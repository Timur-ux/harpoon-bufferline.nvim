local log = {}

--- prints only if debug is true.
---
---@param scope string: the scope from where this function is called.
---@param str string: the formatted string.
---@param ... any: the arguments of the formatted string.
---@private
function log.debug(scope, str, ...)
    return log.notify(scope, vim.log.levels.DEBUG, str, ...)
end

--- prints only if debug is true.
---
---@param scope string: the scope from where this function is called.
---@param level string: the log level of vim.notify.
---@param str string: the formatted string.
---@param ... any: the arguments of the formatted string.
---@private
function log.notify(scope, level, str, ...)
    vim.notify(
        string.format("[harpoon-bufferline.nvim@%s] %s", scope, string.format(str, ...)),
        level,
        { title = "harpoon-bufferline.nvim" }
    )
end

--- analyzes the user provided `setup` parameters and sends a message if they use a deprecated option, then gives the new option to use.
---
---@param options table: the options provided by the user.
---@private
function log.warn_deprecation(options)
    local uses_deprecated_option = false
    local notice = "is now deprecated, use `%s` instead."
    local root_deprecated = {}

    for name, warning in pairs(root_deprecated) do
        if options[name] ~= nil then
            uses_deprecated_option = true
            log.notify(
                "deprecated_options",
                vim.log.levels.WARN,
                true,
                string.format("`%s` %s", name, string.format(notice, warning))
            )
        end
    end

    if uses_deprecated_option then
        log.notify(
            "deprecated_options",
            vim.log.levels.WARN,
            true,
            "sorry to bother you with the breaking changes :("
        )
        log.notify(
            "deprecated_options",
            vim.log.levels.WARN,
            true,
            "use `:h HarpoonBufferline.options` to read more."
        )
    end
end

return log

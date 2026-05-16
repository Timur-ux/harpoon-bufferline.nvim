<p align="center">
  <h1 align="center">harpoon-bufferline.nvim</h2>
</p>

<p align="center">
		Add harpooned buffers to bufferline group easy
</p>

<div align="center">

https://github.com/user-attachments/assets/169d6521-f7f3-46af-91c3-37a0852d7665

</div>

	Warning! Use harpoon2, not old harpoon!

## ⚡️ Features

- [x] sync harpooned buffers and with specified bufferline group 
- [x] collapse empty positions in harpoon internal storage when buffer removed
- [x] sort harpooned buffers inside bufferline group as they placed in harpoon storage
- [ ] set lazy load trigger to load after harpoon plugin

## 📋 Installation

<div align="center">
<table>
<thead>
<tr>
<th>Package manager</th>
<th>Snippet</th>
</tr>
</thead>
<tbody>
<tr>
<td>

[folke/lazy.nvim](https://github.com/folke/lazy.nvim)

</td>
<td align="left">

```lua
{
	"Timur-ux/harpoon-bufferline.nvim",
	dependencies = {
    "ThePrimeagen/harpoon",
    "akinsho/bufferline.nvim",
	},
	opts = {},
	lazy = false, -- TODO: Set loading after harpoon module
	keys = {
		{
			-- custom clear list call due to require("harpoon"):list():clear()
			-- don't call any callbacks to handle clearing with bufferline sync
			"<leader>hc",
			function()
				require("harpoon-bufferline").clearList()
			end,
			mode = { "n" },
			desc = "Harpoon: clear list",
		},
	},
}
```

</td>
</tr>
</tbody>
</table>
</div>

## ☄ Getting started

No special actions needed. By default all added to harpoon list buffers marks as pinned bufferline buffers.

## ⚙ Configuration

> **Note**: The options are also available in Neovim by calling `:h harpoon-bufferline.options`

```lua
require("harpoon-bufferline").setup({
	-- bufferline group to sync with harpoon. "pinned" group created by bufferline
	-- If you want use other group make sure that it is created
	group = "pinned" 
	-- force buffers in bufferline group match harpoon buffers order
	order_bufferline_as_harpoon = true, 
	-- remove empty spaces in harpoon buffers storage when buffers are removed
	fit_harpoon_storage_on_remove = true 
})
```

## ⌨ Contributing

PRs and issues are always welcome. Make sure to provide as much context as possible when opening one.


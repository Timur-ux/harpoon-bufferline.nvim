<p align="center">
  <h1 align="center">harpoon-bufferline.nvim</h2>
</p>

<p align="center">
		Add harpooned buffer to bufferline group easy
</p>

<div align="center">

> Videos don't work on GitHub mobile, so a GIF alternative can help users.

_[GIF version of the showcase video for mobile users](SHOWCASE_GIF_LINK)_

</div>

	Warning! Use harpoon2, not old harpoon!

## ⚡️ Features

- [x] sync harpooned buffers and with specified bufferline group 
- [ ] fit harpoon internal buffers storage when buffer removed
- [ ] sort harpooned buffers inside bufferline group as they placed in harpoon storage

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
<td>

```lua
{
	"harpoon-bufferline.nvim",
	dependencies = {
    "ThePrimeagen/harpoon",
    "akinsho/bufferline.nvim",
	}
	opts = {}
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

> The configuration list sometimes become cumbersome, making it folded by default reduce the noise of the README file.
>
> **Note**: The options are also available in Neovim by calling `:h harpoon-bufferline.options`

```lua
require("harpoon-bufferline").setup({
	-- bufferline group to sync with harpoon. "pinned" group created by bufferline
	-- If you want use other group make sure that it is created
	group = "pinned"
})
```

## ⌨ Contributing

PRs and issues are always welcome. Make sure to provide as much context as possible when opening one.


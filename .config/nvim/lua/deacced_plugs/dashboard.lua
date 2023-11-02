return {
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
        theme = 'doom', --  theme is doom and hyper default is hyper
config = {
  center = {
    {
      icon = '',
      icon_hl = 'group',
      desc = 'description',
      desc_hl = 'group',
      key = 'shortcut key in dashboard buffer not keymap !!',
      key_hl = 'group',
      action = '',
    },
  },
  footer = {},
},
  hide = {
    statusline,    -- hide statusline default is true
    tabline,       -- hide the tabline
    winbar,        -- hide winbar
  },
  preview = {
    command,       -- preview command
    file_path,     -- preview file path
    file_height,   -- preview file height
    file_width,   -- preview file width
},
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
      -- config

return {
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup({
        fps = 30,
        level = 1,
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "✎",
          WARN = ""
        },
        opacity = 10,
        stages = "fade_in_slide_out",
        timeout = 5000,
      })

      vim.notify = require('notify')
    end
  }
}

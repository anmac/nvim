return {
  {
    "petertriho/nvim-scrollbar",
    dependencies = {
      {
        "kevinhwang91/nvim-hlslens",
        config = function()
          require("scrollbar.handlers.search").setup({
            override_lens = function() end,
          })
        end,
      },
    },
    opts = function()
      return require("user.ui.scrollbar")
    end,
    config = function(_, opts)
      local status_ok_scrollbar, scrollbar = pcall(require, "scrollbar")
      if not status_ok_scrollbar then
        vim.notify("Scrollbar Plugin Failed!")
        return
      end
      scrollbar.setup(opts)
    end,
  },
  {
    "kosayoda/nvim-lightbulb",
    opts = function()
      return require("user.ui.lightbulb")
    end,
    config = function(_, opts)
      local status_ok_lightbulb, lightbulb = pcall(require, "nvim-lightbulb")
      if not status_ok_lightbulb then
        vim.notify("Lightbulb Plugin Failed!")
        return
      end
      lightbulb.setup(opts)
    end,
  },
}

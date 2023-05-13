local status_ok, noice = pcall(require, "noice")
if not status_ok then
  vim.notify("noice plugin failed!")
  return
end

noice.setup({
  cmdline = {
    enabled = true,
    view = "cmdline_popup",
    format = {
      conceal = false,
      cmdline = { pattern = "^:", icon = "󰘳", lang = "vim" },
    },
  },
  messages = {
    enabled = true,
  },
  popupmenu = {
    enabled = true,
  },
  redirect = {
    view = "cmdline",
    filter = { event = "msg_show" },
  },
  commands = {
    history = {
      view = "split",
      opts = { enter = true, format = "details" },
      filter = {
        any = {
          { error = true },
          { warning = true },
          { event = "msg_show", kind = { "" } },
          { event = "lsp", kind = "message" },
        },
      },
    },
    last = {
      view = "popup",
      opts = { enter = true, format = "details" },
      filter = {
        any = {
          { event = "notify" },
          { error = true },
          { warning = true },
          { event = "msg_show", kind = { "" } },
          { event = "lsp", kind = "message" },
        },
      },
      filter_opts = { count = 1 },
    },
    errors = {
      view = "popup",
      opts = { enter = true, format = "details" },
      filter = { error = true },
      filter_opts = { reverse = true },
    },
  },
  notify = {
    enabled = true,
    view = "notify",
  },
  lsp = {
    progress = {
      enabled = true,
      format = "lsp_progress",
      format_done = "lsp_progress_done",
      throttle = 300,
      view = "mini",
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
      ["vim.lsp.util.stylize_markdown"] = false,
      ["cmp.entry.get_documentation"] = false,
    },
    hover = {
      enabled = true,
      silent = true,
    },
    signature = {
      enabled = true,
      view = "hover",
    },
    message = {
      enabled = true,
      view = "notify",
      view_error = false,
      view_warn = false,
      view_history = "messages",
      view_search = false,
    },
  },
  health = {
    checker = false,
  },
  smart_move = {
    enabled = false,
    excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = false,
    inc_rename = false,
    lsp_doc_border = true,
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "search_count",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        kind = "",
      },
      opts = { skip = true },
    },
  },
})

require("full-border"):setup {
    -- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
    type = ui.Border.ROUNDED,
}

require("git"):setup()

require("mime-ext"):setup {
    with_files = {
        makefile = "text/makefile",
    },
    with_exts = {
        mk = "text/makefile",
    },
    fallback_file1 = true,
}

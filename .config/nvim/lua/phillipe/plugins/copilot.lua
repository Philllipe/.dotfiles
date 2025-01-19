return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
        panel = { enabled = false },
        suggestion = {
            keymap = {
                accept = "<C-l>",
                next = "<C-]>",
                prev = "<C-[>",
                dismiss = "none",
            },
        },
    },
}

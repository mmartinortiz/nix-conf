icons = {
    kind = {
        Array = ' ',
        Boolean = ' ',
        Class = ' ',
        Color = ' ',
        Constant = ' ',
        Constructor = ' ',
        Enum = ' ',
        EnumMember = ' ',
        Event = ' ',
        Field = ' ',
        File = ' ',
        Folder = '󰉋 ',
        Function = ' ',
        Interface = ' ',
        Key = ' ',
        Keyword = ' ',
        Method = ' ',
        -- Module = " ",
        Module = ' ',
        Namespace = ' ',
        Null = '󰟢 ',
        Number = ' ',
        Object = ' ',
        Operator = ' ',
        Package = ' ',
        Property = ' ',
        Reference = ' ',
        Snippet = ' ',
        String = ' ',
        Struct = ' ',
        Text = ' ',
        TypeParameter = ' ',
        Unit = ' ',
        Value = ' ',
        Variable = ' ',
    },
    git = {
        LineAdded = ' ',
        LineModified = ' ',
        LineRemoved = ' ',
        FileDeleted = ' ',
        FileIgnored = '◌',
        FileRenamed = ' ',
        FileStaged = 'S',
        FileUnmerged = '',
        FileUnstaged = '',
        FileUntracked = 'U',
        Diff = ' ',
        Repo = ' ',
        Octoface = ' ',
        Copilot = ' ',
        Branch = '',
    },
    ui = {
        ArrowCircleDown = '',
        ArrowCircleLeft = '',
        ArrowCircleRight = '',
        ArrowCircleUp = '',
        BoldArrowDown = '',
        BoldArrowLeft = '',
        BoldArrowRight = '',
        BoldArrowUp = '',
        BoldClose = '',
        BoldDividerLeft = '',
        BoldDividerRight = '',
        BoldLineLeft = '▎',
        BoldLineMiddle = '┃',
        BoldLineDashedMiddle = '┋',
        BookMark = '',
        BoxChecked = ' ',
        Bug = ' ',
        Stacks = '',
        Scopes = '',
        Watches = '󰂥',
        DebugConsole = ' ',
        Calendar = ' ',
        Check = '',
        ChevronRight = '',
        ChevronShortDown = '',
        ChevronShortLeft = '',
        ChevronShortRight = '',
        ChevronShortUp = '',
        Circle = ' ',
        Close = '󰅖',
        CloudDownload = ' ',
        Code = '',
        Comment = '',
        Dashboard = '',
        DividerLeft = '',
        DividerRight = '',
        DoubleChevronRight = '»',
        Ellipsis = '',
        EmptyFolder = ' ',
        EmptyFolderOpen = ' ',
        File = ' ',
        FileSymlink = '',
        Files = ' ',
        FindFile = '󰈞',
        FindText = '󰊄',
        Fire = '',
        Folder = '󰉋 ',
        FolderOpen = ' ',
        FolderSymlink = ' ',
        Forward = ' ',
        Gear = ' ',
        History = ' ',
        Lightbulb = ' ',
        LineLeft = '▏',
        LineMiddle = '│',
        List = ' ',
        Lock = ' ',
        NewFile = ' ',
        Note = ' ',
        Package = ' ',
        Pencil = '󰏫 ',
        Plus = ' ',
        Project = ' ',
        Search = ' ',
        SignIn = ' ',
        SignOut = ' ',
        Tab = '󰌒 ',
        Table = ' ',
        Target = '󰀘 ',
        Telescope = ' ',
        Text = ' ',
        Tree = '',
        Triangle = '󰐊',
        TriangleShortArrowDown = '',
        TriangleShortArrowLeft = '',
        TriangleShortArrowRight = '',
        TriangleShortArrowUp = '',
    },
    diagnostics = {
        BoldError = '',
        Error = '',
        BoldWarning = '',
        Warning = '',
        BoldInformation = '',
        Information = '',
        BoldQuestion = '',
        Question = '',
        BoldHint = '',
        Hint = '󰌶',
        Debug = '',
        Trace = '✎',
    },
    misc = {
        Robot = '󰚩 ',
        Squirrel = ' ',
        Tag = ' ',
        Watch = '',
        Smiley = ' ',
        Package = ' ',
        CircuitBoard = ' ',
    },
}

require('notify').setup({
    background_colour = "#000000",
})

require('noice').setup {
    cmdline = {
        enabled = true,         -- enables the Noice cmdline UI
        view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
        opts = {},              -- global options for the cmdline. See section on views
        ---@type table<string, CmdlineFormat>
        format = {
            -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
            -- view: (default is cmdline view)
            -- opts: any options passed to the view
            -- icon_hl_group: optional hl_group for the icon
            -- title: set to anything or empty string to hide
            cmdline = { pattern = "^:", icon = "", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
            filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
            lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
            help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
            input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
            -- lua = false, -- to disable a format, set to `false`
        },
    },
    messages = {
        -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        -- This is a current Neovim limitation.
        enabled = false,         -- enables the Noice messages UI
        view = 'notify',         -- default view for messages
        view_error = 'notify',   -- view for errors
        view_warn = 'notify',    -- view for warnings
        view_history = 'messages', -- view for :messages
        view_search = 'virtualtext', -- view for search count messages. Set to `false` to disable
    },
    popupmenu = {
        enabled = false, -- enables the Noice popupmenu UI
        ---@type 'nui'|'cmp'
        backend = 'nui', -- backend to use to show regular cmdline completions
        ---@type NoicePopupmenuItemKind|false
        -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
        kind_icons = icons.kind, -- set to `false` to disable icons
    },
    ---@type NoiceRouteConfig
    redirect = {
        view = 'popup',
        filter = { event = 'msg_show' },
    },
    notify = {
        -- Noice can be used as `vim.notify` so you can route any notification like other messages
        -- Notification messages have their level and other properties set.
        -- event is always "notify" and kind can be any log level as a string
        -- The default routes will forward notifications to nvim-notify
        -- Benefit of using Noice for this is the routing and consistent history view
        enabled = true,
        view = 'notify',
    },
    health = {
        checker = true, -- Disable if you don't want health checks to run
    },
    smart_move = {
        -- noice tries to move out of the way of existing floating windows.
        enabled = true, -- you can disable this behaviour here
        -- add any filetypes here, that shouldn't trigger smart move.
        excluded_filetypes = { 'cmp_menu', 'cmp_docs', 'notify' },
    },
    lsp = {
        progress = {
            enabled = true,
            -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
            -- See the section on formatting for more details on how to customize.
            --- @type NoiceFormat|string
            format = 'lsp_progress',
            --- @type NoiceFormat|string
            format_done = 'lsp_progress_done',
            throttle = 1000 / 10, -- frequency to update lsp progress message
            view = 'mini',
        },
        override = {
            -- override the default lsp markdown formatter with Noice
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            -- override the lsp markdown formatter with Noice
            ['vim.lsp.util.stylize_markdown'] = true,
            -- override cmp documentation with Noice (needs the other options to work)
            ['cmp.entry.get_documentation'] = true,
        },
        hover = {
            enabled = true,
            silent = false, -- set to true to not show a message if hover is not available
            view = nil, -- when nil, use defaults from documentation
            ---@type NoiceViewOptions
            opts = {}, -- merged with defaults from documentation
        },
        signature = {
            enabled = true,
            auto_open = {
                enabled = true,
                trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
                luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
                throttle = 50, -- Debounce lsp signature help request by 50ms
            },
            view = nil, -- when nil, use defaults from documentation
            ---@type NoiceViewOptions
            opts = {},  -- merged with defaults from documentation
        },
        message = {
            -- Messages shown by lsp servers
            enabled = true,
            view = 'notify',
            opts = {},
        },
        -- defaults for hover and signature help
        documentation = {
            view = 'hover',
            ---@type NoiceViewOptions
            opts = {
                lang = 'markdown',
                replace = true,
                render = 'plain',
                format = { '{message}' },
                win_options = { concealcursor = 'n', conceallevel = 3 },
            },
        },
    },                            -- you can enable a preset for easier configuration
    presets = {
        bottom_search = true,     -- use a classic bottom cmdline for search
        command_palette = true,   -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,       -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true,    -- add a border to hover docs and signature help
    },
    throttle = 1000 / 30,         -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
    ---@type NoiceConfigViews
    views = {
        mini = {
            win_options = {
                winblend = 0,
            },
        },
    }, ---@see section on views
    routes = {
        {
            filter = {
                event = 'msg_show',
                kind = '',
                find = 'written',
            },
            opts = { skip = true },
        },
    },         --- @see section on routes
    ---@type table<string, NoiceFilter>
    status = {}, --- @see section on statusline components
    ---@type NoiceFormatOptions
    format = {}, --- @see section on formatting
}

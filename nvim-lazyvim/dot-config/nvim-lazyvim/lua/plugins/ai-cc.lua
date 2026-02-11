return {
    ---------------------------------------------------------------------------
    -- MCPHub (hub MCP dans Neovim)
    ---------------------------------------------------------------------------
    {
        "ravitemer/mcphub.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        -- IMPORTANT:
        -- MCPHub nécessite Node.js (souvent >= 18) + l’outil "mcp-hub".
        -- Je NE force pas l’installation ici (pas de "build = npm ...") car ça dépend
        -- de ton système. Installe-le une fois au niveau système si nécessaire.
        --
        -- Ensuite, dans Neovim: :checkhealth mcphub et :MCPHub
        opts = {
            ui = { border = "rounded" },

            -- Fichier de config des serveurs MCP (défaut: ~/.config/mcphub/servers.json).
            -- Exemple avec les 4 MCP retenus (Filesystem, Fetch, Grep, Brave Search) :
            -- docs/mcphub-servers.example.json → copier vers ~/.config/mcphub/servers.json
            config = vim.fn.expand("~/.config/mcphub/servers.json"),

            -- Approvals: safe par défaut ; auto-approve par serveur dans servers.json (autoApprove).
            approval = {
                enabled = true,
                auto_approve = {},
            },
        },
        keys = {
            { "<leader>mH", "<cmd>MCPHub<cr>", desc = "MCPHub: UI" },
            { "<leader>mR", "<cmd>MCPHubReload<cr>", desc = "MCPHub: Reload serveurs" },
            { "<leader>mL", "<cmd>MCPHubLogs<cr>", desc = "MCPHub: Logs" },
        },
    },

    ---------------------------------------------------------------------------
    -- CodeCompanion (chat + actions) + extension MCPHub
    ---------------------------------------------------------------------------
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-telescope/telescope.nvim",
            "ravitemer/mcphub.nvim", -- <- fournit mcphub.extensions.codecompanion
        },
        opts = function()
            local adapters = require("codecompanion.adapters")

            return {
                ---------------------------------------------------------------------
                -- Adapters HTTP (structure requise: adapters.http.*)
                -- Variables d'env : OPENAI_API_KEY, ANTHROPIC_API_KEY
                -- Bascule dynamique : `ga` dans le chat, ou :CodeCompanionChat adapter=X model=Y
                ---------------------------------------------------------------------
                adapters = {
                    http = {
                        openai_responses = function()
                            return adapters.extend("openai_responses", {
                                env = { api_key = "OPENAI_API_KEY" },
                                schema = {
                                    model = { default = "gpt-4.1" },
                                },
                            })
                        end,
                        openai = function()
                            return adapters.extend("openai", {
                                env = { api_key = "OPENAI_API_KEY" },
                                schema = {
                                    model = { default = "gpt-4.1" },
                                },
                            })
                        end,
                        anthropic = function()
                            return adapters.extend("anthropic", {
                                env = { api_key = "ANTHROPIC_API_KEY" },
                                schema = {
                                    model = { default = "claude-3-5-sonnet-latest" },
                                },
                            })
                        end,
                    },
                },

                -- Adapter par défaut (mets celui que tu veux)
                default_adapter = "openai_responses",
                strategies = {
                    chat = { adapter = "openai_responses" },
                    inline = { adapter = "openai_responses" },
                    agent = { adapter = "openai_responses" },
                },
                interactions = {
                    chat = {
                        adapter = {
                            name = "openai_responses",
                            model = "gpt-4.1",
                        },
                    },
                },
                ---------------------------------------------------------------------
                -- UI
                ---------------------------------------------------------------------
                display = {
                    chat = {
                        window = {
                            layout = "vertical",
                            border = "rounded",
                            width = 0.42,
                        },
                        show_settings = true,
                    },
                },

                ---------------------------------------------------------------------
                -- Prompt library (actions utiles)
                ---------------------------------------------------------------------
                prompt_library = {
                    ["Résumé (buffer)"] = {
                        strategy = "chat",
                        description = "Résume le buffer courant",
                        prompts = {
                            { role = "system", content = "Tu es un assistant clair, précis et concis." },
                            {
                                role = "user",
                                content = "Résume le contenu de #{buffer} en 10 lignes maximum, puis liste 5 points clés.",
                            },
                        },
                    },

                    -- Bonus utile : résumé de ce que tu vois à l’écran (plus léger)
                    ["Résumé (viewport)"] = {
                        strategy = "chat",
                        description = "Résume uniquement la portion visible",
                        prompts = {
                            { role = "system", content = "Tu es un assistant clair, précis et concis." },
                            {
                                role = "user",
                                content = "Résume le contenu de #{viewport} en 8 lignes maximum.",
                            },
                        },
                    },
                    ["Plan d'investigation Linux (SRE)"] = {
                        strategy = "chat",
                        description = "Démarche d'investigation serveur web Linux",
                        prompts = {
                            {
                                role = "system",
                                content = "Tu es un SRE pragmatique. Tu proposes une démarche structurée et safe.",
                            },
                            {
                                role = "user",
                                content = "Propose un plan d'investigation étape par étape pour diagnostiquer un comportement anormal d’un serveur web Linux.",
                            },
                        },
                    },
                    ["Analyse généraliste (sélection)"] = {
                        strategy = "chat",
                        description = "Analyse neutre sur la sélection",
                        prompts = {
                            {
                                role = "system",
                                content = "Tu es un assistant généraliste. Analyse le texte sans supposer qu'il s'agit de code.",
                            },
                            {
                                role = "user",
                                content = "Analyse le texte suivant et réponds clairement :\n\n#{selection}",
                            },
                        },
                    },
                    ["Chat généraliste (neutre)"] = {
                        strategy = "chat",
                        description = "Réponses générales, pas orientées code",
                        prompts = {
                            {
                                role = "system",
                                content = [[
Tu es un assistant généraliste. Réponds clairement et de façon pratique.
Ne te focalise pas sur le code. N'évoque Neovim, buffers, LSP, ou plugins
que si la question porte explicitement dessus.
Si une information te manque, pose 1–2 questions ciblées.
        ]],
                            },
                            {
                                role = "user",
                                content = [[
Question : {{input}}

Réponds de manière structurée (titres courts + listes si utile).
        ]],
                            },
                        },
                        -- Demande une entrée à l'utilisateur (input prompt)
                        input = {
                            title = "Question généraliste",
                            prompt = "Pose ta question : ",
                        },
                    },
                },

                ---------------------------------------------------------------------
                -- ✅ Extension MCPHub (la bonne façon)
                -- -> charge l’extension depuis mcphub.nvim (pas depuis codecompanion)
                ---------------------------------------------------------------------
                extensions = {
                    mcphub = {
                        callback = "mcphub.extensions.codecompanion",
                        opts = {
                            -- Variables de ressources: #mcp:...
                            make_vars = true,

                            -- Slash commands: /mcp:...
                            make_slash_commands = true,

                            -- Exposer les tools MCP au modèle (tool calls)
                            -- Si ton modèle/provider gère bien les tool calls, laisse true.
                            make_tools = true,

                            -- Afficher le résultat des tools directement dans le chat
                            show_result_in_chat = true,

                            -- Laisser MCPHub gérer les validations/approbations
                            user_approval = true,
                        },
                    },
                },
            }
        end,
        keys = {
            { "<leader>aca", "<cmd>CodeCompanionChat Toggle<cr>", desc = "AI: Chat toggle" },
            { "<leader>acc", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "AI: Actions" },
            { "<leader>aci", "<cmd>CodeCompanion<cr>", mode = { "n", "v" }, desc = "AI: Inline (prompt)" },
        },
    },
}

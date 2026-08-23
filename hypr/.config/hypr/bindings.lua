-- Cursor on C. Super+Shift+C was Calendar (Hey.com); the clock calendar
-- widget remains on Super+Ctrl+Alt+D.
hl.unbind("SUPER + SHIFT + C")
o.bind("SUPER + SHIFT + C", "Cursor", { launch = "cursor", focus = "^Cursor$" })

-- Super+Shift+N was the generic editor (now Cursor). Put N back on Neovim.
hl.unbind("SUPER + SHIFT + N")
o.bind("SUPER + SHIFT + N", "Neovim", { tui = "nvim", focus = true })

-- Super+Shift+G was Signal. WhatsApp stays on Super+Shift+Alt+G.
hl.unbind("SUPER + SHIFT + G")
o.bind("SUPER + SHIFT + G", "Grok Bot", { launch = "grok-bot", focus = "^Grok Bot$" })

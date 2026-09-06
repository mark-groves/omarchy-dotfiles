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

-- Super+Shift+U was free. Toggle the agents usage panel (Cursor, Claude, Codex).
o.bind("SUPER + SHIFT + U", "Agent usage", "omarchy-shell omarchy.agents toggle")

-- Super+Shift+K was free (Super+K is the keybindings overlay).
-- Use /client so Slack stays in the web app instead of handing off to slack://.
o.bind("SUPER + SHIFT + K", "Slack", { webapp = "https://app.slack.com/client", focus = true })

-- Super+Shift+E was Hey.com email. Proton has no public compose URL,
-- so Super+Shift+Alt+E also opens Proton Mail (press C to compose).
hl.unbind("SUPER + SHIFT + E")
o.bind("SUPER + SHIFT + E", "Proton Mail", { webapp = "https://mail.proton.me", focus = true })
hl.unbind("SUPER + SHIFT + ALT + E")
o.bind("SUPER + SHIFT + ALT + E", "Proton Mail", { webapp = "https://mail.proton.me", focus = true })

# Portable prompt layout; palette follows the current Omarchy theme.
add_newline = true
command_timeout = 700
scan_timeout = 30

palette = "omarchy"

# bash doesn't support right prompt.
right_format = ""

format = """
[╭─](bold glow) $os$username$hostname$shell
[│ ](bold glow) $directory$git_branch$git_commit$git_state$git_status$git_metrics$aws$gcloud$kubernetes$nodejs$python$rust$golang$java$lua$c$cmake$dotnet$elixir$elm$erlang$haskell$julia$nim$ocaml$perl$php$purescript$raku$rlang$ruby$scala$swift$dart$terraform$helm$docker_context$package$time$line_break[╰─](bold glow)$status$jobs$cmd_duration$character
"""

# Compact variant for narrow terminals (toggle by replacing the format above):
# format = """
# [╭](bold glow) $os$directory$git_branch$git_status$time$line_break[╰](bold glow) $status$character
# """

[palettes.omarchy]
glow = "{{ accent }}"
halo = "{{ magenta }}"
dim = "{{ muted }}"
err = "{{ red }}"
ok = "{{ green }}"
warn = "{{ yellow }}"
git_clean = "{{ cyan }}"
git_dirty = "{{ red }}"
cloud = "{{ magenta }}"
sys = "{{ magenta }}"
dir = "{{ cyan }}"
git = "{{ green }}"
git_meta = "{{ foreground }}"
lang_web = "{{ cyan }}"
lang_sys = "{{ green }}"
lang_func = "{{ magenta }}"
lang_data = "{{ yellow }}"
tooling = "{{ orange }}"
time = "{{ foreground }}"
capsule = "{{ foreground }}"

[line_break]
disabled = false

[character]
success_symbol = "[•](bold glow)[❯](bold glow) "
error_symbol = "[•](bold glow)[❯](bold err) "
vimcmd_symbol = "[•](bold glow)[❮](bold halo) "
vimcmd_replace_one_symbol = "[•](bold glow)[❮](bold err) "
vimcmd_replace_symbol = "[•](bold glow)[❮](bold err) "
vimcmd_visual_symbol = "[•](bold glow)[❮](bold glow) "

[status]
disabled = false
format = "[⟦](bold capsule)[$symbol$status](bold err)[⟧](bold capsule)"
symbol = "✖ "
not_executable_symbol = " "
not_found_symbol = " "
sigint_symbol = "󰀥 "
signal_symbol = "⚡ "
style = "bold err"
map_symbol = false
recognize_signal_code = true
pipestatus = false

[jobs]
threshold = 1
symbol_threshold = 1
number_threshold = 1
format = "[$symbol$number]($style) "
symbol = " "
style = "bold tooling"

[cmd_duration]
min_time = 800
format = "[•](dim)[󱎫 $duration]($style)"
style = "bold time"
show_milliseconds = false
disabled = false
show_notifications = false

[os]
disabled = false
style = "bold sys"
# Starship has no Omarchy OS id. U+E900 is the mark in omarchy.ttf.
# Nerd Fonts also put COBOL there; terminals must map this range to omarchy.
format = "[]($style)  "

[os.symbols]
AIX = " "
Alpaquita = " "
Alpine = " "
ALTLinux = " "
AlmaLinux = " "
Amazon = " "
Android = " "
AOSC = " "
Arch = " "
Artix = " "
Bluefin = " "
CachyOS = " "
CentOS = " "
Debian = " "
DragonFly = " "
Elementary = " "
Emscripten = " "
EndeavourOS = " "
Fedora = " "
FreeBSD = " "
Garuda = "󰛓 "
Gentoo = " "
HardenedBSD = "󰞌 "
Illumos = "󰈸 "
Ios = "󰀷 "
InstantOS = " "
Kali = " "
Linux = " "
Mabox = " "
Macos = " "
Manjaro = " "
Mariner = " "
MidnightBSD = " "
Mint = " "
NetBSD = " "
NixOS = " "
Nobara = " "
OpenBSD = "󰈺 "
OpenCloudOS = " "
openEuler = " "
openSUSE = " "
OracleLinux = "󰌷 "
PikaOS = " "
Pop = " "
Raspbian = " "
Redhat = " "
RedHatEnterprise = " "
RockyLinux = " "
Redox = "󰀘 "
Solus = "󰠳 "
SUSE = " "
Ubuntu = " "
Ultramarine = " "
Unknown = " "
Uos = " "
Void = " "
Windows = "󰍲 "
Zorin = " "

[username]
format = "[$user]($style) "
style_root = "bold err"
style_user = "bold sys"
show_always = false
disabled = false

[hostname]
ssh_only = true
ssh_symbol = "󰣀 "
trim_at = "."
format = "[$ssh_symbol$hostname]($style) "
style = "bold sys"
disabled = false

[shell]
format = "[ $indicator]($style) "
bash_indicator = "bash"
fish_indicator = "fish"
zsh_indicator = "zsh"
powershell_indicator = "pwsh"
ion_indicator = "ion"
elvish_indicator = "esh"
tcsh_indicator = "tsh"
nu_indicator = "nu"
xonsh_indicator = "xsh"
cmd_indicator = "cmd"
unknown_indicator = "shell"
style = "bold tooling"
disabled = false

[directory]
format = "[  $path]($style) "
style = "bold dir"
truncation_length = 1
truncation_symbol = ""
home_symbol = "~"
read_only = " "
read_only_style = "bold warn"

[git_branch]
symbol = "  "
format = "[•](dim) [$symbol$branch]($style) "
style = "bold git"

[git_commit]
commit_hash_length = 7
format = '([\[$hash$tag\]]($style) )'
style = "bold git_meta"
only_detached = true
tag_symbol = "  "
tag_disabled = false

[git_metrics]
added_style = "bold git_clean"
deleted_style = "bold git_dirty"
only_nonzero_diffs = true
format = "([+$added]($added_style)[-$deleted]($deleted_style) )"
disabled = false
ignore_submodules = false

[git_state]
rebase = "REBASING"
merge = "MERGING"
revert = "REVERTING"
cherry_pick = "CHERRY-PICKING"
bisect = "BISECTING"
am = "APPLY-MAILBOX"
am_or_rebase = "AM/REBASE"
style = "bold err"
format = '([\[$state( $progress_current/$progress_total)\]]($style) )'
disabled = false

[git_status]
# Legend: + staged, ! modified, ? untracked, ✘ deleted, » renamed,
# = conflicted, $ stashed, ⇡ ahead, ⇣ behind, ⇕ diverged
format = '([\[$all_status$ahead_behind\]]($style) )'
style = "bold git"
stashed = '\$'
ahead = "⇡"
behind = "⇣"
up_to_date = ""
diverged = "⇕"
conflicted = "="
deleted = "✘"
renamed = "»"
modified = "!"
staged = "+"
untracked = "?"
typechanged = "~"
ignore_submodules = false
disabled = false
use_git_executable = false

[aws]
format = '[󰸏 $profile( \($region\))]($style) '
style = "bold cloud"
disabled = false
expiration_symbol = "󰧠"
force_display = false

[gcloud]
format = '[󱇶 $project($account)( \($region\))]($style) '
symbol = ""
style = "bold cloud"
disabled = false
detect_env_vars = []

[gcloud.project_aliases]

[gcloud.region_aliases]

[kubernetes]
format = '[󱃾 $context( \($namespace\))]($style) '
style = "bold cloud"
disabled = false
detect_extensions = []
detect_files = []
detect_folders = []
detect_env_vars = ["KUBECONFIG", "KUBERNETES_SERVICE_HOST"]

[nodejs]
format = "[ $version]($style) "
style = "bold lang_web"

[python]
format = "[ $version]($style) "
style = "bold lang_data"

[rust]
format = "[ $version]($style) "
style = "bold lang_sys"

[golang]
format = "[ $version]($style) "
style = "bold lang_sys"

[java]
format = "[ $version]($style) "
style = "bold lang_data"

[lua]
format = "[ $version]($style) "
style = "bold lang_func"

[c]
format = "[ $version]($style) "
style = "bold lang_sys"

[cmake]
format = "[△ $version]($style) "
style = "bold lang_sys"

[dotnet]
format = "[󰪮 $version( 🎯 $tfm)]($style) "
style = "bold lang_sys"

[elixir]
format = '[ $version( OTP $otp_version)]($style) '
style = "bold lang_func"

[elm]
format = "[ $version]($style) "
style = "bold lang_func"

[erlang]
format = "[ $version]($style) "
style = "bold lang_func"

[haskell]
format = "[ $version]($style) "
style = "bold lang_func"

[julia]
format = "[ $version]($style) "
style = "bold lang_func"

[nim]
format = "[󰆥 $version]($style) "
style = "bold lang_func"

[ocaml]
format = '[ $version( \($switch_indicator$switch_name\))]($style) '
style = "bold lang_func"

[perl]
format = "[ $version]($style) "
style = "bold lang_func"

[php]
format = "[ $version]($style) "
style = "bold lang_web"

[purescript]
format = "[ $version]($style) "
style = "bold lang_func"

[raku]
format = "[󱖉 $version-$vm_version]($style) "
style = "bold lang_func"

[rlang]
format = "[󰟔 $version]($style) "
style = "bold lang_data"

[ruby]
format = "[ $version]($style) "
style = "bold lang_func"

[scala]
format = "[ $version]($style) "
style = "bold lang_func"

[swift]
format = "[ $version]($style) "
style = "bold lang_sys"

[dart]
format = "[ $version]($style) "
style = "bold lang_web"

[terraform]
format = "[󱁢 $workspace]($style) "
style = "bold tooling"

[helm]
format = "[⎈ $version]($style) "
style = "bold tooling"

[docker_context]
format = "[ $context]($style) "
style = "bold tooling"
only_with_files = true

[package]
format = "[󰏗 $version]($style) "
style = "bold tooling"
version_format = "v${raw}"

[time]
disabled = true
format = "[•](dim) [ $time]($style) "
time_format = "%H:%M"
style = "bold time"

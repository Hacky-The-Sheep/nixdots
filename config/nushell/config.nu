# GENERAL
$env.config.show_banner = false

# Editor
# $env.EDITOR = "hx"

# ALIASES
alias ei = exit
# alias hx = helix

# GIT ALIASES
alias ga = git add
alias gc = git commit -m
alias gs = git status

# YDL500
alias yty = yt-dlp -o '%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'
alias ytu = yt-dlp -o '~/MyVideos/%(playlist)s/%(chapter_number)s - %(chapter)s/%(title)s.%(ext)s'
alias ydl = yt-dlp --prefer-ffmpeg --merge-output-format mkv
alias ymp4 = yt-dlp --prefer-ffmpeg --merge-output-format mp4
alias ymp3 = yt-dlp --extract-audio --audio-format mp3

# NIX
alias clcon = nix-env --delete-generations 14d
alias gecon = nix-store --gc

# Nix-Shell
let nix_shell_suffix = if ($env.IN_NIX_SHELL? | is-not-empty) {
  $" | (ansi light_blue_bold)nix(ansi reset)"
} else {
  ""
}

## ENV Variables
$env.config.completions.algorithm = "substring"
$env.config.completions.sort = "smart"
$env.config.completions.case_sensitive = false
$env.config.completions.quick = true
$env.config.completions.partial = true
$env.config.completions.use_ls_colors = true
$env.config.use_kitty_protocol = true
$env.config.use_ansi_coloring = "auto"
$env.config.error_style = "fancy"
$env.config.filesize.unit = "metric"
$env.config.filesize.show_unit = true
$env.config.filesize.precision = 1
$env.config.render_right_prompt_on_last_line = false
$env.config.float_precision = 2
$env.config.ls.use_ls_colors = true
$env.config = ($env.config | merge {
    cursor_shape: {
        emacs: line
    }
})


## STYLING
## Catppuccin
let cat_red_bold = {
  fg: '#f38ba8'
  attr: b
}

### Get the OS
def os_icon [] {
    let os = (sys host | get name | str downcase)

    match $os {
        "arch linux"   => "󰣇 "
        _         => "󰠗 "
    }
}


$env.PROMPT_COMMAND = {
    let ssh = if ($env.SSH_CONNECTION? != null) {
        "[SSH] "
    } else {
        ""
    }
    let os = (os_icon)
    let host = (sys host | get hostname)
    let cwd  = ($env.PWD | path relative-to "/home/hacky/")

    let git_status = (do { git status} | complete | get stdout | str trim)

    let git_indicator = if ($git_status | str contains "not staged") {
      "  "
    } else if ($git_status | str contains "Changes to be committed") {
      " 󱆿 "
    } else if ($git_status | str contains "branch is ahead") {
      "  "
    } else {
      ""
    }

    let git_current_ref = (do { git rev-parse --abbrev-ref HEAD } | complete | get stdout | str trim)
    let git_segment = if ($git_current_ref != "") {$"(ansi reset) (ansi yellow)($git_current_ref)($git_indicator)"}

    $"(ansi white)($ssh)(ansi blue)($os) on (ansi $cat_red_bold)($host) (ansi blue)($cwd)($git_segment)\n"
}

## Remove the time from the right hand side
$env.PROMPT_COMMAND_RIGHT = ""

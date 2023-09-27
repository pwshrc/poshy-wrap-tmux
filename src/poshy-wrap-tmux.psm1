#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest


# ALIASES
# see: https://man.openbsd.org/OpenBSD-current/man1/tmux.1

function Invoke-TmuxAttachForTerminal {
    tmux attach -t @args
}
Set-Alias -Name ta -Value Invoke-TmuxAttachForTerminal
Set-Alias -Name txa -Value Invoke-TmuxAttachForTerminal
Export-ModuleMember -Function Invoke-TmuxAttachForTerminal -Alias @(
    "ta",
    "txa"
)

function Invoke-TmuxAttachForTerminalDetachingOthers {
    tmux attach -d -t @args
}
Set-Alias -Name tad -Value Invoke-TmuxAttachForTerminalDetachingOthers
Export-ModuleMember -Function Invoke-TmuxAttachForTerminalDetachingOthers -Alias tad

function Invoke-TmuxNewSessionFromSource {
    tmux new-session -s @args
}
Set-Alias -Name ts -Value Invoke-TmuxNewSessionFromSource
Set-Alias -Name txn -Value Invoke-TmuxNewSessionFromSource
Export-ModuleMember -Function Invoke-TmuxNewSessionFromSource -Alias @(
    "ts",
    "txn"
)

function Invoke-TmuxListSessions {
    tmux list-sessions @args
}
Set-Alias -Name tl -Value Invoke-TmuxListSessions
Set-Alias -Name txl -Value Invoke-TmuxListSessions
Export-ModuleMember -Function Invoke-TmuxListSessions -Alias @(
    "tl",
    "txl"
)

function Invoke-TmuxKillServer {
    tmux kill-server @args
}
Set-Alias -Name tksv -Value Invoke-TmuxKillServer
Export-ModuleMember -Function Invoke-TmuxKillServer -Alias tksv

function Invoke-TmuxKillSessionForTerminal {
    tmux kill-session -t @args
}
Set-Alias -Name tkss -Value Invoke-TmuxKillSessionForTerminal
Export-ModuleMember -Function Invoke-TmuxKillSessionForTerminal -Alias tkss

function Invoke-TmuxEditConfig {
    &$Env:EDITOR $Env:PWSHRC_TMUX_CONFIG @args
}
Set-Alias -Name tmuxconf -Value Invoke-TmuxEditConfig
Export-ModuleMember -Function Invoke-TmuxEditConfig -Alias tmuxconf

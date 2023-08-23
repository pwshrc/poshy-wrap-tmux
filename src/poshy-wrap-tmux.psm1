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

function Invoke-TmuxAttachForTerminalDetachingOthers {
    tmux attach -d -t @args
}
Set-Alias -Name tad -Value Invoke-TmuxAttachForTerminalDetachingOthers

function Invoke-TmuxNewSessionFromSource {
    tmux new-session -s @args
}
Set-Alias -Name ts -Value Invoke-TmuxNewSessionFromSource
Set-Alias -Name txn -Value Invoke-TmuxNewSessionFromSource

function Invoke-TmuxListSessions {
    tmux list-sessions @args
}
Set-Alias -Name tl -Value Invoke-TmuxListSessions
Set-Alias -Name txl -Value Invoke-TmuxListSessions

function Invoke-TmuxKillServer {
    tmux kill-server @args
}
Set-Alias -Name tksv -Value Invoke-TmuxKillServer

function Invoke-TmuxKillSessionForTerminal {
    tmux kill-session -t @args
}
Set-Alias -Name tkss -Value Invoke-TmuxKillSessionForTerminal

function Invoke-TmuxEditConfig {
    &$Env:EDITOR $Env:PWSHRC_TMUX_CONFIG @args
}
Set-Alias -Name tmuxconf -Value Invoke-TmuxEditConfig


Export-ModuleMember -Function * -Alias *

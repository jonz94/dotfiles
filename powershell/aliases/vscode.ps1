# open current directory in vscode

# NOTE: using `Start-Process` allows the shell to close immediately, without waiting for vscode to exit.
function c. {
  Start-Process "code" -ArgumentList "." -WorkingDirectory $PWD -WindowStyle Hidden
}

function cs. {
  Start-Process "cursor" -ArgumentList "." -WorkingDirectory $PWD -WindowStyle Hidden
}

# legacy method: (❌ not recommended)
#
# function c. {
#   code .
# }
#
# the above method launches vscode synchronously, causing the shell to remain open until vscode is closed.

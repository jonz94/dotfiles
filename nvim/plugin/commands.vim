" abort git commit when editing the commit log message
command! AbortGitCommit  :cq!
command! CancelGitCommit :cq!
command! GitAbortCommit  :cq!
command! GitCancelCommit :cq!

" aborting fc and avoiding unwanted re-reruns
command! AbortEditLastCommandInEditor  :cq!
command! AbortFc                       :cq!
command! CancelEditLastCommandInEditor :cq!
command! CancelFc                      :cq!

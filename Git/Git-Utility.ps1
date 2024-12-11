function GetCurrentCommitHash {
    git rev-parse HEAD
}

function GetCurrentBranch {
    git rev-parse --abbrev-ref HEAD
}
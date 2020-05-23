function updateOutDatedApps {
    <#
    .SYNOPSIS
        git status
    .DESCRIPTION
        run 'git status --short --branch'
    #>
    $data = npm -g outdated --parseable --depth=0
    foreach ($item in $data) {
        $package = ($item -split ":")[-1];
        npm -g install "$package";
    }
}

updateOutDatedApps;

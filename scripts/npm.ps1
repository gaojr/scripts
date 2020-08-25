function updateOutDatedApps {
  <#
  .DESCRIPTION
    update outdated apps
  #>
  $data = npm -g outdated --parseable --depth=0
  foreach ($item in $data) {
    $package = ($item -split ":")[-1];
    npm -g install "$package";
  }
}

updateOutDatedApps;

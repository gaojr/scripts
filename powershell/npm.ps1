# 参数
$opt = $args[0];

function listGlobalAll {
  <#
  .DESCRIPTION
    list global apps
  #>
  npm ls -g --depth=0 --long;
}

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

if ($opt -eq "u") {
  updateOutDatedApps;
} elseif ($opt -eq "l") {
  listGlobalAll;
}

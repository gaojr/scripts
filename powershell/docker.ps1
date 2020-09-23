# 参数
$opt = $args[0];

function __images {
  docker images;
}

function __pull {
  param([string]$image);
  docker pull $image;
}

function __save {
  param([string]$image);
  docker save $image;
}

function __delete {
  param([string]$image);
  docker rmi $image;
}

# function __gzip {
#   param([string]$image, [string]$zip);
#   if ([String]::IsNullOrEmpty($image) -and [String]::IsNullOrEmpty($zip)) {
#     Write-Output "请检查入参!";
#   } else {
#     docker save $image | gzip > $zip;
#   }
# }

if ($opt -eq "p") {
  __pull -image $args[1];
} elseif ($opt -eq "s") {
  __save -image $args[1];
} elseif ($opt -eq "d") {
  __delete -image $args[1];
# } elseif ($opt -eq "gzip") {
#   __gzip -image $args[1] -zip $args[2];
} else {
  __images;
}

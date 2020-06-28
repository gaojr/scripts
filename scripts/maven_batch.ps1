Set-ExecutionPolicy RemoteSigned

function isDirectory {
    <#
    .SYNOPSIS
        路径存在且是目录
    #>
    param([string]$path);
    return Test-Path -Path $path -PathType Container;
}

function hasPom {
    <#
    .SYNOPSIS
        有pom文件
    #>
    param([array]$children);
    return $children.Contains("pom.xml");
}

function dealPath {
    <#
    .SYNOPSIS
        循环运行 mvn clean
    #>
    param ([array]$paths);
    foreach ($path in $paths) {
        if (".idea" -eq $path) {
            continue;
        }
        if (isDirectory -path $path) {
            Set-Location $path;
            $files = Get-ChildItem -File -Name;
            if (hasPom -children $files) {
                Write-Output "`n********************************";
                Write-Host -ForegroundColor Red $path;
                Write-Output "********************************`n";
                Invoke-Expression "mvn clean";
            } else {
                $children = (Get-ChildItem -Directory -Name);
                dealPath -paths $children;
            }
        }
    }
}

dealPath -paths $args;

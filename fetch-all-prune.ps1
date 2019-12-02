# 要更新的路径
$paths = "path1", "path2"

foreach ($path in $paths) {
    # 分隔符
    Write-Output "`n********************************"
    if (Test-Path -Path $path -PathType Container) {
        # 路径存在且是目录
        Set-Location $path
        Write-Output "'$path' start fetching!"
        git fetch --all --prune
    } else {
        Write-Output "'$path' is not a directory or does not exist!"
    }
    # 分隔符
    Write-Output "********************************`n"
}

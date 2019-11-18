Set-ExecutionPolicy RemoteSigned

foreach ($path in $args) {
    if  (Test-Path -Path $path -PathType Container) {
        # 路径存在且是目录
        while (gci -R . | where {$_.PSISContainer -and @( $_ | gci).Count -eq 0}) {
            gci -R . | where {$_.PSISContainer -and @($_ | gci).Count -eq 0} | ri
        }
    } else {
        echo "'$path' is not a directory or does not exist!"
    }
}

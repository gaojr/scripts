Set-ExecutionPolicy RemoteSigned

foreach ($path in $args) {
    if  (Test-Path -Path $path -PathType Container) {
        # 路径存在且是目录
        while (Get-ChildItem -R . | Where-Object {$_.PSISContainer -and @( $_ | Get-ChildItem).Count -eq 0}) {
            Get-ChildItem -R . | Where-Object {$_.PSISContainer -and @($_ | Get-ChildItem).Count -eq 0} | Remove-Item
        }
    } else {
        Write-Output "'$path' is not a directory or does not exist!"
    }
}

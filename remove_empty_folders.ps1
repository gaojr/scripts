Set-ExecutionPolicy RemoteSigned
while (gci -R . | where {$_.PSISContainer -and @( $_ | gci).Count -eq 0}) {
    gci -R . | where {$_.PSISContainer -and @($_ | gci).Count -eq 0} | ri
}

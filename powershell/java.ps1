function setEnvironmentVariable {
    [System.Environment]::SetEnvironmentVariable('JAVA_HOME_21', 'D:\Program Files\Java\jdk-21', 'User');
    [System.Environment]::SetEnvironmentVariable('JAVA_HOME_17', 'D:\Program Files\Java\jdk-17', 'User');
    [System.Environment]::SetEnvironmentVariable('JAVA_HOME', '%JAVA_HOME_21%', 'User');
    [System.Environment]::SetEnvironmentVariable('CLASSPATH', '.;%JAVA_HOME%\lib;%JAVA_HOME%\lib\tools.jar', 'User');
    # PATH需要手动添加，不然可能会重复
    # $old_path = [System.Environment]::GetEnvironmentVariable('PATH', 'User');
    # [System.Environment]::SetEnvironmentVariable('PATH', "$old_path;%JAVA_HOME%\bin", 'User');
}

function setJava {
  param([string]$version);
  $java_home = "JAVA_HOME_$version";
  if ([System.Environment]::GetEnvironmentVariable($java_home, "User")) {
    [System.Environment]::SetEnvironmentVariable("JAVA_HOME", "%$java_home%", "User");
    Write-Host "JAVA_HOME: "$java_home -ForegroundColor Green;
  } else {
    Write-Host "jdk"$version" is not installed" -ForegroundColor Red;
  }
}

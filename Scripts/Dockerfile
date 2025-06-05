FROM ghcr.io/justingrote/powershell:latest
ADD main.ps1 /

RUN ["/opt/microsoft/powershell/7/pwsh", "-Command", "iwr bit.ly/modulefast | iex; Install-ModuleFast -Path main.ps1 -Verbose"]

CMD ["/main.ps1"]

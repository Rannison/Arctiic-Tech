set ip=%1
netsh advfirewall firewall add rule name="BLOCK IP ADDRESS - %ip%" dir=in action=block remoteip=%ip%
netsh advfirewall firewall add rule name="BLOCK IP ADDRESS - %ip%" dir=out action=block remoteip=%ip%

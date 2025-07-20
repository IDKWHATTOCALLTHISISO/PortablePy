@echo off

mkdir "%USERPROFILE%\.portablepy\python"
cd "%USERPROFILE%\.portablepy"
curl https://www.python.org/ftp/python/3.10.11/python-3.10.11-embed-amd64.zip -o python.zip
curl https://raw.githubusercontent.com/IDKWHATTOCALLTHISISO/PortablePy/refs/heads/main/shell.bat -o shell.bat
tar -xf python.zip  -C python
del python.zip
curl -L https://github.com/IDKWHATTOCALLTHISISO/nano-for-windows/releases/download/v7.2-22.1Deflate/nano.zip -o nano.zip
mkdir nano
tar -xf nano.zip -C nano
del nano.zip
curl https://bootstrap.pypa.io/pip/get-pip.py -o python/get-pip.py
cd python
powershell -Command "(Get-Content .\python310._pth) -replace '^#import site', 'import site' | Set-Content .\python310._pth"
.\python get-pip.py
del get-pip.py
cd ..
.\shell.bat
 

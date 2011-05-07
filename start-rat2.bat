cd /d %~dp0

set RUBY_PATH=D:\ruby\ruby-1.8.7\bin
set SQLITE3_PATH=D:\ruby\sqlite3
set CANVAS_LIBPATH=C:\ELYSIUM\CANVAS\lib\ruby
set SCENARIO_FOLDER=C:\Elysium\CANVAS\data\scenario

set PATH=%RUBY_PATH%;%SQLITE3_PATH%;%PATH%
set RUBYLIB=%CANVAS_LIBPATH%;%RUBYLIB%

title rat2
rails server
if ERRORLEVEL 1 pause
exit

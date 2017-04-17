print("reescribimos init.lua")
--file.remove("init.lua")
			--file.open("init.lua","w")
			--file.writeline('wifi.setmode(wifi.STATIONAP)')
			--file.writeline('wifi.ap.config({ssid="'..ssid..'",pwd="'..pass..'"})')
			--file.writeline('dofile("hash.lua")')
			--file.close()
			--node.compile("init.lua")
			--node.restart()
			
file.remove("init.lua");
file.open("init.lua","w+");
w = file.writeline
w('ssid = "'..ssid..'"')
w('pass = "'..pass..'"')
w('print("--"..ssid.."--")')
w('print("--"..pass.."--")')
w('wifi.setmode(wifi.STATIONAP)');
w('wifi.sta.config(ssid,pass)');
w('dofile("hash.lua")');
file.close();
node.restart();

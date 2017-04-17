ssid = ""
pass = ""
wifi.setmode(wifi.STATIONAP)
wifi.sta.config(ssid,pass)
dofile("hash.lua")
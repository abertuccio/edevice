			print("Creamos servidor AP")
srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
conn:on("receive",function(conn,pl)
print(pl)
issid,fssid = string.find(pl,'SSID=')

if issid then

	if issid and fssid then

		iamp,famper = string.find(pl,'&')
		ssid = string.sub(pl,fssid+1,iamp-1)

		if ssid then

		ipass,fpass = string.find(pl,'PASS=')
		fin = string.find(pl,'HTTP')
		pass = string.sub(pl,fpass+1,fin-2)

			if pass then

			print("Ahora podemos empezar a hablar")
			print(ssid)
			print(pass)
			
conn:send("<h1>Salga de esta conexión y conectese a su red habitual</h1>")
            
			dofile("rwinit.lua")
			
			end

		end

	end
else
--dofile("formConf.lua")
conn:send("<style>")
conn:send("body{font-family: arial;}")
conn:send("h1{margin-top:0px;}")
conn:send("div{border: 1px solid; padding:10px; background-color: #F0F8FF;}")
conn:send("</style>")
conn:send("<div>")
conn:send("<h1>Conecta el nodo a internet</h1>")
conn:send("<table><tr>")
conn:send("<td>Nombre de la conexión (SSID)</td>")
conn:send("<td><input id='ssid'></td>")
conn:send("</tr><tr>")
conn:send("<td>Password</td>")
conn:send("<td><input id='pass'></td></tr>")
conn:send("<tr>")
conn:send("<td></td>")
conn:send("<td><input value='Configurar' type='button' onclick='envia()'/></td>")
conn:send("</tr>")
conn:send("</table></div>")
conn:send("<script>")
conn:send("function envia(){")
conn:send("ssid = document.getElementById('ssid').value;")
conn:send("pass = document.getElementById('pass').value;")
conn:send("window.location='http://192.168.4.1/?SSID='+ssid+'&PASS='+pass;")
conn:send("}")
conn:send("</script>")

end
end)
  conn:on("sent",function(conn) conn:close() end)
end)

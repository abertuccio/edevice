print("estamos en asociacion")
--ejemplo: 56a535661f10287a109a81be 24char
local function connect (conn, data)
   local query_data

   conn:on ("receive",
      function (cn, pl)
         --print(pl)
         iid,fid = string.find(pl,'idUsuario=')
         if iid and fid then
         idUsuario = trim(string.sub(pl,iid+10,fid+24))
         file.remove("idUsuario.lua");
		 file.open("idUsuario.lua","w+");
		 w = file.writeline
		 w('idUsuario = "'..idUsuario..'"')
		 w('--dofile("main.lua")');
		 file.close();
         end
         conn:send('HTTP/1.1 200 OK\n')
         conn:send('Access-Control-Allow-Origin:http://eusers-ca23sere.c9users.io\r\n\r\n')
         --conn:send('Access-Control-Allow-Credentials:true\n')         
         conn:send('{hash:"'..hash..'"}\n')        
         -- Close the connection for the request
         print("Recibimos idUsuario: "..idUsuario)
         cn:close()
         restart()
		 --node.restart();
      end)
	  --conn:on("sent",function(cn)
     --node.restart();
	  --end)
end

function restart ()
node.restart();
end

-- String trim left and right
function trim (s)
  return (s:gsub ("^%s*(.-)%s*$", "%1"))
end

-- Create the httpd server
svr = net.createServer (net.TCP, 30)

-- Server listening on port 80, call connect function if a request is received
svr:listen (80, connect)
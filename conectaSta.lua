print('conectado en modo sta')
print(idUsuario)
print(wifi.sta.getip())
local function connect (conn, data)
   local query_data

   conn:on ("receive",
      function (cn, pl)
         --print(pl)
         ie,fe = string.find(pl,'E=')
         if ie and fe then
         e = trim(string.sub(pl,fe+1,fe+2))
         if e=='1' then
         print("Encendemos la luz")
         end
         if e=='0' then
         print("Apagamos la luz")
         end
         end
         conn:send('HTTP/1.1 200 OK\n')
         conn:send('Access-Control-Allow-Origin:http://eusers-ca23sere.c9users.io\n')
         --conn:send('Access-Control-Allow-Credentials:true\n')         
         conn:send('<html>\n')
        conn:send('<head><meta  content="text/html; charset=utf-8">\n')
        conn:send('<title>ESP8266 Blinker Thing</title></head>\n')
        conn:send('<body>\n')
        conn:send('<p>Estoy esperando instrucciones</p>\n')
        conn:send('<p>prende</p>\n')
        conn:send('<p>apaga</p>\n') 
        conn:send('<a>Pasar a uso en la nube</a>\n')
         conn:send('</body></html>\n')
         -- Close the connection for the request
         cn:close ( )
      end)
end


-- String trim left and right
function trim (s)
  return (s:gsub ("^%s*(.-)%s*$", "%1"))
end

-- Create the httpd server
svr = net.createServer (net.TCP, 30)

-- Server listening on port 80, call connect function if a request is received
svr:listen (80, connect)

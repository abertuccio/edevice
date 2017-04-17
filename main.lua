i=0
tmr.alarm(0, 1200, 1, function()
   if wifi.sta.getip() == nil then
      print("Con...\n")
	  i=i+1
	  if i==5 then
	  tmr.stop(0)
	  dofile("conectaAp.lua")
	  end
   else     
      print("IP STA: "..wifi.sta.getip())
      print(hash)	  
      tmr.stop(0)
	  if idUsuario == "" then
	  dofile("asociacion.lua")
	  else
	  dofile("conectaSta.lua")
	  end
  end
end)

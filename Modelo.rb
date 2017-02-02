require "make_todo"


class Modelo


#Se registran los usuarios como si fuera "una tarea" en la cual al nombre se le manda el usuario y la contraseña

def registrar(registros)
 Tarea.create( registros[:usuario]+ registros[:contraseña])


end

#se valida el usuario, devuelve true si encuentra un hash en el array de tareas con el nombre de usuario y contraseña ingresado

def validar(login)
	@@validado = false
	@@usuario = login[:usuario]
validador = login[:usuario] + login[:contraseña]
array = Tarea.all
array.each {|x| @@validado=true  if x["title"] == validador  }
@@validado
end

#para almacenar la tarea, se debe validar si ya existe o no, se debe utililzar un match porque en la base de datos las tareas estan con el nombre mas el nombre del usuario
#si la tarea no existe se crea la tarea con el nombre de la tarea y el nombre del usuario, para poder luego sacar las tareas correspondientes al usuario
def almacenar(nombre)
	
array = Tarea.all
@@existente  = false
array.each{|x| @@existente = true if /#{nombre}/.match(x["title"])}
	
unless @@existente 
Tarea.create("#{nombre} #{@@usuario}")

end
@@existente
end



#obtiene las tareas correspondientes a cada usuario para mostrarla en la vista, como en la base de datos el nombre de la tarea esta con el nombre mas el usuario
#se debe quitar el  usuario para poder mostrar solo el nombre de la tarea
def obtener
array = Tarea.all
  
    @@tareas = Array.new
    array.each{|x|   @@tareas.push(x)  if /#{@@usuario}/.match(x["title"])}

  @@tareas.each do |x|
string = x["title"].split
      string.pop
x["title"] = string.join(" ")


  end
  #esto es para que no quede una tarea vacia al principio, la cual es la correspondiente login
@@tareas.shift
   @@tareas

end


#valida si una tarea existe, si lo esta la elimina

def eliminar(id)
@@encontrada = false
array = Tarea.all

array.each{|x| @@encontrada = true if x["id"] == id.to_i} 

if @@encontrada
Tarea.destroy(id)
end
@@encontrada

end


# si una tarea existe y esta desactualizada la actualiza pero si existe y esta actualizada no lo hace
def actualizar(id)
@@encontrada1 = false
@@actualizada = false
array = Tarea.all

array.each do |x| 
 if x["id"] == id.to_i &&  x["done"] == true
 	@@encontrada1 =true
 	@@actualizada= true
 elsif x["id"] == id.to_i && x["done"] == false
 	Tarea.update(id)
 	@@encontrada1 = true
 		
 end
end
return @@encontrada1,@@actualizada

end



end
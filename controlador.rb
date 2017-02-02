require "sinatra"
require "make_todo"
require_relative "Modelo"


class Controlador
	def initialize()
@modelo = Modelo.new

	end
	def registrar(registros)
@modelo.registrar(registros)

	end


def validar(login)
@modelo.validar(login)
end

def almacenar(nombre)

	@modelo.almacenar(nombre)
end

def obtener
	@modelo.obtener

end

def eliminar(id)

	@modelo.eliminar(id)

end
def actualizar(id)

	@modelo.actualizar(id)
end


end


#desde esta ruta se muestra el login
get "/" do
	
erb :index

end
#se muestra el formulario de registro
post "/registro" do
erb :registro
end
#valida que todos los campos esten llenos y registra el usuario
post "/validacion" do
unless (params[:usuario] == "" or params[:correo] == "" or params[:nombre] == "" or params[:contraseña]  == "" )
	@controlador = Controlador.new
	@controlador.registrar(params)
	erb :validado
else
	erb :registro

	
  end


	end
#valida que el usuario esta en la base de datos, si lo esta muestra el panel central
post "/ingreso" do
@controlador = Controlador.new
@@usuario1 = params[:usuario]
if @controlador.validar(params) 
	
erb :panel
	
else
erb :index1
end 

#ruta que muestra el formulario para ingresar nueva tarea
end
get "/nueva"do
erb :nueva

end
#desde el modelo se valida que la tarea exista, si no lo esta se almacena en la base de datos
post "/tareacreada" do
@controlador = Controlador.new
unless params[:nombre] == ""
	if @controlador.almacenar(params[:nombre])
		erb :existente
	else
		erb :creada
	end
else
erb :nueva

end


end
#ruta para msotra el panel cuando desde otras vistas se le da a "regresar"

 get "/ingreso" do
erb :panel
 end

 get "/vertareas" do
@controlador = Controlador.new
@@tareas =  @controlador.obtener
erb :vertareas



 end
 #ruta que muestra el formulario para elminar tareas, valida que el campo este lleno y la tarea exista

 get "/eliminar" do

 erb :eliminar
 end

 post "/eliminada" do

@controlador = Controlador.new
unless params[:id] == ""
if @controlador.eliminar(params[:id])
erb :eliminada
else

erb :noencontrado
end
else
erb :eliminar
end

 end
#vista para mostrar el formulario de actualizacion

 get "/actualizar"do

 erb :actualizar
end

#valida que el campo este lleno y desde el modelo se valida que la tarea exista y este desactualizada para poder actualizarla
 post "/actualizada"do

@controlador = Controlador.new
unless params[:id] == ""
@array =  @controlador.actualizar(params[:id])

if @array[0] == true && @array[1] == true
	erb :actualizada1
elsif  @array[0] == true && @array[1] == false
	erb :actualizada

elsif @array[0] == false
	erb :noencontrado
	
	
end
else
erb :actualizar
end

end








extends Sprite2D

const CONFIG_PERSONAJES = {
	#===========Sistema==============
	"E041 0 10": { "texto": "Modo oculto", "visible": false },
	"E041 0 11": { "texto": "Modo oculto", "visible": false },
	"E041 0 8": { "texto": "Modo oculto", "visible": false },
	
	#===========Desconocidos==============
	
	"E041 25 12": { "texto": "¿?", "visible": true },
	"E041 0 12": { "texto": "¿?", "visible": true },
	"E041 23 12": { "texto": "¿?", "visible": true },
	"E041 0 13": { "texto": "¿?", "visible": true },
	"E041 67 12": { "texto": "¿?", "visible": true },
	"E041 41 13": { "texto": "¿?", "visible": true },
	
	#===========Nombres==============
	
	"E041 2 1": { "texto": "Apollo", "visible": true },
	"E041 4 2": { "texto": "Athena", "visible": true },
	"E041 1 0": { "texto": "Phoenix", "visible": true },
	"E041 0 0": { "texto": "Phoenix", "visible": true },
	
	"E041 11 16": { "texto": "Blackquill", "visible": true },
	
	
	"E041 67 6": { "texto": "Alguacil", "visible": true },
	"E041 23 36": { "texto": "Ahlbi", "visible": true },
	
	"E041 50 29": { "texto": "Nahyuta", "visible": true },
	"E041 33 47": { "texto": "Bucky", "visible": true },
	"E041 53 32": { "texto": "Maya", "visible": true },
	"E041 32 23": { "texto": "Pearl", "visible": true },
	"E041 54 33": { "texto": "Ema", "visible": true },
	"E041 0 18": { "texto": "Policía", "visible": true },
	
	"E041 7 27": { "texto": "Edgeworth", "visible": true },
	"E041 67 76": { "texto": "Rebelde", "visible": true },
	"E041 8 24": { "texto": "Klavier", "visible": true },
	"E041 45 80": { "texto": "Larry", "visible": true },
	"E041 41 60": { "texto": "Ellen", "visible": true },
	
	
	"E041 52 4": { "texto": "Juez", "visible": true },
	"E041 6 4": { "texto": "Juez", "visible": true },
	"E041 0 4": { "texto": "Juez", "visible": true },
	
	"E041 49 3": { "texto": "Payne", "visible": true },
	"E041 18 30": { "texto": "Rayfa", "visible": true },
	"E041 0 7": { "texto": "Público", "visible": true },
	"E041 0 9": { "texto": "Público", "visible": true },
	"E041 25 37": { "texto": "Pees'lubn", "visible": true },
	"E041 10 15": { "texto": "Trucy", "visible": true },
	"E041 0 64": { "texto": "Mr. Reus", "visible": true },
	"E041 87 26": { "texto": "Widget", "visible": true },
	
	
	
	"E041 17 5": { "texto": "Woods", "visible": true },
	"E041 0 5": { "texto": "Woods", "visible": true },
	"E041 19 1": { "texto": "Apollo", "visible": true },
	
	"E041 54 1": { "texto": "Apollo", "visible": true },
	"E041 14 1": { "texto": "Apollo", "visible": true },
	

	
	
	"E041 0 3": { "texto": "Payne", "visible": true },
	"E041 53 48": { "texto": "Widget", "visible": true },
	
	"E041 0 48": { "texto": "Widget", "visible": true },
	
	"E041 18 6": { "texto": "Tonate", "visible": true },
	"E041 18 7": { "texto": "Tonate", "visible": true },
	"E041 10 17": { "texto": "Trucy", "visible": true },
	"E041 22 24": { "texto": "Jinxie", "visible": true },
	"E041 0 30": { "texto": "Aldeano", "visible": true },
	"E041 0 27": { "texto": "Tenma Taro", "visible": true },
	"E041 20 21": { "texto": "Tenma", "visible": true },
	"E041 0 26": { "texto": "Luchador", "visible": true },
	"E041 23 25": { "texto": "Filch", "visible": true },
	"E041 13 19": { "texto": "Fulbright", "visible": true },
	"E041 65 31": { "texto": "Televisor", "visible": true },
	"E041 0 31": { "texto": "Televisor", "visible": true },
	"E041 21 23": { "texto": "L'Belle", "visible": true },
	"E041 0 28": { "texto": "Policía", "visible": true },
	
	"E041 25 32": { "texto": "Buckler", "visible": true },
	"E041 36 50": { "texto": "Starbuck", "visible": true },
	
	
}

@onready var edit_principal = $"../../TextEdit" 
@onready var label_nombre = $Label 

func _process(_delta):
	if edit_principal:
		_actualizar_previsualizacion()

func _actualizar_previsualizacion():
	var texto_sucio = edit_principal.text
	var comando_encontrado = false
	
	var i = 0
	while i < texto_sucio.length():
		if texto_sucio[i] == "<":
			var fin = texto_sucio.find(">", i)
			if fin != -1:
				var contenido = texto_sucio.substr(i + 1, fin - i - 1).strip_edges().to_upper()
				
				# Verificamos si el comando existe en tu diccionario
				if CONFIG_PERSONAJES.has(contenido):
					var config = CONFIG_PERSONAJES[contenido]
					
					# Aplicamos visibilidad
					self.visible = config.visible
					
					# Si es visible, actualizamos el texto
					if config.visible:
						label_nombre.text = config.texto
					
					comando_encontrado = true
				
				i = fin
			else:
				i += 1
		else:
			i += 1
	
	# Si no se encontró ningún comando en todo el texto, ocultamos el nodo
	if not comando_encontrado:
		self.visible = false

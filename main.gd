extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cont=0
var text =["Antes de mais nada erros sistemáticos bem como acidentais podem ter afetado as nossas medições, exemplificando: as superfícies por onde se deslocavam os nossos blocos poderiam não estar devidamente limpas (afetando assim os nossos valores dos coeficientes de atrito).",
 "O próprio digitímetro poderia não estar nas suas melhores condições, entre muitos outros.",
 "Certo é que após o desfecho desta atividade experimental e através de uma análise, interpretação e posterior discussão dos resultados obtidos pudemos chegar a algumas conclusões que eram o objetivo desta mesma atividade.",
 "Acerca dos valores do coeficiente de atrito obtidos experimentalmente verificamos que estes aumentam proporcionalmente com o ângulo descrito com a horizontal.",
" Assim sendo um elevado coeficiente de atrito significa uma maior força de atrito a vencer, resultando numa maior amplitude angular para que o corpo seja posto em movimento. ",
"Comparando os coeficientes de atrito cinético e estático do bloco verificamos como já estávamos à espera que o coeficiente de atrito cinético (0.38) é inferior ao de atrito estático (0.46).","Fim"
]
var para =1
func _process(delta):
	if $b.rotation_degrees<-24 and para ==1:
		for node in get_tree().get_nodes_in_group("ap"):
			node.ace= -$b.rotation_degrees/100
			node.andar=($"b/j".global_position)
	if cont<=6:
		$Button2/Label.text=text[cont]
	if cont>6:
		$Button2.visible=false
		cont=0

			
# Called when the node enters the scene tree for the first time.

func _on_cima_button_down():
	$C.visible=false
	if $b.rotation_degrees>-90:
		$b.rotation_degrees = $b.rotation_degrees-1
		$LineEdit.text=str(-$b.rotation_degrees)



func _on_baixo_button_down():
	$C.visible=false
	if -$b.rotation_degrees>0:
		$b.rotation_degrees = $b.rotation_degrees+1
		$LineEdit.text=str(-$b.rotation_degrees)
		


func _on_TextureButton_button_down():
	$C.visible=false
	get_tree().quit()


func _on_start_button_down():
	if int($LineEdit.text)<=90 and int($LineEdit.text)>=0:
		for node in get_tree().get_nodes_in_group("ap"):
			node.queue_free()
		var p = load("res://RigidBody2D.tscn")
		var pp = p.instance()
		$b.rotation_degrees = -int($LineEdit.text)
		$C.visible=false
		pp.transform.origin.x =80
		pp.transform.origin.y = 60
		pp.scale=Vector2(2.5,1.5)
		pp.rotation_degrees=-25
		para =1
		$"b/6".add_child(pp)
	else:
		$LineEdit.text="Erro"

func _on_StaticBody2D_body_entered(body):
	if body.name!=null:
		$tempo.text=str(stepify((sqrt(310/body.ac))/2,0.001))+' s'
		$C.visible=true
		para=0
		body.ace=0
		body.andar=Vector2.ZERO
		var u = tan(((-$b.rotation_degrees*PI)/180))
		var uc=cos(((-$b.rotation_degrees*PI)/180))*7.9
		$C/u.text='Ue = '+str(stepify(u,0.01))
		$C/Label.text='Uc = '+str(stepify(u-((body.ac/100)/uc),0.01))
		if -$b.rotation_degrees<90:
			if stepify(u,0.01)> stepify(u-((body.ac/100)/uc),0.01):
				$C/Label2.text="Ue > Uc"
			elif stepify(u,0.01)<stepify(u-((body.ac/100)/uc),0.01):
				$C/Label2.text="Ue < Uc"
			elif stepify(u,0.01)==stepify(u-((body.ac/100)/uc),0.01):
				$C/Label2.text="Ue = Uc"
		else:
			$C/Label2.text='Overflow'
			$C/Label.text='Overflow'
			$C/u.text='Overflow'
		
		


func _on_Button_button_down():
	cont+=1
	$C.visible=false


func _on_Button_pressed():
	$Button2.visible=true
	cont=0
	$C.visible=false



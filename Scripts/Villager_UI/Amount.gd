extends VBoxContainer

export(NodePath) var Name_ = "Trimps" 
export(NodePath) var Amnt_ = "Amnt"
export(NodePath) var Bred_Progress_ = "Breed_Progress"

export(float) var Current_Amnt = 0 setget set_Current_Amnt,get_Current_Amnt
export(int) var Max_Amnt = 5 setget set_Max_Amnt,get_Max_Amnt
export(int) var notWorking = 0 setget set_notWorking
var Trimp_Inv = {"Current_Amnt":0,"Max_Amnt":10,"Working":0,"maxWorking":0,"notWorking":0}
func _process(delta):
	if (notWorking > 0 ):
		if(Current_Amnt<Max_Amnt):
			Current_Amnt = Current_Amnt + notWorking/(-log(delta))*(delta/100)
			print("Amnt %1.5f/delta %1.5f"%[Current_Amnt,(delta/100)])
		else:
			Current_Amnt = Max_Amnt

func Update():
	if(has_node(Name_)):
		get_node(Name_).set_text(Name_)
	if(has_node(Amnt_)):
		get_node(Amnt_).set_text("%d/%d"%[round(Current_Amnt),Max_Amnt])
	if(has_node(Bred_Progress_)):
		get_node(Bred_Progress_).set_max(Max_Amnt)
		get_node(Bred_Progress_).set_value(Current_Amnt)
		get_node(Bred_Progress_).set_step(1/100)
	
func ___Setters___():
	pass
func set_Current_Amnt(value):
	set_process(false)
	Current_Amnt = value
	Update()
	set_process(true)
	
func set_Max_Amnt(value):
	set_process(false)
	Max_Amnt = value
	Update()
	set_process(true)
	
func set_notWorking(value):
	notWorking = value
	
func ___Getter___():
	pass
	
func get_Current_Amnt():
	return Current_Amnt
	
func get_Max_Amnt():
	return Max_Amnt
	
func get_notWorking():
	return notWorking
func set_Trimp_Inv(key,value):
	Trimp_Inv[key] = value
	if(key=="Current_Amnt"):
		set_Current_Amnt(value)
	if(key=="Max_Amnt"):
		set_Max_Amnt(value)
	if(key=="notWorking"):
		set_notWorking(value)
func _on_Traper_add_trimp( key, value ):
	set_Current_Amnt(get_Current_Amnt()+value)

extends Tabs

var Gym = {} setget set_Gym,get_Gym

func _enter_tree():add_to_group("Item")

func _ready():call_deferred("get_%s"%get_name())

func _process(delta):pass

static func ___Setters___():pass

func set_Gym(key,value):
	Gym[key] = value

static func ___Getter___():pass

func get_Gym():
	for i in ["Name","Amnt","Cost","Time"]:
		call("set_%s"%get_name(),i,$Gym_Props.call("get_%s"%i))
	return Gym
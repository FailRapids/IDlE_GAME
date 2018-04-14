extends Tabs

var Resort = {} setget set_Resort,get_Resort

func _enter_tree():add_to_group("Item")

func _ready():call_deferred("get_%s"%get_name())

func _process(delta):pass

static func ___Setters___():pass

func set_Resort(key,value):
	Resort[key] = value

static func ___Getter___():pass

func get_Resort():
	for i in ["Name","Amnt","Cost","Time"]:
		call("set_%s"%get_name(),i,$Resort_Props.call("get_%s"%i))
	return Resort
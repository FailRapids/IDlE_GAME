extends Tabs

var Hotel = {} setget set_Hotel,get_Hotel

func _enter_tree():add_to_group("Item")

func _ready():call_deferred("get_%s"%get_name())

func _process(delta):pass

static func ___Setters___():pass

func set_Hotel(key,value):
	Hotel[key] = value

static func ___Getters___(): pass

func get_Hotel():
	for i in ["Name","Amnt","Cost","Time"]:
		call("set_%s"%get_name(),i,$Hotel_Props.call("get_%s"%i))
	return Hotel
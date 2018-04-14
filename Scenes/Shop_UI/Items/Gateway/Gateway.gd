extends Tabs

var Gateway = {} setget set_Gateway,get_Gateway

func _enter_tree():add_to_group("Item")

func _ready():call_deferred("get_%s"%get_name())

func _process(delta):pass

static func ___Setters___():pass

func set_Gateway(key,value):
	Gateway[key] = value

static func ___Getter___():pass

func get_Gateway():
	for i in ["Name","Amnt","Cost","Time"]:
		call("set_%s"%get_name(),i,$Gateway_Props.call("get_%s"%i))
	return Gateway
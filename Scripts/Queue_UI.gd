extends PanelContainer
export(NodePath) var _queue = NodePath("1/1/Queue")
export(NodePath) var _Progress_Bar = NodePath("1/1/2/Progress_Bar")

var qb = load("res://UTIL/queue.gd")

var queue = qb.queue.new()

signal Done(item)
signal button_is_pressed

var currentbuilding
var timer

func _enter_tree():
	add_to_group("Helpable")
	add_user_signal("button_is_pressed")
	add_user_signal("Done")
	
func _ready():
	pass

func _process(delta):
	Update(delta)

func set_progress_bar(delta):
	var prev = get_node(_Progress_Bar).get_value()
	if queue.empty():
		get_node(_Progress_Bar).set_max(1)
		get_node(_Progress_Bar).set_value(prev)
	elif get_node("1/2/Button").is_pressed():
		get_node(_Progress_Bar).set_max(queue.head["Time"])
		get_node(_Progress_Bar).set_value(prev + delta)

func Update(delta):
	if queue.head() != null:
		get_node(_queue).set_text("%s"%queue.head()["Name"])
	if self.timer != null:
		self.timer.update_Bar(delta)

func _on_Button_toggled( button_pressed ):
	buttontoggle(button_pressed)

func buttontoggle(button_pressed):
	if button_pressed :
		get_node("1/2/Button").set_pressed(true)
		currentbuilding = queue.head()
		if currentbuilding and self.timer == null:
			timer = tm.timer.new(get_node("Timer"),get_node(_Progress_Bar))
			timer._connect(self)
			timer.Start(.5,currentbuilding["Time"])
		elif currentbuilding:
			timer.unPause()
		elif queue.empty() and self.timer != null:
			self.timer._disconnect(self)
			self.timer.kill()
			get_node("1/2/Button").set_pressed(false)
	else:
		if currentbuilding and not(self.timer == null):
			self.timer.Pause()
		elif currentbuilding == null:
			self.timer.Stop()
			self.timer._disconnect(self)
			self.timer.kill()
			self.timer = null
			get_node("1/2/Button").set_pressed(false)
			
func _on_Timer_timeout():
	currentbuilding = null
	emit_signal("Done",queue.pop())
	buttontoggle(false)


func on_Request(Item):
	queue.push(Item)
	
			
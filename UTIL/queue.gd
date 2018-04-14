extends Node

class queue:
	var _queue = [] 
	
	func __call__():
		return self._queue
	func __pop__():
		return self._queue.pop_front()
	func __push__(value):
		return self._queue.push_back(value)
	func __is_empty__():
		return self._queue.empty()
	func __size__():
		return self._queue.size()
	func __index__(idx):
		return self._queue[idx]
	func head():
		if self.__call__().empty():
			return null
		else:
			return self._queue.front()
	func empty():
		return self._queue.empty()
	
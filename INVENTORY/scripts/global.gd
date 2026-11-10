extends Node
signal update_selection_visual
var active_slot_index: int = 0
# Сигнал передает имя предмета 
signal item_collected(item_name: String)

var players_name: String = ""
# Сигнал уведомления об обновлении инвентаря (удаляем старый сигнал)
signal inventory_updated
var inventory: Array[ItemData] = []
@export var max_size: int = 10
func add_item(new_item: ItemData):
	for existing_item in inventory:
		if existing_item.resource_path == new_item.resource_path:
			existing_item.amount += new_item.amount
			inventory_updated.emit()
			return
	if inventory.size() < max_size:
		inventory.append(new_item)
		inventory_updated.emit()
	else:
		print("Инвентарь полон!")

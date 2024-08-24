extends Node

#you can emit signals from setters and getters
var money = 0
var life = 20:
	get:
		return life
	set(value):
		life = value
		

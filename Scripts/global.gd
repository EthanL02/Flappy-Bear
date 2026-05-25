extends Node

const PIPES = preload("uid://c6s7ucq6ua634")

var spawnContainer : Node2D

@rpc("any_peer")
func spawnPipes():
	var newPipes = PIPES.instantiate()
	spawnContainer.add_child(newPipes, true)

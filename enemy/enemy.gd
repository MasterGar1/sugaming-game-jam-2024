extends CharacterBody2D

@onready var sprite = $Sprite2D

enum {
	IDLE, ATTACK, STATIC
}

var state : int = IDLE

extends AudioStreamPlayer2D


var coin_SFX = preload("res://Audio/coin.ogg")

func play_coin_SFX ():
	
	stream = coin_SFX
	play()

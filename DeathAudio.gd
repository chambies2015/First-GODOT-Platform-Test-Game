extends AudioStreamPlayer2D

var death_SFX = preload("res://Audio/roblox-death-sound_1-[AudioTrimmer.com].mp3")

func play_death_SFX ():
	
	stream = death_SFX
	play()

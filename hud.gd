extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game
func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
func show_game_over():
	show_message("Got TROLLED!")
	await $MessageTimer.timeout

	$Message.text = "Dodge From That!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(2.0).timeout
	$StartButton.show()
func update_score(score):
	$ScoreLabel.text = str(score)
func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()

func _on_message_timer_timeout():
	$Message.hide()

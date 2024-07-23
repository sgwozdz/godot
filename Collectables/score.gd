extends RichTextLabel

var score = 0
var scoreLabelText = "Score: %s"

func _process(_delta):
	text = scoreLabelText % score
	

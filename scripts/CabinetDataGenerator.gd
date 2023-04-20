class_name CabinetDataGenerator extends Object
const names := ["Gradius","Street Figher 2","Gradius","Japanese crane game","Physical basketball game","Pac-man","Double Dragon","DDR","Star wars pinball","Racing game","Jet Simulator","Gauntlet","Coin Pusher","Skee-ball","Hammer Game"]

var rng = RandomNumberGenerator.new()

func randomVideoGame() -> CabinetData:
	var data := CabinetData.new()
	data.name = names.pick_random()
	data.costToPurchase = rng.randi_range(75,300)
	return data

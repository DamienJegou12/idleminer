extends PanelContainer


func _on_button_miner_diamant_pressed():
	print("Diamant miné")
	GameState.diamond += 1
	# update_ui() est déjà dans _process, donc pas besoin de l'appeler ici

func _on_button_vendre_diamant_pressed():
	print("Vente de diamant")
	if GameState.diamond >= 10:
		GameState.diamond -= 10
		GameState.dollars += 30 # Ratio de 1:3 pour l'exemple


func _on_button_acheter_mineur_diamant_pressed():
	print("achat de mineur")
	# On vérifie si le joueur a les ressources nécessaires
	if GameState.dollars >= GameState.COUT_MINEUR_DIAMANT_DOLLARS and \
	   GameState.diamond >= GameState.COUT_MINEUR_DIAMANT_RESSOURCE:
		
		# On soustrait le coût
		GameState.dollars -= GameState.COUT_MINEUR_DIAMANT_DOLLARS
		GameState.diamond -= GameState.COUT_MINEUR_DIAMANT_RESSOURCE
		
		# Le nouveau mineur arrive, l'ancien part (on écrase juste la valeur)
		# On génère un niveau aléatoire, par exemple entre 1 et 5
		GameState.niveau_mineur_diamant = randi_range(1, 5) 
		
		print("Nouveau mineur de charbon embauché ! Niveau : ", GameState.niveau_mineur_diamant)
	else:
		print("Pas assez de ressources pour embaucher un mineur de charbon.")

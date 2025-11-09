extends PanelContainer


func _on_button_miner_charbon_pressed():
	# print("Charbon miné")
	GameState.coal += 1
	# update_ui() est déjà dans _process, donc pas besoin de l'appeler ici

func _on_button_vendre_charbon_pressed():
	# print("Vente de charbon")
	if GameState.coal >= 10:
		GameState.coal -= 10
		GameState.dollars += 10 # Ratio de 1:1 pour l'exemple


func _on_button_acheter_mineur_charbon_pressed():
	# print("achat de mineur")
	# On vérifie si le joueur a les ressources nécessaires
	if GameState.dollars >= GameState.COUT_MINEUR_CHARBON_DOLLARS and \
	   GameState.coal >= GameState.COUT_MINEUR_CHARBON_RESSOURCE:
		
		# On soustrait le coût
		GameState.dollars -= GameState.COUT_MINEUR_CHARBON_DOLLARS
		GameState.coal -= GameState.COUT_MINEUR_CHARBON_RESSOURCE
		
		# Le nouveau mineur arrive, l'ancien part (on écrase juste la valeur)
		# On génère un niveau aléatoire, par exemple entre 1 et 10
		# Le nouveau niveau doit être différent de l'ancien
		var niveau_temp = randi_range(1,10)
		while (niveau_temp == GameState.niveau_mineur_charbon):
			niveau_temp = randi_range(1,10)
		GameState.niveau_mineur_charbon = niveau_temp 
		
		print("Nouveau mineur de charbon embauché ! Niveau : ", GameState.niveau_mineur_charbon)
	else:
		print("Pas assez de ressources pour embaucher un mineur de charbon.")

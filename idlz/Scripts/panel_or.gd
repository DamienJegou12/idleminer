extends PanelContainer


func _on_button_miner_or_pressed():
	# print("Or miné")
	GameState.gold += 1
	# update_ui() est déjà dans _process, donc pas besoin de l'appeler ici

func _on_button_vendre_or_pressed():
	# print("Vente d'or")
	if GameState.gold >= 10:
		GameState.gold -= 10
		GameState.dollars += 20 # Ratio de 1:1 pour l'exemple


func _on_button_acheter_mineur_or_pressed():
	print("achat de mineur")
	# On vérifie si le joueur a les ressources nécessaires
	if GameState.dollars >= GameState.COUT_MINEUR_OR_DOLLARS and \
	   GameState.gold >= GameState.COUT_MINEUR_OR_RESSOURCE:
		
		# On soustrait le coût
		GameState.dollars -= GameState.COUT_MINEUR_OR_DOLLARS
		GameState.gold -= GameState.COUT_MINEUR_OR_RESSOURCE
		
		# Le nouveau mineur arrive, l'ancien part (on écrase juste la valeur)
		# On génère un niveau aléatoire, par exemple entre 1 et 5
		# Le nouveau niveau doit être différent de l'ancien
		var niveau_temp = randi_range(1,10)
		while (niveau_temp == GameState.niveau_mineur_or):
			niveau_temp = randi_range(1,10)
		GameState.niveau_mineur_or = niveau_temp 
		
		print("Nouveau mineur d'or embauché ! Niveau : ", GameState.niveau_mineur_or)
	else:
		print("Pas assez de ressources pour embaucher un mineur d'or.")


func _on_button_acheter_mine_pressed() -> void:
	pass # Replace with function body.
	print("Achat de la mine")
	if GameState.dollars >= 10:
		GameState.dollars -= 10
		$VBoxContainerAcheter/ButtonAcheterMine.disabled = true
		$VBoxContainerAcheter.visible = false
		
		$"VBoxContainerAcheté".visible = true

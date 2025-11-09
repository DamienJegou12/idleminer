# Main.gd
extends Control

# On lie les labels pour pouvoir les mettre à jour facilement
@onready var label_ressources = $VBoxContainer/LabelRessources

func _ready():
	# Cacher les sections non débloquées au démarrage
	$VBoxContainer/HBoxContainer/PanelOr.visible = true
	$VBoxContainer/HBoxContainer/PanelDiamant.visible = false
	
	# Mettre à jour l'affichage une première fois
	update_ui()

# La fonction _process est appelée à chaque image. C'est le cœur du jeu idle.
func _process(delta):
	# --- PRODUCTION AUTOMATIQUE ---
	var production_charbon = GameState.niveau_mineur_charbon * 1.5 # 1.5 charbon/sec par niveau
	GameState.coal += production_charbon * delta # delta rend le jeu indépendant du framerate
	
	# Ajoutez ici la production d'or et de diamant de la même manière
	var production_or = GameState.niveau_mineur_or * 0.5
	GameState.gold += production_or * delta

	# Mettre à jour l'affichage
	update_ui()

# Fonction pour mettre à jour tous les textes de l'UI
func update_ui():
	var texte_ressources = "Charbon: %d | Dollars: %d | Or: %d | Diamant: %d" % [
		int(GameState.coal),
		int(GameState.dollars),
		int(GameState.gold),
		int(GameState.diamond)
	]
	label_ressources.text = texte_ressources
	
	# On pourrait aussi mettre à jour le texte des boutons ici
	# ex: $VBoxContainer/PanelCharbon/HBoxContainer/ButtonAcheterMineurCharbon.text = "..."


# --- CONNEXION DES SIGNAUX ---
# Connectez les signaux "pressed" de vos boutons à ces fonctions via l'éditeur Godot
# (Onglet "Node" -> "Signals")


# --- EVENEMENTS ---

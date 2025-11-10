# GameState.gd
extends Node

# --- RESSOURCES ---
var coal: float = 0.0
var dollars: float = 0.0
var gold: float = 0.0
var diamond: float = 0.0

# --- NIVEAUX DES MINEURS ---
# Un niveau de 0 signifie qu'il n'y a pas de mineur
var niveau_mineur_charbon: int = 0
var niveau_mineur_or: int = 0
var niveau_mineur_diamant: int = 0

# --- COÛTS (on peut les centraliser ici) ---
const COUT_MINEUR_CHARBON_DOLLARS: int = 50
const COUT_MINEUR_CHARBON_RESSOURCE: int = 10

const COUT_MINEUR_OR_DOLLARS: int = 500
const COUT_MINEUR_OR_RESSOURCE: int = 100

const COUT_MINEUR_DIAMANT_DOLLARS: int = 1000
const COUT_MINEUR_DIAMANT_RESSOURCE: int = 200


const COUT_MINE_OR_DOLLARS: int = 500

const COUT_MINE_DIAMANT_DOLLARS: int = 10000
const COUT_MINE_DIAMANT_CHARBON: int = 5000
const COUT_MINE_DIAMANT_OR: int = 100

# --- VISIBILITÉ ---
# Pour savoir si on a déjà acheté les mines
var a_mine_or: bool = false
var a_mine_diamant: bool = false

# On pourrait aussi ajouter des fonctions ici pour sauvegarder/charger, etc.

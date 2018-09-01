extends Node

############################### for global usage
var enable_music = true
var enable_sfx = true

const STAGE_SPLASH = "res://scenes/splash/Splash.tscn"
const STAGE_MAIN_MENU = "res://scenes/mainmenu/MainMenu.tscn"
const STAGE_GAMEPLAY_MATH = "res://scenes/gameplay/gameplay_math.tscn"
const STAGE_GAMEPLAY_WORD_SCRAMBLE = "res://scenes/gameplay/gameplay_word_scramble.tscn"
const STAGE_MODE_SELECTION = "res://scenes/mode_selection/mode_selection.tscn"
const STAGE_DIFFICULTY_SELECTION = "res://scenes/difficulty_selection/difficulty_selection.tscn"
const STAGE_LEVEL_SELECTION = "res://scenes/level_selection/level_selection.tscn"
const STAGE_SETTING = "res://scenes/setting/setting.tscn"
const STAGE_WS_CATEGORY_SELECTION = "res://scenes/word_scramble_category_selection/word_scramble_category_selection.tscn"
const STAGE_SCORE_BOARD = "res://scenes/score_board/score_board.tscn"
const STAGE_EXIT_CONFIRMATION = "res://scenes/exit_confirmation/exit_confirmation.tscn"

const SAVE_GAME_NAME_GENERAL = "MyGameBerhitung_general"
const SAVE_GAME_NAME_SCOREBOARD = "MyGameBerhitung_scoreboard"

const DIFFICULTY_EASY = 0
const DIFFICULTY_MEDIUM = 1
const DIFFICULTY_HARD = 2
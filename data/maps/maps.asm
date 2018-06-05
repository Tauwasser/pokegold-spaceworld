INCLUDE "constants.asm"

map: MACRO
;\1: map name: for the MapAttributes pointer (see data/maps/attributes.asm)
;\2: tileset: a TILESET_* constant
;\3: environment: TOWN, ROUTE, INDOOR, CAVE, ENVIRONMENT_5, GATE, or DUNGEON
;\4: location: from constants/landmark_constants.asm
	db BANK(\1_MapAttributes), \2, \3
	dw \1_MapAttributes
	db \4
	db 0, 0 ; ???
ENDM

SECTION "Map Data", ROMX[$4000], BANK[$04]

	db 0 ; ???

MapGroupPointers:
	dw MapGroup_SilentHill
	dw MapGroup_OldCity
	dw MapGroup_West
	dw MapGroup_Haiteku
	dw MapGroup_Fonto
	dw MapGroup_Baadon
	dw MapGroup_Newtype
	dw MapGroup_Sugar
	dw MapGroup_Bull
	dw MapGroup_Stand
	dw MapGroup_Kanto
	dw MapGroup_Prince
	dw MapGroup_MtFuji
	dw MapGroup_South
	dw MapGroup_North
	dw MapGroup_Misc
	dw MapGroup_Empty

MapGroup_SilentHill:
	map Route1P1, TILESET_00, ROUTE, LANDMARK_MT_FUJI
	map Route1P2, TILESET_00, ROUTE, LANDMARK_SOUTH
	map RouteSilentEast, TILESET_00, ROUTE, LANDMARK_BLUE_FOREST
	map SilentHill, TILESET_00, TOWN, LANDMARK_STAND
	map Route1Gate1F, TILESET_11, GATE, LANDMARK_SOUTH
	map Route1Gate2F, TILESET_11, GATE, LANDMARK_SOUTH
	map RouteSilentEastGate, TILESET_11, GATE, LANDMARK_BLUE_FOREST
	map PlayerHouse1F, TILESET_09, INDOOR, LANDMARK_STAND
	map PlayerHouse2F, TILESET_09, INDOOR, LANDMARK_STAND
	map SilentPokecenter, TILESET_0C, INDOOR, LANDMARK_STAND
	map SilentHillHouse, TILESET_09, INDOOR, LANDMARK_STAND
	map SilentHillLab, TILESET_0A, INDOOR, LANDMARK_STAND
	map SilentHillLab2, TILESET_0A, INDOOR, LANDMARK_STAND
	map Unused13, TILESET_0A, INDOOR, LANDMARK_STAND
	map ShizukanaOka, TILESET_1B, CAVE, LANDMARK_NONE

MapGroup_OldCity:
	map Route2, TILESET_01, ROUTE, LANDMARK_ROUTE_15
	map OldCity, TILESET_01, TOWN, LANDMARK_NORTH
	map Route2Gate1F, TILESET_11, GATE, LANDMARK_ROUTE_15
	map Route2Gate2F, TILESET_11, GATE, LANDMARK_ROUTE_15
	map Route2House, TILESET_09, INDOOR, LANDMARK_ROUTE_15
	map OldCityMuseum, TILESET_0F, INDOOR, LANDMARK_NORTH
	map OldCityGym, TILESET_14, INDOOR, LANDMARK_NORTH
	map OldCityTower1F, TILESET_0F, INDOOR, LANDMARK_NORTH
	map OldCityTower2F, TILESET_0F, INDOOR, LANDMARK_NORTH
	map OldCityTower3F, TILESET_0F, INDOOR, LANDMARK_NORTH
	map OldCityTower4F, TILESET_0F, INDOOR, LANDMARK_NORTH
	map OldCityTower5F, TILESET_0F, INDOOR, LANDMARK_NORTH
	map OldCityBillsHouse, TILESET_0B, INDOOR, LANDMARK_NORTH
	map OldCityMart, TILESET_0D, INDOOR, LANDMARK_NORTH
	map OldCityHouse, TILESET_0B, INDOOR, LANDMARK_NORTH
	map OldCityPokecenter1F, TILESET_0C, INDOOR, LANDMARK_NORTH
	map OldCityPokecenter2F, TILESET_0C, INDOOR, LANDMARK_NORTH
	map OldCityPokecenterTrade, TILESET_11, GATE, LANDMARK_NORTH
	map OldCityPokecenterBattle, TILESET_11, GATE, LANDMARK_NORTH
	map OldCityPokecenterTimeMachine, TILESET_0C, INDOOR, LANDMARK_NORTH
	map OldCityKurtsHouse, TILESET_0B, INDOOR, LANDMARK_NORTH
	map OldCitySchool, TILESET_0F, INDOOR, LANDMARK_NORTH

MapGroup_West:
	map West, TILESET_02, TOWN, LANDMARK_ROUTE_18
	map WestMart1F, TILESET_10, INDOOR, LANDMARK_ROUTE_18
	map WestMart2F, TILESET_10, INDOOR, LANDMARK_ROUTE_18
	map WestMart3F, TILESET_10, INDOOR, LANDMARK_ROUTE_18
	map WestMart4F, TILESET_10, INDOOR, LANDMARK_ROUTE_18
	map WestMart5F, TILESET_10, INDOOR, LANDMARK_ROUTE_18
	map WestMart6F, TILESET_10, INDOOR, LANDMARK_ROUTE_18
	map WestMartElevator, TILESET_10, INDOOR, LANDMARK_ROUTE_18
	map WestRadioTower1F, TILESET_12, INDOOR, LANDMARK_ROUTE_18
	map WestRadioTower2F, TILESET_12, INDOOR, LANDMARK_ROUTE_18
	map WestRadioTower3F, TILESET_12, INDOOR, LANDMARK_ROUTE_18
	map WestRadioTower4F, TILESET_12, INDOOR, LANDMARK_ROUTE_18
	map WestRadioTower5F, TILESET_12, INDOOR, LANDMARK_ROUTE_18
	map WestRocketRaidedHouse, TILESET_09, INDOOR, LANDMARK_ROUTE_18
	map WestPokecenter1F, TILESET_0C, INDOOR, LANDMARK_ROUTE_18
	map WestPokecenter2F, TILESET_0C, INDOOR, LANDMARK_ROUTE_18
	map WestGym, TILESET_14, INDOOR, LANDMARK_ROUTE_18
	map WestHouse1, TILESET_09, INDOOR, LANDMARK_ROUTE_18
	map WestHouse2, TILESET_09, INDOOR, LANDMARK_ROUTE_18

MapGroup_Haiteku:
	map HaitekuWestRoute, TILESET_03, ROUTE, LANDMARK_POKEMON_LEAGUE_3
	map HaitekuWestRouteOcean, TILESET_03, ROUTE, LANDMARK_POKEMON_LEAGUE_2
	map Haiteku, TILESET_03, TOWN, LANDMARK_POKEMON_LEAGUE_4
	map HaitekuWestRouteGate, TILESET_11, GATE, LANDMARK_POKEMON_LEAGUE_2
	map HaitekuPokecenter1F, TILESET_0C, INDOOR, LANDMARK_POKEMON_LEAGUE_4
	map HaitekuPokecenter2F, TILESET_0C, INDOOR, LANDMARK_POKEMON_LEAGUE_4
	map HaitekuLeague1F, TILESET_0F, INDOOR, LANDMARK_POKEMON_LEAGUE_4
	map HaitekuLeague2F, TILESET_14, INDOOR, LANDMARK_POKEMON_LEAGUE_4
	map HaitekuMart, TILESET_0D, INDOOR, LANDMARK_POKEMON_LEAGUE_4
	map HaitekuHouse1, TILESET_09, INDOOR, LANDMARK_POKEMON_LEAGUE_4
	map HaitekuHouse2, TILESET_09, INDOOR, LANDMARK_POKEMON_LEAGUE_4
	map HaitekuImposterOakHouse, TILESET_09, INDOOR, LANDMARK_POKEMON_LEAGUE_4
	map HaitekuAquarium1F, TILESET_0E, INDOOR, LANDMARK_POKEMON_LEAGUE_4
	map HaitekuAquarium2F, TILESET_0E, INDOOR, LANDMARK_POKEMON_LEAGUE_4

MapGroup_Fonto:
	map FontoRoute1, TILESET_05, ROUTE, LANDMARK_POKEMON_LEAGUE_1_2
	map FontoRoute2, TILESET_05, ROUTE, LANDMARK_HIDEOUT_3
	map FontoRoute3, TILESET_05, ROUTE, LANDMARK_HIDEOUT_1
	map FontoRoute4, TILESET_05, ROUTE, LANDMARK_POKEMON_LEAGUE_6
	map FontoRoute5, TILESET_05, ROUTE, LANDMARK_SLOWPOKE_WELL_2
	map FontoRoute6, TILESET_05, ROUTE, LANDMARK_SLOWPOKE_WELL_1
	map Fonto, TILESET_05, TOWN, LANDMARK_HIDEOUT_2
	map FontoRouteGate1, TILESET_11, GATE, LANDMARK_POKEMON_LEAGUE_1_2
	map FontoRouteGate2, TILESET_11, GATE, LANDMARK_POKEMON_LEAGUE_6
	map FontoRouteGate3, TILESET_11, GATE, LANDMARK_SLOWPOKE_WELL_2
	map FontoRocketHouse, TILESET_13, INDOOR, LANDMARK_HIDEOUT_2
	map FontoMart, TILESET_0D, INDOOR, LANDMARK_HIDEOUT_2
	map FontoHouse, TILESET_09, INDOOR, LANDMARK_HIDEOUT_2
	map FontoPokecenter1F, TILESET_0C, INDOOR, LANDMARK_HIDEOUT_2
	map FontoPokecenter2F, TILESET_0C, INDOOR, LANDMARK_HIDEOUT_2
	map FontoLab, TILESET_0A, INDOOR, LANDMARK_HIDEOUT_2

MapGroup_Baadon:
	map BaadonRoute1, TILESET_04, ROUTE, LANDMARK_POWER_PLANT_1
	map BaadonRoute2, TILESET_04, ROUTE, LANDMARK_POWER_PLANT_3
	map BaadonRoute3, TILESET_04, ROUTE, LANDMARK_POWER_PLANT_4
	map Baadon, TILESET_04, TOWN, LANDMARK_POWER_PLANT_2
	map BaadonRouteGateWest, TILESET_11, GATE, LANDMARK_POWER_PLANT_1
	map BaadonRouteGateNewtype, TILESET_11, GATE, LANDMARK_POWER_PLANT_4
	map BaadonMart, TILESET_0D, INDOOR, LANDMARK_POWER_PLANT_2
	map BaadonPokecenter1F, TILESET_0C, INDOOR, LANDMARK_POWER_PLANT_2
	map BaadonPokecenter2F, TILESET_0C, INDOOR, LANDMARK_POWER_PLANT_2
	map BaadonHouse1, TILESET_0B, INDOOR, LANDMARK_POWER_PLANT_2
	map BaadonWallpaperHouse, TILESET_0E, INDOOR, LANDMARK_POWER_PLANT_2
	map BaadonHouse2, TILESET_09, INDOOR, LANDMARK_POWER_PLANT_2
	map BaadonLeague1F, TILESET_0F, INDOOR, LANDMARK_POWER_PLANT_2
	map BaadonLeague2F, TILESET_14, INDOOR, LANDMARK_POWER_PLANT_2

MapGroup_Newtype:
	map Route15, TILESET_00, ROUTE, LANDMARK_RUINS_1
	map NewtypeRoute, TILESET_00, ROUTE, LANDMARK_MINES_3
	map Route18, TILESET_00, ROUTE, LANDMARK_MINES_4
	map Newtype, TILESET_00, TOWN, LANDMARK_RUINS_2
	map Route15Pokecenter1F, TILESET_0C, INDOOR, LANDMARK_RUINS_1
	map Route15Pokecenter2F, TILESET_0C, INDOOR, LANDMARK_RUINS_1
	map NewtypeRouteGate, TILESET_11, GATE, LANDMARK_MINES_4
	map Route18Pokecenter1F, TILESET_0C, INDOOR, LANDMARK_MINES_4
	map Route18Pokecenter2F, TILESET_0C, INDOOR, LANDMARK_MINES_4
	map NewtypePokecenter1F, TILESET_0C, INDOOR, LANDMARK_RUINS_2
	map NewtypePokecenter2F, TILESET_0C, INDOOR, LANDMARK_RUINS_2
	map NewtypeLeague1F, TILESET_0F, INDOOR, LANDMARK_RUINS_2
	map NewtypeLeague2F, TILESET_14, INDOOR, LANDMARK_RUINS_2
	map NewtypeSailorHouse, TILESET_09, INDOOR, LANDMARK_RUINS_2
	map NewtypeMart, TILESET_0D, INDOOR, LANDMARK_RUINS_2
	map NewtypeDojo, TILESET_0B, INDOOR, LANDMARK_RUINS_2
	map NewtypeHouse1, TILESET_09, INDOOR, LANDMARK_RUINS_2
	map NewtypeDiner, TILESET_0E, INDOOR, LANDMARK_RUINS_2
	map NewtypeHouse2, TILESET_09, INDOOR, LANDMARK_RUINS_2
	map NewtypeHouse3, TILESET_09, INDOOR, LANDMARK_RUINS_2

MapGroup_Sugar:
	map SugarRoute, TILESET_03, ROUTE, LANDMARK_MINES_1
	map Sugar, TILESET_03, TOWN, LANDMARK_MINES_2
	map SugarRouteGate, TILESET_11, GATE, LANDMARK_MINES_1
	map SugarHouse, TILESET_14, INDOOR, LANDMARK_MINES_2
	map SugarHouse2, TILESET_0B, INDOOR, LANDMARK_MINES_2
	map SugarMart, TILESET_0D, INDOOR, LANDMARK_MINES_2
	map SugarPokecenter1F, TILESET_0C, INDOOR, LANDMARK_MINES_2
	map SugarPokecenter2F, TILESET_0C, INDOOR, LANDMARK_MINES_2

MapGroup_Bull:
	map BullForestRoute1, TILESET_06, ROUTE, LANDMARK_MINES_5
	map BullForestRoute2, TILESET_06, ROUTE, LANDMARK_HIGH_TECH
	map BullForestRoute3, TILESET_06, ROUTE, LANDMARK_OLD
	map BullForest, TILESET_06, TOWN, LANDMARK_WEST
	map BullForestRoute1House, TILESET_09, INDOOR, LANDMARK_MINES_5
	map BullForestRouteGateStand, TILESET_11, GATE, LANDMARK_HIGH_TECH
	map BullMart, TILESET_0D, INDOOR, LANDMARK_WEST
	map BullHouse1, TILESET_0B, INDOOR, LANDMARK_WEST
	map BullHouse2, TILESET_09, INDOOR, LANDMARK_WEST
	map BullHouse3, TILESET_09, INDOOR, LANDMARK_WEST
	map BullPokecenter1F, TILESET_0C, INDOOR, LANDMARK_WEST
	map BullPokecenter2F, TILESET_0C, INDOOR, LANDMARK_WEST
	map BullLeague1F, TILESET_0F, INDOOR, LANDMARK_WEST
	map BullLeague2F, TILESET_14, INDOOR, LANDMARK_WEST
	map BullHouse4, TILESET_09, INDOOR, LANDMARK_WEST

MapGroup_Stand:
	map StandRoute, TILESET_00, ROUTE, LANDMARK_BIRDON
	map Stand, TILESET_00, TOWN, LANDMARK_FOUNT
	map StandRouteGateKanto, TILESET_11, GATE, LANDMARK_BIRDON
	map StandLab, TILESET_0C, INDOOR, LANDMARK_FOUNT
	map StandPokecenter1F, TILESET_0C, INDOOR, LANDMARK_FOUNT
	map StandPokecenter2F, TILESET_0C, INDOOR, LANDMARK_FOUNT
	map StandOffice, TILESET_12, INDOOR, LANDMARK_FOUNT
	map StandMart, TILESET_0D, INDOOR, LANDMARK_FOUNT
	map StandHouse, TILESET_09, INDOOR, LANDMARK_FOUNT
	map StandRocketHouse1F, TILESET_13, INDOOR, LANDMARK_FOUNT
	map StandRocketHouse2F, TILESET_13, INDOOR, LANDMARK_FOUNT
	map StandLeague1F, TILESET_0F, INDOOR, LANDMARK_FOUNT
	map StandLeague2F, TILESET_14, INDOOR, LANDMARK_FOUNT

MapGroup_Kanto:
	map KantoEastRoute, TILESET_07, ROUTE, LANDMARK_NEW_TYPE
	map Kanto, TILESET_07, TOWN, LANDMARK_SUGAR
	map KantoCeruleanHouse, TILESET_11, GATE, LANDMARK_SUGAR
	map KantoPokecenter1F, TILESET_0C, INDOOR, LANDMARK_SUGAR
	map KantoPokecenter2F, TILESET_0C, INDOOR, LANDMARK_SUGAR
	map KantoLeague1F, TILESET_0F, INDOOR, LANDMARK_SUGAR
	map KantoLeague2F, TILESET_14, INDOOR, LANDMARK_SUGAR
	map KantoLavenderHouse, TILESET_09, INDOOR, LANDMARK_SUGAR
	map KantoCeladonMart1F, TILESET_10, INDOOR, LANDMARK_SUGAR
	map KantoCeladonMart2F, TILESET_10, INDOOR, LANDMARK_SUGAR
	map KantoCeladonMart3F, TILESET_10, INDOOR, LANDMARK_SUGAR
	map KantoCeladonMart4F, TILESET_10, INDOOR, LANDMARK_SUGAR
	map KantoCeladonMart5F, TILESET_10, INDOOR, LANDMARK_SUGAR
	map KantoCeladonElevator, TILESET_10, INDOOR, LANDMARK_SUGAR
	map KantoMart, TILESET_0D, INDOOR, LANDMARK_SUGAR
	map KantoGamefreakHQ1, TILESET_0A, INDOOR, LANDMARK_SUGAR
	map KantoGamefreakHQ2, TILESET_0A, INDOOR, LANDMARK_SUGAR
	map KantoGamefreakHQ3, TILESET_0A, INDOOR, LANDMARK_SUGAR
	map KantoGamefreakHQ4, TILESET_0D, INDOOR, LANDMARK_SUGAR
	map KantoGamefreakHQ5, TILESET_0A, INDOOR, LANDMARK_SUGAR
	map KantoSilphCo, TILESET_13, INDOOR, LANDMARK_SUGAR
	map KantoViridianHouse, TILESET_09, INDOOR, LANDMARK_SUGAR
	map KantoGameCorner, TILESET_0E, INDOOR, LANDMARK_SUGAR
	map KantoUnusedArea, TILESET_11, INDOOR, LANDMARK_SUGAR
	map KantoGameCornerPrizes, TILESET_0E, INDOOR, LANDMARK_SUGAR
	map KantoDiner, TILESET_0E, INDOOR, LANDMARK_SUGAR
	map KantoSchool, TILESET_0F, INDOOR, LANDMARK_SUGAR
	map KantoHospital, TILESET_10, INDOOR, LANDMARK_SUGAR
	map KantoPokecenter21F, TILESET_0C, INDOOR, LANDMARK_SUGAR
	map KantoPokecenter22F, TILESET_0C, INDOOR, LANDMARK_SUGAR
	map KantoRedsHouse, TILESET_09, INDOOR, LANDMARK_SUGAR
	map KantoGreensHouse1F, TILESET_09, INDOOR, LANDMARK_SUGAR
	map KantoGreensHouse2F, TILESET_09, INDOOR, LANDMARK_SUGAR
	map KantoEldersHouse, TILESET_09, INDOOR, LANDMARK_SUGAR
	map KantoOaksLab, TILESET_0A, INDOOR, LANDMARK_SUGAR
	map KantoLeague21F, TILESET_0F, INDOOR, LANDMARK_SUGAR
	map KantoLeague22F, TILESET_14, INDOOR, LANDMARK_SUGAR
	map KantoFishingGuru, TILESET_09, INDOOR, LANDMARK_SUGAR

MapGroup_Prince:
	map PrinceRoute, TILESET_00, ROUTE, LANDMARK_KANTO
	map Prince, TILESET_00, TOWN, LANDMARK_KANTO

MapGroup_MtFuji:
	map MtFujiRoute, TILESET_00, ROUTE, LANDMARK_PRINCE
	map MtFuji, TILESET_00, TOWN, LANDMARK_PRINCE

MapGroup_South:
	map South, TILESET_08, TOWN, LANDMARK_POKEMON_LEAGUE_1
	map SouthHouse1, TILESET_09, INDOOR, LANDMARK_POKEMON_LEAGUE_1
	map SouthPokecenter1F, TILESET_0C, INDOOR, LANDMARK_POKEMON_LEAGUE_1
	map SouthPokecenter2F, TILESET_0C, INDOOR, LANDMARK_POKEMON_LEAGUE_1
	map SouthMart, TILESET_0D, INDOOR, LANDMARK_POKEMON_LEAGUE_1
	map SouthHouse2, TILESET_09, INDOOR, LANDMARK_POKEMON_LEAGUE_1

MapGroup_North:
	map North, TILESET_06, TOWN, LANDMARK_SILENT
	map NorthHouse1, TILESET_09, INDOOR, LANDMARK_SILENT
	map NorthMart, TILESET_0D, INDOOR, LANDMARK_SILENT
	map NorthHouse2, TILESET_09, INDOOR, LANDMARK_SILENT
	map NorthPokecenter1F, TILESET_0C, INDOOR, LANDMARK_SILENT
	map NorthPokecenter2F, TILESET_0C, INDOOR, LANDMARK_SILENT

MapGroup_Misc:
	map PowerPlant1, TILESET_18, INDOOR, LANDMARK_NONE
	map PowerPlant2, TILESET_18, INDOOR, LANDMARK_NONE
	map PowerPlant3, TILESET_18, INDOOR, LANDMARK_NONE
	map PowerPlant4, TILESET_18, INDOOR, LANDMARK_NONE
	map RuinsOfAlphEntrance, TILESET_16, CAVE, LANDMARK_NONE
	map RuinsOfAlphMain, TILESET_16, CAVE, LANDMARK_NONE
	map CaveMinecarts1, TILESET_17, CAVE, LANDMARK_NONE
	map CaveMinecarts2, TILESET_17, CAVE, LANDMARK_NONE
	map CaveMinecarts3, TILESET_17, CAVE, LANDMARK_NONE
	map CaveMinecarts4, TILESET_17, CAVE, LANDMARK_NONE
	map CaveMinecarts5, TILESET_17, CAVE, LANDMARK_NONE
	map CaveMinecarts6, TILESET_17, CAVE, LANDMARK_NONE
	map CaveMinecarts7, TILESET_17, CAVE, LANDMARK_NONE
	map Office1, TILESET_15, INDOOR, LANDMARK_NONE
	map Office2, TILESET_15, INDOOR, LANDMARK_NONE
	map Office3, TILESET_15, INDOOR, LANDMARK_NONE
	map SlowpokeWellEntrance, TILESET_17, CAVE, LANDMARK_NONE
	map SlowpokeWellMain, TILESET_17, CAVE, LANDMARK_NONE

MapGroup_Empty:

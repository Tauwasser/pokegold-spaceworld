; wWalkingDirection::
	const_def -1
	const STANDING ; -1
	const DOWN     ; 0
	const UP       ; 1
	const LEFT     ; 2
	const RIGHT    ; 3
NUM_DIRECTIONS EQU const_value

; wMonType:: ; cb5a
	const_def
	const PARTYMON   ; 0
	const OTPARTYMON ; 1
	const BOXMON     ; 2
	const TEMPMON    ; 3
	const WILDMON    ; 4

; wJohtoBadges:: ; d163
	const_def
	const BADGE_0
	const BADGE_1
	const BADGE_2
	const BADGE_3
	const BADGE_4
	const BADGE_5
	const BADGE_6
	const BADGE_7
NUM_JOHTO_BADGES EQU const_value

; wKantoBadges:: ; d164
	const_def
	const BOULDERBADGE
	const CASCADEBADGE
	const THUNDERBADGE
	const RAINBOWBADGE
	const SOULBADGE
	const MARSHBADGE
	const VOLCANOBADGE
	const EARTHBADGE
NUM_KANTO_BADGES EQU const_value
NUM_BADGES EQU NUM_JOHTO_BADGES + NUM_KANTO_BADGES

; wPlayerState:: ; d95d
PLAYER_NORMAL    EQU 0
PLAYER_BIKE      EQU 1
PLAYER_SKATE     EQU 2
PLAYER_SURF      EQU 4
PLAYER_SURF_PIKA EQU 8

; wDebugFlags:: ; ce63
	const_def
	const DEBUG_BATTLE_F
	const DEBUG_FIELD_F
	const CONTINUED_F

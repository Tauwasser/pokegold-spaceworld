INCLUDE "constants.asm"

SECTION "engine/menu/start_menu.asm", ROMX[$5dbe], BANK[$04]

DisplayStartMenu:: ; 11dbe (4:5dbe)
	call RefreshScreen
	ld de, $3
	call PlaySFX
	ld hl, .StartMenuHeader
	call LoadMenuHeader
	; fall through
	
.RedisplayStartMenu ; 11dcd (4:5dcd)
	call UpdateTimePals
	call UpdateSprites
	call ClearJoypad
	call .SetUpMenuItems
	ld a, [wStartmenuCursor]
	ld [wMenuCursorBuffer], a
	call OpenMenu
	jr c, .CloseStartMenu
	ld a, [wMenuCursorBuffer]
	ld [wStartmenuCursor], a
	call PlaceHollowCursor
	ld a, [wMenuSelection]
	ld hl, .StartMenuFunctionPtrs
	call CallJumptable
	ld hl, .StartMenuCleanupPtrs
	jp CallJumptable
.StartMenuCleanupPtrs
	dw .RedisplayStartMenu                    ; 0x00
	dw .CloseStartMenu                        ; 0x01
	dw .CloseStartMenuDirect                  ; 0x02
	dw .fun_5e0f                              ; 0x03
	dw .CloseStartMenuDirectExecuteSelectHook ; 0x04
.CloseStartMenu
	call .waitAButton
	call LoadFontExtra
	; fall through
.CloseStartMenuDirect
	call ExitMenu
	; fall through
.fun_5e0f
	call Function1fea
	call UpdateTimePals
	ret

.Function_11e16: ; 11e16 (4:5e16)
	call .waitAButton
	call LoadFontExtra
	call CloseWindow
	jr .fun_5e0f

.waitAButton: ; 11e21 (4:5e21)
.wait
	call GetJoypad
	ldh a, [hJoyDown]
	bit A_BUTTON_F, a
	jr nz, .wait
	ret

.CloseStartMenuDirectExecuteSelectHook: ; 11e2b (4:5e2b)
	call ExitMenu
	ld a, $ff
	ldh [hStartmenuCloseAndSelectHookEnable], a
	jr .fun_5e0f

.StartMenuHeader
	db $40            ; tile backup
	db $00, $0C       ; start coords
	db $11, $13       ; end coords
	dw .StartMenuData
	db $01            ; default selection

.StartMenuData
	db %10101000 ; x padding, wrap around, start can close
	dn 0, 0      ; rows, columns
	dw .StartMenuItemList
	dw $1F8A
	dw .StartMenuLabels

.StartMenuLabels
	db "ずかん@"
	db "ポケモン@"
	db "りュック@"
	db "<PLAYER>@"
	db "レポート@"
	db "せってい@"
	db "とじる@"
	db "わくせん@"
	db "りセット@"

.StartMenuFunctionPtrs
	dw .StartMenuPokeDex
	dw $64B9
	dw DisplayStartMenuBackpack
	dw .StartMenuPlayer
	dw .StartMenuSave
	dw .StartMenuSettings
	dw .StartMenuClose
	dw .StartMenuBorder
	dw .StartMenuReset
    
.StartMenuItemList
	db $04
	db $04 ; Save
	db $05 ; Settings
	db $03 ; Player
	db $06 ; Close
	db $FF
	
	db $05
	db $01 ; Pokémon
	db $03 ; Player
	db $04 ; Save
	db $05 ; Settings
	db $06 ; Close
	db $FF
	
	db $06
	db $00 ; PokéDex
	db $01 ; Pokémon
	db $03 ; Player
	db $04 ; Save
	db $05 ; Settings
	db $06 ; Close
	db $FF
	
	db $07
	db $00 ; PokéDex
	db $01 ; Pokémon
	db $02 ; Backpack
	db $03 ; Player
	db $04 ; Save
	db $05 ; Settings
	db $06 ; Close
	db $FF
	
	db $06
	db $00 ; PokéDex
	db $01 ; Pokémon
	db $02 ; Backpack
	db $03 ; Player
	db $05 ; Settings
	db $06 ; Close
	db $FF

.SetUpMenuItems ; 11ea4 (4:5ea4)
	ld b, $04
	ld hl, wDebugFlags
	bit 1, [hl]
	jr z, .done
	ld b, $00
	ld hl, wd41b
	bit 2, [hl]
	jr z, .done
	ld b, $01
	ld hl, wd41c
	bit 4, [hl]
	jr z, .done
	ld b, $02
	ld hl, wd41d
	bit 2, [hl]
	jr z, .done
	ld b, $03
.done
	ld a, b
	ld [$cbf7], a
	ret

.StartMenuClose ; 11ecf (4:5ecf)
	ld a, $01 ; .CloseStartMenu
	ret

.StartMenuBorder: ; 11ed2 (4:5ed2)
	ld hl, $4305
	ld a, $3f
	call FarCall_hl
	ld a, $00 ; .RedisplayStartMenu
	ret

.StartMenuReset: ; 11edd (4:5edd)
	ld hl, DisplayResetDialog
	ld a, BANK(DisplayResetDialog)
	call DisplayResetDialog ; FIXME: should be FarCall_hl
	ld a, $00 ; .RedisplayStartMenu
	ret

.StartMenuSave: ; 11ee8 (4:5ee8)
	ld a, $4a
	call Predef
	call UpdateSprites
	ld a, $00  ; .RedisplayStartMenu
	ret

.StartMenuSettings ; 11ef3 (4:5ef3)
	call LoadStandardMenuHeader
	xor a
	ldh [hBGMapMode], a
	call ClearTileMap
	call UpdateSprites
	ld hl, $5cf3
	ld a, $01
	call FarCall_hl
	call ClearPalettes
	call Call_ExitMenu
	call LoadTilesetGFX
	call LoadFontExtra
	call UpdateSprites
	call WaitBGMap
	call UpdateTimePals
	ld a, $00 ; .RedisplayStartMenu
	ret

.StartMenuPlayer ; 11f1f (4:5f1f)
	call ._StartMenuPlayer
	ld a, $00 ; .RedisplayStartMenu
	ret

._StartMenuPlayer ; 11f25 (4:5f25)
	call LoadStandardMenuHeader
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a
	ld hl, $6d41
	ld a, $04
	call FarCall_hl
	call ClearPalettes
	call LoadFont
	call ReloadFontAndTileset
	call Call_ExitMenu
	call GetMemSGBLayout
	call WaitBGMap
	call UpdateTimePals
	pop af
	ldh [hMapAnims], a
	ret

.StartMenuPokeDex ; 11f4f (4:5f4f)
	call LoadStandardMenuHeader
	ld a, $2f
	call Predef
	call ClearPalettes
	call Function360b
	call ReloadFontAndTileset
	call Call_ExitMenu
	call GetMemSGBLayout
	call WaitBGMap
	call UpdateTimePals
	ld a, $00 ; .RedisplayStartMenu
	ret


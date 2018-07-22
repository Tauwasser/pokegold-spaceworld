include "constants.asm"

; if DEBUG
SECTION "home/random.asm", ROM0
; else
; SECTION "Random Number Generation", ROM0 [$3234]
; endc

Random::
; A simple hardware-based random number generator (RNG).

; Two random numbers are generated by adding and subtracting
; the divider to the respective values every time it's called.

; The divider is a register that increments at a rate of 16384Hz.
; For comparison, the Game Boy operates at a clock speed of 4.2MHz.

; This implementation also takes the current scanline as read from rLY
; and adds it nybble-swapped to the value of the divider.  The unswapped
; value of rLY is also added to the value that's subtracted.

; Additionally, an equivalent function is executed in VBlank.

; This leaves a with the value in hRandomSub.

	push bc

	ldh a, [rLY]
	ld c, a
	swap a
	ld b, a
	ldh a, [rDIV]
	adc b
	ld b, a
	ldh a, [hRandomAdd]
	adc b
	ldh [hRandomAdd], a

	ldh a, [rLY]
	swap a
	ld b, a
	ldh a, [rDIV]
	adc b
	adc c
	ld b, a
	ldh a, [hRandomSub]
	sbc b
	ldh [hRandomSub], a

	pop bc
	ret

BattleRandom::
; _BattleRandom lives in another bank.

; It handles all RNG calls in the battle engine, allowing
; link battles to remain in sync using a shared PRNG.
	ldh a, [hROMBank]
	push af
	ld a, BANK(_BattleRandom)
	call Bankswitch

	call _BattleRandom

	ld [wPredefHL + 1], a
	pop af
	call Bankswitch
	ld a, [wPredefHL + 1]
	ret
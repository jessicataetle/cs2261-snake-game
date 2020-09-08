#include "myLib.h"
#include "magenta.h"
#include "spritesheet.h"
#include "blue.h"
#include "green.h"
#include "yellow.h"
#include"red.h"
#include "game.h"
#include <stdlib.h>
#include <stdio.h>

void initialize();

//Button Variables
unsigned short buttons;
unsigned short oldButtons;

//State Prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

//States
enum {START, GAME,PAUSE, WIN, LOSE};
int state = 0;

int main() {

    initialize(); 

	while(1) {

        oldButtons = buttons;
        buttons = BUTTONS;

        waitForVBlank();
        switch (state) {
        case START:
            start();
            break;
        case GAME:
            game();
            break; 
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        default:
            break;
        }
	}

	return 0;
}

//initializes game
void initialize() {
    
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; 

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP | BG_SIZE_LARGE;

    seed = 0;

    goToStart();

}

//Sets up the Start State
void goToStart() {
    DMANow(3, magentaPal, PALETTE, 256);
    DMANow(3, magentaTiles, &CHARBLOCK[0], magentaTilesLen / 2);
    DMANow(3, magentaMap, &SCREENBLOCK[28], 1024 * 4);

    isLost = 0;
    appleCounter = 0;

    state = START;

}

//Start state
void start() {

    seed++;

    if(BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        goToGame();
        initGame();
    }
}

void goToGame() {
    DMANow(3, bluePal, PALETTE, 256);
    DMANow(3, blueTiles, &CHARBLOCK[0], blueTilesLen / 2);
    DMANow(3, blueMap, &SCREENBLOCK[28], 1024 * 4);

    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

    hideSprites();
    state = GAME;
}

//Game state
void game() {

    updateGame();

    if(BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if(appleCounter == SNAKELENGTH) {
        goToWin();
    }
    if(isLost == 1) {
        goToLose();
    }
}

//sets up pause state
void goToPause() {
    DMANow(3, greenPal, PALETTE, 256);
    DMANow(3, greenTiles, &CHARBLOCK[0], greenTilesLen / 2);
    DMANow(3, greenMap, &SCREENBLOCK[28], 1024 * 4);

    hideSprites();
    DMANow(3, shadowOAM, OAM, spritesheetPalLen);
    state = PAUSE;
}

//Pause state
void pause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }  
}

//sets up win state
void goToWin() {
    DMANow(3, yellowPal, PALETTE, 256);
    DMANow(3, yellowTiles, &CHARBLOCK[0], yellowTilesLen / 2);
    DMANow(3, yellowMap, &SCREENBLOCK[28], 1024 * 4);

    hideSprites();
    DMANow(3, shadowOAM, OAM, spritesheetPalLen);
    state = WIN;
}

//Win State
void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }  
}

//sets up lose state
void goToLose() {
    DMANow(3, redPal, PALETTE, 256);
    DMANow(3, redTiles, &CHARBLOCK[0], redTilesLen / 2);
    DMANow(3, redMap, &SCREENBLOCK[28], 1024 * 4);

    hideSprites();
    DMANow(3, shadowOAM, OAM, spritesheetPalLen);
    state = LOSE;
}

//Lose State
void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }  
}

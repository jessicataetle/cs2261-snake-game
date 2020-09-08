#include "myLib.h"
#include "blue.h"
#include "spritesheet.h"
#include "game.h"
#include <stdlib.h>
#include <stdio.h>

SNAKE snake[SNAKELENGTH];
APPLE apple;

//aniState Enum
enum {SNAKEDOWN, SNAKERIGHT, SNAKEUP, SNAKELEFT, APPLEA, SNAKEBODY, SNAKEBODYH, SNAKEBODYUPLEFT, SNAKEBODYUPRIGHT, SNAKEBODYDOWNLEFT, SNAKEBODYDOWNRIGHT};

OBJ_ATTR shadowOAM[128];

int snakeTimer;

//initializes game
void initGame() {

    snakeTimer = 0;

    //initializing snake head
    snake[0].width = 16;
    snake[0].height = 16;
    snake[0].cdel = 0;
    snake[0].rdel = 16;
    snake[0].col = (SCREENWIDTH / 2) - (snake[0].width / 2);
    snake[0].row = (SCREENHEIGHT / 2);
	snake[0].aniState = SNAKEDOWN;
    snake[0].isActive = 1;

    //initializing apple
    apple.width = 16;
    apple.height = 16;
    apple.row = (rand() % 2200) / 16;
    while (apple.row % 16 != 0) {
        apple.row++;
    }
    apple.col = (rand() % 1300) / 16;
    while (apple.col % 16 != 0) {
        apple.col++;
    }

    //initializing snake body
    for(int i = 1; i < SNAKELENGTH; i++) {
        snake[i].width = 16;
        snake[i].height = 16;
        snake[i].col = (SCREENWIDTH / 2) - (snake[0].width / 2);
        snake[i].row = (SCREENHEIGHT / 2) - (snake[0].height / 2) - (i * 16);
        snake[i].aniState = SNAKEBODY;
        snake[i].isActive = 0;
    }
    buttons = BUTTONS;
}

//updates the game
void updateGame() {
    snakeTimer++;

    //update state of snake head
    if(BUTTON_PRESSED(BUTTON_UP)) {
        snake[0].rdel = -16;
        snake[0].cdel = 0;
        snake[0].aniState = SNAKEUP;
    }
    if(BUTTON_PRESSED(BUTTON_DOWN)) {
        snake[0].rdel = 16;
        snake[0].cdel = 0;
        snake[0].aniState = SNAKEDOWN;
    }
    if(BUTTON_PRESSED(BUTTON_RIGHT)) {
        snake[0].rdel = 0;
        snake[0].cdel = 16;
        snake[0].aniState = SNAKERIGHT;
    }
    if(BUTTON_PRESSED(BUTTON_LEFT)) {
        snake[0].rdel = 0;
        snake[0].cdel = -16;
        snake[0].aniState = SNAKELEFT;
    }

    //adjusting snake's body positiion
    if (snakeTimer == 10) {
        for(int i = SNAKELENGTH - 1; i > 0; i--) {
            snake[i].row = snake[i - 1].row;
            snake[i].col = snake[i - 1].col;
        }
        snake[0].row = snake[0].row + snake[0].rdel;
        snake[0].col = snake[0].col + snake[0].cdel;

        snakeTimer = 0;
    }


    //make the player lose if snake goes out of bounds
    if((snake[0].col < -8) || (snake[0].row < -8) || (snake[0].col >= 240) || (snake[0].row >= 160 - (snake[0].height / 8))) {
        isLost = 1;
    }

    //add a point and make a new apple if snakehead collision w apple
    if(collision(snake[0].col, snake[0].row, snake[0].width, snake[0].height, apple.col, apple.row, apple.width, apple.height)) {
        appleCounter++;
        int newCol = rand() % 220;
        int newRow = rand() % 130;
        while (newCol % 16 != 0) {
            newCol++;
        }
         while (newRow % 16 != 0) {
            newRow++;
        }
        apple.col = newCol;
        apple.row = newRow;
        for(int i = 1; i < SNAKELENGTH; i++) {
             if(!snake[i].isActive) {
                snake[i].isActive = 1;
                break;
             }
        }
    }

    //check for collision of head with body
    for(int i = 1; i < SNAKELENGTH; i++) {
        if (snake[i].isActive) {
            if(collision(snake[0].col, snake[0].row, snake[0].width, snake[0].height, snake[i].col, snake[i].row, snake[i].width, snake[i].height)) {
                isLost = 1;
                break;
            }
        }
    }

    //draw snake head
    shadowOAM[0].attr0 = ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE | snake[0].row;
    shadowOAM[0].attr1 = ATTR1_SMALL | snake[0].col;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) |  ATTR2_TILEID(snake[0].aniState * 2, 0);

    //draw apple
    shadowOAM[1].attr0 = ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE | apple.row;
    shadowOAM[1].attr1 = ATTR1_SMALL | apple.col;
    shadowOAM[1].attr2 = ATTR2_PALROW(0) |  ATTR2_TILEID(4 * 2, 0);

    //draw snake body
    for(int i = 1; i < SNAKELENGTH; i++) {
        if (snake[i].isActive) {
            shadowOAM[i+1].attr0 = ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE | snake[i].row;
            shadowOAM[i+1].attr1 = ATTR1_SMALL | snake[i].col;
            shadowOAM[i+1].attr2 = ATTR2_PALROW(0) |  ATTR2_TILEID(snake[i].aniState * 2, 0);
        }
    }
    
    waitForVBlank();

    DMANow(3, shadowOAM, OAM, spritesheetPalLen);
}
//snake struct
typedef struct {
	int row;
	int col;
    int rdel;
    int cdel;
	int width;
    int height;
    int aniState;
    int isActive;
} SNAKE;

//follow the one right before it - linked list almost

//apple struct
typedef struct {
    int row;
	int col;
    int width;
    int height;
} APPLE;

//Game Prototypes
void initGame();
void updateGame();

//Lose variable
int isLost;

//apple counter
int appleCounter;

//random numbers
int seed;

//snake body length
#define SNAKELENGTH 10
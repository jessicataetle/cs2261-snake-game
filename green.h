
//{{BLOCK(green)

//======================================================================
//
//	green, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 1 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 32 + 2048 = 2592
//
//	Time-stamp: 2020-03-11, 20:25:42
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GREEN_H
#define GRIT_GREEN_H

#define greenTilesLen 32
extern const unsigned short greenTiles[16];

#define greenMapLen 2048
extern const unsigned short greenMap[1024];

#define greenPalLen 512
extern const unsigned short greenPal[256];

#endif // GRIT_GREEN_H

//}}BLOCK(green)

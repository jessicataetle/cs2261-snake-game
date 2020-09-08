
//{{BLOCK(blue)

//======================================================================
//
//	blue, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 64 + 8192 = 8768
//
//	Time-stamp: 2020-03-07, 14:10:20
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BLUE_H
#define GRIT_BLUE_H

#define blueTilesLen 64
extern const unsigned short blueTiles[32];

#define blueMapLen 8192
extern const unsigned short blueMap[4096];

#define bluePalLen 512
extern const unsigned short bluePal[256];

#endif // GRIT_BLUE_H

//}}BLOCK(blue)

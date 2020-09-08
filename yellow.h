
//{{BLOCK(yellow)

//======================================================================
//
//	yellow, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 64 + 8192 = 8768
//
//	Time-stamp: 2020-03-08, 16:22:27
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_YELLOW_H
#define GRIT_YELLOW_H

#define yellowTilesLen 64
extern const unsigned short yellowTiles[32];

#define yellowMapLen 8192
extern const unsigned short yellowMap[4096];

#define yellowPalLen 512
extern const unsigned short yellowPal[256];

#endif // GRIT_YELLOW_H

//}}BLOCK(yellow)

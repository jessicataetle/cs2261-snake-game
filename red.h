
//{{BLOCK(red)

//======================================================================
//
//	red, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 64 + 8192 = 8768
//
//	Time-stamp: 2020-03-08, 20:02:27
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_RED_H
#define GRIT_RED_H

#define redTilesLen 64
extern const unsigned short redTiles[32];

#define redMapLen 8192
extern const unsigned short redMap[4096];

#define redPalLen 512
extern const unsigned short redPal[256];

#endif // GRIT_RED_H

//}}BLOCK(red)

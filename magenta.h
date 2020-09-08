
//{{BLOCK(magenta)

//======================================================================
//
//	magenta, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 64 + 8192 = 8768
//
//	Time-stamp: 2020-03-07, 12:47:17
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAGENTA_H
#define GRIT_MAGENTA_H

#define magentaTilesLen 64
extern const unsigned short magentaTiles[32];

#define magentaMapLen 8192
extern const unsigned short magentaMap[4096];

#define magentaPalLen 512
extern const unsigned short magentaPal[256];

#endif // GRIT_MAGENTA_H

//}}BLOCK(magenta)

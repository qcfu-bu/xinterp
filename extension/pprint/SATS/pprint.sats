#define XANADU_targetloc
"./../../../xanadu/srcgen/xats"

//
(* ****** ****** *)
//
#staload
LAB = "{$XANADU}/SATS/label0.sats"
#staload
FIL = "{$XANADU}/SATS/filpath.sats"
#staload
LOC = "{$XANADU}/SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload
LEX = "{$XANADU}/SATS/lexing.sats"
//
(* ****** ****** *)
//
#staload
S0E = "{$XANADU}/SATS/staexp0.sats"
#staload
D0E = "{$XANADU}/SATS/dynexp0.sats"
//
#staload
S1E = "{$XANADU}/SATS/staexp1.sats"
#staload
D1E = "{$XANADU}/SATS/dynexp1.sats"
//
#staload
S2E = "{$XANADU}/SATS/staexp2.sats"
#staload
S2T = "{$XANADU}/SATS/statyp2.sats"
#staload
D2E = "{$XANADU}/SATS/dynexp2.sats"
//
#staload
D3E = "{$XANADU}/SATS/dynexp3.sats"

fun
{a:t@ype}
pprint(x:a): void

fun
{a:t@ype}
pprintln(x:a): void

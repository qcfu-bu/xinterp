#define XANADU_targetloc
"./../../../xanadu/srcgen/xats"

//
(* ****** ****** *)
//
#staload
"{$XANADU}/SATS/basics.sats"
//
#staload
"{$XANADU}/SATS/label0.sats"
#staload
"{$XANADU}/SATS/filpath.sats"
#staload
"{$XANADU}/SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload
LEX = "{$XANADU}/SATS/lexing.sats"
//
(* ****** ****** *)
//
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

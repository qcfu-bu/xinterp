#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"

#staload
"./../SATS/pprint.sats"

#define XANADU_targetloc
"./../../../xanadu/srcgen/xats"
#staload
"{$XANADU}/SATS/basics.sats"
//

(* ****** ****** *)

implement
fprint_valkind(out, vlk) =
case+ vlk of
| VLKval() => fprint(out, "val ")
//
| VLKvalp() => fprint(out, "val+ ")
| VLKvaln() => fprint(out, "val- ")
| VLKprval() => fprint(out, "prval ")

implement
pprint<valkind>(vlk) =
fprint_valkind(stdout_ref, vlk)

(* ****** ****** *)

implement
fprint_funkind
  (out, fnk) =
case+ fnk of
| FNKfn0() => fprint(out, "fn ")
| FNKfnx() => fprint(out, "fun ")
| FNKfn1() => fprint(out, "fun ")
| FNKfun() => fprint(out, "fun ")
//
| FNKprfn0() => fprint(out, "prfn")
| FNKprfn1() => fprint(out, "prfun")
| FNKprfun() => fprint(out, "prfun")
| FNKpraxi() => fprint(out, "praxi")
//
| FNKcastfn() => fprint(out, "castfn")

implement
pprint<funkind>(fnk) =
fprint_funkind(stdout_ref, fnk)

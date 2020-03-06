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
fprint_funkind
  (out, fnk) =
(
case+ fnk of
| FNKfn0() => fprint(out, "fn")
| FNKfnx() => fprint(out, "fun")
| FNKfn1() => fprint(out, "fun")
| FNKfun() => fprint(out, "fun")
//
| FNKprfn0() => fprint(out, "prfn")
| FNKprfn1() => fprint(out, "prfun")
| FNKprfun() => fprint(out, "prfun")
| FNKpraxi() => fprint(out, "praxi")
//
| FNKcastfn() => fprint(out, "castfn")
)

(* ****** ****** *)

implement
fprint_impkind
  (out, knd) =
(
case+ knd of
| IMPgen() => fprint!(out, "implement")
| IMPprf() => fprint!(out, "primplement")
| IMPval() => fprint!(out, "implement")
| IMPfun() => fprint!(out, "implement")
| IMPtmp() => fprint!(out, "implement")
) (* end of [fprint_impkind] *)

(* ****** ****** *)

implement
fprint_funclo2(out, fc2) =
(
case+ fc2 of
| FC2fun() => fprint!(out, "->")
| FC2clo(knd) =>
  ( fprint!(out, "-<") ;
  ( case-knd of
  | CLOFLT => fprint!("cloflt")
  | CLOPTR => fprint!("cloptr")
  | CLOREF => fprint!("cloref")
  | LINCLOFLT => fprint!("lincloflt")
  | LINCLOPTR => fprint!("lincloptr")
  ) ; fprint!(">"))
)

(* ****** ****** *)

implement
fprint_dctkind
  (out, knd) =
(
//
case+ knd of
| DCKfun() =>
  fprint(out, "fun")
| DCKval() =>
  fprint(out, "val")
| DCKpraxi() =>
  fprint(out, "praxi")
| DCKprfun() =>
  fprint(out, "prfun")
| DCKprval() =>
  fprint(out, "prval")
| DCKcastfn() =>
  fprint(out, "castfn")
//
| DCKunknown() =>
  fprint(out, "unknown")
//
) (* end of [fprint_dctkind] *)

(* ****** ****** *)

implement
fprint_valkind(out, vlk) =
(
case+ vlk of
| VLKval() => fprint(out, "val")
//
| VLKvalp() => fprint(out, "val+")
| VLKvaln() => fprint(out, "val-")
| VLKprval() => fprint(out, "prval")
)


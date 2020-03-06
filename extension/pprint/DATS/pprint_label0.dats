#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"

#staload
"./../SATS/pprint.sats"

#define XANADU_targetloc
"./../../../xanadu/srcgen/xats"
#staload
"{$XANADU}/SATS/staexp0.sats"
#staload
"{$XANADU}/SATS/lexing.sats"
#staload
"{$XANADU}/SATS/symbol.sats"
#staload
"{$XANADU}/SATS/label0.sats"

implement
fprint_label
  (out, l0) =
(
case+ l0 of
| LABint(i0) =>
  fprint!(out, ".", i0)
| LABsym(s0) =>
  fprint!(out, ".", s0)
)

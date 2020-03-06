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

(* ****** ****** *)

implement
fprint_t0int
  (out, x0) =
(
case+ x0.node() of
| T0INTnone(tok) => fprint(out, tok)
| T0INTsome(tok) => fprint(out, tok)
)

(* ****** ****** *)

implement
fprint_t0chr
  (out, x0) =
(
case+ x0.node() of
| T0CHRnone(tok) => fprint(out, tok)
| T0CHRsome(tok) => fprint(out, tok)
)

(* ****** ****** *)

implement
fprint_t0flt
  (out, x0) =
(
case+ x0.node() of
| T0FLTnone(tok) => fprint(out, tok)
| T0FLTsome(tok) => fprint(out, tok)
)

implement
fprint_t0str
  (out, x0) =
(
case+ x0.node() of
| T0STRnone(tok) => fprint(out, tok)
| T0STRsome(tok) => fprint(out, tok)
)

implement
fprint_i0dnt
  (out, x0) =
(
case+ x0.node() of
| I0DNTnone(tok) => fprint(out, tok)
| I0DNTsome(tok) => fprint(out, tok)
)

implement
fprint_l0abl
  (out, l0) =
(
case+
l0.node() of
| L0ABLnone(tok) => fprint(out, tok)
| L0ABLsome(lab) => fprint(out, lab)
)

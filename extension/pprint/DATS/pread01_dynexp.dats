#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"

#staload
"./../SATS/pprint.sats"
#staload _ = "./pprint_basic.dats"
#staload _ = "./pprint_dynexp1.dats"

#define XANADU_targetloc
"./../../../xanadu/srcgen/xats"

#staload
"{$XANADU}/SATS/lexing.sats"
#staload
"{$XANADU}/SATS/staexp1.sats"
#staload
"{$XANADU}/SATS/dynexp1.sats"
#staload
"{$XANADU}/SATS/tread01.sats"

implement
//{}(*tmp*)
tread01_d1ecl(d1c0) = let
//
val loc0 = d1c0.loc((*void*))
//
(*
val () =
println!
("tread01_d1ecl: d1c0 = ", d1c0)
*)
//
in
//
case+
d1c0.node() of
//
| D1Cfundecl
  ( knd
  , mopt
  , tqas, f1ds) =>
  {
    val () =
    tread01_f1undeclist(f1ds)
  }
//
| D1Cdynconst
  (knd, tqas, d1cs) =>
  {
    val () = tread01_tq1arglst(tqas)
(*
    val () = tread01_d1cstdeclist(d1cs)
*)
  }
//
| _(* rest-of-d1ecl *) =>
  (
    prerrln!("hello world: d1c0 = ", d1c0)
  )
//
end // end of [tread01_d1ecl]

implement
tread01_main(d1cs) = println!("hello world")
//
(* ****** ****** *)

(* end of [xats_tread01_dynexp.dats] *)

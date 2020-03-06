#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"

#staload "./../SATS/pprint.sats"
(* #staload "./../DATS/pprint_basic.dats" *)

(* #dynload "./../DATS/pprint_basic.dats" *)

#ifdef
_LIBPPRINT_
#then
#else
//
implement
main0(argc, argv) =
(
//
println!("Hello from ATS3(pprint)!")
// end of [if]
) (* end of [main] *)
//
#endif // ifdef(_LIBPPRINT_)

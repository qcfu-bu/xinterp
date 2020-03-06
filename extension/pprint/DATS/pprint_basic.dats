#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"

#staload
"./../SATS/pprint.sats"

implement(a)
pprintln<a>(x) =
( pprint<a>(x)
; print("\n")
)

implement(a)
pprint<List(a)>(xs) =
( print("[")
; list_foreach_env<a><env>(xs, counter)
; print("]")
)
where
{
  typedef env = int
  var counter: env = 0
  implement
  list_foreach$fwork<a><env>(x, env) =
  ( if env != 0 then print(", ")
  ; pprint<a>(x)
  ; env := env + 1
  )
}

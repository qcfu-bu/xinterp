#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"

#staload "./../SATS/pprint.sats"
#staload "./../DATS/pprint.dats"

#dynload "./../DATS/pprint.dats"

val ys = $list{int}(0, 1, 2, 3, 4)

implement
main0() = pprintln<List(int)>(ys)
where
{
  implement
  pprint<int>(x) = print(x)
}

#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"

#staload
"./../SATS/pprint.sats"
#staload
"./pprint_basic.dats"

#define XANADU_targetloc
"./../../../xanadu/srcgen/xats"
#staload
"{$XANADU}/SATS/lexing.sats"
#staload
"{$XANADU}/SATS/basics.sats"

(* ****** ****** *)

fun
fprint_sort(out, srt: int): void =
( case-srt of
| TBOXSORT => fprint(out, "$")
| TFLTSORT => fprint(out, "@")
| VTBOXSORT => fprint(out, "vt$")
| VTFLTSORT => fprint(out, "vt@")
)

//
(*
#define VTYPESORT 2 // 00010
*)
#define VTBOXSORT 3 // 00011
#define VTFLTSORT 2 // 00010
#define VTFLATSORT 2 // 00010


(* ****** ****** *)

implement
fprint_tnode(out, tnd) =
(
case+ tnd of
//
| T_EOF() => fprint(out, "\n")
| T_ERR() => fprint(out, "error")
//
| T_EOL() => fprint(out, "\n")
//
| T_BLANK(x) => fprint(out, " ")
//
| T_CLNLT(x) => fprint(out, ":<")
| T_DOTLT(x) => fprint(out, ".<")
//
| T_IDENT_alp(x) => fprint!(out, x)
| T_IDENT_sym(x) => fprint(out, x)
//
| T_IDENT_srp(x) =>
  fprint!(out, "#", x)
| T_IDENT_dlr(x) =>
  fprint!(out, "$", x)
//
| T_IDENT_qual(x) =>
  fprint!(out, "$", x)
//
| T_INT1(rep) => fprint(out, rep)
| T_INT2(base, rep) =>
  fprint!(out, base, "x", rep)
| T_INT3(base, rep, k0(*sfx*)) =>
  fprint!(out, base, "x", rep, "_", k0)
//
| T_FLOAT1(rep) => fprint(out, rep)
| T_FLOAT2(base, rep) =>
  fprint!(out, base, "x", rep)
| T_FLOAT3(base, rep, k0(*sfx*)) =>
  fprint!(out, base, "x", rep, "_", k0)
//
(*
| T_CHAR(chr) =>
  let
    val chr = int2char0(chr)
  in
    fprint!(out, "CHAR(", chr, ")")
  end
*)
| T_CHAR_nil(rep) => fprint(out, "''")
| T_CHAR_char(rep) =>
  fprint!(out, "'", rep, "'")
| T_CHAR_slash(rep) =>
  fprint!(out, "'", rep, "'")
//
| T_STRING_closed(str) =>
  fprint!(out, "\"", str, "\"")
| T_STRING_unclsd(str) =>
  fprint!(out, "\"", str)
//
(*
| T_CDATA(cdata, asz) => fprint!(out, "CDATA(...)")
*)
//
| T_SPECHAR(c) =>
  fprint!(out, "\'", int2char0(c), "\'")
//
| T_COMMENT_line
    (init, content) =>
    fprint!(out, init, content)
| T_COMMENT_rest
    (init, content) =>
    fprint!(out, init, content)
| T_COMMENT_cblock
    (level, content) =>
    fprint!(out, "/*", content, "*/")
| T_COMMENT_mlblock
    (level, content) =>
    fprint!(out, "(*", content, "*)")
//
| T_AT() => fprint(out, "@")
//
| T_BAR() => fprint(out, "|")
| T_CLN() => fprint(out, ":")
| T_DOT() => fprint(out, ".")
//
| T_EQ() => fprint(out, "=")
//
| T_LT() => fprint(out, "<")
| T_GT() => fprint(out, ">")
//
| T_DLR() => fprint(out, "$")
| T_SRP() => fprint(out, "#")
//
| T_EQLT() => fprint(out, "=<")
| T_EQGT() => fprint(out, "=>")
//
| T_LTGT() => fprint(out, "<>")
| T_GTLT() => fprint(out, "><")
//
| T_MSLT() => fprint(out, "-<")
(*
| T_MSGT() => fprint(out, "MSGT")
| T_MSLTGT() => fprint(out, "MSLTGT")
*)
//
(*
| T_DOTLT() => fprint(out, "DOTLT")
*)
| T_GTDOT() => fprint(out, ">.")
//
| T_COMMA() => fprint(out, ",")
| T_SMCLN() => fprint(out, ";")
//
| T_BSLASH() => fprint(out, "\\")
//
| T_LPAREN() => fprint(out, "(")
| T_RPAREN() => fprint(out, ")")
| T_LBRACE() => fprint(out, "{")
| T_RBRACE() => fprint(out, "}")
//
| T_LBRACK() => fprint(out, "[")
| T_RBRACK() => fprint(out, "]")
//
| T_EXISTS(knd) =>
  ( fprint_sort(out, knd)
  ; fprint!(out, "[]")
  )
//
| T_TUPLE(knd) =>
  ( fprint_sort(out, knd)
  ; fprint!(out, "(")
  )
| T_RECORD(knd) =>
  ( fprint_sort(out, knd)
  ; fprint!(out, "{")
  )
(*
| T_STRUCT() => fprint(out, "STRUCT")
*)
//
| T_AS() => fprint(out, "as")
//
| T_OF() => fprint(out, "of")
//
| T_OP() => fprint(out, "op")
//
| T_OP_par() => fprint(out, "op(")
| T_OP_sym(id) =>
  fprint!(out, "op(", id, ")")
//
| T_IN() => fprint(out, "in")
//
| T_AND() => fprint(out, "and")
| T_END() => fprint(out, "end")
//
| T_IF() => fprint(out, "if")
| T_SIF() => fprint(out, "sif")
| T_THEN() => fprint(out, "then")
| T_ELSE() => fprint(out, "else")
//
| T_WHEN() => fprint(out, "when")
| T_WITH() => fprint(out, "with")
//
| T_CASE(k0) => fprint(out, "case")
//
| T_SCASE() => fprint(out, "scase")
//
| T_ENDIF() => fprint(out, "endif")
| T_ENDSIF() => fprint(out, "endsif")
| T_ENDCASE() => fprint(out, "endcase")
| T_ENDSCASE() => fprint(out, "endscase")
//
| T_LAM(knd) =>
  ( fprint!(out, "lam")
  ; case-knd of
  | TBOXSORT => ()
  | TFLTSORT => fprint(out, "@")
  )
| T_FIX(knd) =>
  ( fprint!(out, "fix")
  ; case-knd of
  | TBOXSORT => ()
  | TFLTSORT => fprint(out, "@")
  )
//
| T_LET() => fprint(out, "let")
| T_TRY() => fprint(out, "try")
| T_WHERE() => fprint(out, "where")
| T_LOCAL() => fprint(out, "local")
//
| T_ENDLAM() => fprint(out, "endlam")
| T_ENDLET() => fprint(out, "endlet")
| T_ENDTRY() => fprint(out, "endtry")
| T_ENDWHERE() => fprint(out, "endwhere")
| T_ENDLOCAL() => fprint(out, "endlocal")
//
| T_VAL(vlk) =>
  fprint!(out, vlk)
| T_VAR() => fprint!(out, "var")
//
| T_FUN(fnk) => fprint(out, fnk)
//
| T_IMPLMNT(knd) => fprint(out, knd)
//
| T_ABSSORT() => fprint(out, "abssort")
//
| T_SORTDEF() => fprint(out, "sortdef")
//
| T_SEXPDEF(srt) =>
  fprint!(out, "sexpdef(", srt, ")")
//
| T_ABSTYPE(srt) =>
  fprint!(out, "abstype(", srt, ")")
//
| T_ABSIMPL() =>
  fprint!(out, "absimpl")
| T_ABSOPEN() =>
  fprint!(out, "absopen")
//
| T_DATASORT() =>
  fprint!(out, "datasort")
//
| T_EXCPTCON() =>
  fprint!(out, "exception")
//
| T_DATATYPE(srt) =>
  fprint!(out, "datatype(", srt, ")")
//
| T_WITHTYPE(srt) =>
  fprint!(out, "withtype(", srt, ")")
//
| T_SRP_NONFIX() => fprint(out, "#nonfix")
| T_SRP_FIXITY(knd) => fprint(out, "#fixixty")
//
| T_SRP_STACST() => fprint(out, "#stacst")
//
| T_SRP_STATIC() => fprint(out, "#static")
| T_SRP_EXTERN() => fprint(out, "#extern")
//
| T_SRP_DEFINE() => fprint(out, "#define")
| T_SRP_MACDEF() => fprint(out, "#macdef")
//
| T_SRP_INCLUDE() => fprint(out, "#include")
//
| T_SRP_STALOAD() => fprint(out, "#staload")
| T_SRP_DYNLOAD() => fprint(out, "#dynload")
//
| T_SRP_SYMLOAD() => fprint(out, "#symload")
//
) (* end of [fprint_tnode] *)
//
(* ****** ****** *)

implement
print2_tnode
  (tok) =
  fprint2_tnode(stdout_ref, tok)
implement
prerr2_tnode
  (tok) =
  fprint2_tnode(stderr_ref, tok)
//
(* ****** ****** *)
//
implement
fprint2_tnode(out, tnd) =
(
case+ tnd of
//
| T_EOF() => ()
| T_ERR() =>
  fprint(out, "*ERROR*")
//
| T_EOL() => fprint(out, "\n")
//
| T_BLANK(x) => fprint(out, x)
//
| T_CLNLT(x) => fprint(out, x)
| T_DOTLT(x) => fprint(out, x)
//
| T_IDENT_alp(x) => fprint(out, x)
| T_IDENT_sym(x) => fprint(out, x)
//
| T_IDENT_srp(x) => fprint(out, x)
| T_IDENT_dlr(x) => fprint(out, x)
//
| T_IDENT_qual(x) => fprint(out, x)
//
| T_INT1(rep) => fprint(out, rep)
| T_INT2(base, rep) => fprint(out, rep)
| T_INT3(base, rep, _(*sfx*)) => fprint(out, rep)
//
| T_FLOAT1(rep) => fprint(out, rep)
| T_FLOAT2(base, rep) => fprint(out, rep)
| T_FLOAT3(base, rep, _(*sfx*)) => fprint(out, rep)
//
(*
| T_CHAR(chr) =>
  let
    val chr = int2char0(chr)
  in
    fprint!(out, "CHAR(", chr, ")")
  end
*)
| T_CHAR_nil(rep) => fprint(out, rep)
| T_CHAR_char(rep) => fprint(out, rep)
| T_CHAR_slash(rep) => fprint(out, rep)
//
| T_STRING_closed(str) => fprint(out, str)
| T_STRING_unclsd(str) => fprint(out, str)
//
(*
| T_CDATA(cdata, asz) => fprint!(out, "CDATA(...)")
*)
//
| T_SPECHAR(c) =>
  fprint(out, c) where{val c=int2char0(c)}
//
| T_COMMENT_line
    (init, content) =>
    fprint!(out, init, content)
| T_COMMENT_rest
    (init, content) =>
    fprint!(out, init, content)
| T_COMMENT_cblock
    (level, content) => fprint(out, content)
| T_COMMENT_mlblock
    (level, content) => fprint(out, content)
//
| T_AT() => fprint(out, "@")
//
| T_BAR() => fprint(out, "|")
| T_CLN() => fprint(out, ":")
| T_DOT() => fprint(out, ".")
//
| T_EQ() => fprint(out, "=")
//
| T_LT() => fprint(out, "<")
| T_GT() => fprint(out, ">")
//
| T_DLR() => fprint(out, "$")
| T_SRP() => fprint(out, "#")
//
| T_EQLT() => fprint(out, "=<")
| T_EQGT() => fprint(out, "=>")
//
| T_LTGT() => fprint(out, "<>")
| T_GTLT() => fprint(out, "><")
//
| T_MSLT() => fprint(out, "-<")
(*
| T_MSGT() => fprint(out, "->")
| T_MSLTGT() => fprint(out, "-<>")
*)
//
| T_GTDOT() => fprint(out, ">.")
//
| T_COMMA() => fprint(out, ",")
| T_SMCLN() => fprint(out, ";")
//
| T_BSLASH() => fprint(out, "\\")
//
| T_LPAREN() => fprint(out, "(")
| T_RPAREN() => fprint(out, ")")
| T_LBRACE() => fprint(out, "{")
| T_RBRACE() => fprint(out, "}")
//
| T_LBRACK() => fprint(out, "[")
| T_RBRACK() => fprint(out, "]")
//
| T_EXISTS(knd) =>
  fprint!(out, "exists(", knd, ")")
//
| T_TUPLE(knd) =>
  fprint!(out, "tuple(", knd, ")")
| T_RECORD(knd) =>
  fprint!(out, "record(", knd, ")")
//
(*
| T_STRUCT(knd) =>
  fprint!(out, "struct(", knd, ")")
*)
//
| T_AS() => fprint(out, "as")
//
| T_OF() => fprint(out, "of")
//
| T_OP() => fprint(out, "op")
//
| T_OP_par() => fprint(out, "op(")
| T_OP_sym(id) => fprint!(out, "op", id)
//
| T_IN() => fprint(out, "in")
//
| T_AND() => fprint(out, "and")
| T_END() => fprint(out, "end")
//
| T_IF() => fprint(out, "if")
| T_SIF() => fprint(out, "sif")
| T_THEN() => fprint(out, "then")
| T_ELSE() => fprint(out, "else")
//
| T_WHEN() => fprint(out, "when")
| T_WITH() => fprint(out, "with")
//
| T_CASE(k0) =>
  fprint!(out, "case(", k0, ")")
//
| T_SCASE() => fprint(out, "scase")
//
| T_ENDIF() => fprint(out, "endif")
| T_ENDSIF() => fprint(out, "endsif")
| T_ENDCASE() => fprint(out, "endcase")
| T_ENDSCASE() => fprint(out, "endscase")
//
| T_LAM(knd) =>
  fprint!(out, "lam(", knd, ")")
| T_FIX(knd) =>
  fprint!(out, "fix(", knd, ")")
//
| T_LET() => fprint(out, "let")
| T_TRY() => fprint(out, "try")
| T_WHERE() => fprint(out, "where")
| T_LOCAL() => fprint(out, "local")
//
| T_ENDLAM() => fprint(out, "endlam")
| T_ENDLET() => fprint(out, "endlet")
| T_ENDTRY() => fprint(out, "endtry")
| T_ENDWHERE() => fprint(out, "endwhere")
| T_ENDLOCAL() => fprint(out, "endlocal")
//
| T_VAL(vlk) => fprint(out, vlk)
| T_VAR() => fprint!(out, "var")
//
| T_FUN(fnk) =>
  fprint!(out, "FUN(", fnk, ")")
//
| T_IMPLMNT(knd) =>
  fprint!(out, "implmnt(", knd, ")")
//
| T_ABSSORT() =>
  fprint!(out, "abssort(", ")")
//
| T_SORTDEF() =>
  fprint!(out, "sortdef(", ")")
//
| T_SEXPDEF(knd) =>
  fprint!(out, "sexpdef(", knd, ")")
//
| T_ABSTYPE(knd) =>
  fprint!(out, "abstype(", knd, ")")
//
| T_ABSIMPL() =>
  fprint!(out, "absimpl")
| T_ABSOPEN() =>
  fprint!(out, "absopen")
//
| T_DATASORT() =>
  fprint!(out, "datasort")
//
| T_EXCPTCON() =>
  fprint!(out, "excptcon")
//
| T_DATATYPE(knd) =>
  fprint!(out, "datatype(", knd, ")")
//
| T_WITHTYPE(knd) =>
  fprint!(out, "withtype(", knd, ")")
//
| T_SRP_NONFIX() =>
  fprint!(out, "#nonfix")
| T_SRP_FIXITY(knd) =>
  fprint!(out, "#fixity(", knd, ")")
//
| T_SRP_STACST() => fprint!(out, "#stacst")
//
| T_SRP_STATIC() => fprint!(out, "#static")
| T_SRP_EXTERN() => fprint!(out, "#extern")
//
| T_SRP_DEFINE() => fprint!(out, "#define")
| T_SRP_MACDEF() => fprint!(out, "#macdef")
//
| T_SRP_INCLUDE() => fprint(out, "#include")
//
| T_SRP_STALOAD() => fprint(out, "#staload")
| T_SRP_DYNLOAD() => fprint(out, "#dynload")
//
| T_SRP_SYMLOAD() => fprint(out, "#symload")
//
) (* end of [fprint2_tnode] *)

implement
fprint_token
  (out, tok) = fprint(out, tok.node())

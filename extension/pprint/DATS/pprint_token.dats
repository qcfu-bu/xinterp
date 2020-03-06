#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"

#staload
"./../SATS/pprint.sats"




implement
pprint<$LEX.tnode>(tnd) =
case+ tnd of
| $LEX.T_EOF() => print!("\n")
| $LEX.T_ERR() => print!("error")
//
| $LEX.T_EOL() => print!("\n")
//
| $LEX.T_BLANK(x) => print!(" ")
//
| $LEX.T_CLNLT(x) => print!(":<")
| $LEX.T_DOTLT(x) => print!(".<")
//
| $LEX.T_IDENT_alp(x) => print!(x)
| $LEX.T_IDENT_sym(x) => print!(x)
//
| $LEX.T_IDENT_srp(x) => print!(x)
| $LEX.T_IDENT_dlr(x) => print!(x)
//
| $LEX.T_IDENT_qual(x) => print!(x)
//
| $LEX.T_INT1(rep) => print!(rep)
| $LEX.T_INT2(base, rep) => print!(base, "x", rep)
| $LEX.T_INT3(base, rep, k0(*sfx*)) =>
  print!(base, "x", rep, "_", k0)
//
| $LEX.T_FLOAT1(rep) =>
  print!(rep)
| $LEX.T_FLOAT2(base, rep) =>
  print!(base, "x", rep)
| $LEX.T_FLOAT3(base, rep, k0(*sfx*)) =>
  print!(base, "x", rep, "_", k0)
//
| $LEX.T_CHAR_nil(rep) =>
  print!("CHAR_nil(", rep, ")")
| $LEX.T_CHAR_char(rep) =>
  print!("CHAR_char(", rep, ")")
| $LEX.T_CHAR_slash(rep) =>
  print!("CHAR_slash(", rep, ")")
//
| $LEX.T_STRING_closed(str) =>
  print!("STRING_closed(", str, ")")
| $LEX.T_STRING_unclsd(str) =>
  print!("STRING_unclsd(", str, ")")
//
| $LEX.T_SPECHAR(c) =>
  print!("SPECHAR(", int2char0(c), ")")
//
| $LEX.T_COMMENT_line
    (init, content) =>
    print!("T_COMMENT_line(", init, "; ", "...)")
| $LEX.T_COMMENT_rest
    (init, content) =>
    print!("T_COMMENT_rest(", init, "; ", "...)")
| $LEX.T_COMMENT_cblock
    (level, content) =>
    print!("T_COMMENT_cblock(", level, "; ", "...)")
| $LEX.T_COMMENT_mlblock
    (level, content) =>
    print!("T_COMMENT_mlblock(", level, "; ", "...)")
//
| $LEX.T_AT() => print!("AT")
//
| $LEX.T_BAR() => print!("BAR")
| $LEX.T_CLN() => print!("CLN")
| $LEX.T_DOT() => print!("DOT")
//
| $LEX.T_EQ() => print!("EQ")
//
| $LEX.T_LT() => print!("LT")
| $LEX.T_GT() => print!("GT")
//
| $LEX.T_DLR() => print!("DLR")
| $LEX.T_SRP() => print!("SRP")
//
| $LEX.T_EQLT() => print!("EQLT")
| $LEX.T_EQGT() => print!("EQGT")
//
| $LEX.T_LTGT() => print!("LTGT")
| $LEX.T_GTLT() => print!("GTLT")
//
| $LEX.T_MSLT() => print!("MSLT")
(*
| $LEX.T_MSGT() => print!("MSGT")
| T_MSLTGT() => print!("MSLTGT")
*)
//
(*
| $LEX.T_DOTLT() => print!("DOTLT")
*)
| $LEX.T_GTDOT() => print!("GTDOT")
//
| $LEX.T_COMMA() => print!("COMMA")
| $LEX.T_SMCLN() => print!("SMCLN")
//
| $LEX.T_BSLASH() => print!("BSLASH")
//
| $LEX.T_LPAREN() => print!("LPAREN")
| $LEX.T_RPAREN() => print!("RPAREN")
| $LEX.T_LBRACE() => print!("LBRACE")
| $LEX.T_RBRACE() => print!("RBRACE")
//
| $LEX.T_LBRACK() => print!("LBRACK")
| $LEX.T_RBRACK() => print!("RBRACK")
//
| $LEX.T_EXISTS(knd) =>
  print!("EXISTS(", knd, ")")
//
| $LEX.T_TUPLE(knd) =>
  print!("TUPLE(", knd, ")")
| $LEX.T_RECORD(knd) =>
  print!("RECORD(", knd, ")")
(*
| $LEX.T_STRUCT() => print!("STRUCT")
*)
//
| $LEX.T_AS() => print!("AS")
//
| $LEX.T_OF() => print!("OF")
//
| $LEX.T_OP() => print!("OP")
//
| $LEX.T_OP_par() =>
  print!("OP_par()")
| $LEX.T_OP_sym(id) =>
  print!("OP_sym(", id, ")")
//
| $LEX.T_IN() => print!("IN")
//
| $LEX.T_AND() => print!("AND")
| $LEX.T_END() => print!("END")
//
| $LEX.T_IF() => print!("IF")
| $LEX.T_SIF() => print!("SIF")
| $LEX.T_THEN() => print!("THEN")
| $LEX.T_ELSE() => print!("ELSE")
//
| $LEX.T_WHEN() => print!("WHEN")
| $LEX.T_WITH() => print!("WITH")
//
| $LEX.T_CASE(k0) =>
  print!("CASE(", k0, ")")
//
| $LEX.T_SCASE() => print!("SCASE()")
//
| $LEX.T_ENDIF() => print!("ENDIF")
| $LEX.T_ENDSIF() => print!("ENDSIF")
| $LEX.T_ENDCASE() => print!("ENDCASE")
| $LEX.T_ENDSCASE() => print!("ENDSCASE")
//
| $LEX.T_LAM(knd) =>
  print!("LAM(", knd, ")")
| $LEX.T_FIX(knd) =>
  print!("FIX(", knd, ")")
//
| $LEX.T_LET() => print!("LET")
| $LEX.T_TRY() => print!("TRY")
| $LEX.T_WHERE() => print!("WHERE")
| $LEX.T_LOCAL() => print!("LOCAL")
//
| $LEX.T_ENDLAM() => print!("ENDLAM")
| $LEX.T_ENDLET() => print!("ENDLET")
| $LEX.T_ENDTRY() => print!("ENDTRY")
| $LEX.T_ENDWHERE() => print!("ENDWHERE")
| $LEX.T_ENDLOCAL() => print!("ENDLOCAL")
//
| $LEX.T_VAL(vlk) =>
  print!("VAL(", vlk, ")")
| $LEX.T_VAR() => print!("VAR")
//
| $LEX.T_FUN(fnk) =>
  print!("FUN(", fnk, ")")
//
| $LEX.T_IMPLMNT(knd) =>
  print!("IMPLMNT(", knd, ")")
//
| $LEX.T_ABSSORT() =>
  print!("ABSSORT(", ")")
//
| $LEX.T_SORTDEF() =>
  print!("SORTDEF(", ")")
//
| $LEX.T_SEXPDEF(srt) =>
  print!("SEXPDEF(", srt, ")")
//
| $LEX.T_ABSTYPE(srt) =>
  print!("ABSTYPE(", srt, ")")
//
| $LEX.T_ABSIMPL() =>
  print!("ABSIMPL")
| $LEX.T_ABSOPEN() =>
  print!("ABSOPEN")
//
| $LEX.T_DATASORT() =>
  print!("DATASORT")
//
| $LEX.T_EXCPTCON() =>
  print!("EXCPTCON")
//
| $LEX.T_DATATYPE(srt) =>
  print!("DATATYPE(", srt, ")")
//
| $LEX.T_WITHTYPE(srt) =>
  print!("WITHTYPE(", srt, ")")
//
|$LEX. T_SRP_NONFIX() =>
  print!("#NONFIX")
| $LEX.T_SRP_FIXITY(knd) =>
  print!("#FIXIXTY(", knd, ")")
//
| $LEX.T_SRP_STACST() => print!("#STACST")
//
| $LEX.T_SRP_STATIC() => print!("#STATIC")
| $LEX.T_SRP_EXTERN() => print!("#EXTERN")
//
| $LEX.T_SRP_DEFINE() => print!("#DEFINE")
| $LEX.T_SRP_MACDEF() => print!("#MACDEF")
//
| $LEX.T_SRP_INCLUDE() => print!("#INCLUDE")
//
| $LEX.T_SRP_STALOAD() => print!("#STALOAD")
| $LEX.T_SRP_DYNLOAD() => print!("#DYNLOAD")
//
| $LEX.T_SRP_SYMLOAD() => print!("#SYMLOAD")
//
(* end of [pprint] *)

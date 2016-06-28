Concat hat dieselbe Priorität wie Addition und Subtraktion.
Deswegen ist die richtige Position die SimpleTerm-Funktion (Line 198).

   rd.function Req.Simp_Expr(GV1: out Gen_Val_Typ) is
      GV2: Gen_Val_Typ;
   begin
                                    if Sy_Test then Put_Line("Req_Simp_Expr"); end if;
      Req.Term(GV1);
        { Ask.Dlm_Sy("+");
            Req.Term(GV2);          Typ_Vergleich(GV1, GV2);
                                    case GV1.Typ is
                                    when Int => GV1.Int:= GV1.Int + GV2.Int;
                                    when Flt => GV1.Flt:= GV1.Flt + GV2.Flt;
                                    when others => Semantik_Fehler("Addition nicht erlaubt");
                                    end case;
        | Ask.Dlm_Sy("-");
            Req.Term(GV2);          Typ_Vergleich(GV1, GV2);
                                    case GV1.Typ is
                                    when Int => GV1.Int:= GV1.Int - GV2.Int;
                                    when Flt => GV1.Flt:= GV1.Flt - GV2.Flt;
                                    when others => Semantik_Fehler("Subtraktion nicht erlaubt");
                                    end case;
        }
                                    if Sy_Test then Put("+-: "); Put_GV(GV1); New_Line; end if;
   end;
       
wird zu:

   rd.function Req.Simp_Expr(GV1: out Gen_Val_Typ) is
        GV2: Gen_Val_Typ;
   begin
        if Sy_Test then 
            Put_Line("Req_Simp_Expr"); 
        end if;
        Req.Term(GV1);
        {
            Ask.Dlm_Sy("+");
            Req.Term(GV2);          
            Typ_Vergleich(GV1, GV2);
            case GV1.Typ is
                when Int => GV1.Int:= GV1.Int + GV2.Int;
                when Flt => GV1.Flt:= GV1.Flt + GV2.Flt;
                when others => Semantik_Fehler("Addition nicht erlaubt");
            end case;
        | 
            Ask.Dlm_Sy("&");
            Req.Term(GV2);
            Typ_Vergleich(GV1, GV2);
            if GV1.Typ = String then 
                 GV1.String:= GV1.String & GV2.String;
            end if;
        | 
            Ask.Dlm_Sy("-");
            Req.Term(GV2);
            Typ_Vergleich(GV1, GV2);
            case GV1.Typ is
                when Int => GV1.Int:= GV1.Int - GV2.Int;
                when Flt => GV1.Flt:= GV1.Flt - GV2.Flt;
                when others => Semantik_Fehler("Subtraktion nicht erlaubt");
            end case;
        }
        if Sy_Test then Put("+-: "); Put_GV(GV1); New_Line; end if;
    end;
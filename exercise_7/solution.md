Modulo hat dieselbe Priorität wie Multiplikation und Division.
Deswegen ist die richtige Position die Term-Funktion (Line 87).

    begin
                                        if Sy_Test then Put_Line("Req_Term"); end if;
          Req.Faktor(P1);
             { Ask.Dlm_Sy("*");
                Req.Faktor(P2); 
                                        P1:= P1 * P2;
             | Ask.Dlm_Sy("/");
                Req.Faktor(P2);         if P2 = 0 then
                                           Semantik_Fehler("Division durch null ist nicht erlaubt");
                                        else
                                           P1:= P1 / P2;
                                        end if;
             }
       end;
       
wird zu:

    begin
        if Sy_Test then Put_Line("Req_Term"); 
    end if;
    
    Req.Faktor(P1);
        { Ask.Dlm_Sy("*");
            Req.Faktor(P2); 
            P1:= P1 * P2;
        | Ask.Dlm_Sy("/");
            Req.Faktor(P2);
            if P2 = 0 then
                Semantik_Fehler("Division durch null ist nicht erlaubt");
            else
                P1:= P1 / P2;
            end if;
        | Ask.Dlm_Sy("mod");
            Req.Faktor(P2); 
            P1:= P1 mod P2;
        }
    end;
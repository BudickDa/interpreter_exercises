## Aufgabe 1.:
in Req_Term (Line 211):

    procedure Req_Term(P1: out Integer) is
      P2: Integer;
    begin
      Req_Faktor(P1);
      while Ask_Delim('*') loop
            Req_Faktor(P2); 
                                    P1:= P1 * P2;
      end loop;
    end;
    
Wird zu: 

    procedure Req_Term(P1: out Integer) is
        P2: Integer;
    begin
        Req_Faktor(P1);
        loop
            if Ask_Delim('*') then
                Req_Faktor(P2); 
                P1:= P1 * P2;
            elsif Ask_Delim('/') then
                Req_Faktor(P2);
                -- maybe test for P2 == 0 or put into try to throw exception
                P1:= P1 / P2;
            else
                exit;
            end if;
        end loop;
    end;



## Aufgabe 2.: 
^ mit ** ersetzen durch folgende Regex: [0-9]{n}\^[0-9]{n} da das die einzige Form ist, in welcher ^ als Potenzzeichen vorkommt. 
Diese Kombination ist eindeutig.

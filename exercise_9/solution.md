### Repeat-Funktion:

Repeat ist eine Mischung aus while und if:

    rd.function Ask.Repeat_Stmt is
          Attr9: Attr_Typ;
          I9:    Integer;
    begin
        Ask.Dlm_Sy("repeat");
        -- get list
        Gen_Lab(I9);
        GenerLabOpc("L_" & To_VString(I9, 1), +"Lbl");
        Req.Stmt_List;
        -- keyword until
        Req.Dlm_Sy("until");
        -- get expression
        Req.Expression(Attr9);
        
        -- check return type of expression
        if Attr9.Typ = Boo then
            GenerOpcLab("BiF", "L_" & To_VString(I9, 1));
        else 
            Semantik_Fehler("Typ-Konflikt bei 'while'");
        end if;
        Req.Dlm_Sy(";");
    end;       
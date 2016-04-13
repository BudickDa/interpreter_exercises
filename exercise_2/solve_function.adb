with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;

procedure solve_function is
    a, b, c, discriminant: Float;
begin
    a:= 2.0;
    b:=3.0;
    c:=4.0;
    if a = 0.0 then
        if b = 0.0 then
            if c = 0.0 then
                Put("Trivial");
            else
                Put("Not solveable");
            end if;
        else
            Put("Linear");
            Put(-c / b);
        end if;
    else discriminant:= b * b - 4.0 * a * c;
        if discriminant < 0.0 then
            Put("Not solveable");
        elsif discriminant = 0.0 then
            Put("One solution");
            Put(-b / (2.0 * a));
        else
            discriminant:= discriminant**(1/2);
            Put((-b + discriminant) / (2.0 * a));
            Put((-b - discriminant) / (2.0 * a));
        end if;
    end if;
end;
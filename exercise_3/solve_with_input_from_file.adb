with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;

procedure solve_with_input_from_file is
    a, b, c, discriminant: Float;
    inputFile: File_Type;
    counter: Integer;
begin
    Open(inputFile, In_File, "Koeff.adb");
    loop
        Get(inputFile, a);
        Get(inputFile, b);
        Get(inputFile, c);
        exit when a = 0.0 and a = b and a = c;
        if a = 0.0 then
            if b = 0.0 then
                if c = 0.0 then
                    Put("Not solveable");
                    New_line(1);
                else
                    Put("Trivial:");
                    New_line(1);
                    Put(-c);
                end if;
            else
                counter:=0;
                Put("Linear");
                new_line(1);
                Put(-c / b);
            end if;
        else discriminant:= b * b - 4.0 * a * c;
            new_line(1);
            if discriminant < 0.0 then
                Put("Not solveable");
                new_line(1);
            elsif discriminant = 0.0 then
                Put("One solution");
                new_line(1);
                Put(-b / (2.0 * a));
                new_line(1);
            else
                Put("Two solution");
                new_line(1);
                discriminant:= discriminant**(1/2);
                Put((-b + discriminant) / (2.0 * a));
                new_line(1);
                Put((-b - discriminant) / (2.0 * a));
            end if;
        end if;
        new_line(2);
        Put("--------------------------------");
        new_line(2);
    end loop;
end;
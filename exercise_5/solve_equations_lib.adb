package body solve_equations_lib is
    procedure linear(a, b: in Float; ouput: out Float) is
    begin
        ouput:= -b/ a;
    end;

    procedure square(a, b, c: in Float; firstOutput, secondOutput: out Float) is
        discriminant: Float;
    begin
        discriminant:= b * b - 4.0 * a * c;
        discriminant:= discriminant**(1/2);
        firstOutput:= (-b + discriminant) / (2.0 * a);
        secondOutput:= (-b - discriminant) / (2.0 * a);
    end;
end;
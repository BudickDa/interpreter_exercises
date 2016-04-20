with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;

procedure solve_equations is
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

	a, b, c, discriminant, solution, secondSolution: Float;
	inputFile: File_Type;
begin
	Open(inputFile, In_File, "Koeff.adb");
	loop
		Get(inputFile, a);
--		Put(a, 3, 2, 0);
		Get(inputFile, b);
--		Put(b, 3, 2, 0);
		Get(inputFile, c);
--		Put(c, 3, 2, 0);
		exit when a = 0.0 and a = b and a = c;
		if a = 0.0 then
			if b = 0.0 then
				if c = 0.0 then
					Put("Trivial");
					New_line(1);
				else
					Put("Not solveable");
				end if;
			else
				linear(b, c, solution);
				Put("Linear");
				new_line(1);
		 		Put(solution);
			end if;
		else discriminant:= b * b - 4.0 * a * c;
			new_line(1);
			if discriminant < 0.0 then
				Put("Not solveable");
				new_line(1);
			elsif discriminant = 0.0 then
				square(a,b,c, solution, secondSolution);
				Put("One solution");
				new_line(1);
				Put(solution);
				new_line(1);
			else
				square(a,b,c, solution, secondSolution);
				Put("Two solution");
				new_line(1);
				discriminant:= discriminant**(1/2);
				Put(solution);
				new_line(1);
		 		Put(secondSolution);
			end if;
		end if;
		new_line(2);
		Put("--------------------------------");
		new_line(2);
	end loop;
end;
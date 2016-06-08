with X_IO;
use X_IO;
with Z_Time;
use Z_Time;
procedure test_performance is last:Float; counter: Integer;
begin
	Time_Init;
	last:=2.0;
	counter:=0;
	while counter <= 10**6 loop
		counter:=counter+1;
		last:=last + last/(3.0*last);
		if counter= 10**6 then
			Put("Highest Number found: ");
			Put(last);
			Put("Time (ms): ");
			Milli_Seconds;
		end if;
	end loop;
end;

is_Part_Time=1;
is_Full_Time=2;
max_Hrs_In_Month=100;
emp_Rate_Per_Hr=20;
num_Working_Days=20;

totalEmpHrs=0;
totalWorkingDays=0;

while [[ $totalEmpHrs -lt $max_Hrs_In_Month && $totalWorkingDays -lt $num_Working_Days  ]]
do
	((totalWorkingDays++))
	empCheck=$((RANDOM%3));
		case $empCheck in
			$is_Full_Time)
			empHrs=8
			;;
			$is_Part_Time)
			empHrs=4
			;;
			*)
			empHrs=0
			;;
		esac
		totalEmpHrs=$(($totalEmpHrs+$empHrs));
done

totalSalary=$(($totalEmpHrs*$emp_Rate_Per_Hr));

echo "The Montly Employee Wage as per working hours or days is $totalSalary"


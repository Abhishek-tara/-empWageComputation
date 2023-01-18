
is_Part_Time=1;
is_Full_Time=2;
max_Hrs_In_Month=100;
emp_Rate_Per_Hr=20;
num_Working_Days=20;

totalEmpHrs=0;
totalWorkingDays=0;

function getWorkingHours(){
     case $1 in
         $is_Full_Time)
          workHours=8
          ;;
         $is_Part_Time)
          workHours=4
          ;;
         *)
 	  workHours=0
      	  ;;
     esac
echo $workHours
}

function getEmpWage(){
	local empHr=$1
	echo $(($empHr*$emp_Rate_Per_Hr))
}

while [[ $totalEmpHrs -lt $max_Hrs_In_Month && $totalWorkingDays -lt $num_Working_Days  ]]
do
	((totalWorkingDays++))
	workHours=$( getWorkingHours $((RANDOM%3)) )
        totalEmpHrs=$(($totalEmpHrs+$workHours))
	dailyWage[$totalWorkingDays]="$( getEmpWage $workHours)"
done

totalSalary=$(($totalEmpHrs*$emp_Rate_Per_Hr));
echo "Daily Wage = " ${dailyWage[@]} 
echo "The Total Montly Employee Wage as per working hours or days is $totalSalary"


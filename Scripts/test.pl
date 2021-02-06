#!/usr/bin/perl

###转义符tr计数
$sequence = "GCUACGUUCGAAGCU";
$Ucount = ($sequence =~ tr/U//);
printf("There are $Ucount uracil in the sequence\n");

###用户输入数
#This program prompts the user for 10 numbers and then prints their average
for($i =0; $i < 10; $i++){
    print("Enter another number:\n");
    $numbers[$i] = <STDIN>;
}
$sum = 0;
for($j=0; $j < 10; $j++){
    $sum += $numbers[$j];
}
$average = $sum / 10.0 ;
print("The average of all 10 numbers is $average\n");
print("The sum of all 10 numbers is $sum\n");

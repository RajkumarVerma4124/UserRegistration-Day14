echo "Welcome To The User Registration Program"
echo "User Registration System ensuring all validations are in place during the User Entry"
printf "\n"

#!/bin/bash -x
shopt -s extglob
echo "As a User need to enter a valid First Name- First name starts with Cap and has minimum 3 characters (UC1)"
function firstName(){
read -p "ENTER THE FIRST NAME : " fName
pat="^[A-Z]{1}[a-z]{2,}$";
if [[ $fName =~ $pat ]]
then
	echo "VALID"
else
	echo "First Name Start With Capital and has Minimum 3 Characters like Abc,Raj "
	printf "\n"
	firstName
fi
}

lastName(){
echo -e "As a User need to enter a valid Last Name - Last name starts with Cap and has minimum 3 characters (UC2) \n"
read -p "ENTER THE LAST NAME : " lName
pat="^[A-Z]{1}[a-z]{2,}$"
if [[ $lName =~ $pat ]];
then
	echo "VALID ";
else
	echo "Invalid last name \n Last Name Start With Capital and has Minimum 3 Characters "
	lastName
fi
}

email(){
echo -e "\n As a User need to enter a valid email (UC3)"
read -p "ENTER THE EMAIL ADDRESS : " email
pat="^[0-9a-zA-Z]{1,7}([._+-][0-9a-zA-Z]{1,7})*@[0-9a-zA-Z]+[.]+([a-zA-Z]{2,4})+[.]*([a-zA-Z]{2,3})*$"
if [[ $email =~ $pat ]];
then
	echo "Valid Email";
else
	echo -e " INVALID EMAIL ADDRESS \n EG:- abc.xyz@bl.co.in or abc@bl.co \n you can put your name at abc minimum 3 chracters and xyz and .in is optional bl and co is 2 fixed characters"
	email
fi
}

phoneNumber(){
echo -e "\n As a User need to follow pre-defined Mobile Format - E.g. 91 9919819801 - Country code follow by space and 10 digit number (UC4)"
read -p "ENTER THE PHONE NUMBER : " phoneNo
pat="^91[ ][0-9]{10}$"
if [[ $phoneNo =~ $pat ]]
then
	echo "Valid Phone Number"
else
	echo "Invalid Phone Number It Should be 91 followed by space then 10 digit phone number"
	echo "EG:- 91 1234567895"
	phoneNumber
fi
}

passwordFunction()
{
echo -e "User need to follow pre-defined Password rules.\nRule1 – minimum 8 characters (UC5)\nRule2 – Should have at least 1 Upper Case (UC6)"
echo -e "Rule3-Should have at least 1 numeric number in the password (UC7) \nRule4 – Has exactly 1 Special Character (UC8)"
read -p "ENTER THE PASSWORD : " password
#pat="^(?=.*[A-Z])(?=.*[0-9])[0-9a-zA-Z]{8,}$"
count=${password//[^@#$%*+=-_!&()\-_=+;:,<.>]/}

if [[ ${#password} -gt 7 && "$password" == *[[:upper:]]* && "$password" == *[[:digit:]]*  && "$password" != *[[:space:]]* && ${#count} -eq 1 ]]
then
	echo "Valid Password"
else
	echo -e "Invalid PassWord it should be minimum 8 characters \nPassword Should Have atleast One Capital Letter"
	echo -e "Password Should Have atleast One digit \nPassword has exactly 1 Special Character \n"
	passwordFunction
fi
}

firstName
lastName
email
phoneNumber
passwordFunction

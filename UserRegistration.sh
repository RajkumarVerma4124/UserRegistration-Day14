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
firstName

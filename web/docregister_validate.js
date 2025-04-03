function docRegistrationValidation()
{

	var valid=true;
	var errorMsg = "";

	var unamecheck=new RegExp("^[a-zA-Z0-9_\\d]+$","g");
   // var datecheck=new RegExp("^[{2}0-9");
	/*var value1=new RegExp("^[a-zA-Z'-._\\d]+$","g");
	var value2=new RegExp("[a-zA-Z\\d]+$","g");//no special chars
	var value3=new RegExp("^[a-zA-Z\\d.]+$","g");//no spaces,no special chars(^ for space)
	var value4=new RegExp("[\\d]+$");//no letters
	var value5=new RegExp("[a-zA-Z\\d.]+$","g");//no special chars except dot

	if(!value.match(value1))
{alert("please enter valid details");return valid;}

	 */

	var name=document.f3.t1.value;
	var namecheck = new RegExp("^[a-zA-Z]+$","g");

	if(name == "")
	{

		errorMsg += "\nNAME: Provide Doctor name\n";
	}


	else if(!name.match(namecheck))
	{

		errorMsg += "\nNAME: Your name should not contain any special characters\n";

	}

    var sp=document.f3.t2.value;
    if(sp == "")
	{

		errorMsg += "\nSpecialization: Provide Specialization\n";
	}


	else if(!sp.match(namecheck))
	{

		errorMsg += "\nSpecialization: Your specialization should not contain any special characters\n";

	}
    

var phone = document.f3.t8.value;
	if(phone == "")
	{

		errorMsg += "\nPHONE: Enter phone no.\n";
	}
	else if(isNaN(phone))
	{

		errorMsg += "\nPHONE: Enter valid phone no.\n";
	}


	var zip = document.f3.t3.value;
	if(zip == "")
	{

		errorMsg += "\nZIP: Enter ZIP \n";
	}
	else if(isNaN(zip))
	{

		errorMsg += "\nZIP: Enter valid phone no.\n";
	}

    var email = document.f3.t7.value;
	var apos=document.f3.t7.value.indexOf("@");
	var dotpos=document.f3.t7.value.lastIndexOf(".");

	if(email=="")
	{

		errorMsg += "\nEMAIL: Provide  your emailid\n";
	}
	else if((apos<1)||((dotpos-apos)<2))
	{
		errorMsg += "\nEMAIL: Provide valid emailid\n";
	}

    
    var address = document.f3.m1.value;
	if(address == "")
	{

		errorMsg += "\nADDRESS: Enter address\n";
	}

   
    var username=document.f3.t4.value;
	var password=document.f3.t5.value;
	var repassword=document.f3.t6.value;

	if(username==""||username.length < 6||username.length > 20)
	{
		errorMsg += "\nUSERNAME: Your Username must be at least 6 characters\n";

	}
	else if(!username.match(unamecheck))
	{
		errorMsg += "\nUSERNAME: Your username should not contain any special characters except UNDERSCORE and should start with alphabet\n";
	}


	if (password.length < 6||password.length > 20)
	{
		errorMsg += "\nPASSWORD: Password should be atleast 6 characters and atmost 20 characters\n";

	}
	if((password.search("'"))>=0)
	{
		errorMsg+="\nPASSWORD: Please remove apostrophe from your Password!\n";

	}

	if(password!=repassword)
	{
		errorMsg += "\nPASSWORDS: Passwords not matching\n";
	}
if (errorMsg != "")
	{
		alert(errorMsg);
        exit(0);
		return false;
	}
	else
	{
        document.f3.method="post";
        document.f3.action="doctor.jsp";
        document.f3.submit();
		return true;
	}


}

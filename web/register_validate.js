function RegistrationValidation()
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

	var name=document.f1.t1.value;
	var namecheck = new RegExp("^[a-zA-Z0-9\\d]+$","g");

	if(name == "")
	{	
		errorMsg += "\nNAME: Provide your first name\n";
	}

	else if(name.length<3 || name.length >30)
	{
        
		errorMsg += "\nNAME: Name lenght MAX 30 MIN 3 Chars\n";
	}

	else if(!name.match(namecheck))
	{
        
		errorMsg += "\nNAME: Your name should not contain any special characters\n";

	}

	
	

	var phone = document.f1.t9.value;
	if(phone == "")
	{
         
		errorMsg += "\nPHONE: Enter phone no.\n";
	}
	else if(isNaN(phone))
	{
        
		errorMsg += "\nPHONE: Enter valid phone no.\n";
	}

    var email = document.f1.t4.value;
    
	var apos=document.f1.t4.value.indexOf("@");
    
   
	var dotpos=document.f1.t4.value.lastIndexOf(".")
   
    
	if(email=="")
	{
        
		errorMsg += "\nEMAIL: Provide  your emailid\n";
	}
	else if((apos<1)||((dotpos-apos)<2))
	{
		errorMsg += "\nEMAIL: Provide valid emailid\n";
	}

    var district = document.f1.d4.value;
	if(district == "")
	{
         
		errorMsg += "\nDISTRICT Select district \n";
	}
    var address = document.f1.m1.value;
	if(address == "")
	{
        
		errorMsg += "\nADDRESS: Enter address\n";
	}
     var area = document.f1.d5.value;
	if(area == "")
	{

		errorMsg += "\nArea: Enter Area\n";
	}
    
    var username=document.f1.t1.value;
	var password=document.f1.t2.value;
	var repassword=document.f1.t3.value;

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
		return false; 
	}
	else
	{
        
		return true;
	}		
    
	
}

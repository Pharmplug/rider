import 'package:email_validator/email_validator.dart';

class Validators {
  static RegExp numReg = RegExp(r".*[0-9].*");
  static RegExp letterReg = RegExp(r".*[A-Z].*");
  static RegExp specialReg = RegExp(r".*[@#\$&].*");


static String? passwordValidator(value){

bool passValid = RegExp("^(?=.{8,32}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).*").hasMatch(value);
 
if (value.isEmpty ){
   return 'Password cannot be empty';
}
if (value.length < 8){
   return 'Must be 8 characters long';
}

if(!passValid) 
 {
 return 'Atleast one capital letter (A-Z), one number (0-9), any special character';
 }
}

 static String? phoneNumberValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your phone number';
    }

    // Remove any non-digit characters from the input
    final cleanInput = value.replaceAll(RegExp(r'\D'), '');

    // Check if the cleaned input has at least 10 digits
    if (cleanInput.length < 10) {
      return 'Invalid phone number';
    }

    return null;
  }


  static String? emailValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Invalid Email';
    }
    return null;
  }
  static String? nameValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }
    static String? dataValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your email or phone number';
    }
    return null;
  }
static String? surnameValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your surname';
    }
    return null;
  }
  bool emailCheck(value) {
    bool isValid = true;

//declare a test case boolean, set it to false
    isValid = EmailValidator.validate(value);
    String correct = "";
    if (isValid) {
      return true;
    }
    return false;
  }
}

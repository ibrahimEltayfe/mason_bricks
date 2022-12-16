import 'dart:developer';
import 'package:email_validator/email_validator.dart';

class Validation {
  Validation._internal();
  static final _validator = Validation._internal();
  factory Validation() => _validator;

  String? emailValidator(String email){
   log(EmailValidator.validate(email).toString());
   log(email.toString());
    if(email.isEmpty) {
      return "من فضلك أدخل البريد الإلكترونى".toString();
    }else if(!EmailValidator.validate(email)){
        return "البريد الإلكترونى غير صالح";
    }

    return null;
  }

  String? registerPasswordValidator(String password){

    if(password.isEmpty) {
      return "من فضلك أدخل كلمة السر";
    }else if(password.length < 6) {
      return "من فضلك أدخل على الأقل 6 أرقام أو حروف";
    }
    return null;
  }

  String? nameValidator(String? name){

    if(name == null || name.isEmpty) {
      return "من فضلك أدخل الاسم";
    }else if(name.length>=25) {
      return "الاسم يجب أن لا يتعدى 25 حرف";
    }
    return null;
  }

  String? loginPasswordValidator(String password){

    if(password.isEmpty){
      return "من فضلك أدخل كلمة السر";
    }else if(password.length < 6){
      return "أقل عدد لطول كلمة السر هو 6";
    }
    return null;

  }

}

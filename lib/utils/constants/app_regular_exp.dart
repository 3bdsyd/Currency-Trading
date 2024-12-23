//* This class provides regular expressions as constant strings for validating
//* common user inputs such as name, email, password, and phone number.
class AppRegularExpressions {
  // static const String name =
  //     r'^(?=[a-zA-Z\u0621-\u064A\u0660-\u0669._]{2,50}$)(?!.*[_.]{2})[a-zA-Z\u0621-\u064A][a-zA-Z\u0621-\u064A._]*[a-zA-Z\u0621-\u064A]$';

  static const String emailRegExp =
      r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";

  static const String passwordRegExp =
      r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";

  static const String phoneNumberRegExp = r'^\d{10,15}$';
}

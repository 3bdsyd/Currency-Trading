import 'package:currency_trading/core/helper/check_forms.dart';
import 'package:flutter/material.dart';

//* Helper class for validating various form inputs such as name, email, password, and phone number.
class FormsValidate {
  static String? _oldPassword = '';

  //* Validates the 'name' field.
  //* Returns an error message string if validation fails, otherwise returns null.
  static String? getNameValidate(BuildContext context, String name) {
    if (!CheckForms.checkEmpty(name)) {
      return 'Required Field';
    }

    if (name.length < 3) {
      return 'Name Invalid';
    }

    return null;
  }

  //* Validates the 'email' field.
  //* Returns an error message string if validation fails, otherwise returns null.
  static String? getEmailValidate(BuildContext context, String email) {
    if (!CheckForms.checkEmpty(email)) {
      return 'Required Field';
    }

    if (!CheckForms.checkEmailRegex(email)) {
      return 'Email Invalid';
    }

    return null;
  }

  //* Validates the 'password' field.
  //* Returns an error message string if validation fails, otherwise returns null.
  static String? getPasswordValidate(BuildContext context, String password,
      {bool? isFillOldPassword}) {
    if (!CheckForms.checkEmpty(password)) {
      return 'Required Field';
    }

    if (password.length < 8) {
      return 'Password Invalid';
    }

    if (isFillOldPassword != null && isFillOldPassword) {
      _oldPassword = password;
    }

    return null;
  }

  //* Validates the 'confirm password' field.
  //* Returns an error message string if validation fails, otherwise returns null.
  static String? getConfPasswordValidate(
      BuildContext context, String password) {
    if (!CheckForms.checkEmpty(password)) {
      return 'Required Field';
    }

    if (password != _oldPassword) {
      return "Password's Not Match";
    }

    return null;
  }

  //* Validates fields that should not be empty.
  //* Returns an error message string if validation fails, otherwise returns null.
  static String? getEmptyValidate(BuildContext context, String value) {
    if (!CheckForms.checkEmpty(value)) {
      return 'Required Field';
    }

    return null;
  }

  //* Validates the 'phone number' field.
  //* Returns an error message string if validation fails, otherwise returns null.
  static String? getPhoneNumberValidate(
      BuildContext context, String phoneNumber) {
    if (!CheckForms.checkEmpty(phoneNumber)) {
      return 'Required Field';
    }

    if (!CheckForms.checkPhoneNumberRegex(phoneNumber)) {
      return 'Number Invalid';
    }

    return null;
  }
}

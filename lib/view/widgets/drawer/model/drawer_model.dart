import 'package:currency_trading/utils/icons.dart';

class SignalsDrawerModel {
  final String text;
  final String icon;
  SignalsDrawerModel({
    required this.text,
    required this.icon,
  });
}

List<SignalsDrawerModel> signalsDrawerModel = [
  SignalsDrawerModel(text: 'Login', icon: IconsAssets.loginIcon),
  SignalsDrawerModel(
      text: 'Notifications', icon: IconsAssets.notificationsIcon),
  SignalsDrawerModel(
      text: 'Privacy Policy', icon: IconsAssets.privacyPolicyIcon),
  SignalsDrawerModel(text: 'Terms Of Use', icon: IconsAssets.termsIcon),
];

List<SignalsDrawerModel> signalsDrawerLoginModel = [
  SignalsDrawerModel(text: 'Your Profile', icon: IconsAssets.profileIcon),
  SignalsDrawerModel(
      text: 'Notifications', icon: IconsAssets.notificationsIcon),
  SignalsDrawerModel(
      text: 'Privacy Policy', icon: IconsAssets.privacyPolicyIcon),
  SignalsDrawerModel(text: 'Terms Of Use', icon: IconsAssets.termsIcon),
  SignalsDrawerModel(text: 'Log out', icon: IconsAssets.logOutIcon),
];

import 'package:currency_trading/shared/custom_button_widget.dart';
import 'package:currency_trading/shared/custom_textfield.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/view/widgets/auth_appbar_function.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/title_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar(title: 'Update Password'),
      body: Container(
          height: double.maxFinite,
          decoration: mainLinearGradient(),
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Enter your new password',
                                style: TextStyle(color: Color(0xffB7B7B7)))),
                        const CustomVerticalSizedox(height: 50),
                        const TitleTextFieldWidget(title: 'New Password '),
                        const CustomVerticalSizedox(height: 10),
                        CustomTextField(
                            prefixIcon:
                                SvgPicture.asset(IconsAssets.passwordIcon),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(IconsAssets.eyeIcon,
                                  width: 3,
                                  height: 3,
                                  color: const Color(0xff8e711c)),
                            )),
                        const CustomVerticalSizedox(height: 40),
                        const CustomButtonWidget(text: 'Update Password'),
                        const CustomVerticalSizedox(height: 20),
                      ])))),
    );
  }
}

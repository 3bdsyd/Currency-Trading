import 'package:currency_trading/shared/custom_button_widget.dart';
import 'package:currency_trading/shared/custom_textfield.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/view/screens/auth/verify/verify_screen.dart';
import 'package:currency_trading/view/widgets/auth_appbar_function.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/title_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authAppBar(title: 'Verification'),
      body: Container(
          height: double.maxFinite,
          decoration: mainLinearGradient(),
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Enter your Email',
                            style: TextStyle(color: Color(0xffB7B7B7))),
                        const CustomVerticalSizedox(height: 50),
                        const TitleTextFieldWidget(title: 'Email '),
                        const CustomVerticalSizedox(height: 10),
                        CustomTextField(
                            prefixIcon:
                                SvgPicture.asset(IconsAssets.emailIcon)),
                        const CustomVerticalSizedox(height: 30),
                        CustomButtonWidget(
                            text: 'Send Code',
                            // onTap: () => Get.to(() => const VerifyScreen())
                            ),
                        const CustomVerticalSizedox(height: 20)
                      ])))),
    );
  }
}

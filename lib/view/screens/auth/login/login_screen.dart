import 'package:currency_trading/logic/controllers/auth/login_controller.dart';
import 'package:currency_trading/shared/custom_button_widget.dart';
import 'package:currency_trading/utils/validators/forms_validators.dart';
import 'package:currency_trading/view/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/title_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

import 'package:currency_trading/shared/custom_textfield.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/utils/images.dart';
import 'package:currency_trading/view/screens/auth/sign_up/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginControllerImpl());
    return Scaffold(
        body: Container(
            height: double.maxFinite,
            decoration: mainLinearGradient(),
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: GetBuilder<LoginControllerImpl>(
                      builder: (_) => Form(
                        key: controller.formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomVerticalSizedox(height: 60),
                              Image.asset(ImagesAssets.logoImage),
                              const Text('Welcome back!',
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              const Text(
                                  'Enter your Email and Password to login.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffB7B7B7))),
                              const CustomVerticalSizedox(height: 55),
                              const TitleTextFieldWidget(title: 'Email '),
                              const CustomVerticalSizedox(height: 10),
                              CustomTextField(
                                  validator: (email) =>
                                      FormsValidate.getEmailValidate(
                                          context, email),
                                  controller: controller.emailController,
                                  prefixIcon:
                                      SvgPicture.asset(IconsAssets.emailIcon)),
                              const CustomVerticalSizedox(height: 20),
                              const TitleTextFieldWidget(title: 'Password '),
                              const CustomVerticalSizedox(height: 10),
                              CustomTextField(
                                  obscureText: !controller.isPasswordVisible,
                                  controller: controller.passwordController,
                                  validator: (password) =>
                                      FormsValidate.getPasswordValidate(
                                          context, password,
                                          isFillOldPassword: true),
                                  prefixIcon: SvgPicture.asset(
                                      IconsAssets.passwordIcon),
                                  suffixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () => controller
                                            .togglePasswordVisibility(),
                                        child: SvgPicture.asset(
                                            controller.isPasswordVisible
                                                ? IconsAssets.eyeIcon
                                                : IconsAssets.eye1Icon,
                                            width: 19,
                                            height: 19,
                                            color: const Color(0xff8e711c)),
                                      ))),
                              const CustomVerticalSizedox(height: 5),
                              Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                    onTap: () => Get.to(
                                        () => const ForgotPasswordScreen()),
                                    child: const Text('Forgot Password',
                                        style: TextStyle(
                                            color: Color(0xffB7B7B7),
                                            fontSize: 13,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor:
                                                Color(0xffB7B7B7)))),
                              ),
                              const CustomVerticalSizedox(height: 40),
                              CustomButtonWidget(
                                  text: 'Log in',
                                  onTap: () => controller.loginUser()),
                              const CustomVerticalSizedox(height: 20),
                              GestureDetector(
                                  onTap: () =>
                                      Get.to(() => const SignUpScreen()),
                                  child: RichText(
                                      text: const TextSpan(
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          text: "Don’t have an account? ",
                                          children: <TextSpan>[
                                        TextSpan(
                                            text: 'Sign up',
                                            style: TextStyle(
                                                color: Color(0xfff2b80d)))
                                      ]))),
                              const CustomVerticalSizedox(height: 20)
                            ]),
                      ),
                    )))));
  }
}

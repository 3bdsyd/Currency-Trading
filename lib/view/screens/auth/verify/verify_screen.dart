import 'package:currency_trading/logic/controllers/auth/send_code_controller.dart';
import 'package:currency_trading/shared/custom_button_widget.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/view/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:currency_trading/view/widgets/auth_appbar_function.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SendCodeControllerImpl());
    return Scaffold(
        appBar: authAppBar(title: 'Verification'),
        body: Container(
            height: double.maxFinite,
            decoration: mainLinearGradient(),
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: GetBuilder<SendCodeControllerImpl>(
                      builder: (controller) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Enter your code',
                                    style:
                                        TextStyle(color: Color(0xffB7B7B7)))),
                            const CustomVerticalSizedox(height: 50),
                            Pinput(
                              keyboardType: TextInputType.number,
                              separatorBuilder: (index) =>
                                  const SizedBox(width: 13),
                              length: 4,
                              onCompleted: (pin) => controller.verifyCode(pin),
                              useNativeKeyboard: true,
                              showCursor: true,
                              defaultPinTheme: PinTheme(
                                width: 56,
                                height: 56,
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: const Color(0xff30448E)),
                              ),
                            ),
                            const CustomVerticalSizedox(height: 40),
                            CustomButtonWidget(
                              text: 'Verify',
                              // onTap: () => controller.verifyCode()
                            ),
                            const CustomVerticalSizedox(height: 20),
                            GestureDetector(
                                onTap: () => controller.sendCode(),
                                child: RichText(
                                    text: const TextSpan(
                                        style:
                                            TextStyle(color: Color(0xffB7B7B7)),
                                        text: "Didn't receive a code? ",
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: 'Send again',
                                          style: TextStyle(
                                              color: Color(0xffF2B80C)))
                                    ]))),
                            const CustomVerticalSizedox(height: 20)
                          ]),
                    )))));
  }
}

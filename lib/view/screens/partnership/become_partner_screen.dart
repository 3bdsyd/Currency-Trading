import 'package:currency_trading/shared/custom_textfield.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';

import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/view/screens/partnership/partnership_statistics_screen.dart';
import 'package:currency_trading/view/widgets/drawer/drawer_widget.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/main_appbar_function.dart';
import 'package:currency_trading/view/widgets/main_name_container_widget.dart';
import 'package:currency_trading/view/widgets/title_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BecomePartnerScreen extends StatelessWidget {
  const BecomePartnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const DrawerWidget(),
        appBar: mainAppBar(
            'Partnership',
            Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back, color: Colors.white)))),
        body: Container(
            width: double.infinity,
            height: double.maxFinite,
            decoration: mainLinearGradient(),
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomVerticalSizedox(height: 10),
                          const MainNameContainerWidget(),
                          const CustomVerticalSizedox(height: 15),
                          const Center(
                              child: Text('Become a Partner',
                                  style: TextStyle(
                                      color: Color(0xfff2b80d),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold))),
                          const CustomVerticalSizedox(height: 20),
                          const TitleTextFieldWidget(title: 'Country '),
                          const CustomVerticalSizedox(height: 10),
                          CustomTextField(
                            prefixIcon: Image.asset(IconsAssets.countryIcon),
                          ),
                          const CustomVerticalSizedox(height: 16),
                          const TitleTextFieldWidget(title: 'Birthday '),
                          const CustomVerticalSizedox(height: 10),
                          CustomTextField(
                            prefixIcon: Image.asset(IconsAssets.birthdayIcon),
                          ),
                          const CustomVerticalSizedox(height: 16),
                          const TitleTextFieldWidget(
                              title: 'Your Wallet Address '),
                          const CustomVerticalSizedox(height: 10),
                          CustomTextField(
                              prefixIcon: Image.asset(IconsAssets.walletIcon),
                              suffixIcon: Tooltip(
                                  enableTapToDismiss: true,
                                  textAlign: TextAlign.left,
                                  textStyle:
                                      const TextStyle(color: Colors.white),
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(7)),
                                  message:
                                      "Your wallet address which you would\n like to receive payments on",
                                  child: const Icon(Icons.help,
                                      color: Colors.white))),

                          // const CustomTextField(
                          //     hintText: 'Name', prefixIcon: IconsAssets.nameIcon),
                          // const CustomTextField(
                          //     hintText: 'Email', prefixIcon: IconsAssets.emailIcon),
                          // CustomTextField(
                          //     hintText: 'Password',
                          //     prefixIcon: IconsAssets.passwordIcon,
                          //     suffixIcon: Image.asset(IconsAssets.eyeIcon,
                          //         width: 7, height: 7)),
                          // CustomTextField(
                          //     hintText: 'Confirm Password',
                          //     prefixIcon: IconsAssets.passwordIcon,
                          //     suffixIcon: Image.asset(IconsAssets.eyeIcon,
                          //         width: 7, height: 7)),
                          // const CustomTextField(
                          //     hintText: 'Invitation Code',
                          //     prefixIcon: IconsAssets.invitationCodeIcon),
                          // const CustomTextField(
                          //     hintText: 'Country',
                          //     prefixIcon: IconsAssets.nameIcon),
                          // const CustomTextField(
                          //     hintText: 'Birthday',
                          //     prefixIcon: IconsAssets.),
                          // const CustomTextField(
                          //   hintText: 'Your Wallet Address',
                          //   prefixIcon: IconsAssets.w,
                          //   suffixIcon: Tooltip(
                          //     enableTapToDismiss: true,
                          //     textAlign: TextAlign.center,
                          //     textStyle: TextStyle(color: Colors.white),
                          //     decoration: BoxDecoration(color: Color(0xff2d2d2d)),
                          //     message:
                          //         "Your wallet address which you would\n like to receive payments on",
                          //     child: Icon(
                          //       Icons.help,
                          //       color: Colors.white,
                          //     ),
                          //   ),
                          // ),
                          const CustomVerticalSizedox(height: 40),
                          InkWell(
                              onTap: () => Get.to(
                                  () => const PartnershipStatisticsScreen()),
                              child: Center(
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 65, vertical: 11),
                                      decoration: BoxDecoration(
                                          color: const Color(0xfff2b80d),
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: const Text('Join',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))))),
                          const CustomVerticalSizedox(height: 20),
                        ])))));
  }
}

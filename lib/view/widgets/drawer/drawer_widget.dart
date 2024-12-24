import 'package:currency_trading/core/services/app_services.dart';
import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/constants/app_key.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/view/screens/auth/login/login_screen.dart';
import 'package:currency_trading/view/screens/notifications/notifications_screen.dart';
import 'package:currency_trading/view/widgets/drawer/drawer_login_widget.dart';
import 'package:currency_trading/view/widgets/drawer/model/drawer_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';


class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
  final String? token = Get.find<MyServices>().getBox.read(AppKey.token);
    return ClipRRect(
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(60)),
        child: Drawer(
            width: 236,
            backgroundColor: const Color(0xff757575),
            child: SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
              const CustomVerticalSizedox(height: 60),
             Image.asset(IconsAssets.logoIcon,width: 60),
              Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(IconsAssets.drawerbackIcon))),
              const CustomVerticalSizedox(height: 10),
              token != null
                  ? const DrawerLoginWidget()
                  : ListView.builder(
                      shrinkWrap: true,
                      itemExtent: 35,
                      itemBuilder: (context, index) => ListTile(
                          visualDensity: const VisualDensity(vertical: -4), 
                          onTap: () {
                            signalsDrawerModel[index].text == 'Login'
                                ? {Get.offAll(() => const LoginScreen(),
                                    transition: Transition.leftToRight), Get.deleteAll()}
                                : signalsDrawerModel[index].text ==
                                        'Notifications'
                                    ? Get.to(() => const NotificationsScreen(),
                                        transition: Transition.leftToRight)
                                    : () {};
                          },
                          leading: SvgPicture.asset(signalsDrawerModel[index].icon,
                              width: 22),
                          title: Text(signalsDrawerModel[index].text,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14))),
                      itemCount: signalsDrawerModel.length),
              CustomVerticalSizedox(height: token != null ? Get.height/15 : Get.height/2.8),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(IconsAssets.telegramIcon, width: 50),
                Image.asset(IconsAssets.whatsappIcon, width: 50),
                Image.asset(IconsAssets.youtubeIcon, width: 50),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(IconsAssets.twitterIcon, width: 50),
                Image.asset(IconsAssets.discordIcon, width: 50),
              ]),
              const CustomVerticalSizedox(height: 10)
            ]))));
  }
}

// LayoutBuilder(
//       builder: (context, size) => SizedBox(
//         width: 303,
//         child: Stack(
//           children: [
//             Drawer(
//               surfaceTintColor: ColorName.white,
//               width: 280,
//               backgroundColor: ColorName.white,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: ListView(
//                   padding: EdgeInsets.zero,
//                   children: [
//                     const SizedBox(height: 66),
//                     buildProfileSection(),
//                     const SizedBox(height: 40),
//                     buildMenuItems(),
//                     const SizedBox(height: 15),
//                     buildLanguageToggle(),
//                     SizedBox(
//                       height: _box.read(AppKey.token) != null
//                           ? size.maxHeight - 800
//                           : size.maxHeight - 530,
//                     ),
//                     buildLogoutItem(),
//                   ],
//                 ),
//               ),
//             ),
//             buildBackButton(),
//           ],
//         ),
//       ),
//     );
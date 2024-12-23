import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/view/screens/partnership/become_partner_screen.dart';
import 'package:currency_trading/view/widgets/drawer/drawer_widget.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/main_appbar_function.dart';
import 'package:currency_trading/view/widgets/main_name_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool _isChecked = false;
final ScrollController _scrollController = ScrollController();

class PartnershipScreen extends StatefulWidget {
  const PartnershipScreen({super.key});

  @override
  State<PartnershipScreen> createState() => _PartnershipScreenState();
}

class _PartnershipScreenState extends State<PartnershipScreen> {
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
                          Center(
                            child: const Text(
                              'About Partnership',
                              style: TextStyle(
                                  color: Color(0xfff2b80d),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const CustomVerticalSizedox(height: 20),
                          Container(
                              height: 330,
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: const Color(0xFF2C2C2E).withOpacity(.3),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ScrollbarTheme(
                                  data: ScrollbarThemeData(
                                    thumbColor:
                                        MaterialStateProperty.all(Colors.white),
                                    trackColor: MaterialStateProperty.all(
                                        Colors.white.withOpacity(0.1)),
                                    trackBorderColor: MaterialStateProperty.all(
                                        Colors.transparent), // إزالة الإطار
                                  ),
                                  child: Scrollbar(
                                      trackVisibility: true,
                                      controller: _scrollController,
                                      thumbVisibility: true,
                                      thickness: 6,
                                      radius: Radius.circular(16),
                                      child: SingleChildScrollView(
                                          controller: _scrollController,
                                          child: Text(
                                              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  height: 2)))))),
                          const CustomVerticalSizedox(height: 6),
                          Row(children: [
                            Checkbox(
                              side: const BorderSide(color: Color(0xff76b354)),
                              hoverColor: const Color(0xff76b354),
                              activeColor: const Color(0xff76b354),
                              focusColor: const Color(0xff76b354),
                              fillColor: WidgetStateProperty.all(
                                  const Color(0xff76b354)),
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value ?? false;
                                });
                              },
                            ),
                            const Text('Agree to conditions',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18))
                          ]),
                          const CustomVerticalSizedox(height: 12),
                          InkWell(
                              onTap: () =>
                                  Get.to(() => const BecomePartnerScreen()),
                              child: Center(
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 65, vertical: 11),
                                      decoration: BoxDecoration(
                                          color: const Color(0xfff2b80d),
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: const Text('Continue',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold))))),
                          const CustomVerticalSizedox(height: 20),
                        ])))));
  }
}

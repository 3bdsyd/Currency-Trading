import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/view/screens/partnership/widgets/partnership_statistics_instructions.dart';
import 'package:currency_trading/view/screens/partnership/widgets/partnership_statistics_tab_withicon.dart';
import 'package:currency_trading/view/screens/partnership/widgets/partnership_statistics_transactions.dart';
import 'package:currency_trading/view/screens/partnership/widgets/partnership_statistics_user.dart';
import 'package:currency_trading/view/screens/partnership/widgets/partnership_statistics_user_options.dart';
import 'package:currency_trading/view/widgets/drawer/drawer_widget.dart';
import 'package:currency_trading/view/widgets/mainLinear_gradient_function.dart';
import 'package:currency_trading/view/widgets/main_appbar_function.dart';
import 'package:currency_trading/view/widgets/main_name_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool showFirstTable = true;

class PartnershipStatisticsScreen extends StatefulWidget {
  const PartnershipStatisticsScreen({super.key});

  @override
  State<PartnershipStatisticsScreen> createState() =>
      _PartnershipStatisticsScreenState();
}

class _PartnershipStatisticsScreenState
    extends State<PartnershipStatisticsScreen> {
  void switchToFirstTable() {
    setState(() {
      showFirstTable = false;
    });
  }

  void switchToSecondTable() {
    setState(() {
      showFirstTable = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
            endDrawer: const DrawerWidget(),
            appBar: mainAppBar(
                'Partnership',
                Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: InkWell(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.arrow_back,
                            color: Colors.white)))),
            body: Container(
                width: double.infinity,
                decoration: mainLinearGradient(),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomVerticalSizedox(height: 10),
                            const MainNameContainerWidget(),
                            const CustomVerticalSizedox(height: 15),
                            const TabBar(
                                labelStyle: TextStyle(fontSize: 10),
                                indicatorColor: Color(0xffF2B80C),
                                labelColor: Color(0xffF2B80C),
                                automaticIndicatorColorAdjustment: true,
                                indicatorSize: TabBarIndicatorSize.tab,
                                unselectedLabelColor: Color(0xffF7F7F7),
                                tabs: [
                                  PartnershipStatisticsTabWithIcon(
                                      icon: IconsAssets.usersIcon,
                                      text: 'Users',
                                      index: 0),
                                  PartnershipStatisticsTabWithIcon(
                                      icon: IconsAssets.transactionsIcon,
                                      text: 'Transactions',
                                      index: 1),
                                  PartnershipStatisticsTabWithIcon(
                                      icon: IconsAssets.instructionsIcon,
                                      text: 'Instructions',
                                      index: 2)
                                ]),
                            Column(children: [
                              SizedBox(
                                  height: double.maxFinite,
                                  child: TabBarView(children: [
                                    showFirstTable == true
                                        ? PartnershipStatisticsUser(
                                            onEyeClick: switchToFirstTable)
                                        : const PartnershipStatisticsUsersOptions(),
                                    const PartnershipStatisticsTransactions(),
                                    const PartnershipStatisticsInstructions(),
                                  ]))
                            ])
                          ]),
                    )))));
  }
}

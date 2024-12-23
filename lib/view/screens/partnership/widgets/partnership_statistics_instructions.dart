import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:flutter/material.dart';

int? selected;

class PartnershipStatisticsInstructions extends StatefulWidget {
  const PartnershipStatisticsInstructions({super.key});

  @override
  State<PartnershipStatisticsInstructions> createState() =>
      _PartnershipStatisticsInstructionsState();
}

class _PartnershipStatisticsInstructionsState
    extends State<PartnershipStatisticsInstructions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: ListView.separated(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) => SizedBox(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Text("Lorem ipsum dolor sit amet?",
                              style: TextStyle(
                                  color: selected == index
                                      ? const Color(0xffF2B80C)
                                      : Colors.white,
                                  fontWeight: FontWeight.w500))),
                      ExpansionTile(
                          onExpansionChanged: (isExpanded) {
                            setState(() {
                              selected = isExpanded ? index : null;
                            });
                          },
                        //   showTrailingIcon: false,
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          title: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white.withOpacity(.2)),
                              child: Row(children: [
                                Flexible(
                                    child: Text(
                                        'sed do eiusmod tempor incididunt ut labore et dolore\n magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                                        style: TextStyle(
                                            fontSize: 11,
                                            overflow: TextOverflow.ellipsis,
                                            color: Color(0xffB7B7B7)))),
                                Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Image.asset(IconsAssets.shapeIcon))
                              ])),
                          iconColor: Colors.white,
                          children: <Widget>[
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                padding: const EdgeInsets.all(18),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: const Color(0xff23252F)),
                                child: Text(
                                    "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                                    style: TextStyle(
                                        color: Color(0xffF7F7F7),
                                        fontSize: 11)))
                          ])
                    ])),
            separatorBuilder: (context, index) =>
                const CustomVerticalSizedox(height: 20),
            itemCount: 5));
  }
}

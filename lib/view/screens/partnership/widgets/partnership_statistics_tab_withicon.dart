import 'package:flutter/material.dart';

class PartnershipStatisticsTabWithIcon extends StatelessWidget {
  final String icon;
  final String text;
  final int index;

  const PartnershipStatisticsTabWithIcon({
    super.key,
    required this.icon,
    required this.text,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final TabController controller = DefaultTabController.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final isSelected = controller.index == index;
        return Tab(
            icon: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            icon,
            color:
                isSelected ? const Color(0xffF2B80C) : const Color(0xffF7F7F7),
          ),
          const SizedBox(width: 6),
          Text(text)
        ]));
      },
    );
  }
}

import 'package:currency_trading/shared/custom_vertical_sizedox.dart';
import 'package:currency_trading/utils/icons.dart';
import 'package:currency_trading/view/widgets/title_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartnershipStatisticsTransactions extends StatelessWidget {
  const PartnershipStatisticsTransactions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomVerticalSizedox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          itemExtent: 90,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ListTile(
            leading: SizedBox(
                width: 40,
                height: 40,
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff23252F)),
                    child: index == 0
                        ? InkWell(
                            onTap: () => Get.dialog(
                                barrierDismissible: false,
                                AlertDialog(
                                  backgroundColor: Colors.black,
                                  content: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18, vertical: 10),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: IconButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  icon: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              7),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.white),
                                                          shape:
                                                              BoxShape.circle),
                                                      child: const Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                        size: 12,
                                                      ))),
                                            ),
                                            const Text('Withdraw Wallet',
                                                style: TextStyle(
                                                    color: Color(0xffF2B80C),
                                                    fontSize: 26,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            const CustomVerticalSizedox(
                                                height: 27),
                                            const Text(
                                                'You can withdraw at least 10USDT',
                                                style: TextStyle(
                                                    color: Color(0xffF7F7F7),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            const CustomVerticalSizedox(
                                                height: 27),
                                            const Text('Your wollet: 100USDT',
                                                style: TextStyle(
                                                    color: Color(0xffF7F7F7),
                                                    fontSize: 16)),
                                            const CustomVerticalSizedox(
                                                height: 27),
                                            const TitleTextFieldWidget(
                                                title: 'Amount '),
                                            const CustomVerticalSizedox(
                                                height: 10),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                  suffixIcon: Container(
                                                    alignment: Alignment.center,
                                                    width: 44,
                                                    height: 48,
                                                    decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xff704EF4),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7)),
                                                    child: const Text('Max',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 14.0),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7),
                                                      borderSide:
                                                          BorderSide.none),
                                                  filled: true,
                                                  fillColor:
                                                      const Color(0xff282828)
                                                          .withOpacity(.4),
                                                  prefixIcon: Image.asset(
                                                      IconsAssets.amountIcon),
                                                  labelStyle: const TextStyle(
                                                      color: Colors.white)),
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const CustomVerticalSizedox(
                                                height: 25),
                                            Center(
                                                child: Container(
                                                    width: 162,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffF2B80C),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                    alignment: Alignment.center,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 30,
                                                            vertical: 10),
                                                    child: Text('Withdraw',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20))))
                                          ])),
                                )),
                            child: Image.asset(IconsAssets.withdrawalIcon,
                                width: 30, height: 30),
                          )
                        : Image.asset(IconsAssets.depositIcon,
                            width: 30, height: 30))),
            title: index == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        const Text('Withdrawal',
                            style: TextStyle(
                                color: Color(0xfff2b80d),
                                fontWeight: FontWeight.bold)),
                        Text('15-02-2024',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w300))
                      ])
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Deposit',
                          style: TextStyle(
                              color: Color(0xff40ad2f),
                              fontWeight: FontWeight.bold)),
                      Text('15-02-2024',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w300))
                    ],
                  ),
            subtitle: index == 0
                ? const Text('200 USDT',
                    style: TextStyle(color: Colors.white, fontSize: 12))
                : const Text('Received 10 USDT for inviting UID 15.',
                    style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
          itemCount: 5,
        ),
      ],
    );
  }
}

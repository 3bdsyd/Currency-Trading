import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_trading/logic/controllers/signals_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignalsContainerSliderBoxWidget extends StatelessWidget {
  const SignalsContainerSliderBoxWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    Get.put(SignalsControllerImpl());
    return GetBuilder<SignalsControllerImpl>(
        builder: (controller) => Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200]),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  alignment: Alignment.center,
                    height: 200,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    imageUrl: 'https://crypto-signals-ultimate.com/$image',
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                backgroundColor: const Color(0xff454545),
                                color: const Color(0xfff2b80d),
                                value: downloadProgress.progress)),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error)))));
  }
}

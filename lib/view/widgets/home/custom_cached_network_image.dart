import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/them_controller.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.image,
  });

  final String? image;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return CachedNetworkImage(
      fit: BoxFit.cover,
      width: double.infinity,
      imageUrl: image == null
          ? themeController.isDarkMode.value
              ? 'https://i.pinimg.com/564x/5c/83/ba/5c83ba886d0db72af932da66b770a6ba.jpg'
              : "https://allgoods.com.au/cdn/shop/products/placeholder-image_7ec1fe46-a978-435e-ab7f-257457a0c985.jpg?v=1692573879&width=800"
          : image!,
      errorWidget: (context, url, error) {
        return const Icon(Icons.error);
      },
    );
  }
}

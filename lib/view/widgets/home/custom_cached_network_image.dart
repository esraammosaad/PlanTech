import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.image,
  });

  final String? image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      width: double.infinity,
      imageUrl: image ??
          "https://allgoods.com.au/cdn/shop/products/placeholder-image_7ec1fe46-a978-435e-ab7f-257457a0c985.jpg?v=1692573879&width=800",
      errorWidget: (context, url, error) {
        return const Icon(Icons.error);
      },
    );
  }
}

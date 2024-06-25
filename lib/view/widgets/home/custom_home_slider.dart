import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grad_proj/controller/home_controllers/home_controller.dart';
import 'package:get/get.dart';
import '../../../data/data_source/static/static_home.dart';
import 'custom_slider_item.dart';

class CustomHomeSlider extends StatelessWidget {
  const CustomHomeSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return CarouselSlider(
          options: CarouselOptions(

            padEnds: false,
            aspectRatio: 16 / 8,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              controller.slider(index);
            },
            scrollDirection: Axis.horizontal,
          ),
          items: homeList.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return CustomSliderItem(
                  item: item,
                );
              },
            );
          }).toList(),
        );
      }
    );
  }
}

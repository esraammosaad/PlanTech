import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/camera_controllers/my_garden_controller.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import '../../../core/constants/styles.dart';
import '../../widgets/camera/custom_heading_text.dart';
import '../../widgets/camera/custom_heading_two_test.dart';
import '../../widgets/camera/custom_meaning_text.dart';
import '../../widgets/camera/custom_points_text.dart';

class GardenItemDetails extends StatelessWidget {
  const GardenItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    int index = Get.arguments[0];
    return Scaffold(
      body: GetBuilder<MyGardenControllerImp>(
          builder: (controller) => SafeArea(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.close,
                              color: AppColors.kPrimaryColor,
                              size: 28,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: SizedBox(
                            // width: double.infinity,
                            // height: double.infinity,
                            child: CachedNetworkImage(imageUrl: controller.myGarden![index].image,),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.myGarden![index].result == ''
                                        ? 'No Result'
                                        : controller.myGarden![index].result,
                                    style: Styles.textStyle30(context)
                                        .copyWith(
                                        color: themeController
                                            .isDarkMode.value
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                  // Text(
                                  //   controller.myGarden![index] == null
                                  //       ? 'No Result'
                                  //       : 'Accuracy ' +
                                  //       (controller.myGarden![index][]! * 100)
                                  //           .toString()
                                  //           .substring(0, 5) +
                                  //       '%',
                                  //   style: Styles.textStyle18(context)
                                  //       .copyWith(
                                  //       color: themeController
                                  //           .isDarkMode.value
                                  //           ? Colors.white
                                  //           : Colors.black,
                                  //       fontWeight: FontWeight.w300),
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomMeaningText(
                                    themeController: themeController,
                                    text: controller.myGarden![index].result == "Spot"
                                        ? "Spot diseases, such as leaf spots caused by fungi or bacteria, can significantly affect plant health. These spots often appear as black, brown, or yellow lesions on the leaves, stems, or flowers. Here are recommendations for preventing and managing spot diseases in your plants:"
                                        : controller.myGarden![index].result == "Slug"
                                        ? "Slugs are common garden pests that can cause significant damage to plants by chewing holes in leaves, stems, and flowers. Here are recommendations for preventing and managing slug infestations in your plants:"
                                        : controller.myGarden![index].result == "Healthy"
                                        ? "Caring for healthy plants involves a combination of proper watering, sunlight, soil management, and preventive measures to keep them thriving and free from diseases. Here are comprehensive tips for maintaining the health of your plants:"
                                        : controller.myGarden![index].result == "Rust"
                                        ? 'Rust is another common fungal disease that affects a wide range of plants, manifesting as rust-colored spots or pustules on the leaves, stems, and flowers. Here are recommendations for preventing and managing rust in your plants'
                                        : 'Powdery mildew is a common fungal disease that affects many plants. It appears as a white or gray powdery coating on the leaves, stems, and buds. To manage and prevent powdery mildew, you can follow these recommendations:',
                                  ),
                                  controller.myGarden![index].result=="Healthy"?SizedBox():Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      SizedBox(height: 16,),
                                      controller.myGarden![index].result=="Spot"?CustomHeadingText(themeController: themeController, text: "Treatment of Spot Infection"): controller.myGarden![index].result=="Slug"?CustomHeadingText(themeController: themeController, text: "Treatment of Slug Infection"):controller.myGarden![index].result=="Powdery"?CustomHeadingText(themeController: themeController, text: "Treatment of Powdery Infection"):controller.myGarden![index].result=="Rust"?CustomHeadingText(themeController: themeController, text: "Treatment of Rust Infection"):SizedBox(),
                                      SizedBox(height: 16,),
                                      CustomHeadingTwoText(themeController: themeController, text: "Active constituents:                        \n "),

                                      CustomPointsText(themeController: themeController, text: controller.myGarden![index].result=="Spot"?"*Imidacloprid  \n\n *Acetamiprid \n\n *Abamectin 1.8%                            ":controller.myGarden![index].result ==
                                          "Slug"
                                          ? "*Proclain \n\n*Chlorpyrifos"
                                          :controller.myGarden![index].result ==
                                          "Rust"
                                          ? '*Dimethomorph + Pyraclostrobin.                        '
                                          : '*Propiconazole.                  \n\n*Difenoconazole + Azoxystrobin.' ),


                                      controller.myGarden![index].result == "Spot"
                                          ? Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets
                                                .only(
                                                top: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Expanded(
                                                    child: Image
                                                        .asset(
                                                      "assets/images/img_7.png",)),
                                                Expanded(
                                                    child: Image
                                                        .asset(
                                                      "assets/images/img_8.png",
                                                      height: 95,
                                                    )),
                                                Expanded(
                                                    child: Image
                                                        .asset(
                                                      "assets/images/img_9.png",
                                                      height: 110,
                                                    )),
                                              ],
                                            ),
                                          ),
                                          CustomPointsText(
                                              themeController:
                                              themeController,
                                              text:
                                              '•	Dosage: at noon every week according to infection.')
                                        ],
                                      ):controller.myGarden![index].result == "Slug"
                                          ? Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Expanded(
                                                  child: Image
                                                      .asset(
                                                      "assets/images/img.png")),
                                              Expanded(
                                                  child:
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        bottom:
                                                        12),
                                                    child:
                                                    Image.asset(
                                                      "assets/images/img_1.png",
                                                      height: 110,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          CustomPointsText(
                                              themeController:
                                              themeController,
                                              text:
                                              '•	Dosage: spray one puff from ( proclain and Chlorpyrifos )\n   alternately in the evening every 3 days.')
                                        ],
                                      )
                                          : controller.myGarden![index].result=="Rust"?Column(
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets
                                                .only(
                                                top: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Expanded(
                                                    child: Image
                                                        .asset(
                                                        "assets/images/img_5.png")),
                                                Expanded(
                                                    child: Image
                                                        .asset(
                                                      "assets/images/img_6.png",
                                                    )),

                                              ],
                                            ),
                                          ),
                                          CustomPointsText(
                                              themeController:
                                              themeController,
                                              text:
                                              '•	Dosage: spray one puff in the morning or afternoon \n   (avoid noon time)\n\n        *For severe infection: apply every 3 days\n\n        *For moderate infection: apply every 5 days\n\n        *For mild infection: apply every 10 days.')
                                        ],
                                      ):controller.myGarden![index].result == "Powdery"
                                          ? Column(
                                        children: [
                                          Padding(
                                            padding:
                                            const EdgeInsets
                                                .only(
                                                top: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Expanded(
                                                    child: Image
                                                        .asset(
                                                        "assets/images/img_2.png")),
                                                Expanded(
                                                    child: Image
                                                        .asset(
                                                      "assets/images/img_3.png",
                                                      height: 110,
                                                    )),
                                                Expanded(
                                                    child: Image
                                                        .asset(
                                                      "assets/images/img_4.png",
                                                      height: 110,
                                                    )),
                                              ],
                                            ),
                                          ),
                                          CustomPointsText(
                                              themeController:
                                              themeController,
                                              text:
                                              '•	Dosage: spray one puff in the morning or afternoon \n   (avoid noon time)\n\n        *For severe infection: apply every 3 days\n\n        *For moderate infection: apply every 5 days\n\n        *For mild infection: apply every 10 days.')
                                        ],
                                      )
                                          : SizedBox(),
                                      SizedBox(height: 16,),
                                    ],
                                  ),


                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              ExpansionTile(
                                  initiallyExpanded: false,
                                  title: CustomHeadingText(
                                    themeController: themeController,
                                    text: controller.myGarden![index].result == "Healthy"
                                        ? "General Care Tips:"
                                        : 'Prevention and Care Tips:',
                                  ),
                                  backgroundColor:
                                  themeController.isDarkMode.value
                                      ? Colors.black26
                                      : AppColors.backgroundColor,
                                  collapsedBackgroundColor:
                                  themeController.isDarkMode.value
                                      ? Colors.black26
                                      : AppColors.backgroundColor,
                                  childrenPadding:
                                  const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  collapsedIconColor:
                                  AppColors.kPrimaryColor,
                                  iconColor: AppColors.kPrimaryColor,
                                  children: [
                                    ExpansionTile(
                                      title: CustomHeadingTwoText(
                                          themeController: themeController,
                                          text: controller.myGarden![index].result ==
                                              "Healthy"
                                              ? "  1- Proper Watering:"
                                              : '  1- Increase Air Circulation:'),
                                      backgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      collapsedBackgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      childrenPadding:
                                      const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 8,
                                      ),
                                      collapsedIconColor:
                                      AppColors.kPrimaryColor,
                                      iconColor: AppColors.kPrimaryColor,
                                      children: [
                                        CustomPointsText(
                                          themeController: themeController,
                                          text: controller.myGarden![index].result == "Slug"
                                              ? '       *Space plants adequately to reduce the humidity \n         that slugs prefer.\n\n       *Prune or trim plants to improve airflow.'
                                              : controller.myGarden![index].result ==
                                              "Healthy"
                                              ? '       *Water plants deeply but infrequently to encourage \n         deep root growth.\n\n       *Use a soaker hose or drip irrigation to water at \n         the base of the plants, keeping foliage dry.\n\n       *Adjust watering frequency based on the plant type, \n         soil, and weather conditions.'
                                              : '       *Ensure good spacing between plants to allow air\n         to circulate freely.\n\n       *Prune or trim plants to improve airflow.',
                                        ),
                                      ],
                                    ),
                                    ExpansionTile(
                                      title: CustomHeadingTwoText(
                                          themeController: themeController,
                                          text: controller.myGarden![index].result ==
                                              "Healthy"
                                              ? '  2- Adequate Sunlight:'
                                              : '  2- Watering Practices:'),
                                      backgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      collapsedBackgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      childrenPadding:
                                      const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 8,
                                      ),
                                      collapsedIconColor:
                                      AppColors.kPrimaryColor,
                                      iconColor: AppColors.kPrimaryColor,
                                      children: [
                                        CustomPointsText(
                                          themeController: themeController,
                                          text: controller.myGarden![index].result == "Slug"
                                              ? "       *Water plants early in the day to allow the soil \n         surface to dry by evening.\n\n       *Avoid OverWatering and ensure the garden has\n         proper drainage."
                                              : controller.myGarden![index].result ==
                                              "Healthy"
                                              ? '       *Ensure your plants receive the right amount of sunlight \n         based on their specific needs.\n\n       *Most flowering and vegetable plants need 6-8 hours \n         of direct sunlight daily.'
                                              : '       *Water plants at the base rather than from above \n        to keep the foliage dry.\n\n       *Water in the early morning so that any water \n         on the leaves can dry quickly.',
                                        ),
                                      ],
                                    ),
                                    ExpansionTile(
                                      title: CustomHeadingTwoText(
                                          themeController: themeController,
                                          text:
                                          controller.myGarden![index].result == "Healthy"
                                              ? '  3- Soil Health:'
                                              : '  3- Sunlight:'),
                                      backgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      collapsedBackgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      childrenPadding:
                                      const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 8,
                                      ),
                                      collapsedIconColor:
                                      AppColors.kPrimaryColor,
                                      iconColor: AppColors.kPrimaryColor,
                                      children: [
                                        CustomPointsText(
                                            themeController:
                                            themeController,
                                            text: controller.myGarden![index].result=="Spot"?"        *Ensure plants receive sufficient sunlight, as many fungal \n          and bacterial diseases thrive in damp, shaded  \n          environments.":controller.myGarden![index].result ==
                                                "Slug"
                                                ? "        *Plant in areas that receive sufficient sunlight, as \n         slugs prefer cool, damp, and shaded environments."
                                                : controller.myGarden![index].result ==
                                                "Healthy"
                                                ? '       *Use well-draining soil rich in organic matter.\n\n       *Regularly add compost or organic fertilizers to enrich \n         the soil and provide nutrients.\n\n       *Test the soil periodically and amend it as needed to \n         maintain optimal pH and nutrient levels.'
                                                : controller.myGarden![index].result ==
                                                "Rust"
                                                ? '        *Ensure plants receive sufficient sunlight,as rust\n          fungi thrive in damp, shaded environments.'
                                                : '        *Place plants in an area with adequate sunlight, \n         as powdery mildew thrives in shady, humid conditions.'),
                                      ],
                                    ),
                                    ExpansionTile(
                                      title: CustomHeadingTwoText(
                                          themeController: themeController,
                                          text:
                                          controller.myGarden![index].result == "Healthy"
                                              ? '  4- Mulching:'
                                              : '  4- Healthy Soil:'),
                                      backgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      collapsedBackgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      childrenPadding:
                                      const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 8,
                                      ),
                                      collapsedIconColor:
                                      AppColors.kPrimaryColor,
                                      iconColor: AppColors.kPrimaryColor,
                                      children: [
                                        CustomPointsText(
                                            themeController:
                                            themeController,
                                            text: controller.myGarden![index].result =="Slug"||controller.myGarden![index].result=="Spot"

                                                ? '        *Maintain well-draining soil. \n\n        *Enrich the soil with organic matter to support \n          healthy plant growth.'
                                                : '        *Apply a layer of mulch around plants to retain soil \n          moisture,regulate temperature, and suppress weeds.\n\n        *Organic mulches such as straw, wood chips, or compost  \n          are beneficial.'),
                                      ],
                                    ),
                                    controller.myGarden![index].result == "Healthy"
                                        ? ExpansionTile(
                                      title: CustomHeadingTwoText(
                                          themeController:
                                          themeController,
                                          text:
                                          '  5- Pruning and Deadheading:'),
                                      backgroundColor: themeController
                                          .isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      collapsedBackgroundColor:
                                      themeController
                                          .isDarkMode.value
                                          ? Colors.black26
                                          : AppColors
                                          .backgroundColor,
                                      childrenPadding:
                                      const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 8,
                                      ),
                                      collapsedIconColor:
                                      AppColors.kPrimaryColor,
                                      iconColor:
                                      AppColors.kPrimaryColor,
                                      children: [
                                        CustomPointsText(
                                            themeController:
                                            themeController,
                                            text:
                                            '        *Regularly prune plants to remove dead or diseased \n          parts and to encourage healthy growth.\n\n        *Deadhead spent flowers to promote continuous \n          blooming.'),
                                      ],
                                    )
                                        : SizedBox(),
                                  ]),
                              SizedBox(
                                height: 8,
                              ),
                              ExpansionTile(
                                  initiallyExpanded: false,
                                  title: CustomHeadingText(
                                    themeController: themeController,
                                    text: controller.myGarden![index].result == "Healthy"
                                        ? 'Preventive Measures:'
                                        : 'Treatment Options:',
                                  ),
                                  backgroundColor:
                                  themeController.isDarkMode.value
                                      ? Colors.black26
                                      : AppColors.backgroundColor,
                                  collapsedBackgroundColor:
                                  themeController.isDarkMode.value
                                      ? Colors.black26
                                      : AppColors.backgroundColor,
                                  childrenPadding:
                                  const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  collapsedIconColor:
                                  AppColors.kPrimaryColor,
                                  iconColor: AppColors.kPrimaryColor,
                                  children: [
                                    ExpansionTile(
                                      title: CustomHeadingTwoText(
                                          themeController: themeController,
                                          text: controller.myGarden![index].result == "Slug"
                                              ? "  1- Handpicking:"
                                              : controller.myGarden![index].result ==
                                              "Healthy"
                                              ? '  1- Pest Control:'
                                              : '  1- Remove Infected Parts:'),
                                      backgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      collapsedBackgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      childrenPadding:
                                      const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 8,
                                      ),
                                      collapsedIconColor:
                                      AppColors.kPrimaryColor,
                                      iconColor: AppColors.kPrimaryColor,
                                      children: [
                                        CustomPointsText(
                                          themeController: themeController,
                                          text: controller.myGarden![index].result == "Slug"
                                              ? "        *Regularly inspect your plants, especially in the evening\n          or early morning when slugs are most active.\n\n        *Remove slugs by hand and dispose of them."
                                              : controller.myGarden![index].result ==
                                              "Healthy"
                                              ? '        *Monitor plants regularly for pests.\n\n        *Use natural predators, such as ladybugs,to \n          control pest populations.\n\n        *Apply organic or chemical insecticides if necessary, \n          following label instructions.'
                                              : '        *Carefully remove and dispose of infected leaves, \n          stems, and flowers.\n\n        *Do not compost infected plant parts, as this can \n          spread the fungus.',
                                        ),
                                      ],
                                    ),
                                    ExpansionTile(
                                      title: CustomHeadingTwoText(
                                          themeController: themeController,
                                          text: controller.myGarden![index].result == "Slug"
                                              ? "  2- Barriers and Traps:"
                                              : controller.myGarden![index].result ==
                                              "Healthy"
                                              ? '  2- Disease Prevention:'
                                              : '  2- Use Fungicides:'),
                                      backgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      collapsedBackgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      childrenPadding:
                                      const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 8,
                                      ),
                                      collapsedIconColor:
                                      AppColors.kPrimaryColor,
                                      iconColor: AppColors.kPrimaryColor,
                                      children: [
                                        CustomPointsText(
                                          themeController:
                                          themeController,
                                          text: controller.myGarden![index].result ==
                                              "Slug"
                                              ? "        *Copper Tape or Wire: Place copper tape or wire \n          around pots or garden beds, Slugs avoid crossing \n          copper due to a reaction with their slime.\n\n        *Diatomaceous Earth: Sprinkle diatomaceous earth around \n          plants, This natural, abrasive material can deter slugs.\n\n        *Beer Traps: Bury containers filled with beer up to the rim near\n          plants,Slugs are attracted to the beer, fall in, and drown."
                                              : controller.myGarden![index].result ==
                                              "Healthy"
                                              ? '        *Ensure good air circulation around plants to prevent \n          fungal diseases.\n\n        *Avoid overhead watering to keep foliage dry.\n\n        *Remove and dispose of any diseased plant  \n          material promptly. '
                                              : controller.myGarden![index].result == "Rust"
                                              ? '        *Apply a fungicide specifically designed to treat \n          rust mildew. Look for organic options if you prefer.\n\n        *Follow the manufacturer’s instructions \n          for application.'
                                              : '        *Apply a fungicide specifically designed to treat \n          powdery mildew. Look for organic options if you prefer.\n\n        *Follow the manufacturer’s instructions \n          for application.',
                                        ),
                                      ],
                                    ),
                                    ExpansionTile(
                                      title: CustomHeadingTwoText(
                                          themeController: themeController,
                                          text: controller.myGarden![index].result == "Slug"
                                              ? "  3- Natural Predators:"
                                              : controller.myGarden![index].result ==
                                              "Healthy"
                                              ? '  3- Fertilization:'
                                              : '  3- Homemade Remedies:'),
                                      backgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      collapsedBackgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      childrenPadding:
                                      const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 8,
                                      ),
                                      collapsedIconColor:
                                      AppColors.kPrimaryColor,
                                      iconColor: AppColors.kPrimaryColor,
                                      children: [
                                        CustomPointsText(
                                          themeController: themeController,
                                          text: controller.myGarden![index].result == "Slug"
                                              ? "        *Encourage natural slug predators, such as birds, frogs, \n          toads, and ground beetles, by creating a habitat that \n          attracts them.\n\n        *Introduce nematodes that specifically target slugs if\n          available in your area."
                                              : controller.myGarden![index].result ==
                                              "Healthy"
                                              ? '        *Fertilize plants based on their specific needs, \n          avoiding over-fertilization.\n\n        *Use a balanced, slow-release fertilizer for continuous  \n          nutrient supply.'
                                              : '        *Baking Soda Solution: Mix 1 tablespoon of baking soda,1/2\n          teaspoon of liquid soap (not detergent),and 1 gallon \n          of water. Spray the solution on affected plants.',
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        controller.myGarden![index].result == "Powdery"
                                            ? CustomPointsText(
                                          themeController:
                                          themeController,
                                          text:
                                          '        *Milk Spray: Mix 1 part milk with 2-3 parts water  \n          and spray on the plants.Milk has antifungal properties\n          that can help control powdery mildew.',
                                        )
                                            : SizedBox(),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        controller.myGarden![index].result == "Healthy" ||
                                            controller.myGarden![index].result == "Slug"
                                            ? SizedBox()
                                            : CustomPointsText(
                                          themeController:
                                          themeController,
                                          text:
                                          '         *Neem Oil: Neem oil is an organic treatment that can help \n           control fungal infections. Follow the instructions on the label\n           for mixing and applying.',
                                        ),
                                      ],
                                    ),
                                    controller.myGarden![index].result=="Slug"?SizedBox(): ExpansionTile(
                                      title: CustomHeadingTwoText(
                                          themeController: themeController,
                                          text:controller.myGarden![index].result ==
                                              "Healthy"
                                              ? '  4- Crop Rotation:'
                                              : '  4- Plant Resistant Varieties:'),
                                      backgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      collapsedBackgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      childrenPadding:
                                      const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 8,
                                      ),
                                      collapsedIconColor:
                                      AppColors.kPrimaryColor,
                                      iconColor: AppColors.kPrimaryColor,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            CustomPointsText(
                                              themeController:
                                              themeController,
                                              text:  controller.myGarden![index].result=="Spot"?"         *Choose plant varieties that are resistant to \n           spot diseases if they are a recurring issue":controller.myGarden![index].result ==
                                                  "Healthy"
                                                  ? '         *Rotate crops annually in vegetable gardens to prevent \n           soil depletion and reduce the risk of soil-borne diseases.'
                                                  : controller.myGarden![index].result ==
                                                  'Rust'
                                                  ? '         *Choose plant varieties that are resistant to rust \n           if rust is a recurring issue.'
                                                  : '         *If you frequently experience powdery mildew, consider\n           planting varieties that are resistant to this disease.',
                                            ),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ]),
                              SizedBox(
                                height: 8,
                              ),
                              ExpansionTile(
                                  initiallyExpanded: false,
                                  title: CustomHeadingText(
                                      themeController: themeController,
                                      text: 'Long-term Strategies:'),
                                  backgroundColor:
                                  themeController.isDarkMode.value
                                      ? Colors.black26
                                      : AppColors.backgroundColor,
                                  collapsedBackgroundColor:
                                  themeController.isDarkMode.value
                                      ? Colors.black26
                                      : AppColors.backgroundColor,
                                  childrenPadding:
                                  const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  collapsedIconColor:
                                  AppColors.kPrimaryColor,
                                  iconColor: AppColors.kPrimaryColor,
                                  children: [
                                    ExpansionTile(
                                      title: CustomHeadingTwoText(
                                          themeController: themeController,
                                          text: controller.myGarden![index].result == "Slug"
                                              ? "  1- Keep the Garden Clean:"
                                              : controller.myGarden![index].result ==
                                              "Healthy"
                                              ? '  1- Choose Resistant Varieties:'
                                              : '  1- Rotate Crops:'),
                                      backgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      collapsedBackgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      childrenPadding:
                                      const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 8,
                                      ),
                                      collapsedIconColor:
                                      AppColors.kPrimaryColor,
                                      iconColor: AppColors.kPrimaryColor,
                                      children: [
                                        CustomPointsText(
                                          themeController: themeController,
                                          text: controller.myGarden![index].result == "Slug"
                                              ? "         *Remove debris, fallen leaves, and plant material \n           where slugs can hide.\n\n        *Regularly clean up garden beds to reduce slug habitats."
                                              : controller.myGarden![index].result ==
                                              "Healthy"
                                              ? '         *Select plant varieties that are resistant to common diseases\n           and pests in your area.'
                                              : '         *If you are gardening, rotate crops annually to prevent\n          the buildup of disease in the soil.',
                                        ),
                                      ],
                                    ),
                                    ExpansionTile(
                                      title: CustomHeadingTwoText(
                                          themeController: themeController,
                                          text: controller.myGarden![index].result == "Slug"
                                              ? "  2- Mulching:"
                                              : controller.myGarden![index].result ==
                                              "Healthy"
                                              ? '  2- Companion Planting:'
                                              : '  2- Keep the Garden Clean:'),
                                      backgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      collapsedBackgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      childrenPadding:
                                      const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 8,
                                      ),
                                      collapsedIconColor:
                                      AppColors.kPrimaryColor,
                                      iconColor: AppColors.kPrimaryColor,
                                      children: [
                                        CustomPointsText(
                                          themeController: themeController,
                                          text: controller.myGarden![index].result=="Spot"?"         *Regularly clean up plant debris and fallen leaves,\n           as these can harbor fungal spores.":controller.myGarden![index].result == "Slug"
                                              ? "         *Use coarse mulch such as wood chips or gravel\n           which slugs find difficult to move across.\n\n        *Avoid using organic mulch that retains moisture and \n          provides hiding places for slugs."
                                              : controller.myGarden![index].result ==
                                              "Healthy"
                                              ? '         *Use companion planting to deter pests and improve plant health.\n           For example, planting marigolds can help repel nematodes.'
                                              : '         *Regularly clean up plant debris and fallen leaves,\n          as these can harbor fungal spores.',
                                        ),
                                      ],
                                    ),
                                    ExpansionTile(
                                      title: CustomHeadingTwoText(
                                          themeController: themeController,
                                          text: '  3- Monitor Regularly:'),
                                      backgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      collapsedBackgroundColor:
                                      themeController.isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      childrenPadding:
                                      const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 8,
                                      ),
                                      collapsedIconColor:
                                      AppColors.kPrimaryColor,
                                      iconColor: AppColors.kPrimaryColor,
                                      children: [
                                        CustomPointsText(
                                          //
                                          themeController: themeController,
                                          text: controller.myGarden![index].result=="Spot"?"         *Frequently inspect your plants for signs of spot diseases\n           and take action at the first sign of infection.":controller.myGarden![index].result == "Slug"
                                              ? "         *Keep an eye on your plants and act quickly \n          at the first sign of slug damage.\n\n         *Use a flashlight to check for slugs at night\n           when they are most active."
                                              : controller.myGarden![index].result ==
                                              "Healthy"
                                              ? '         *Inspect plants regularly for signs of stress, disease,\n          or pest infestations.\n\n         *Take immediate action if you notice any issues.'
                                              : controller.myGarden![index].result ==
                                              "Rust"
                                              ? '         *Frequently inspect your plants for signs of rust \n          and take action at the first sign of infection.'
                                              : '         *Keep an eye on your plants and act quickly at  \n          the first sign of powdery mildew.',
                                        ),
                                      ],
                                    ),
                                    controller.myGarden![index].result == "Healthy"
                                        ? ExpansionTile(
                                      title: CustomHeadingTwoText(
                                          themeController:
                                          themeController,
                                          text:
                                          '  4- Seasonal Care:'),
                                      backgroundColor: themeController
                                          .isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      collapsedBackgroundColor:
                                      themeController
                                          .isDarkMode.value
                                          ? Colors.black26
                                          : AppColors
                                          .backgroundColor,
                                      childrenPadding:
                                      const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 8,
                                      ),
                                      collapsedIconColor:
                                      AppColors.kPrimaryColor,
                                      iconColor:
                                      AppColors.kPrimaryColor,
                                      children: [
                                        CustomPointsText(
                                            themeController:
                                            themeController,
                                            text:
                                            '         *Adjust care routines based on the season. For example, \n          reduce watering in winter for dormant plants.')
                                      ],
                                    )
                                        : SizedBox(),
                                  ]),
                              SizedBox(
                                height:
                                controller.myGarden![index].result == "Healthy" ? 8 : 0,
                              ),
                              controller.myGarden![index].result == "Healthy"
                                  ? ExpansionTile(
                                  initiallyExpanded: false,
                                  title: CustomHeadingText(
                                      themeController: themeController,
                                      text:
                                      'Specific Tips for Different Plant Types:'),
                                  backgroundColor:
                                  themeController.isDarkMode.value
                                      ? Colors.black26
                                      : AppColors.backgroundColor,
                                  collapsedBackgroundColor:
                                  themeController.isDarkMode.value
                                      ? Colors.black26
                                      : AppColors.backgroundColor,
                                  childrenPadding:
                                  const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  collapsedIconColor:
                                  AppColors.kPrimaryColor,
                                  iconColor: AppColors.kPrimaryColor,
                                  children: [
                                    ExpansionTile(
                                      title: CustomHeadingTwoText(
                                          themeController:
                                          themeController,
                                          text:
                                          '  1- Indoor Plants:'),
                                      backgroundColor: themeController
                                          .isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      collapsedBackgroundColor:
                                      themeController
                                          .isDarkMode.value
                                          ? Colors.black26
                                          : AppColors
                                          .backgroundColor,
                                      childrenPadding:
                                      const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 8,
                                      ),
                                      collapsedIconColor:
                                      AppColors.kPrimaryColor,
                                      iconColor:
                                      AppColors.kPrimaryColor,
                                      children: [
                                        CustomPointsText(
                                            themeController:
                                            themeController,
                                            text:
                                            '         *Provide sufficient light, either natural or artificial.\n\n         *Avoid overwatering and ensure proper drainage.\n\n         *Maintain humidity levels suited to the specific plants.'),
                                      ],
                                    ),
                                    ExpansionTile(
                                      title: CustomHeadingTwoText(
                                          themeController:
                                          themeController,
                                          text:
                                          '  2- Outdoor Plants:'),
                                      backgroundColor: themeController
                                          .isDarkMode.value
                                          ? Colors.black26
                                          : AppColors.backgroundColor,
                                      collapsedBackgroundColor:
                                      themeController
                                          .isDarkMode.value
                                          ? Colors.black26
                                          : AppColors
                                          .backgroundColor,
                                      childrenPadding:
                                      const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 8,
                                      ),
                                      collapsedIconColor:
                                      AppColors.kPrimaryColor,
                                      iconColor:
                                      AppColors.kPrimaryColor,
                                      children: [
                                        CustomPointsText(
                                            themeController:
                                            themeController,
                                            text:
                                            '         *Protect plants from extreme weather conditions with covers \n          or windbreaks.\n\n         *Group plants with similar water and sunlight needs together.'),
                                      ],
                                    ),
                                  ])
                                  : SizedBox(),
                              SizedBox(
                                height: 16,
                              ),
                              CustomMeaningText(
                                themeController: themeController,
                                text: controller.myGarden![index].result=="Spot"?"Implementing these strategies should help you manage and prevent spot diseases in your plants effectively. If the problem persists, consider consulting a local extension service or a plant specialist for more specific advice.":controller.myGarden![index].result == "Slug"
                                    ? "Implementing these strategies should help you manage and prevent slug infestations in your garden effectively. If the problem persists, you might need to consult a local extension service or a pest control specialist for more specific advice."
                                    : controller.myGarden![index].result == "Healthy"
                                    ? "By following these guidelines, you can maintain the health and vigor of your plants, ensuring they thrive and remain resilient against diseases and pests."
                                    : controller.myGarden![index].result == "Rust"
                                    ? "Implementing these strategies should help you manage and prevent rust in your plants effectively. If the problem persists, consider consulting a local extension service or a plant specialist for more specific advice."
                                    : "Implementing these strategies should help you manage and prevent powdery mildew on your plants effectively. If the problem persists, you might need to consult a local extension service or a plant specialist for more specific advice.",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}





import 'package:flutter/material.dart';

import '../../widgets/home/custom_another_app_bar.dart';
class PlantsCommunity extends StatelessWidget {
  const PlantsCommunity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.symmetric(vertical: 16),
      child: CustomScrollView(
        slivers: [

          SliverToBoxAdapter(
              child: CustomAnotherAppBar(text: 'Plants Community')),

        ],
      ),


    ) ;
  }
}

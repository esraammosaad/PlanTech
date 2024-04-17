import 'package:flutter/material.dart';
import '../../widgets/home/custom_grid_view.dart';
import '../../widgets/home/custom_home_widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Padding(
               padding: EdgeInsets.all(8.0),
               child: CustomHomeWidgets(),
          )),
          CustomGridView(),


          // const CustomSearchField(),
        ],
      ),
    );
  }
}

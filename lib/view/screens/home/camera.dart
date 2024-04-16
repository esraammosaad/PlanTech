import 'package:flutter/material.dart';
import '../../widgets/home/custom_another_app_bar.dart';
import '../../widgets/home/custom_third_app_bar.dart';
class Camera extends StatelessWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar(text: 'Camera'),
      body: const Padding(padding: EdgeInsets.symmetric(vertical: 16),
        child: CustomScrollView(
          slivers: [


            // SliverToBoxAdapter(
            //     child: CustomAnotherAppBar(text: 'Camera')),

          ],
        ),


      ),
    ) ;
  }
}

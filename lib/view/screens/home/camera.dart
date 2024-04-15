import 'package:flutter/material.dart';
import '../../widgets/home/custom_another_app_bar.dart';
class Camera extends StatelessWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Padding(
        padding: EdgeInsets.all(50),
        child: CustomScrollView(
          slivers: [
            Padding(
              padding: EdgeInsets.all(16),
              child: SliverToBoxAdapter(
                  child: CustomAnotherAppBar(text: 'Camera')),
            ),
      
          ],
        ),
      
      
      ),
    ) ;
  }
}

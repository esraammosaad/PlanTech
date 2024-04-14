import 'package:flutter/material.dart';
import '../../widgets/home/custom_another_app_bar.dart';

class Bluetooth extends StatelessWidget {
  const Bluetooth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                   const CustomAnotherAppBar(text: 'bluetooth'),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * 0.2,
                  ),
                ],
              ),
            ),
             SliverFillRemaining(
              fillOverscroll: false,
              hasScrollBody: false,
              child: SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
            )
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/class/them_controller.dart';
import '../../widgets/home/custom_another_app_bar.dart';
import '../../widgets/profile/change_mode.dart';

class Bluetooth extends StatefulWidget {
  const Bluetooth({Key? key}) : super(key: key);

  @override
  State<Bluetooth> createState() => _BluetoothState();
}

class _BluetoothState extends State<Bluetooth> {

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



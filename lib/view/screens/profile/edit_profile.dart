import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../widgets/home/custom_third_app_bar.dart';
import '../../widgets/profile/custom_profile_column.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,text: 'Edit Profile'),
      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ScreenTypeLayout.builder(mobile: (context)=>const CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CustomProfileColumn(),
              ),

            ],
          ),tablet: (context)=>Row(

            children: [
              Expanded(child: Container()),
              const Expanded(flex:5,child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: CustomProfileColumn(),
                  ),

                ],
              )),
              Expanded(child: Container()),

            ],
          ),),
        ),
      ),
    );
  }
}



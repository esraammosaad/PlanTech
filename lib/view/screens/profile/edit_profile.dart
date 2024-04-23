import 'package:flutter/material.dart';
import 'package:grad_proj/view/widgets/home/custom_material_button.dart';
import '../../widgets/profile/custom_profile_column.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CustomProfileColumn(),
              ),

            ],
          ),
        ),
      ),
    );
  }
}



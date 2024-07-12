import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/styles.dart';
import '../../../core/constants/color.dart';
import '../../widgets/home/custom_third_app_bar.dart';
class Developers extends StatelessWidget {
  const Developers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar(context,text: 'Developers Team'),

      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text("Developers Team",style: Styles.textStyle30(context).copyWith(color: AppColors.kPrimaryColor,fontWeight: FontWeight.bold),),
                SizedBox(height: 32,),

                CircleAvatar(
                  radius: 60,

                  backgroundImage: AssetImage( "assets/images/s.png"),
                ),
                SizedBox(height: 8,),

                Text("Abdelrahman Sobhy \n bodeysobhy@gmail.com",textAlign: TextAlign.center,style: Styles.textStyle14(context).copyWith(fontWeight: FontWeight.bold,color: AppColors.kPrimaryColor)),
                SizedBox(height: 8,),
                CircleAvatar(
                  radius: 60,

                  backgroundImage: AssetImage( "assets/images/photo_2024-07-02_22-22-46.jpg"),
                ),
                SizedBox(height: 8,),

                Text("Arwa Tawfik \n arwatawfik2020@gmail.com",textAlign: TextAlign.center,style: Styles.textStyle14(context).copyWith(fontWeight: FontWeight.bold,color: AppColors.kPrimaryColor),),
                SizedBox(height: 8,),
                CircleAvatar(
                  radius: 60,

                  backgroundImage: AssetImage( "assets/images/photo_2024-07-03_05-02-54.jpg"),
                ),
                SizedBox(height: 8,),

                Text("Esraa Mosaad \n esraa.m.mosaad@gmail.com",textAlign: TextAlign.center,style: Styles.textStyle14(context).copyWith(fontWeight: FontWeight.bold,color: AppColors.kPrimaryColor)),
                SizedBox(height: 8,),
                CircleAvatar(
                  radius: 60,

                  backgroundImage: AssetImage( "assets/images/IMG_6131.JPG"),
                ),
                SizedBox(height: 8,),

                Text("Yomna Ashraf \n uomnaashraf550@gmail.com",textAlign: TextAlign.center,style: Styles.textStyle14(context).copyWith(fontWeight: FontWeight.bold,color: AppColors.kPrimaryColor),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

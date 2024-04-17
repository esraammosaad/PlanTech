import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/styles.dart';
import '../../widgets/home/custom_another_app_bar.dart';
import '../../widgets/profile/setting_options.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      child: CustomScrollView(
        slivers: [

          const SliverToBoxAdapter(
              child: CustomAnotherAppBar(text: 'Account Settings')),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(FirebaseAuth
                                  .instance.currentUser?.photoURL ??
                              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              alignment: AlignmentDirectional.centerStart,
                              fit: BoxFit.scaleDown,
                              child: Text(
                                FirebaseAuth.instance.currentUser?.displayName==''||FirebaseAuth.instance.currentUser?.displayName==null?
                                'person':FirebaseAuth.instance.currentUser!.displayName!,
                                style: Styles.textStyle25.copyWith(
                                    color: Colors.grey[950],
                                    fontFamily: AppFonts.kArabicFont),
                              ),
                            ),
                            FittedBox(
                              alignment: AlignmentDirectional.centerStart,
                              fit: BoxFit.scaleDown,
                              child: Text(
                                FirebaseAuth.instance.currentUser?.email==''||FirebaseAuth.instance.currentUser?.email==null?
                                    'person':FirebaseAuth.instance.currentUser!.email!,
                                style: Styles.textStyle14.copyWith(
                                    color: Colors.grey[600],
                                    fontFamily: AppFonts.kArabicFont),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16,),
// <<<<<<< esraa

//                   GetBuilder<ProfileControllerImpl>(builder: (controller) {
//                     return Container(
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(color: Colors.grey)),
//                       child: Column(
//                         children: [
//                           CustomProfileWidget(
//                               onTap: () {

//                               },
//                               text: 'Your Profile'),
//                           CustomProfileWidget(
//                               onTap: () {
//                                 controller.logOut();
//                               },
//                               text: 'Settings'),
//                           CustomProfileWidget(
//                               onTap: () {
//                                 controller.logOut();
//                               },
//                               text: 'Logout'),

//                         ],
//                       ),
//                     );
//                   })
// =======
                  SettingOptions()

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




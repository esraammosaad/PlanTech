import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grad_proj/controller/home_controllers/profile_controller.dart';
import 'package:get/get.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/styles.dart';
import '../../widgets/home/custom_another_app_bar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
              child: CustomAnotherAppBar(text: 'Account Settings')),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.15,
                        backgroundImage: NetworkImage(FirebaseAuth
                                .instance.currentUser?.photoURL ??
                            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
                      ),
                      const Spacer(
                        flex: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FirebaseAuth.instance.currentUser?.displayName ??
                                'none',
                            style: Styles.textStyle25.copyWith(
                                color: Colors.grey[950],
                                fontFamily: AppFonts.kArabicFont),
                          ),
                          Text(
                            FirebaseAuth.instance.currentUser?.email ?? 'none',
                            style: Styles.textStyle14.copyWith(
                                color: Colors.grey[600],
                                fontFamily: AppFonts.kArabicFont),
                          ),
                        ],
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          GetBuilder<ProfileControllerImpl>(
            builder: (controller) {
              return SliverFillRemaining(
                fillOverscroll: false,
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8),
                          child: Row(
                            children: [
                              const Text('logout'),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  controller.logOut();

                                },
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                       const Divider(
                          height: 10,
                          thickness: 2,
                        )
                      ],
                    ),
                    ),
                  ),
                );

            }
          ),
        ],
      ),
    );
  }
}

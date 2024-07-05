import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/home/custom_third_app_bar.dart';

final Uri _instgramurl = Uri.parse('https://www.instagram.com/esraa.m.mosaad/');
final Uri _githuburl = Uri.parse('https://github.com/esraammosaad/PlanTech.git');

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,text: 'Info'),

      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                color: Colors.white.withOpacity(0.2),
                width: double.infinity,
                height: double.infinity),
        
            Container(
                decoration: BoxDecoration(
                    color: Color(0xffE9E9E9),
                    borderRadius: BorderRadius.circular(25)),
                width: MediaQuery.of(context).size.width*0.8,
                height: MediaQuery.of(context).size.height*0.5,
                child: Padding(
                  padding:
                  const EdgeInsets.only(top: 40, left: 8, right: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                     Text(
                      'Your Smart Gardening Companion',
                      style: Styles.textStyle16(context).copyWith(color: Colors.black,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16,),
                     Text(
                      textAlign: TextAlign.center,
                      'Plantech is a mobile application designed to empower gardening enthusiasts of all levels, It offers a comprehensive suite of features to help you nurture your plants, connect with the gardening community, and monitor your landscapes remotely.',
                      style: Styles.textStyle16(context).copyWith(color: Colors.black,fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
        
                    const SizedBox(
                      height: 30,
                    ),
                    const Text('Contact us',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const IconButton(
                          // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(FontAwesomeIcons.instagram,
                                color: Colors.pinkAccent),
                            onPressed: _instgramUrl),
        
                        const IconButton(
                          // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                            icon: FaIcon(FontAwesomeIcons.github,
                                color: Colors.black),
                            onPressed: _githubUrl),
        
                      ],
                    ),
                  ]),
                )),
        
            Positioned(
              top: 85,
              left: 20,
              right: 20,
              child: Image.asset(
                'assets/images/logooo.png',
                height: 150,
                width: 150,
              ),
            ),

            // Positioned(
            //   top: 155,
            //   left: 20,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //        Text(
            //         'ABOUT',
            //         style: Styles.textStyle45(context),
            //       ),
            //        Text(
            //         'PlanTech',
            //         style: Styles.textStyle45(context),
            //       ),
            //       SizedBox(
            //           width: 70,
            //           child: Divider(
            //             thickness: 2,
            //             color: Colors.grey[800],
            //             height: 5,
            //           ))
            //     ],
            //   ),
            // ),
            // const Center(
            //     child: Padding(
            //         padding: EdgeInsets.only(top: 410),
            //         child: Text(
            //           'Developed by Esraa Mosaad',
            //           style:
            //           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //         )))
          ],
        ),
      ),
    );
  }
}

Future<void> _instgramUrl() async {
  if (!await launchUrl(_instgramurl)) {
    throw Exception('Could not launch $_instgramurl');
  }
}

// Future<void> _facebookUrl() async {
//   if (!await launchUrl(_facebookurl)) {
//     throw Exception('Could not launch $_facebookurl');
//   }
// }

Future<void> _githubUrl() async {
  if (!await launchUrl(_githuburl)) {
    throw Exception('Could not launch $_githuburl');
  }
}

// Future<void> _twitterUrl() async {
//   if (!await launchUrl(_twitterurl)) {
//     throw Exception('Could not launch $_githuburl');
//   }
// }

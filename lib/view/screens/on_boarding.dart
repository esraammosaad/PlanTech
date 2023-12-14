import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/data/data_source/static/static.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: PageView.builder(
        itemCount: onBoardigList.length,
        itemBuilder: (context,i) =>
          Container(
            width: 400,
            height: 812,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Color(0xFF090D05)),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 400,
                    height: 812,
                    decoration:  BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(onBoardigList[i].image!),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 400,
                    height: 812,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.00, -1.00),
                        end: Alignment(0, 1),
                        colors: [Colors.black.withOpacity(0), Colors.black.withOpacity(0.20000000298023224), Colors.black],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 322,
                  top: 40,
                  child: GestureDetector(
                    onTap: (){

                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Reem Kufi',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 16,
                  top: 99,
                  child: SizedBox(
                    width: 298,
                    child: Text(
                      onBoardigList[i].title!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontFamily: 'Reem Kufi',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 239,
                  child: SizedBox(
                    width: 343,
                    child: Text(
                      onBoardigList[i].body!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Reem Kufi',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 409,
                  child: Container(
                    width: 315,
                    height: 160,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 155,
                          top: 0,
                          child: Container(
                            width: 160,
                            height: 160,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage(onBoardigList[i].image!),
                                fit: BoxFit.cover,
                              ),
                              shape: OvalBorder(
                                side: BorderSide(width: 1.50, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 223,
                          top: 68,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage(onBoardigList[i].image!),
                                fit: BoxFit.cover,
                              ),
                              shape: OvalBorder(
                                side: BorderSide(width: 0.80, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 3,
                          child: Container(
                            width: 179,
                            height: 48,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 25,
                          top: 14,
                          child: Text(
                            onBoardigList[i].text!,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Reem Kufi',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 640,
                  child: GestureDetector(
                    onTap: (){},
                    child: Container(
                      width: 343,
                      padding: const EdgeInsets.symmetric(horizontal: 92, vertical: 10),
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(1.00, -0.03),
                          end: Alignment(-1, 0.03),
                          colors: buttonsColor,
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Reem Kufi',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 155,
                  top: 735,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ...List.generate(
                            onBoardigList.length,
                              (index) => AnimatedContainer(
                                margin: EdgeInsets.only(right: 20),
                                  duration: Duration(microseconds: 900),
                              width: 10,
                              height: 10,
                              decoration: ShapeDecoration(
                                color: Color(0xFFE3E3E3),
                                shape: OvalBorder(),
                              ),)
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),)
    );
  }
}

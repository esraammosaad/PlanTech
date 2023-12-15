import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController name = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController repassword = TextEditingController();

  GlobalKey<FormState> formstste = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formstste,
        child: Stack(children: [
          Container(
            height:800,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://s3-alpha-sig.figma.com/img/3dc8/2e6d/a5e4d1f9a09775108084fe95cdd9a761?Expires=1703462400&Signature=LQan6OWUqRMQCOs4JNcqhyG3SUxkrwcai9VzXpqyKBg-Thm-QQ43Al~mtIc6BRGBs5ddFXcUcN00xpCCGAP8frR~fYlbpAKrPcRVTwKMKuQkyA3AhGqUAi85wOWceOrT1pWcMDzWCvjpIaXo3GDg0raKmYTif8CDE~OE1bALmrp23NzM6AcMPCsryJRStrt4X5MjSYxj8lJKLa7EaEe6nuGtgRIn4gpK4BQF0P3ZDtoUhcsb2HwVAE5LNPj7LeXYOnXZ2vI4H-rf4jQhMG4omcsR0OXyKls4oFaN4ALtTIqYqki6h6FxN2XXPBtJJ3UJEvN1lJPp0IYa2-DHTvnh9Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                fit: BoxFit.fill,),
            ),),
          Container(
            //width: 375,
            height: 1000,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: const Alignment(0.00, -1.00),
                end: const Alignment(0, 1),
                colors: [Colors.black.withOpacity(0), Colors.black.withOpacity(0.1), Colors.black],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 150,
                ),
                const Text("Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontFamily: 'Reem Kufi',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    )),
                field(context, name, "Enter email"),
                fieldpass(
                    context,
                    password,
                    "Enter Password",
                    IconButton(
                      icon: const Icon(Icons.visibility_off),
                      onPressed: () {},
                    )),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Container(
                    width: double.infinity,
                    height: 47,
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(1.00, -0.03),
                        end: Alignment(-1, 0.03),
                        colors: [Color(0xFF75E00A), Color(0xFF09E09F)],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Sign In',
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
                Center(
                  child: SizedBox(
                    width: 350,
                    height: 26,
                    child: Stack(
                      children: [
                        const Positioned(
                          left: 160,
                          top: 0,
                          child: Text(
                            'Or',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Reem Kufi',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 12,
                          child: Container(
                            width: 142,
                            height: 2,
                            decoration: BoxDecoration(color: Color(0xFFC4C4C4)),
                          ),
                        ),
                        Positioned(
                          left: 206,
                          top: 12,
                          child: Container(
                            width: 142,
                            height: 2,
                            decoration: BoxDecoration(color: Color(0xFFC4C4C4)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Center(child: Text("Sign in with" , style:TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Reem Kufi',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0 , vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appicons("image"),
                      appicons("image"),
                      appicons("image"),
                    ],
                  ),
                ),
                const Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Not have an account,yet? ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Reem Kufi',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                            color: Color(0xFF74E009),
                            fontSize: 16,
                            fontFamily: 'Reem Kufi',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

Widget field(
    BuildContext context, TextEditingController controller, String hint) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      validator: (value) {
        if (value!.isNotEmpty && value!.contains("@")) {
          return null;
        } else {
          return "in valid email";
        }
      },
      controller: controller,
      decoration:
      InputDecoration(border: const OutlineInputBorder(), hintText: hint),
    ),
  );
}

Widget fieldpass(BuildContext context, TextEditingController controller,
    String hint, IconButton viewpass) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: viewpass,
          border: const OutlineInputBorder(),
          hintText: hint),
    ),
  );
}

Widget appicons(String image) {
  return Container(
    width: 40,
    height: 40,
    child: Image.asset(image),
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
  );
}

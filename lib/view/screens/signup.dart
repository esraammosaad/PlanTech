import 'package:flutter/material.dart';
class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  TextEditingController name= TextEditingController();
  TextEditingController password= TextEditingController();
  TextEditingController repassword= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height:100,
          ),
          const Text("Sign UP", style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontFamily: 'Reem Kufi',
            fontWeight: FontWeight.w700,
            height: 0,
          )),
          field(context, name, "Enter email"),
          fieldpass(context, password, "Enter Password", IconButton(icon: const Icon(Icons.visibility_off), onPressed: () {},)),
          fieldpass(context, repassword, "Re-enter Password", IconButton(icon: const Icon(Icons.visibility_off), onPressed: () {},)),
          Padding(
            padding:const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Container(
              width: double.infinity,
              height: 47,
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(1.00, -0.03),
                  end: Alignment(-1, 0.03),
                  colors: [Color(0xFF75E00A), Color(0xFF09E09F)],
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sign up',
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
          SizedBox(
            width: 342,
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
                    width: 136,
                    height: 2,
                    decoration: BoxDecoration(color: Color(0xFFC4C4C4)),
                  ),
                ),
                Positioned(
                  left: 206,
                  top: 12,
                  child: Container(
                    width: 136,
                    height: 2,
                    decoration: BoxDecoration(color: Color(0xFFC4C4C4)),
                  ),
                ),
              ],
            ),
          ),
          Text("Sign up with"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              appicons("image"),
              appicons("image"),
              appicons("image"),
            ],),
          ),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Already have an account?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Reem Kufi',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: 'Sign in',
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
          )
        ],
      ),
    );
  }
}
Widget field (BuildContext context, TextEditingController controller , String hint) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint ),
    ),
  );
}

Widget fieldpass (BuildContext context, TextEditingController controller , String hint , IconButton viewpass) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: viewpass,
          border: const OutlineInputBorder(),
          hintText: hint ),
    ),
  );
}

Widget appicons(String image){
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

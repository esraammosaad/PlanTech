import 'package:flutter/material.dart';
class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _SignUpState();
}

class _SignUpState extends State<LogIn> {

  GlobalKey<FormState> formstste = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formstste,
        child: Stack(
          children:  [

            Container(
              //width: 375,
              height:800,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://s3-alpha-sig.figma.com/img/3dc8/2e6d/a5e4d1f9a09775108084fe95cdd9a761?Expires=1703462400&Signature=LQan6OWUqRMQCOs4JNcqhyG3SUxkrwcai9VzXpqyKBg-Thm-QQ43Al~mtIc6BRGBs5ddFXcUcN00xpCCGAP8frR~fYlbpAKrPcRVTwKMKuQkyA3AhGqUAi85wOWceOrT1pWcMDzWCvjpIaXo3GDg0raKmYTif8CDE~OE1bALmrp23NzM6AcMPCsryJRStrt4X5MjSYxj8lJKLa7EaEe6nuGtgRIn4gpK4BQF0P3ZDtoUhcsb2HwVAE5LNPj7LeXYOnXZ2vI4H-rf4jQhMG4omcsR0OXyKls4oFaN4ALtTIqYqki6h6FxN2XXPBtJJ3UJEvN1lJPp0IYa2-DHTvnh9Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                  fit: BoxFit.fill,),
              ),),

            Container(
              //width: 375,
              height: 1000,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [Colors.black.withOpacity(0), Colors.black.withOpacity(0.1), Colors.black],
                ),
              ),
              child: Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 343,
                    height: 48,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.50, color: Color(0xFFDBFFB7)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),

                    child: TextFormField(
                      validator: (value) {
                        if (value!.isNotEmpty && value!.contains("@")) {
                          return null;
                        }else {
                          return "in valid email";
                        }
                      },
                    ),
                  ),
                  MaterialButton(onPressed: (){
                    if(formstste.currentState!.validate()){
                      print("valid");
                    }

                  },child: Text("Sign Up"),),

                ],

              )),
            )

            //  Container(
            //  width: 375,
            //  height: 812,
            //  decoration: BoxDecoration(
            //  gradient: LinearGradient(
            //  begin: Alignment(0.00, -1.00),
            //  end: Alignment(0, 1),
            //  colors: [Colors.black.withOpacity(0), Colors.black.withOpacity(0.20000000298023224), Colors.black],
            //  ),),)
          ],
        ),
      ),);
  }
}

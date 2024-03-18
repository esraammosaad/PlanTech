import 'package:firebase_auth/firebase_auth.dart';

class UpdateUserData {
  updateName(String username) async {
    await FirebaseAuth.instance.currentUser!.updateDisplayName(username);
  }
  updatePassword(String password) async {
    await FirebaseAuth.instance.currentUser!.updatePassword(password);
  }
  updatePhotoUrl(String url) async {
    await FirebaseAuth.instance.currentUser!.updatePhotoURL(url);
  }
  updatePhoneNum(PhoneAuthCredential phoneNum) async {
    await FirebaseAuth.instance.currentUser!.updatePhoneNumber(phoneNum);
  }
}

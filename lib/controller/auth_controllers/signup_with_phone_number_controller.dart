import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../core/functions/awesome_dialog.dart';
import '../../data/data_source/remote/auth_repo/auth_repo_imp.dart';
import '../../data/models/user_model.dart';

abstract class SignUpWthPhoneNumController extends GetxController {
  signUpWithPhoneNumber(BuildContext context);
}

class SignUpWthPhoneNumControllerImp extends SignUpWthPhoneNumController {
  late TextEditingController phoneNumController;
  late GlobalKey<FormState> formKey;
  late AutovalidateMode autoValidateMode;
  AuthRepoImp authRepo = Get.find();
  bool isLoading=false;
   String codeOfCountry='+20';

  @override
  void onInit() {
    phoneNumController = TextEditingController();
    formKey = GlobalKey();
    autoValidateMode = AutovalidateMode.disabled;
    super.onInit();
  }

  Widget chooseCountryCode(){

    return CountryCodePicker(
      onChanged: (countryCode){
        codeOfCountry=countryCode.code!;

      },
      initialSelection: 'EG',
      favorite: const ['+20','EG'],
      showCountryOnly: false,
      showOnlyCountryWhenClosed: false,
      alignLeft: false,
    );
  }

  @override
  signUpWithPhoneNumber(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      isLoading = true;
      update();
      var result =
          await authRepo.phoneAuth(phoneNumber: codeOfCountry+phoneNumController.text);
      result.fold((l) {
        isLoading = false;
        update();
        showAwesomeDialog(
            cancelOnPress: (){},
            okOnPress: (){},
            context: context,
            title: l.errMessage,
            desc: '',
            dialogType: DialogType.error);
      }, (r) {
        isLoading = false;
        update();
        Get.toNamed(AppRoutes.otpScreen);
        authRepo.addUserToCollection(UserModel(
            name: FirebaseAuth.instance.currentUser?.displayName??'',
            email: FirebaseAuth.instance.currentUser?.email??'',
            password: 'phone signUp without password',
            image: FirebaseAuth.instance.currentUser?.photoURL ??
                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
            uid: FirebaseAuth.instance.currentUser?.uid ?? '', phoneNumber: FirebaseAuth.instance.currentUser?.phoneNumber ?? ''));


      });
    }
    autoValidateMode = AutovalidateMode.always;
  }
}

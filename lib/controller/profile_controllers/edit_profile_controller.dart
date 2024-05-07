import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/update_user_data.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:grad_proj/data/models/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../core/functions/awesome_dialog.dart';
import '../../core/functions/pick_and_capture_image.dart';
import '../../data/data_source/remote/auth_repo/auth_repo_imp.dart';

abstract class EditProfileController extends GetxController {
  logOut();
  updateUserPhoto({required BuildContext context});
  updateUserName({required name, required BuildContext context});
  updateUserEmail({required String email, required BuildContext context});
  updateUserPassword({required String password, required BuildContext context});
  updateUserPhoneNumber();
  updateUserHeader({required BuildContext context});
  captureImageFromCamera();
  pickImageFromGallery();
  pickHeaderFromGallery();
}

class EditProfileControllerImpl extends EditProfileController {
  AuthRepoImp authRepo = Get.find();
  UpdateUserData updateUserData = Get.find();
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneNumberController;
   User ? firebaseAuth = FirebaseAuth.instance.currentUser;
  late UserModel userData;
  File? image;
  File? header;
  late ImagePicker imagePicker;
  bool isLoading = false;
  bool isLoadingPhoto = false;
  bool isLoadingHeader = false;
  bool isLoadingName = false;
  bool isLoadingEmail = false;
  bool isLoadingPassword = false;
  bool isLoadingNumber = false;
  @override
  Future<void> onInit() async {
    await getUserData();
    update();
    usernameController = TextEditingController();
    usernameController.text = userData.name;
    emailController = TextEditingController();
    emailController.text = userData.email;
    passwordController = TextEditingController();
    passwordController.text =
        userData.password == 'gmail account without password'
            ? ''
            : userData.password;
    phoneNumberController = TextEditingController();
    phoneNumberController.text = userData.phoneNumber;
    imagePicker = ImagePicker();

    super.onInit();
  }

  @override
  logOut() {
    authRepo.logOut();
    Get.offAllNamed(AppRoutes.logInScreen);
  }

  getUserData() async {
    isLoading=true;
    update();
    userData =
        await authRepo.fireBaseServices.getUserInfo(uid: firebaseAuth!.uid);
    isLoading=false;
    update();
  }

  @override
  updateUserEmail(
      {required String email, required BuildContext context}) async {
    isLoadingEmail = true;
    update();
    var result = await updateUserData.editUserEmail(
      email: email,
    );
    result.fold((l) {
      showAwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: l.errMessage,
          desc: '',
          okOnPress: () async {
            await logOut();
          },
          cancelOnPress: () {});
    }, (r) async {
      showAwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          title: 'To Confirm Changes Please Confirm Your New Email',
          desc: '',
          okOnPress: () {},
          cancelOnPress: () {});
      await getUserData();
      update();
    });
    isLoadingEmail = false;
    update();
  }

  @override
  updateUserName({required name, required BuildContext context}) async {
    isLoadingName = true;
    update();
    var result = await updateUserData.editUserName(
      name: name,
    );
    result.fold((l) {
      showAwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: l.errMessage,
          desc: '',
          okOnPress: () async {

          },
          cancelOnPress: () {});
    }, (r) async {
      showAwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          title: 'Name Changed Successfully',
          desc: '',
          okOnPress: () {},
          cancelOnPress: () {});
      await getUserData();
      update();
    });
    isLoadingName = false;
    update();
  }

  @override
  updateUserPassword(
      {required String password, required BuildContext context}) async {
    isLoadingPassword = true;
    update();
    var result = await updateUserData.editUserPassword(
      password: password,
    );
    result.fold((l) {
      showAwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: l.errMessage,
          desc: '',
          okOnPress: () async {
            await logOut();
          },
          cancelOnPress: () {});
    }, (r) {
      showAwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          title: 'Password Changed Successfully',
          desc: '',
          okOnPress: () {},
          cancelOnPress: () {});
      update();
    });
    isLoadingPassword = false;
    update();
  }

  @override
  updateUserPhoneNumber() {}

  @override
  updateUserPhoto({required BuildContext context}) async {
    isLoadingPhoto = true;
    update();

    var result = await updateUserData.editUserPhoto(
      image: image,
    );
    result.fold((l) {
      showAwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: l.errMessage,
          desc: '',
          okOnPress: () async {

          },
          cancelOnPress: () {});
    }, (r) async {
      showAwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          title: 'Photo Changed Successfully',
          desc: '',
          okOnPress: () {},
          cancelOnPress: () {});
      await getUserData();
      update();
    });
    isLoadingPhoto = false;
    update();
  }

  @override
  captureImageFromCamera() async {
    isLoading = true;
    image = (await capturePhotoFromCamera(imagePicker: imagePicker));
    isLoading = false;
    update();
  }

  @override
  pickImageFromGallery() async {
    isLoading = true;
    image = (await selectPhotoFromGallery(imagePicker: imagePicker));
    isLoading = false;
    update();
  }
  @override
  pickHeaderFromGallery() async {
    isLoading = true;
    header = (await selectPhotoFromGallery(imagePicker: imagePicker));
    isLoading = false;
    update();
  }

  @override
  updateUserHeader({required BuildContext context}) async {
    isLoadingHeader = true;
    update();

    var result = await updateUserData.editUserHeader(
      header: header,
    );
    result.fold((l) {
      showAwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: l.errMessage,
          desc: '',
          okOnPress: () async {

          },
          cancelOnPress: () {});
    }, (r) async {
      showAwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          title: 'Header Changed Successfully',
          desc: '',
          okOnPress: () {},
          cancelOnPress: () {});
      await getUserData();
      update();
    });
    isLoadingHeader = false;
    update();
  }
}

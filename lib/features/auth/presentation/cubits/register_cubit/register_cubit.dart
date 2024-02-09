import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

// import 'package:go_router/go_router.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//import '../../../../../core/utils/styling/styles.dart';
import '../../../data/models/register_models/register_request.dart';
import 'package:opi_se/features/auth/domain/use_cases/register_use_case.dart';
import 'package:opi_se/features/auth/data/models/register_models/language.dart';

import '../../../domain/use_cases/upload_national_id_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(
    this._registerUseCase,
    this._uploadNationalIdUseCase,
  ) : super(RegisterInitial());

  final RegisterUseCase _registerUseCase;
  final UploadNationalIdUseCase _uploadNationalIdUseCase;

  @override
  Future<void> close() async {
    fullNameController.dispose();
    ageController.dispose();
    locationController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    genderController.dispose();
    nativeLanguageController.dispose();
    nativeLevelController.dispose();
    secondLanguageController.dispose();
    secondLevelController.dispose();
    nationalIdController.dispose();
    firstFormKey.currentState?.reset();
    secondFormKey.currentState?.reset();
    super.close();
  }

  final firstFormKey = GlobalKey<FormState>();

  final secondFormKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  TextEditingController nativeLanguageController = TextEditingController();

  TextEditingController nativeLevelController = TextEditingController();

  TextEditingController secondLanguageController = TextEditingController();

  TextEditingController secondLevelController = TextEditingController();

  TextEditingController nationalIdController = TextEditingController();

  bool obscureText = true;

  bool confirmObscureText = true;

  bool agree = false;

  Icon icon = Icon(
    Icons.visibility_outlined,
    size: 21.sp,
    color: const Color(0xff036666),
  );

  Icon confirmIcon = Icon(
    Icons.visibility_outlined,
    size: 21.sp,
    color: const Color(0xff036666),
  );

  List<Language> filteredLanguages() {
    if (nativeLanguageController.text.trim().isNotEmpty) {
      return [
        Language(
          languageName: nativeLanguageController.text.trim(),
          level: int.parse(nativeLevelController.text),
        ),
        Language(
          languageName: secondLanguageController.text.trim(),
          level: int.parse(secondLevelController.text),
        ),
      ];
    } else {
      return [
        Language(
          languageName: nativeLanguageController.text.trim(),
          level: int.parse(nativeLevelController.text),
        ),
      ];
    }
  }

  Future<void> register() async {
    if (!secondFormKey.currentState!.validate()) return;
    emit(RegisterLoading());
    final result = await _registerUseCase.call(
      RegisterRequest(
        userName: fullNameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim(),
        location: locationController.text.trim(),
        age: int.parse(ageController.text.trim()),
        gender: genderController.text.trim().toLowerCase(),
        languages: filteredLanguages(),
      ),
    );
    result.fold((failure) {
      emit(RegisterFailure(failure.errMessage));
    }, (success) {
      emit(RegisterSuccess());
    });
  }

  void changePasswordVisibility() {
    obscureText = !obscureText;
    icon = obscureText
        ? Icon(Icons.visibility, size: 21.sp)
        : Icon(Icons.visibility_off, size: 21.sp);
    emit(ChangePasswordVisibility());
  }

  void changeConfirmPasswordVisibility() {
    confirmObscureText = !confirmObscureText;
    confirmIcon = confirmObscureText
        ? Icon(Icons.visibility, size: 21.sp)
        : Icon(Icons.visibility_off, size: 21.sp);
    emit(ChangePasswordVisibility());
  }

  void changeAgree() {
    agree = !agree;
    emit(ChangeAgree());
  }

  Future<void> getLocation() async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://maps.googleapis.com/maps/api/',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        receiveDataWhenStatusError: true,
      ),
    );

    clearLocationAndEmitLoading();

    await Geolocator.requestPermission();

    if (!await Geolocator.isLocationServiceEnabled()) {
      updateLocationAndEmitFailure('Location Service is Disabled');
      return;
    }

    final permissionStatus = await Geolocator.checkPermission();

    if (permissionStatus == LocationPermission.denied) {
      updateLocationAndEmitFailure('Location Permission is Denied');
      return;
    } else if (permissionStatus == LocationPermission.deniedForever) {
      updateLocationAndEmitFailure('Location Permission is Denied Forever');
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true,
      );

      var response = await dio.get(
        'geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyA5gl0-7D-SYPaLmUXf5QZ970vK22tc2Zg&language=en',
      );

      handleGeoCodingApiResponse(response);
    } catch (e) {
      updateLocationAndEmitFailure('Error, try again');
    }
  }

  void clearLocationAndEmitLoading() {
    locationController.clear();
    emit(GetLocationLoading());
  }

  void updateLocationAndEmitFailure(String message) {
    locationController.text = message;
    emit(GetLocationFailure());
  }

  void handleGeoCodingApiResponse(Response response) {
    if (response.statusCode == 200) {
      var result = response.data;
      String location = result['results'][0]['plus_code']['compound_code'];
      locationController.text =
          location.substring(location.indexOf(' ') + 1).trim();
      emit(GetLocationSuccess());
    } else {
      updateLocationAndEmitFailure('Error, try again');
    }
  }

// final ImagePicker picker = ImagePicker();
//
// Future<XFile?> cropImage(XFile imageFile) async {
//   final CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
//     cropStyle: CropStyle.rectangle,
//     sourcePath: imageFile.path,
//     maxWidth: 1080,
//     maxHeight: 1920,
//     compressQuality: 100,
//     compressFormat: ImageCompressFormat.png,
//     aspectRatioPresets: [
//       CropAspectRatioPreset.ratio16x9,
//       CropAspectRatioPreset.ratio4x3,
//       CropAspectRatioPreset.original,
//       CropAspectRatioPreset.square
//     ],
//     uiSettings: [
//       AndroidUiSettings(
//         toolbarTitle: 'OpiSe Cropper',
//         toolbarColor: const Color(0xFF036666),
//         toolbarWidgetColor: Colors.white,
//         initAspectRatio: CropAspectRatioPreset.ratio16x9,
//         hideBottomControls: false,
//         showCropGrid: true,
//       ),
//       IOSUiSettings(
//         title: 'OpiSe Cropper',
//         resetButtonHidden: false,
//         rotateButtonsHidden: false,
//         cancelButtonTitle: 'Cancel',
//         doneButtonTitle: 'Done',
//         resetAspectRatioEnabled: true,
//         showCancelConfirmationDialog: true,
//       ),
//     ],
//   );
//
//   if (croppedFile != null) {
//     return XFile(croppedFile.path);
//   }
//   return null;
// }
//
// XFile? image;
//
// Future<void> getLostData() async {
//   final LostDataResponse response = await picker.retrieveLostData();
//   if (!response.isEmpty) {
//     final List<XFile>? files = response.files;
//     if (files!.isNotEmpty) {
//       image = files.first;
//       return;
//     }
//   }
// }
//
// Future<void> pickImage() async {
//   getLostData();
//   final pickedImage = await picker.pickImage(
//     source: ImageSource.gallery,
//     imageQuality: 100,
//   );
//   if (pickedImage != null) {
//     image = pickedImage;
//     image = await cropImage(image!);
//     if (image != null) {
//       SystemChrome.setSystemUIOverlayStyle(
//         const SystemUiOverlayStyle(
//           statusBarColor: Colors.white,
//           statusBarBrightness: Brightness.light,
//           statusBarIconBrightness: Brightness.dark,
//         ),
//       );
//       nationalIdController.clear();
//       await uploadNationalId();
//     }
//   }
// }
//
// Future<void> takeImage() async {
//   getLostData();
//   final pickedImage = await picker.pickImage(
//     source: ImageSource.camera,
//     imageQuality: 100,
//   );
//   if (pickedImage != null) {
//     image = pickedImage;
//     image = await cropImage(image!);
//     if (image != null) {
//       SystemChrome.setSystemUIOverlayStyle(
//         const SystemUiOverlayStyle(
//           statusBarColor: Colors.white,
//           statusBarBrightness: Brightness.light,
//           statusBarIconBrightness: Brightness.dark,
//         ),
//       );
//       nationalIdController.clear();
//       await uploadNationalId();
//     }
//   }
// }
//
// Future<void> uploadNationalId() async {
//   emit(UploadNationalIdImageLoading());
//   var result = await _uploadNationalIdUseCase.call(image!);
//   result.fold((failure) {
//     emit(UploadNationalIdImageFailure(failure.errMessage));
//   }, (response) {
//     nationalIdController.text = response.nationalId!;
//     emit(UploadNationalIdImageSuccess());
//   });
// }
//
// void showBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     isDismissible: true,
//     backgroundColor: Colors.white,
//     useSafeArea: true,
//     context: context,
//     builder: (context) {
//       return Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           ListTile(
//             leading: Icon(
//               Icons.camera_outlined,
//               size: 22.sp,
//               color: Colors.black,
//             ),
//             title: Text(
//               'Camera',
//               style: AppStyles.textStyle24.copyWith(
//                 fontSize: 14.sp,
//               ),
//             ),
//             onTap: () async {
//               GoRouter.of(context).pop();
//               await takeImage();
//             },
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.photo_outlined,
//               size: 22.sp,
//               color: Colors.black,
//             ),
//             title: Text(
//               'Gallery',
//               style: AppStyles.textStyle24.copyWith(
//                 fontSize: 14.sp,
//               ),
//             ),
//             onTap: () async {
//               GoRouter.of(context).pop();
//               await pickImage();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
}

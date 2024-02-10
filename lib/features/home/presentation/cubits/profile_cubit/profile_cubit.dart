import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/errors/failure.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:opi_se/core/functions/cache_user_data.dart';
import '../../../domain/use_cases/change_profile_image_use_case.dart';
import '../../../domain/use_cases/delete_profile_image_use_case.dart';
import 'package:opi_se/features/home/data/models/get_profile_response.dart';
import 'package:opi_se/features/home/domain/use_cases/get_profile_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._getProfileUseCase,
    this._deleteProfileImageUseCase,
    this._uploadNationalIdUseCase,
  ) : super(ProfileInitial());

  final GetProfileUseCase _getProfileUseCase;
  final DeleteProfileImageUseCase _deleteProfileImageUseCase;
  final ChangeProfileImageUseCase _uploadNationalIdUseCase;

  Future<void> getProfile() async {
    emit(GetProfileLoading());
    final result = await _getProfileUseCase.call(userCache!.id!);
    result.fold(
      (failure) => emit(GetProfileFailure(failure)),
      (response) {
        updateUserCache(response);
        emit(GetProfileSuccess(response));
      },
    );
  }

  Future<void> deleteProfileImage() async {
    emit(DeleteProfileImageLoading());
    final result = await _deleteProfileImageUseCase.call();
    result.fold(
      (failure) => emit(DeleteProfileImageFailure(failure)),
      (response) async {
        await getProfile().then((value) {
          emit(DeleteProfileImageSuccess(response));
        });
      },
    );
  }

  final ImagePicker picker = ImagePicker();

  Future<XFile?> cropImage(XFile imageFile) async {
    final CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
      cropStyle: CropStyle.rectangle,
      sourcePath: imageFile.path,
      maxWidth: 1080,
      maxHeight: 1920,
      compressQuality: 100,
      compressFormat: ImageCompressFormat.png,
      aspectRatioPresets: [
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'OpiSe Cropper',
          toolbarColor: const Color(0xFF036666),
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.ratio16x9,
          hideBottomControls: false,
          showCropGrid: true,
        ),
        IOSUiSettings(
          title: 'OpiSe Cropper',
          resetButtonHidden: false,
          rotateButtonsHidden: false,
          cancelButtonTitle: 'Cancel',
          doneButtonTitle: 'Done',
          resetAspectRatioEnabled: true,
          showCancelConfirmationDialog: true,
        ),
      ],
    );

    if (croppedFile != null) {
      return XFile(croppedFile.path);
    }
    return null;
  }

  XFile? image;

  Future<void> getLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (!response.isEmpty) {
      final List<XFile>? files = response.files;
      if (files!.isNotEmpty) {
        image = files.first;
        return;
      }
    }
  }

  Future<void> pickImage() async {
    getLostData();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (pickedImage != null) {
      image = pickedImage;
      image = await cropImage(image!);
      if (image != null) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
        );
        await uploadProfileImage();
      }
    }
  }

  Future<void> takeImage() async {
    getLostData();
    final pickedImage = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
    );
    if (pickedImage != null) {
      image = pickedImage;
      image = await cropImage(image!);
      if (image != null) {
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
        );
        await uploadProfileImage();
      }
    }
  }

  Future<void> uploadProfileImage() async {
    emit(UploadProfileImageLoading());
    var result = await _uploadNationalIdUseCase.call(image!);
    result.fold((failure) => emit(UploadProfileImageFailure(failure)),
        (response) async {
      await getProfile().then((value) {
        emit(UploadProfileImageSuccess(response));
      });
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/errors/failure.dart';
import 'package:opi_se/core/utils/constants.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../../../../core/cache/hive_helper.dart';
import '../../../domain/use_cases/change_profile_image_use_case.dart';
import '../../../domain/use_cases/delete_profile_image_use_case.dart';
import '../../../../auth/domain/use_cases/get_user_profile_use_case.dart';
import '../../../../auth/data/models/login_models/login_response/user_skill.dart';
import '../../../../auth/data/models/user_profile_models/get_user_profile_response.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._getUserProfileUseCase,
    this._deleteProfileImageUseCase,
    this._uploadNationalIdUseCase,
  ) : super(ProfileInitial());

  final GetUserProfileUseCase _getUserProfileUseCase;
  final DeleteProfileImageUseCase _deleteProfileImageUseCase;
  final ChangeProfileImageUseCase _uploadNationalIdUseCase;

  final TextEditingController skillController = TextEditingController();

  int skillLevel = 1;

  final List<Skill> skills = userCache!.skills ?? [];

  bool sliderVisible = false;

  Future<void> getUserProfile() async {
    emit(GetProfileLoading());
    final result = await _getUserProfileUseCase.call();
    result.fold(
      (failure) => emit(GetProfileFailure(failure)),
      (response) async {
        await HiveHelper.refreshUserCache(response);
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
        userCache!.profileImage = 'default.png';
        await HiveHelper.updateUserCache(userCache!);
        emit(DeleteProfileImageSuccess());
      },
    );
  }

  final ImagePicker picker = ImagePicker();

  Future<XFile?> cropImage(XFile imageFile) async {
    final CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
      sourcePath: imageFile.path,
      maxWidth: 1080,
      maxHeight: 1920,
      compressQuality: 100,
      compressFormat: ImageCompressFormat.png,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
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
      userCache!.profileImage = response;
      HiveHelper.updateUserCache(userCache!);
      emit(UploadProfileImageSuccess());
    });
  }

  void addSkill() {
    Skill newSkill = Skill(
      skillName: skillController.text.trim(),
      skillRate: skillLevel,
    );

    bool containsSkill() {
      for (Skill s in skills) {
        if (s.skillName == newSkill.skillName) {
          return true;
        }
      }
      return false;
    }

    if (newSkill.skillName!.isNotEmpty && !containsSkill()) {
      skills.add(newSkill);
      skillController.clear();
      skillLevel = 1;
      sliderVisible = false;
      emit(EditSkillsChanged());
    }
  }

  void toggleSlider() {
    if (skillController.text.trim().isNotEmpty) {
      sliderVisible = true;
      emit(EditSliderVisibilityChanged());
    } else {
      sliderVisible = false;
      emit(EditSliderVisibilityChanged());
    }
  }

  void setSkillLevel(int value) {
    skillLevel = value;
    emit(EditSkillsChanged());
  }

  void removeSkill(Skill skill) {
    skills.remove(skill);
    sliderVisible = false;
    emit(EditSkillsChanged());
  }
}

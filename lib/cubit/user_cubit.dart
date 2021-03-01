import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ngefood/models/api_return_value.dart';
import 'package:ngefood/models/models.dart';
import 'package:ngefood/services/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    ApiReturnValue<UserModel> result =
        await UserServices.signIn(email, password);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }

  Future<void> signOut() async {
    ApiReturnValue<bool> result = await UserServices.signOut();

    if (result.value != null) {
      emit(UserInitial());
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }

  Future<void> signUp(UserModel user, String password,
      {File pictureFile}) async {
    ApiReturnValue<UserModel> result =
        await UserServices.signUp(user, password, profilePath: pictureFile);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }

  Future<void> uploadProfilePicture(File pictureFile) async {
    ApiReturnValue<String> result =
        await UserServices.uploadProfilePicture(pictureFile);

    if (result.value != null) {
      emit(UserLoaded((state as UserLoaded).user.copyWith(
          picturePath: "http://foodmarket-backend.buildwithangga.id/storage/" +
              result.value)));
    }
  }
}

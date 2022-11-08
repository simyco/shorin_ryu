import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../models/auth_error.dart';
import '../../../models/login_request.dart';
import '../../../utils/auth_error_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(LoginRequest request) async {
    emit(LoginLoading());
    try {
      // var token = await _r.login(request);
      //await Prefs.saveString(TOKENKEY, token);
      emit(LoginSuccess());
    } on DioError catch (e) {
      var err = AuthErrorHelper.extractLoginError(e);
      emit(LoginFailed(err));
    }
  }
}

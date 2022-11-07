import 'package:demo_cubit/dto/login_response_dto.dart';
import 'package:demo_cubit/service/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> login(String username, String password) async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      LoginResponseDto response = await LoginService.login(username, password);
      // Guardar el token y refresh
      emit(state.copyWith(
          loginSuccess: true,
          status: PageStatus.success,
          token: response.token,
          refreshToken: response.refresh));
    } on Exception catch (ex) {
      emit(state.copyWith(
          loginSuccess: false,
          status: PageStatus.failure,
          errorMessage: ex.toString(),
          exception: ex));
    }
  }
}

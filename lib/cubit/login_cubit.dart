import 'package:demo_cubit/cubit/page_status.dart';
import 'package:demo_cubit/dto/login_response_dto.dart';
import 'package:demo_cubit/service/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> login(String username, String password) async {
    final storage = FlutterSecureStorage();
    // Le digo al frontedn que estamos iniciando el proceso de login
    emit(state.copyWith(status: PageStatus.loading));
    try {
      // Como el móvil no sabe como validar el usario y el password, entonces
      // invoca al backend y para invocar el basckend lo realiza a travex
      // de una clase Service.
      LoginResponseDto response = await LoginService.login(username, password);
      // Si la autenticación fue exitosa Guardar el token y refresh
      await storage.write(key: "TOKEN", value: response.token);
      await storage.write(key: "REFRESH", value: response.refresh);
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

import 'package:demo_cubit/dto/login_response_dto.dart';
import 'package:demo_cubit/service/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppState {
  final bool isUserLoggedIn;
  final bool isLoading;
  final LoginResponseDto? loginResponseDto;

  AppState(
      {required this.isUserLoggedIn,
      required this.isLoading,
      this.loginResponseDto});
}

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState(isUserLoggedIn: false, isLoading: false));

  // Lógica de negocio para hacer el login contra backend
  void login(String username, String password) async {
    // emitir un evento para que la UI sepa que se está haciendo el login
    emit(AppState(isUserLoggedIn: false, isLoading: true));
    await Future.delayed(const Duration(seconds: 3));
    try {
      var loginResponseDto = await LoginService.login(username, password);
      // Si lo anterior salio bien enviamos un evento para que la UI sepa que el login fue exitoso
      emit(AppState(
          isUserLoggedIn: true,
          isLoading: false,
          loginResponseDto: loginResponseDto));
    } catch (error) {
      // Si lo anterior salio mal enviamos un evento para que la UI sepa que el login fue fallido
      emit(AppState(isUserLoggedIn: false, isLoading: false));
    }
  }

  // Lógica de negocio para hacer el logout
  void logout() {
    emit(AppState(isUserLoggedIn: false, isLoading: false));
  }
}

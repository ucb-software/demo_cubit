import 'package:demo_cubit/cubit/login_cubit.dart';
import 'package:demo_cubit/cubit/login_state.dart';
import 'package:demo_cubit/cubit/page_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext ctx1) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Login"),
          ),
          body: BlocConsumer<LoginCubit, LoginState>(
            // Escucho los eventos que llengan del Cubit
            listener: (ctx3, state) {
              // Si el cubit dice cargando, se muestra un Dialog
              if (state.status == PageStatus.loading) {
                _showDialog(context, "Autenticación",
                    "Verificando sus credenciales", false);
              } else if (state.status == PageStatus.success &&
                  state.loginSuccess) {
                // Si el cubit dice que la autenticación fue correcta,
                // se va a la pagian princial
                Navigator.pop(ctx3); // quito el dialog
                Navigator.pushNamed(ctx3, '/home');
              } else {
                // Si el cubit dice que hubo error se lo muestra.
                Navigator.pop(ctx3); // quito el dialog
                _showDialog(context, "Error", state.errorMessage!, true);
              }
            },
            // Construimos la pantalla
            builder: (context, state) => Center(child: formLogin(context)),
          )),
    );
  }

  // Se construye la pantalla de Login.
  Widget formLogin(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Login"),
        TextField(
          controller: _usernameController,
          decoration: const InputDecoration(
            hintText: "Username",
          ),
        ),
        TextField(
          controller: _passwordController,
          decoration: const InputDecoration(
            hintText: "Password",
          ),
        ),
        ElevatedButton(
            // Los eventos desde UI, se lo envial al CUTBIT
            onPressed: () {
              BlocProvider.of<LoginCubit>(context)
                  .login(_usernameController.text, _passwordController.text);
            },
            child: const Text("Login")),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: const Text("Create account"))
      ],
    );
  }

  Future<void> _showDialog(BuildContext context, String title, String message,
      bool closeable) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            closeable
                ? TextButton(
                    child: const Text('Cerrar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                : Container(),
          ],
        );
      },
    );
  }
}

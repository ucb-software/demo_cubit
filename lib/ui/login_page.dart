import 'package:demo_cubit/cubit/app_cubit.dart';
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
  Widget build(BuildContext context) {
    return Center(
        child: BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state.isLoading) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Espere mientras procesamos su solicitud")));
        }
      },
      builder: (context, state) {
        return formLogin();
      },
    ));
  }

  Widget formLogin() {
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
            onPressed: () {
              BlocProvider.of<AppCubit>(context)
                  .login(_usernameController.text, _passwordController.text);
            },
            child: const Text("Login"))
      ],
    );
  }
}

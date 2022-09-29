import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Creación de nueva cuenta"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Ingrese sus datos"),
            TextField(
              controller: _fullNameController,
              decoration: const InputDecoration(
                hintText: "Nombre completo",
              ),
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: "Nombre de usuario",
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: "Contraseña",
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  // BlocProvider.of<AppCubit>(context)
                  //     .login(_usernameController.text, _passwordController.text);
                },
                child: const Text("Crear cuenta"))
          ],
        ),
      ),
    );
  }
}

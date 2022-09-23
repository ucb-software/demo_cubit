import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/app_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedidos Ya!',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => AppCubit()),
        // BlocProvider(create: (context) => SingInCubit()),
        // BlocProvider(create: (context) => MakeOrderCubit()),
      ], child: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pedidos Ya!"),
        ),
        body: BlocBuilder<AppCubit, AppState>(
          builder: (BuildContext context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.isUserLoggedIn) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Bienvenido ${state.loginResponseDto!.firstName}"),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AppCubit>(context).logout();
                        },
                        child: const Text("Logout"))
                  ],
                ),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Login"),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AppCubit>(context)
                              .login("jperez", "123456");
                        },
                        child: const Text("Login"))
                  ],
                ),
              );
            }
          },
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

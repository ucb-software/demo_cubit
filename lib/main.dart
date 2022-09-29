import 'package:demo_cubit/ui/home_page.dart';
import 'package:demo_cubit/ui/login_page.dart';
import 'package:demo_cubit/ui/order_page.dart';
import 'package:demo_cubit/ui/register_page.dart';
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
    return BlocProvider(
        create: (context) => AppCubit(),
        child: MaterialApp(
          title: 'Pedidos Ya!',
          theme: ThemeData(
            // This is the theme of your application.
            primarySwatch: Colors.purple,
          ),
          initialRoute: "/",
          routes: {
            "/": (context) => const LoginPage(),
            "/home": (context) => const HomePage(),
            "/newOrder": (context) => const OrderPage(),
            "/register": (context) => const RegisterPage(),
          },
        ));
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("Pedidos Ya!"),
//         ),
//         body: BlocBuilder<AppCubit, AppState>(
//           builder: (BuildContext context, state) {
//             if (!state.isUserLoggedIn) {
//               return LoginPage();
//             } else if (state.isUserLoggedIn) {
//               return Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Bienvenido ${state.loginResponseDto!.firstName}"),
//                     ElevatedButton(
//                         onPressed: () {
//                           BlocProvider.of<AppCubit>(context).logout();
//                         },
//                         child: const Text("Logout"))
//                   ],
//                 ),
//               );
//             } else {
//               return const Center(child: Text("Error"));
//             }
//           },
//         ) // This trailing comma makes auto-formatting nicer for build methods.
//         );
//   }
// }

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu principal"),
      ),
      body: Center(
        child: // Build menu with icons
            Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/newOrder');
                },
                child: const Text("Nuevo Pedido")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pastOrders');
                },
                child: const Text("Pedidos anteriores")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/invoices');
                },
                child: const Text("Mis facturas")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Salir")),
          ],
        ),
      ),
    );
  }
}

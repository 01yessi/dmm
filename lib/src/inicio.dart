import 'package:flutter/material.dart';
import 'package:formulario/routes/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yessica Perez Reyes',
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      initialRoute: '/',
      routes: obtenerRutas(),
    );
  }
}

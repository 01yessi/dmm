import 'package:flutter/material.dart';
import 'package:formulario/pages/bienvenida2_pages.dart';
import 'package:formulario/pages/bienvenida_pages.dart';
import 'package:formulario/pages/registro_pages.dart';
import 'package:formulario/pages/sesion_pages.dart';

Map<String, WidgetBuilder> obtenerRutas() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => SesionPage(),
    'bienvenida': (BuildContext contex) => BienvenidaPage(),
    'registro': (BuildContext contex) => RegistroPage(),
    'bienvenida2': (BuildContext contex) => Bienvenida2Page()
  };
}

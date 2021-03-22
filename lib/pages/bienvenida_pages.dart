import 'package:flutter/material.dart';
//import 'package:formulario/pages/registro_pages.dart';
import 'package:formulario/pages/sesion_pages.dart';

class BienvenidaPage extends StatelessWidget {
  const BienvenidaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Argumentos parametros = ModalRoute.of(context).settings.arguments;
    TextStyle estilosTexto = TextStyle(
        fontSize: 25, color: Colors.indigo, fontWeight: FontWeight.bold);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bienvenido ${parametros.email}'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepOrangeAccent)),
                width: 300.0,
                child: Center(
                  child: Text(
                    'Correo: ${parametros.email}',
                    style: estilosTexto,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepOrangeAccent)),
                width: 300.0,
                child: Center(
                  child: Text(
                    'Contraseña: ${parametros.contra}',
                    style: estilosTexto,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.deepOrange,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

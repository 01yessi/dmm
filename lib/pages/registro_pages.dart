import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistroPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<RegistroPage> {
  FocusNode nombreFocus;
  FocusNode emailFocus;
  FocusNode contraFocus;

  String nombre;
  String email;
  String contra;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Registrate'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '¡Unete',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'a nosotros!',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Nombre y Apellido',
                      hintText: 'Ejemplo:Juan Perez',
                      prefixIcon: Icon(Icons.person)),
                  onSaved: (value) {
                    nombre = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Campo vacío';
                    } else {
                      return null;
                    }
                  },
                  focusNode: this.nombreFocus,
                  onEditingComplete: () => requestFocus(context, emailFocus),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Ejemplo:alguien@gmail.com',
                      prefixIcon: Icon(Icons.email_rounded)),
                  onSaved: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'campo vacio';
                    } else {
                      return null;
                    }
                  },
                  focusNode: this.emailFocus,
                  onEditingComplete: () => requestFocus(context, contraFocus),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Contraseña',
                        hintText: 'Ejemplo:mínimo 8 caracteres',
                        prefixIcon: Icon(Icons.lock)),
                    onSaved: (value) {
                      contra = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'campo vacio';
                      } else {
                        return null;
                      }
                    },
                    focusNode: this.contraFocus),
                SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  width: 250.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.amber, style: BorderStyle.solid),
                  ),
                  child: RaisedButton(
                      color: Colors.deepOrange,
                      textColor: Colors.white,
                      child: Text('Inicia Sesión'),
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();

                          Navigator.pushNamed(context, 'bienvenida2',
                              arguments: Argumentos(
                                  nombre: this.nombre,
                                  email: this.email,
                                  contra: this.contra));
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //METODO PARA EL FOCUS
  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

//INSTANSIAR A FOCUS
  @override
  void initState() {
    super.initState();
    nombreFocus = FocusNode();
    emailFocus = FocusNode();
    contraFocus = FocusNode();
  }

//ELIMINAR LA INSTANCIA DE FOCUS
  @override
  void dispose() {
    super.dispose();
    nombreFocus.dispose();
    emailFocus.dispose();
    contraFocus.dispose();
  }
}

class Argumentos {
  String nombre;
  String email;
  String contra;

  Argumentos({this.nombre, this.email, this.contra});
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import '../widgets/circle.dart';
import '../widgets/input_text.dart';

class RegistroPage extends StatefulWidget {
  RegistroPage({Key key}) : super(key: key);

  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {

  final _foreKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  _submit(){
    _foreKey.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap:(){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: <Widget>[
//------------------------------------Fondo decorativo-------------------------------------
              Positioned(
                right: -size.width*0.30,
                top: -size.width*0.34,
                child: Circle(
                  radius: size.width*0.50,
                  colors: [
                    Colors.blueGrey,
                    Colors.blueAccent
                  ],
                ),
              ),
              Positioned(
                left: -size.width*0.15,
                top: -size.width*0.34,
                child: Circle(
                  radius: size.width*0.35,
                  colors: [
                    Colors.blueGrey,
                    Colors.lightBlueAccent
                  ],
                ),
              ),
//------------------------------------CUERPO DE LOGIN-------------------------------------
              SingleChildScrollView(
                child: Container(
                  width: size.width,
                  height: size.height,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
//------------------------------------Foto y texto de login-------------------------------------
                        Column(
                          children: <Widget>[
                            Container(
                              width: 90,
                              height: 90,
                              margin: EdgeInsets.only(
                                top: size.width*0.4
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 25
                                  )
                                ]
                              ),
                            ),
                            SizedBox(height:30 ),
                            Text(
                              "Bienvenido. \n Inicie sesion por favor.",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                            )
                          ]
                        ),
//------------------------------------Cuerpo d inputs y buttons-------------------------------------
                        Column(
                          children: <Widget>[
//------------------------------------Inputs de corro y contrasena-------------------------------------
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 350,
                                minWidth: 350,
                              ),
                              child: Form(
                                key: _foreKey,
                                child: Column(
                                  children: <Widget>[
                                    InputText(
                                      label: "Nombre Completo",
                                      validator: (String text){
                                        if(RegExp(r'^[a-zA-Z0-9]+$').hasMatch(text)){
                                          return null;
                                        }
                                        return "Nombr de usuario Invalido";
                                      }
                                    ),
                                    SizedBox(height: 30),
                                    InputText(
                                      label: "Correo Electronico",
                                      inputType: TextInputType.emailAddress,
                                      validator: (String text){
                                        if(text.contains("@")){
                                          return null;
                                        }
                                        return "Correo Invalido";
                                      }
                                    ),
                                    SizedBox(height: 30),
                                    InputText(
                                      label: "Contraseña",
                                      isSecure: true,
                                      validator: (String text){
                                        if(text.isNotEmpty && text.length>5){
                                          return null;
                                        }
                                        return "Contraseña Invalida";
                                      }
                                    )
                                  ],
                                ),
                              )
                            ),
                            SizedBox(height: 50),
//------------------------------------Button de inicio de sesion-------------------------------------
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 350,
                                minWidth: 350,
                              ),
                              child: CupertinoButton(
                                padding: EdgeInsets.symmetric(vertical: 17),
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(10),
                                onPressed: ()=>_submit(),
                                child: Text(
                                  "Reegistrar",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
//------------------------------------Pie de Login para registro de usuarios-------------------------------------
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Esta listo tu registro?",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                                CupertinoButton(
                                  onPressed: ()=>Navigator.pop(context),
                                  child: Text(
                                    "Iniciar sesion aqui",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blueAccent
                                    )
                                  ),
                                )
                              ]
                            ),
                            SizedBox(height: size.height*0.05)
//---------------------------------------------------------------------------------------------------------------
                          ]
                        )
                      ],
                    ),
                  ),
                )
              ),
//------------------------------------Button para ir para atras-------------------------------------
              Positioned(
                left: 15,
                top: 5,
                child: SafeArea(
                  child: CupertinoButton(
                    padding: EdgeInsets.all(10),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black26,
                    onPressed: ()=>Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white
                    ),
                  )
                )
              )
            ],
          ),
        ),
      )
    );
  }
}
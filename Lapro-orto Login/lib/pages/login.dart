import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import '../widgets/circle.dart';
import '../widgets/input_text.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
                                image: DecorationImage(
                                  image: AssetImage('images/Lapro-orto_fonfo.png'),
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
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
                                      label: "Correo Electronico",
                                      inputType: TextInputType.emailAddress,
                                      validator: (String text){
                                        if(text.contains("@")){
                                          return null;
                                        }
                                        return "Correo Invalido";
                                      }
                                    ),
                                    SizedBox(height: 40),
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
                                  "Iniciar sesion",
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
                                  "Eres nuevo?",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                                CupertinoButton(
                                  onPressed: ()=>Navigator.pushNamed(context, "Registro"),
                                  child: Text(
                                    "Registrate aqui",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.blueAccent
                                    )
                                  ),
                                )
                              ]
                            ),
                            SizedBox(height: size.height*0.08)
//---------------------------------------------------------------------------------------------------------------
                          ]
                        )
                      ],
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      )
    );
  }
}
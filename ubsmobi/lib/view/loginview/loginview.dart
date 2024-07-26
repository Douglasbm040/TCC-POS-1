import 'package:flutter/material.dart';
import 'package:ubsmobi/models/usuario_model.dart';
import 'package:ubsmobi/repository/pacient_repository.dart';

import '../../models/paciente_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue[200],

      ///Color(0xffEDEEF0), // Colors.blue[200],
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: height * 0.5,
            width: width * 0.5,
            child: /*Stack(
              children: [
                Positioned(
                  top: 100,
                  left: 30,
                  child: CircleAvatar(
                    radius: 100.0,
                    backgroundColor: Colors.blue[200],
                  ),
                ),
                Positioned(
                  top: 300,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[900],
                    radius: 35,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 30,
                  child: CircleAvatar(
                    radius: 90.0,
                    backgroundColor: Colors.grey[400],
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.grey[100],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: width,
                    height: height * 0.13,
                    color: Colors.white,
                  ),
                ),*/
                Image.asset(
              "assets/images/3d-business-female-doctor-and-male-doctor-standing-together (1).png",
            ),
            //],
            //),
          ),
          Container(
            width: width,
            height: height * .06,
            child: Column(
              children: [
                Text("Bem vindo👋"),
                Text("ao UBS MOBI"),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.4,
            child: Column(
              children: [
                Container(
                  width: width * 0.85,
                  height: 60,
                  child: TextField(
                    controller: email,
                    cursorColor: Colors.grey,
                    cursorRadius: Radius.circular(20),
                    cursorWidth: 1.5,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[900],
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white, //const Color(0xffEEF5FB),
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[900], //Color(0xff7165E3),
                      ),
                      hintText: "Email",
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      )),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(
                              238, 238, 238, 1), //Color(0xff7165E3),
                        ), // Cor da borda quando desabilitado
                      ),
                      floatingLabelStyle: TextStyle(
                        fontSize: 17,
                        color: Colors.grey[900], //Color(0xff7165E3),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(
                              224, 224, 224, 1), //Color(0xff7165E3),
                        ), // Cor da borda quando em foco
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Icon(
                            Icons.person_2,
                            size: 25.0,
                            color: Colors.grey[100],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: width * 0.85,
                  height: 60,
                  child: TextField(
                    controller: senha,
                    cursorColor: Colors.grey,
                    cursorRadius: Radius.circular(20),
                    cursorWidth: 1.5,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[900],
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white, //const Color(0xffEEF5FB),
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[900], //Color(0xff7165E3),
                      ),
                      hintText: "Senha",
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      )),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(
                              238, 238, 238, 1), //Color(0xff7165E3),
                        ), // Cor da borda quando desabilitado
                      ),
                      floatingLabelStyle: TextStyle(
                        fontSize: 17,
                        color: Colors.grey[900], //Color(0xff7165E3),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(
                              224, 224, 224, 1), //Color(0xff7165E3),
                        ), // Cor da borda quando em foco
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Icon(
                            Icons.remove_red_eye,
                            size: 25.0,
                            color: Colors.grey[100],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                    width: width * 0.85,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            backgroundColor: Colors.grey[900]),
                        onPressed: () async {
                          print("Entrar");
                          UsuarioModel? login = await PacientRepository()
                              .login(email.text, senha.text);
                          print(login);
                          if (login == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Não foi encontrado este email ou senha'),
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.black,
                              ),
                            );
                          } else if (login != null) {
                            Navigator.of(context)
                                .pushNamed('/consulta', arguments: login);
                          }
                        },
                        child: Text(
                          "Entrar",
                          style: TextStyle(color: Colors.white),
                        ))),
                SizedBox(height: 10),
                Text("Esqueci minha senha",
                    style: TextStyle(
                        color: Colors.grey[100], fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Container(
                    width: width * 0.85,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: const Color.fromRGBO(33, 33, 33, 1)),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            backgroundColor: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/cadastro');
                        },
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(color: Colors.grey[900]),
                        ))),
              ],
            ),
          ),
        ],
      ))),
    );
  }
}

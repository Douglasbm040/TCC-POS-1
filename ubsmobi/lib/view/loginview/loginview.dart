import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                Image.network(
                    "https://ouch-cdn2.icons8.com/7BP_cWsTdlks4DlfR09o1E7-TQpi6GwUZNv0k3evfto/rs:fit:274:456/extend:false/wm:1:re:0:0:0.8/wmid:ouch/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvMTQv/MGFjNzM2ZjgtMjc2/NS00NGFkLTlhMmQt/YjA3N2ExNWJlZjNj/LnBuZw.png"),
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
                      hintText: "Nome...",
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
                      hintText: "Senha...",
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
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            backgroundColor: Colors.grey[900]),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/consulta');
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
                    height: 60,
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

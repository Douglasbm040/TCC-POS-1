import 'package:flutter/material.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  State<CadastroView> createState() => CadastroViewState();
}

class CadastroViewState extends State<CadastroView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              height: height * 0.3,
              width: width * 0.5,
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.grey[100],
                      child: CircleAvatar(
                          radius: 98,
                          backgroundColor: Colors.grey[100],
                          /*  backgroundImage: NetworkImage(
                          "https://ouch-cdn2.icons8.com/KmrTJKlmnHYBtx2gP2YOJOjB7o5hZCaX479hFBuZJM8/rs:fit:415:456/extend:false/wm:1:re:0:0:0.8/wmid:ouch/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvNjI4/LzUzN2ZhNTM2LTgz/Y2QtNDBmZC1iMjRi/LWEyMDFkNmVlOTVl/Yi5wbmc.png",
                        ),*/
                          child: SizedBox(
                            height: 190,
                            child: Image.network(
                              "https://ouch-cdn2.icons8.com/KmrTJKlmnHYBtx2gP2YOJOjB7o5hZCaX479hFBuZJM8/rs:fit:415:456/extend:false/wm:1:re:0:0:0.8/wmid:ouch/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvNjI4/LzUzN2ZhNTM2LTgz/Y2QtNDBmZC1iMjRi/LWEyMDFkNmVlOTVl/Yi5wbmc.png",
                            ),
                          )),
                    ),
                  ),
                  Positioned(
                      bottom: 30,
                      right: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        radius: 30,
                        child: CircleAvatar(
                            backgroundColor: Colors.grey[900],
                            radius: 28,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.photo_camera_rounded,
                                  color: Colors.grey[100],
                                ))),
                      )),
                ],
              )),
          Container(
            width: width,
            height: height * .01,
          ),
          SizedBox(
            height: height * 0.6,
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
                      hintText: "Nome completo",
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
                      hintText: "Numero do sus",
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
                            Icons.medical_information,
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
                      hintText: "Confirme a senha",
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
                SizedBox(height: 40),
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
                        onPressed: () {},
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(color: Colors.white),
                        ))),
                SizedBox(height: 10),
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
                          Navigator.of(context).pushNamed('/');
                        },
                        child: Text(
                          "Entrar",
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

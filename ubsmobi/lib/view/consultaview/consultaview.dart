import 'package:flutter/material.dart';
import 'package:ubsmobi/models/consulta_model.dart';
import 'package:ubsmobi/models/especilista_model.dart';
import 'package:ubsmobi/models/paciente_model.dart';
import 'package:ubsmobi/repository/consulta_repository.dart';
import 'package:ubsmobi/repository/pacient_repository.dart';

import '../../repository/especlista_repository.dart';
import 'components/calendario.dart';

class ConsultaView extends StatefulWidget {
  const ConsultaView();

  @override
  State<ConsultaView> createState() => _ConsultaViewState();
}

class _ConsultaViewState extends State<ConsultaView> {
  final PacientRepository pacientRequest = PacientRepository();
  final ConsultaRepository consultaResquet = ConsultaRepository();
  final EspecialistaRepository especialistaRequest = EspecialistaRepository();
  List<ConsultaModel> consultas = [];
  List<EspecialistaModel> especialistas = [];

  void getconsultasList() async {
    final listconsultas = await consultaResquet.getConsultas();
    setState(() {
      consultas = listconsultas;
    });
  }

  void getEspecialistaList() async {
    final listespecialistas = await especialistaRequest.getEspecialistas();
    setState(() {
      especialistas = listespecialistas;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getconsultasList();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: const Color(0xffEDEEF0), //.//fromARGB(255, 236, 238, 241),

            ///EDEEF0), //0xFFE1E3E6
            child: Column(
              children: <Widget>[
                FutureBuilder<PacienteModel>(
                    future: pacientRequest.getPacient(),
                    builder: (context, snapshot) {
                      final pacient = snapshot.data;
                      return Container(
                        decoration: BoxDecoration(
                          color:
                              Colors.blue[200], //.fromRGBO(205, 210, 246, 1),
                          /*borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(30.0),
                            )*/
                        ),
                        height: height * 0.25,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: CircleAvatar(
                                      radius: 36,
                                      backgroundColor: Colors.grey[100],
                                      child: CircleAvatar(
                                        backgroundColor: Colors
                                            .grey[900], //Color(0xFF90ACFF),
                                        radius: 32,
                                        child: Icon(
                                          Icons.person,
                                          size: 50.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '👋 Olá ${pacient == null ? " " : pacient.nome}',
                                          style: TextStyle(
                                              color: Colors.grey[900],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          'N SUS: ${pacient == null ? " " : pacient.nsus} UBS.:Guararema',
                                          style: TextStyle(
                                              color: Colors.grey[900],
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: CircleAvatar(
                                      radius: 24,
                                      backgroundColor: Colors.grey[300],
                                      child: CircleAvatar(
                                        radius: 22,
                                        backgroundColor: Colors.grey[100],
                                        child: Icon(Icons.menu,
                                            color: Colors.grey[900], size: 30),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    //color: Colors.amber,
                                    width: width * 0.85,
                                    height: 50,
                                    child: Center(
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
                                          fillColor: Colors
                                              .white, //const Color(0xffEEF5FB),
                                          labelStyle: TextStyle(
                                            fontSize: 15,
                                            color: Colors
                                                .grey[900], //Color(0xff7165E3),
                                          ),
                                          hintText:
                                              "Pesquisar por especialista",
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                            Radius.circular(15.0),
                                          )),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15.0),
                                            ),
                                            borderSide: BorderSide(
                                              color: Color.fromRGBO(238, 238,
                                                  238, 1), //Color(0xff7165E3),
                                            ), // Cor da borda quando desabilitado
                                          ),
                                          floatingLabelStyle: TextStyle(
                                            fontSize: 17,
                                            color: Colors
                                                .grey[900], //Color(0xff7165E3),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15.0),
                                            ),
                                            borderSide: BorderSide(
                                              color: Color.fromRGBO(224, 224,
                                                  224, 1), //Color(0xff7165E3),
                                            ), // Cor da borda quando em foco
                                          ),
                                          suffixIcon: Icon(
                                            Icons.search,
                                            size: 30.0,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Consultas Marcadas",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width * 0.95,
                  height: height * 0.2,
                  child: ListView.builder(
                      itemCount: consultas.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: width * 0.6,
                            height: height * 0.07,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 100,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Color(0xffEEF5FB),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Center(
                                      child: Text(
                                        " ${DateTime.parse(consultas[index].data_marcada).day}\nTER ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey[900],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Column(
                                    children: [
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "Consulta",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                          "${consultas[index].especialidade}:${consultas[index].especialista}"),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.redAccent),
                                          onPressed: () async {
                                            await consultaResquet
                                                .deleteConsulta(
                                                    consultas[index]
                                                        .idespecialista
                                                        .toString(),
                                                    "5",
                                                    consultas[index]
                                                        .data_marcada);
                                            getconsultasList();
                                          },
                                          child: const Text(
                                            "cancelar",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                WeekDaysComponent(getconsultasList: getconsultasList),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ubsmobi/models/consulta_model.dart';
import 'package:ubsmobi/models/especilista_model.dart';
import 'package:ubsmobi/models/paciente_model.dart';
import 'package:ubsmobi/repository/consulta_repository.dart';
import 'package:ubsmobi/repository/pacient_repository.dart';

import '../../repository/especlista_repository.dart';
import 'components/calendario.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          child: Column(
            children: <Widget>[
              FutureBuilder<PacienteModel>(
                  future: pacientRequest.getPacient(),
                  builder: (context, snapshot) {
                    final pacient = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: CircleAvatar(
                              radius: 32,
                              // backgroundColor: Colors.blueAccent,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                radius: 28,
                                child: Icon(
                                  Icons.person,
                                  size: 50.0,
                                  color: Colors.blueAccent[300],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Paciente: ${pacient == null ? " " : pacient.nome}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                                Text(
                                  'N SUS: ${pacient == null ? " " : pacient.nsus} UBS.:Guararema',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13.0),
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: Icon(Icons.menu, size: 30.0)),
                        ],
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: width * 0.9,
                  child: const TextField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 16.0),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        )),
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Pesquisar por profissionais',
                        hintStyle: TextStyle(fontSize: 16.0),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                        child: Card(
                          elevation: 3,
                          child: Container(
                            width: width * 0.5,
                            height: height * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.purple[100],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                    "${consultas[index].especialidade}:${consultas[index].especialista} \nData:${consultas[index].data_marcada}"),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent),
                                    onPressed: () async {
                                      await consultaResquet.deleteConsulta(
                                          consultas[index]
                                              .idespecialista
                                              .toString(),
                                          "5",
                                          consultas[index].data_marcada);
                                      getconsultasList();
                                    },
                                    child: Text(
                                      "cancelar",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ],
                            ),
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
    );
  }
}

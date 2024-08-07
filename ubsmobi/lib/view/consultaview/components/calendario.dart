import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ubsmobi/repository/consulta_repository.dart';

import '../../../models/consulta_model.dart';
import '../../../models/especilista_model.dart';
import '../../../repository/especlista_repository.dart';

class WeekDaysComponent extends StatefulWidget {
  WeekDaysComponent(
      {super.key,
      required this.idPaciente,
      required this.getconsultasList,
      required this.height,
      required this.width});
  double height;
  double width;
  String idPaciente;

  @override
  State<WeekDaysComponent> createState() => _WeekDaysComponentState();
  final Function getconsultasList;
}

class _WeekDaysComponentState extends State<WeekDaysComponent> {
  int selectedIndex = 0; // Índice do dia selecionado

  final EspecialistaRepository especialistaRequest = EspecialistaRepository();
  final ConsultaRepository consultaResquet = ConsultaRepository();
  List<EspecialistaModel> especialistas = [];
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
    getEspecialistaList();
  }

  bool isFinalWeek() {
    if (dayclicked.weekday == DateTime.saturday ||
        dayclicked.weekday == DateTime.sunday) {
      return true;
    } else {
      return false;
    }
  }

  DateTime dayclicked = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: Text(
            'Consultas Disponíveis',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: _buildWeekDays(),
        ),
        Card(
          child: Container(
            width: widget.width,
            height: widget.height * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffF6F7FB),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: isFinalWeek()
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month_rounded,
                            size: 50, color: Colors.red),
                        SizedBox(height: 10),
                        Text(
                          "Sem consultas disponíveis para",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "o dia selecionado.",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: especialistas.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffEEF5FB),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ListTile(
                              title: Text(
                                '${especialistas[index].especialidade} - ${especialistas[index].nome}\nVagas Disponíveis',
                                style: TextStyle(
                                    color: Colors.grey[900],
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: const Text(
                                '08:00 - 18:00',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                              ),
                              trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[900],
                                ),
                                onPressed: () async {
                                  DateFormat dateFormat =
                                      DateFormat('yyyy-MM-dd');
                                  print(especialistas[0].nome);
                                  print(dayclicked);
                                  if (dayclicked.weekday != DateTime.saturday &&
                                      dayclicked.weekday != DateTime.sunday) {
                                    List<ConsultaModel> consultas =
                                        await consultaResquet.getConsultas(
                                            int.parse(widget.idPaciente));
                                    int consultasagendada = consultas
                                        .where((element) =>
                                            element.data_marcada.day ==
                                                dayclicked.day &&
                                            element.data_marcada.month ==
                                                dayclicked.month &&
                                            element.data_marcada.year ==
                                                dayclicked.year)
                                        .toList()
                                        .length;

                                    if (consultas.length < 2 &&
                                        consultasagendada == 0) {
                                      await consultaResquet.postConsultDay({
                                        'esp': especialistas[index]
                                            .idEspecialista
                                            .toString(),
                                        'date': dateFormat
                                            .format(dayclicked)
                                            .toString(),
                                        "pac_des_nome":
                                            widget.idPaciente.toString(),
                                      });
                                      widget.getconsultasList();
                                    } else if (consultas.length == 2) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Você pode agendar no máximo 2 consultas'),
                                          duration: Duration(seconds: 2),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    } else if (consultasagendada != 0) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Você já agendou uma consulta para este dia'),
                                          duration: Duration(seconds: 2),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Não pode agendar uma consulta no fim de semana'),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.black,
                                      ),
                                    );
                                  }
                                },
                                child: const Text(
                                  'AGENDAR',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildWeekDays() {
    List<Widget> weekDayWidgets = [];
    DateTime now = DateTime.now();

    for (int i = 0; i < 5; i++) {
      DateTime day = now.add(Duration(days: i));
      weekDayWidgets.add(
        WeekComponent(
          day: day,
          isSelected: i == selectedIndex, // Define se o dia está selecionado
          onTap: () {
            setState(() {
              selectedIndex = i; // Atualiza o índice do dia selecionado
              dayclicked = day;
            });
          },
        ),
      );
    }

    return weekDayWidgets;
  }
}

class WeekComponent extends StatelessWidget {
  final DateTime day;
  final bool isSelected;
  final VoidCallback onTap;
  List<String> diaSemana = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"];

  WeekComponent({
    required this.day,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            diaSemana[day.weekday - 1],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              backgroundColor: isSelected ? Colors.grey[900] : Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  DateFormat('dd').format(day),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

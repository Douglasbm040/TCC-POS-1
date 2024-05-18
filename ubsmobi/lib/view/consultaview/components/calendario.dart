import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ubsmobi/repository/consulta_repository.dart';

import '../../../models/especilista_model.dart';
import '../../../repository/especlista_repository.dart';

class WeekDaysComponent extends StatefulWidget {
  const WeekDaysComponent({super.key, required this.getconsultasList});

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

  DateTime dayclicked = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: Text(
            'Consultas Disponíveis',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: _buildWeekDays(),
        ),
        Card(
          child: Container(
            width: 400,
            height: 270,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.purple[100],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: especialistas.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          '${especialistas[index].especialidade} - ${especialistas[index].nome}\nVagas Disponíveis',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '08:00 - 18:00',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey[800]),
                        ),
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple[300],
                          ),
                          onPressed: () async {
                            DateFormat dateFormat = DateFormat('yyyy-MM-dd');
                            print(especialistas[0].nome);
                            print(dayclicked);
                            if (dayclicked.weekday != DateTime.saturday &&
                                dayclicked.weekday != DateTime.sunday) {
                              await consultaResquet.postConsultDay({
                                'esp': especialistas[index]
                                    .idEspecialista
                                    .toString(),
                                'date':
                                    dateFormat.format(dayclicked).toString(),
                                "pac_des_nome": "5",
                              });
                              widget.getconsultasList();
                            }
                          },
                          child: Text(
                            'AGENDAR',
                            style: TextStyle(color: Colors.white),
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
            DateFormat('E').format(day),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              backgroundColor:
                  isSelected ? Colors.purple[300] : Colors.grey[100],
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

import 'package:flutter/material.dart';
import 'package:ubsmobi/view/consultaview/consultaview.dart';
import 'package:ubsmobi/view/loginview/loginview.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // Defina a cor da borda padrão para transparente
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
          ),
        ),
        useMaterial3: true,
      ),
      home: LoginView(), //const ConsultaView(),
    );
  }
}

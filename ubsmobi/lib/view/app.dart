import 'package:flutter/material.dart';
import 'package:ubsmobi/view/consultaview/consultaview.dart';
import 'package:ubsmobi/view/loginview/loginview.dart';
import 'package:ubsmobi/view/cadastroview/cadastroview.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        dialogBackgroundColor: Colors.white,

        // Defina a cor da borda padrão para transparente
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.amber),
          ),
        ),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/consulta": (context) => const ConsultaView(),
        "/": (context) => const LoginView(),
        "/cadastro": (context) => const CadastroView(),
      },
    );
  }
}

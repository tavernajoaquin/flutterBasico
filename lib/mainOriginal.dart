import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:prueba/homePage.dart';
import 'package:prueba/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //habilita algunas cosas de contexto y pone la bandita de debug en la esquina
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RootPage(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}

//StatefulWidget se usa cuando se necesitan acciones
class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  //declaracion de variables
  int currentPage = 0;
  List<Widget> pages = const [
    HomePage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    //Scaffold digamos q es el html
    return Scaffold(
      appBar: AppBar(
        title: const Text('Titulo de la aplicación'),
      ),
      body: pages[currentPage],
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // (){} funcion vacia
            debugPrint(
                'Floating Action Button'); //debugPrint imprime en consola
          },
          child: Icon(Icons.waving_hand)),
      bottomNavigationBar: NavigationBar( //Barra de navegacion
        destinations: const [ //Necesita un array de destinaciones
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile')
        ],
        onDestinationSelected: (int index) { //funcion que actualiza la variable usada como indice
          setState(() { //cambiar estado, como en react. (POrque son tan parecidos???)
            currentPage = index;
          });
          debugPrint(
              'currentPage: $currentPage');

        },
        selectedIndex: currentPage,
      ),
    );
  }
}

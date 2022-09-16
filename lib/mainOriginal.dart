
import 'package:flutter/material.dart';
import 'package:prueba/homePage.dart';
import 'package:prueba/profile_page.dart';
import 'package:prueba/login.dart';
import 'package:prueba/LearnFlutterPage.dart';


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
    ProfilePage(),
    LearnFlutterPage(),
    LoginWidget(),

  ];


  @override
  Widget build(BuildContext context) {
    //Scaffold digamos q es el html
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  [
            const DrawerHeader(
                child: Text("Aplicacion de kiosco"),

            ),

            ListTile(
                title: const Text("Home"),
                onTap: () {
                  setState(() {
                    currentPage = 0;
                  });
                  debugPrint(
                'currentPage: $currentPage');
                  Navigator.pop(context); //Cierra el Drawer cuando termina el onTap
                }),
            ListTile(title: const Text("Listado"), onTap: () {
              setState(() {
                currentPage = 1;
              });
              debugPrint(
                  'currentPage: $currentPage');
              Navigator.pop(context);
            }),
            ListTile(title: const Text("Aprender Flutter"), onTap: () {
              setState(() {
                currentPage = 2;
              });
              debugPrint(
                  'currentPage: $currentPage');
              Navigator.pop(context);
            }),
            const Divider(),
            ListTile(title: const Text("Log in"), onTap: () {
              setState(() {
                currentPage = 3;
              });
              debugPrint(
                  'currentPage: $currentPage');
              Navigator.pop(context);
            }),
            ListTile(title: const Text("Camara"), onTap: () {

            }),
            ListTile(title: const Text("Menu 6"), onTap: () => null),
            ListTile(title: const Text("Menu 7"), onTap: () => null),
            const Divider(),
            ListTile(title: const Text("Menu 8"), onTap: () => null),
          ],
        ),
      ),
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
          child: const Icon(Icons.waving_hand)),
      /*
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
      ),*/
    );
  }
}

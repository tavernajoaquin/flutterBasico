

import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({Key? key}) : super(key: key);

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isSwitch = false;  //solo puede ser verdadero o falso
  bool? isChecked = false; //solo puede ser verdadero o falso o null
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aprende Flutter'),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(); //pop borra la pagian que estaba
            },
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [IconButton(onPressed: (){debugPrint('Info');}, icon: Icon(Icons.info_outline))],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset('ímage/perrito.jpg',),
          const SizedBox(height: 10,),
          const Divider(
            color: Colors.black,
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(10.0),
            color: Colors.indigoAccent,
            width: double.infinity,
            child: const Center(
              child: Text(
                'Widged de texto',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: isSwitch ? Colors.blue : Colors.red
            ),
              onPressed: () {
                debugPrint('Boton Eleveado');
              },
              child: const Text('Boton Eleveado')),
          OutlinedButton(
              onPressed: () {
                debugPrint('Outlined Button');
              },
              child: const Text('Outlined Button')),
          TextButton(
              onPressed: () {
                debugPrint('Text Button');
              },
              child: const Text('Text Button')),
          GestureDetector(
            behavior: HitTestBehavior.opaque, //Tengo q ver este
            onTap: () {
              //evento "onCLick"
              debugPrint('esta es la fila');
            },
            child: Row(
              //Fila de cosas
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.local_fire_department, color: Colors.blue),
                Text('Text Button'),
                Icon(
                  Icons.local_fire_department,
                  color: Colors.amberAccent,
                ),
              ],
            ),
          ),
          Switch(
              value: isSwitch,
              onChanged: (bool booleano) {
                setState(() {
                  isSwitch = booleano;
                });
              }),
          Checkbox(value: isChecked, onChanged: (bool? booleano) {
            setState(() {
              isChecked = booleano;
            });
          }),
          Image.network('https://www.dogalize.com/wp-content/uploads/2017/06/La-sverminazione-e-la-pulizia-del-cucciolo-del-cane-2-800x400-800x400.jpg')
        ]),
      ),
    );
  }
}

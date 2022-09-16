import 'package:flutter/material.dart';

const int itemCount = 20;

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
      return  ListTile(
        title: Text('Item ${(index + 1)}'),
        leading: Icon(Icons.person),
        trailing: Icon(Icons.add_circle),
        onTap: (){
          debugPrint('Item ${(index + 1)}');
        },
      );
    });
  }
}

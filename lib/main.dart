import 'package:flutter/material.dart';
import '/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<User> _persons = [
    User("Avidan", "Garcia Castillo", "664-584-6690"),
    User("Jennifer", "Cruz Cruz", "664-803-4399"),
    User("Genesis", "Garcia Cruz", "616-166-3558"),
    User("Irleth", "Garcia Cruz", "616-123-0801"),
    User("Camila", "Garcia Cruz", "616-166-2459")
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: ListView.builder(
              itemCount: _persons.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onLongPress: () {
                    _deleteUser(context, _persons[index]);
                  },
                  title: Text(
                      _persons[index].name + ' ' + _persons[index].lastname),
                  subtitle: Text(_persons[index].phone),
                  leading: CircleAvatar(
                    child: Text(_persons[index].name.substring(0, 1)),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              })),
    );
  }

  _deleteUser(context, User person) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar Contacto"),
              content: Text("Estas Seguro de eliminar a " + person.name + " ?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancelar")),
                TextButton(
                    onPressed: () {
                      this.setState(() {
                        this._persons.remove(person);
                      });
                      Navigator.pop(context);
                    },
                    child: Text("Eliminar"))
              ],
            ));
  }
}

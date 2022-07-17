import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'cards.dart';
import 'engine/remainder.dart';
import 'engine/user.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key) {}

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserClass user = UserClass(1, 'prathis', 'xyz@gmail.com', 'ist', 'en');
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController date = TextEditingController();
  late DateTime _dateTime;

  // List<User> userList = [
  //   User(111, 'prathis', 'xyz@gmail.com', DateTime.now, 'Eng')
  // ];

  // addUser(int id, String name, String email, DateTime date, String language) {
  //   userList.add(User(id, name, email, date, language));
  // }

  @override
  Widget build(BuildContext context) {
    //print(Guid.newGuid);
    return Scaffold(
        appBar: AppBar(
          title: Text('Remaindee'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(244, 67, 54, 1),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: Column(
                        children: [
                          Container(
                            child: Text('Add Remainder'),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Name',
                            ),
                            controller: name,
                            style: TextStyle(color: Colors.white),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Description',
                            ),
                            controller: description,
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Text(_dateTime == null
                              //     ? 'No date Choosen!'
                              //     : _dateTime.toString()),
                              SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                onPressed: () {
                                  DatePicker.showDateTimePicker(context,
                                      showTitleActions: true,
                                      onChanged: (date) {
                                    // print('change $date in time zone ' +
                                    //     date.timeZoneOffsetnHours.toString());
                                  }, onConfirm: (date) {
                                    // print('confirm $date');
                                    _dateTime = date;
                                  },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.en);
                                },
                                child: Text(
                                  'Select Date Time',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('No'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {});
                            // addUser(111, 'prathis', 'kdfk', DateTime.now(),
                            //     'language');
                            user.remainders.add(
                              Remainder(
                                  1, name.text, description.text, _dateTime),
                            );
                            Navigator.pop(context);
                            // print(user.remainders[0].time);
                          },
                          child: const Text('Yes'),
                        ),
                      ],
                      elevation: 24.0,
                      backgroundColor: Colors.grey,
                    ));
          },
          backgroundColor: Colors.red,
          child: Icon(Icons.add),
        ),
        body: Column(
          children: user.remainders
              .map((remainder) => Cards(
                    remainder: remainder,
                    deleteFunction: () {
                      setState(() {
                        user.remainders.remove(remainder);
                      });
                    },
                  ))
              .toList(),
        ));
  }
}

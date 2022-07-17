import 'package:flutter/material.dart';
import 'engine/remainder.dart';

class Cards extends StatelessWidget {
  final Remainder remainder;
  final deleteFunction;
  Cards({required this.remainder, required this.deleteFunction});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(remainder.remainderName.toString()),
        subtitle: Text(remainder.time.toString()),
        leading: IconButton(
          onPressed: () {
            print('hi');
          },
          icon: Icon(
            Icons.star_border,
            color: Colors.grey,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text(
                  'Are you sure?',
                  style: TextStyle(color: Colors.white),
                ),
                content: const Text(
                  'Do you want to delete?',
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('No'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () {
                      deleteFunction();
                      Navigator.pop(context);
                    },
                    child: const Text('Yes'),
                  ),
                ],
                elevation: 24.0,
                backgroundColor: Colors.red,
              ),
            );
          },
          icon: Icon(Icons.delete, color: Colors.red),
        ),
      ),
    );
  }
}

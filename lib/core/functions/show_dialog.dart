import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showAlertDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
            title: const Text('Cupertino Alert Dialog'),
            content: const Text('Do you really want to delete?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    //action code for "Yes" button
                  },
                  child: const Text('Yes')),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); //close Dialog
                },
                child: const Text('Close'),
              )
            ]);
      });
}

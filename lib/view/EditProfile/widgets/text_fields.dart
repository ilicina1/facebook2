import 'package:flutter/material.dart';

Widget textFields(BuildContext context) {
  var _controllerName = TextEditingController();
  return Column(
    children: [
      Container(
        width: 300,
        child: TextField(
            enabled: false,
            controller: _controllerName = TextEditingController(),
            decoration: InputDecoration(
              hintText: "Ime i prezime",
              suffixIcon: IconButton(
                onPressed: () => _controllerName.clear(),
                icon: Icon(Icons.edit),
              ),
            )),
      ),
      Container(
        width: 300,
        child: TextField(
            enabled: false,
            controller: _controllerName = TextEditingController(),
            decoration: InputDecoration(
              hintText: "Opis profila",
              suffixIcon: IconButton(
                onPressed: () => _controllerName.clear(),
                icon: Icon(Icons.edit),
              ),
            )),
      )
    ],
  );
}

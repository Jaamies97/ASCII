import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'getdictionary.dart';

class asciihome extends StatefulWidget {

  @override
  _asciihomeState createState() => _asciihomeState();
}

class _asciihomeState extends State<asciihome> {
  String url = '';
  var dictionary;
  String sum = '';
  late Map alphabet;

  int i = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextField(
          onChanged: (value){
            url = "http://127.0.0.1:5000/axel?query=" + value.toString();
          },
        ),
        TextButton(
            onPressed: ()async{
              dictionary = await fetchdata(url);
              var decoded = jsonDecode(dictionary);
              setState((){
                var tableOfKeys = [];
                var tableOfValues = [];
                sum = decoded["1"];
                print(sum.toString());
                alphabet = decoded["2"];
                print(alphabet);
                alphabet.keys.forEach((key) {
                  tableOfKeys.add(key);
                });
                alphabet.values.forEach((value) {
                  tableOfValues.add(value);
                });
                print(tableOfKeys);
                print(tableOfValues);
              });
            },
            child: const Text("Get ASCII value of a string")
        ),
        DataTable(
          columns: const [
            DataColumn(label: Text("Letter")),
            DataColumn(label: Text("Number of")),
          ],
          rows: [

          ]
        ),
        Text(sum),
      ],
    );
  }
}

class AlphabetList{
  late String letter;
  late int number;
  AlphabetList({required this.letter, required this.number});
  @override
  String toString() {
    return '{$letter, $number}';
  }
}

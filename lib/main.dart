// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'constants.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';
import 'pokemon.dart';
// import 'package:rest_api_example/model/user_model.dart';

var url = Uri.https('pokeapi.co', 'api/v2/pokemon/');

var _pokeJson = [];
var result;
var mainSprite;
// ignore: unused_element
get pokeJson => _pokeJson;

// Future<void> sharedPrefs() async {
//   ApiConstants.prefs = await SharedPreferences.getInstance();
// }

void main() async {
  http.Response response = await http.get(url);
  try {
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      for (var i = 1; i <= decodedData["results"].length; i++) {
        var urlPos = "api/v2/pokemon/" + "$i/";
        http.Response response =
            await http.get(Uri.https('pokeapi.co', urlPos));
        _pokeJson.add(jsonDecode(response.body));
        print(response.body);
      }
      // _pokeJson = decodedData["results"];

      print(_pokeJson);
    } else {
      print('failed');
    }
  } catch (e) {
    print('failed');
  }
  // print('HOLA QUE TAL');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'PROYECTO POKEMON'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = PageController();
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: PageView(
          dragStartBehavior: DragStartBehavior.start,
          scrollDirection: Axis.vertical,
          controller: _controller,
          children: [
            for (int i = 0; i < _pokeJson.length; i++)
              Pokemon1(pokemon: _pokeJson[i], pokeId: i)
          ],
        ));
  }
}

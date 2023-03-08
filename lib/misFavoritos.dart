// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image/image.dart' as img;
import 'package:palette_generator/palette_generator.dart';
import 'package:proyecto_pokemon/constants.dart';
import 'package:proyecto_pokemon/pokemon.dart';
import 'package:proyecto_pokemon/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MisFavoritos extends StatelessWidget {
  MisFavoritos({super.key, this.pokemones, this.colores, this.prefs});

  final pokemones;
  final colores;
  var prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MisFavoritosChange(pokemones: pokemones, colores: colores),
    );
  }
}

class MisFavoritosChange extends StatefulWidget {
  MisFavoritosChange({super.key, this.pokemones, this.colores});

  var pokemones;
  var colores;

  @override
  State<MisFavoritosChange> createState() => _MisFavoritosChangeState();
}

class _MisFavoritosChangeState extends State<MisFavoritosChange> {
  // MisFavoritosChange.pokemones;

  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    // pokemones = prefs.then((SharedPreferences prefs) {
    //   return prefs.getStringList('pokemones') ?? '';
    // }) as List;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: BackButton(
                  color: Colors.black,
                  onPressed: () => {Navigator.maybePop(context)},
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  'Mis Favoritos',
                  style: GoogleFonts.poppins(color: Colors.black),
                ),
              ),
            ],
          ),
          for (var i = 0; i < widget.pokemones.length; i++)
            Container(
              height: 80,
              width: 280,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: widget.colores.containsKey(
                        widget.pokemones[i]['types'][0]['type']['name'])
                    ? widget.colores[widget.pokemones[i]['types'][0]['type']
                        ['name']]
                    : Colors.green,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            image: NetworkImage(
                                widget.pokemones[i]['sprites']['other']
                                    ['official-artwork']['front_default'],
                                scale: 7.5)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.pokemones[i]['name'],
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => {
                            setState(() {
                              pokemones.remove(pokemones[i]);
                              // pokemones = prefs.then((SharedPreferences prefs) {
                              //   return prefs.remove('pokemones') ?? '';
                              // }) as List;
                            })
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ]),
            )
        ]),
      ),
    );
    ;
  }
}

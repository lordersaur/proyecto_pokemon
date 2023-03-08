import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_pokemon/misFavoritos.dart';
import 'package:shared_preferences/shared_preferences.dart';

var pokemones = [];
final colores = {
  'fire': const Color.fromARGB(255, 165, 55, 47),
  'grass': Colors.green,
  'water': const Color.fromARGB(255, 48, 124, 187),
  'bug': Colors.brown,
  'normal': Colors.grey
};

class Pokemon extends StatefulWidget {
  Pokemon({super.key, required this.pokemon, required this.pokeId});

  final pokemon;
  final pokeId;
  var prefs;

  @override
  State<Pokemon> createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // pokemones = prefs.then((SharedPreferences prefs) {
    //   return prefs.getString('pokemones') ?? '';
    // })
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          colores.containsKey(widget.pokemon['types'][0]['type']['name'])
              ? colores[widget.pokemon['types'][0]['type']['name']]
              : Colors.green,
      body: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          Row(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              children: [
                const SizedBox(
                  width: 170,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => {
                        print(pokemones),
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MisFavoritos(
                                    pokemones: pokemones,
                                    colores: colores,
                                    prefs: prefs)))
                      },
                      child: Container(
                        margin: const EdgeInsetsDirectional.symmetric(
                            horizontal: 30),
                        child: Row(children: [
                          Container(
                            margin: const EdgeInsetsDirectional.symmetric(
                                horizontal: 20.0),
                            child: Text(
                              'Mis favoritos',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          const Icon(
                            Icons.star_border_outlined,
                            color: Colors.white,
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              ]),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsetsDirectional.only(end: 25.0),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'Pokemon nro ' + widget.pokeId.toString(),
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
                    child: Text(
                      widget.pokemon['name'],
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsetsDirectional.only(top: 200),
                    height: 230,
                    width: 270,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsetsDirectional.only(
                                          end: 5, bottom: 5),
                                      width: 110,
                                      height: 40,
                                      child: Stack(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  right: 18),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  // boxShadow: [
                                                  //   BoxShadow(
                                                  //       blurRadius: 20,
                                                  //       blurStyle: BlurStyle.normal,
                                                  //       spreadRadius: .4,
                                                  //       color: Colors.grey)
                                                  // ],
                                                  // color: Colors.blueGrey,
                                                  border: Border.all(
                                                      color: Colors.black12),
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  widget.pokemon['stats'][1]
                                                          ['base_stat']
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.grey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 60,
                                            decoration: BoxDecoration(
                                                // boxShadow: [
                                                //   BoxShadow(
                                                //       blurRadius: 20,
                                                //       blurStyle: BlurStyle.normal,
                                                //       spreadRadius: .4,
                                                //       color: Colors.grey)
                                                // ],
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Center(
                                                child: Text(
                                              'Attack',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsetsDirectional.only(
                                          end: 5, bottom: 5),
                                      width: 110,
                                      height: 40,
                                      child: Stack(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  right: 18),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  // boxShadow: [
                                                  //   BoxShadow(
                                                  //       blurRadius: 20,
                                                  //       blurStyle: BlurStyle.normal,
                                                  //       spreadRadius: .4,
                                                  //       color: Colors.grey)
                                                  // ],
                                                  // color: Colors.blueGrey,
                                                  border: Border.all(
                                                      color: Colors.black12),
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  widget.pokemon['stats'][0]
                                                          ['base_stat']
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.grey,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 60,
                                            decoration: BoxDecoration(
                                                // boxShadow: [
                                                //   BoxShadow(
                                                //       blurRadius: 20,
                                                //       blurStyle: BlurStyle.normal,
                                                //       spreadRadius: .4,
                                                //       color: Colors.grey)
                                                // ],
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Center(
                                                child: Text(
                                              'HP',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                              Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsetsDirectional.only(
                                          end: 5, bottom: 5),
                                      width: 110,
                                      height: 40,
                                      child: Stack(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  right: 18),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  // boxShadow: [
                                                  //   BoxShadow(
                                                  //       blurRadius: 20,
                                                  //       blurStyle: BlurStyle.normal,
                                                  //       spreadRadius: .4,
                                                  //       color: Colors.grey)
                                                  // ],
                                                  // color: Colors.blueGrey,
                                                  border: Border.all(
                                                      color: Colors.black12),
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    widget.pokemon['stats'][2]
                                                            ['base_stat']
                                                        .toString(),
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.grey,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )),
                                            ),
                                          ),
                                          Container(
                                            width: 60,
                                            decoration: BoxDecoration(
                                                // boxShadow: [
                                                //   BoxShadow(
                                                //       blurRadius: 20,
                                                //       blurStyle: BlurStyle.normal,
                                                //       spreadRadius: .4,
                                                //       color: Colors.grey)
                                                // ],
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            child: Center(
                                                child: Text(
                                              'Defense',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )),
                                          ),
                                        ],
                                      )),
                                  Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsetsDirectional.only(
                                          end: 5, bottom: 5),
                                      width: 110,
                                      height: 40,
                                      child: Stack(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  // boxShadow: [
                                                  //   BoxShadow(
                                                  //       blurRadius: 20,
                                                  //       blurStyle: BlurStyle.normal,
                                                  //       spreadRadius: .4,
                                                  //       color: Colors.grey)
                                                  // ],
                                                  // color: Colors.blueGrey,
                                                  border: Border.all(
                                                      color: Colors.black12),
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Center(
                                                  child: Text(
                                                // ignore: prefer_interpolation_to_compose_strings
                                                'Type: ' +
                                                    widget.pokemon['types'][0]
                                                        ['type']['name'],
                                                style: GoogleFonts.poppins(
                                                    color: Colors.grey,
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                            ),
                                          ),
                                          // Container(
                                          //   width: 60,
                                          //   decoration: BoxDecoration(

                                          //       color: Colors.green,
                                          //       borderRadius:
                                          //           BorderRadius.circular(6)),
                                          // ),
                                        ],
                                      )),
                                ],
                              ),
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: MaterialButton(
                                    minWidth: 230,
                                    color:
                                        const Color.fromARGB(255, 66, 66, 66),
                                    onPressed: () => {
                                      if (pokemones.contains(widget.pokemon) ==
                                          false)
                                        {
                                          pokemones.add(widget.pokemon),
                                          // pokemones = prefs
                                          //     .then((SharedPreferences prefs) {
                                          //   return prefs.setString('pokemones',
                                          //           jsonEncode(pokemones)) ??
                                          //       '';
                                          // }) as List
                                        }
                                      else
                                        print("YA EXISTE !!!!!!!!"),
                                    },
                                    child: Center(
                                        child: Text(
                                      'Yo te elijo!',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    )),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(),
                    child: Image(
                        width: 250,
                        image: NetworkImage(widget.pokemon['sprites']['other']
                            ['official-artwork']['front_default'])),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Pokemon1 extends StatelessWidget {
  Pokemon1({super.key, required this.pokemon, required this.pokeId});

  final pokemon;
  final pokeId;
  var prefs;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Pokemon(
        pokeId: pokeId,
        pokemon: pokemon,
      ),
    );
  }
}

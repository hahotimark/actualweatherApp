import 'package:actualweather/main.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// const idojaras = r"http://api.weatherapi.com/v1/current.json?key=41f00bb660f84ca494b190113201810&q=Budapest";

Future<http.Response> fetchIdojaras2() {
  return http.get('http://api.weatherapi.com/v1/current.json?key=41f00bb660f84ca494b190113201810&q=London');
}

Future<Idojaras> fetchIdojaras() async {
  final response = await http.get('http://api.weatherapi.com/v1/current.json?key=41f00bb660f84ca494b190113201810&q=Budapest');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Idojaras.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Nem sikerült betölteni az időjárást');
  }
}
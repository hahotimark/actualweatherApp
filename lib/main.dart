import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:actualweather/remote.dart';

void main() {
  runApp(MyApp());
}

class Location {
  final String name;

  Location({this.name});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(name: json['name']);
  }
}

class CurrentWeather {
  final num tempCel;
  final num wind;

  CurrentWeather({this.tempCel, this.wind});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(tempCel: json['temp_c'],
                          wind: json['wind_kph']);

  }
}

class Idojaras {
  final Location location;
  final CurrentWeather currentWeather;


  Idojaras({this.location, this.currentWeather});

  factory Idojaras.fromJson(Map<String, dynamic> json) {
    return Idojaras(
      location: Location.fromJson(json['location']),
      currentWeather: CurrentWeather.fromJson(json['current']),
    );
  }
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightBlue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Aktuális időjárás'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<Idojaras> futureIdojaras;

  @override
  void initState() {
    super.initState();
    futureIdojaras = fetchIdojaras();

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title, style: TextStyle(color: Colors.blueGrey)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.wb_cloudy,
              color: Colors.blueGrey,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),

      body:

      Column(
        children: [
          Header(),
                  Column(
                    children: [
                      SizedBox(   //Use of SizedBox
                        height: 10,
                      ),
                      Container(
                    padding: EdgeInsets.all(4.0),
                    height: 170,
                    width: 394,
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent.withOpacity(0.8),

                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: 6,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Text("Kaposvár időjárása", style: TextStyle(fontFamily: 'Raleway',fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white),),
                            Row(
                              children: [
                                Text("\nHőmérséklet: 23 C", style: TextStyle(fontFamily: 'Raleway',fontSize: 17, fontWeight: FontWeight.bold),),
                              ],
                            ),
                            Icon(Icons.cloud_queue,
                              color: Colors.white,
                              size: 30.0,),
                          ],
                        ),
                      ],
                    ),
                  ),
                      SizedBox(   //Use of SizedBox
                        height: 16,
                      ),
                      Container(
                        padding: EdgeInsets.all(4.0),
                        height: 170,
                        width: 394,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent.withOpacity(0.5),

                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 6,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                                Text("Kaposvár 24 előrejelzés", style: TextStyle(fontFamily: 'Raleway',fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white),),
                                Row(
                                  children: [
                                    Text("\nHőmérséklet: 23 C", style: TextStyle(fontFamily: 'Raleway',fontSize: 17, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Icon(Icons.cloud_queue,
                                  color: Colors.white,
                                  size: 30.0,),
                          ],
                        ),
                      ),
                      SizedBox(   //Use of SizedBox
                        height: 16,
                      ),
                      Container(
                        padding: EdgeInsets.all(4.0),
                        height: 170,
                        width: 394,
                        decoration: BoxDecoration(
                          color: Colors.indigoAccent.withOpacity(0.2),

                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 6,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [

                                Text("Kaposvár 72 órás előrejelzés", style: TextStyle(fontFamily: 'Raleway',fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white),),
                                Row(
                                  children: [
                                    Text("\nHőmérséklet: 23 C ", style: TextStyle(fontFamily: 'Raleway',fontSize: 17, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Icon(Icons.cloud_queue,
                                  color: Colors.white,
                                  size: 30.0,),
                          ],
                        ),
                      )



                        ]
                      ),
                  ]
      ),
    );
  }

}
class Header extends StatefulWidget{

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header>{
  List<String>cities = ["Budapest", "Kaposvár", "Miskolc", "London", "Csepel", "Szentlászló", "Dómbóvár", "Pécs"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context){
    return Container(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cities.length,
        itemBuilder:(context, index) => buildCities(index),
      ),
    );
  }

  Widget buildCities(int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.all(3.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
        cities[index],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: selectedIndex == index ? Colors.black45 : Colors.black45,
          ),
      ),
              Container(
                margin: EdgeInsets.all(0.5),
                height: 2,
                width: 25,
                color: selectedIndex == index ? Colors.black45 : Colors.transparent,
              )
            ]
      )
      ),
    );
  }

}


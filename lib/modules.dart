/*



            child: Center(
              child:
              Padding(
                padding: const EdgeInsets.all(12.0),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Row(

                      children: [
                        FutureBuilder(
                          future: futureIdojaras,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text("Hőmérséklet:  ${snapshot.data.currentWeather.tempCel} \nVáros: ${snapshot.data.location.name}\nSzél: ${snapshot.data.currentWeather.wind} km/h", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),);

                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }

                            // By default, show a loading spinner.
                            return CircularProgressIndicator();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

 */
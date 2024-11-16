import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'artists.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //MyApp remains unchanged
  const MyApp({super.key});
  static const String _title = 'Rampage';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  // _MyHomePageState was something the codelab did, what is written here is essentially also written in the codelab
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    RampageHomePage(),
    ArtistsPage(),
    EventsPage(),
    CharitiesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // this here switches what page is displayed based on what "selectedIndex" is. case 0 = home page, case 1 = artists, etc

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 14, 7, 7),
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 103, 55, 177),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.audiotrack),
            label: 'Artists',
            backgroundColor: Color.fromARGB(255, 103, 55, 177),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Events',
            backgroundColor: Color.fromARGB(255, 103, 55, 177),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Charities',
            backgroundColor: Color.fromARGB(255, 103, 55, 177),
          )
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Color.fromARGB(255, 187, 16, 4),
        onTap: _onItemTapped,
      ),
    );

    /*body: Row(
          children: [
            SafeArea(
              /*child: NavigationRail(
                backgroundColor: Color.fromARGB(255, 119, 61, 212),
                //allows one to toggle between different pages easily
                extended: constraints.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'DeliciousHandrawn',
                          color: Color.fromARGB(255, 187, 16, 4),
                          fontSize: 20,
                        )),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.audiotrack),
                    label: Text('Artists',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'DeliciousHandrawn',
                          color: Color.fromARGB(255, 187, 16, 4),
                          fontSize: 20,
                        )),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.audiotrack),
                    label: Text('Events',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'DeliciousHandrawn',
                          color: Color.fromARGB(255, 187, 16, 4),
                          fontSize: 20,
                        )),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.audiotrack),
                    label: Text('Charities',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'DeliciousHandrawn',
                          color: Color.fromARGB(255, 187, 16, 4),
                          fontSize: 20,
                        )),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  //this changes selectedIndex to 0 or 1 I believe, depending on what page has just been selected
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),*/

              /*child: Center(
                child: ElevatedButton(child: Text("Click me"), onPressed: (){
                  final player= AudioCache();
                  player.play('ambitions.wav');
                }))*/
            ),
            Expanded(
              //not too sure what this does
              child: Container(
                child: page,
              ),
            ),
          ],
        ),
      );
    });*/
  }
}

class RampageHomePage extends StatelessWidget {
  // copied from what we had as the home page previously

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(0, 32, 2, 2),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("graphics/starback.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
            children: [
              Text(
                'RAMPAGE CORPORATIONS',
                style: TextStyle(
                  fontFamily: 'DeliciousHandrawn',
                  color: Color.fromARGB(255, 103, 55, 177),
                  fontSize: 55,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'At Rampage Corporations, we have created a network of musical artists throughout New York City. We put together concerts and allow these artists to perform and promote their music. Every guest pays for a ticket and all proceeds go to charity. Tune in!',
                style: TextStyle(
                  fontFamily: 'Dosis',
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      disabledForegroundColor: Colors.white,
                    ),
                    child: Text(
                      "Listen to some of our music!",
                      style: TextStyle(
                        fontFamily: 'ShadowsIntoLight',
                        color: Color.fromARGB(255, 103, 55, 177),
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      final player = AudioCache();
                      player.play('ambitions.wav');
                    }),
              )),
              SizedBox(height: 10),
              Image.asset('graphics/logo.png', width: 400, height: 400),
            ],
          ),
        ),
      ),
    );
  }
}

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // this widget allows one to have a scrolling mechanism in the page, prevents the weird pixel problem
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("graphics/eventsstarback.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(13.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('EVENTS',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'DeliciousHandrawn',
                color: Color.fromARGB(255, 103, 55, 177),
                fontSize: 55,
              )),
          Text(
              'For our first event, we rented out Grove 34 in Astoria on December 17th. S4D4T, Kilonova, PXRALYSIS, Luka, Jaeseo, and Bianca all performed. We raised \$250 and all proceeds went to the Palestine\'s Children Relief Fund.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Dosis',
                color: Colors.white,
                fontSize: 15,
              )),
          Text(''),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.white,
              ),
            ),
            child: Image.asset(
              'graphics/paralysisconcert1.png',
              // width: 344, height: 438
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.white,
              ),
            ),
            child: Image.asset(
              'graphics/biancaconcert.png',
              // width: 344, height: 438
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.white,
              ),
            ),
            child: Image.asset(
              'graphics/lukaconcert.png',
              // width: 344, height: 398
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.white,
              ),
            ),
            child: Image.asset(
              'graphics/jaeseoconcert.png',
              // width: 344, height: 380
            ),
          ),
        ]),
      ),
    );
  }
}

class CharitiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // this widget allows one to have a scrolling mechanism in the page, prevents the weird pixel problem
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("graphics/starback.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(13.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('CHARITIES',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'DeliciousHandrawn',
                color: Color.fromARGB(255, 103, 55, 177),
                fontSize: 50,
              )),
          Text(
              'For our first event we worked with the Palestine\'s Children Relief Fund. It is a nonprofit humanitarian organization that provides medical relief to children in the Middle East. Donations help pay for treatment and provide orphans in Gaza, Palestine with monthly food and hygiene supplies ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Dosis',
                color: Colors.white,
                fontSize: 15,
              )),
          // I want to add this link here: https://www.pcrf.net/pages/pediatric-cancer-departments
          Text(''),
          ElevatedButton(
            onPressed: _launchUrll,
            child: Text('Link',
                style: TextStyle(color: Color.fromARGB(255, 103, 55, 177))),
          ),
          Text(''),
          Text(''),

          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Color.fromARGB(255, 103, 55, 177),
              ),
            ),
            child: Image.asset('graphics/pcrf.png', width: 300, height: 300),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Color.fromARGB(255, 103, 55, 177),
              ),
            ),
            child: Image.asset('graphics/pcrf1.png', width: 300, height: 300),
          ),
        ]),
      ),
    );
  }

  Future<void> _launchUrll() async {
    const url = 'https://www.pcrf.net/pages/pediatric-cancer-departments';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

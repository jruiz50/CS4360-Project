import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spread/searchPage/list_view.dart';
import 'firebase_options.dart';
import 'package:spread/searchPage/search_appbar.dart';
import 'package:spread/loginPage/loginView.dart';
import 'package:spread/qrPage/qr_scanner.dart';
import 'mapPage/mapView.dart';
import 'package:spread/ocrPage/camView.dart';
import 'package:spread/mapPage/mapView.dart';
import 'package:spread/mapPage/mapSample.dart';
import 'package:spread/mapPage/googleMap.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crave',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: loginView(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 2;
  // We set 2 to be the middle (search) screen
  // Used for index relative to BottomNavigationBar

  static final List<Widget> _widgetOptions = <Widget>[
    CamView(),
    const Text(
      'Index 1: Favorites Screen',
    ),
    launchListTile(),
    GoogleMapsDemo(),
    const Text('Index 4: Settings Screen'),
  ];
  // This creates a list of widgets; each widget displays different text so far

  void _onTabClicked(int index) {
    setState(() {
      _selectedIndex = index;
    });
  } // Function to change index when tab is clicked

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: SearchAppBar(
        appBar: AppBar(),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        // Child shows widget from the list defined above
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_2),
              label: 'Scan QR',
              backgroundColor: Color.fromRGBO(208, 188, 255, 1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
              backgroundColor: Color.fromRGBO(208, 188, 255, 1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Color.fromRGBO(208, 188, 255, 1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_pin),
              label: 'Map',
              backgroundColor: Color.fromRGBO(208, 188, 255, 1)),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Color.fromRGBO(208, 188, 255, 1))
        ],
        currentIndex: _selectedIndex,
        onTap: _onTabClicked,
      ),
    );
  }
}

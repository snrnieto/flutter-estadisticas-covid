import 'package:dio/dio.dart';
import 'package:pruebaapi/Screens/TabCountries.dart';
import 'package:flutter/material.dart';
import 'package:pruebaapi/Screens/TabWorld.dart';

getSummaryApi() async {
  var response = await Dio().get("https://api.covid19api.com/summary");

  if (response.statusCode == 200) {
    // print(response.data);
    return response.data;
  } else {
    throw Exception('Failed to load Countries');
  }
}

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fetch Data Example',
      home: MyApp(),
      theme: ThemeData(
        primaryColor: Color(0xFF222035),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List futureCountries = [];
  Map<String, dynamic> futureSummary = {};

  int _currentIndex = 0;
  List<Widget> children = [CenterProgress(), CenterProgress()];

  bool isSwitched = false;

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    getSummaryApi().then((data) {
      setState(() {
        futureCountries = data["Countries"];
        futureSummary = data["Global"];
        children.clear();

        children = [
          TabWorld(futureSummary: futureSummary),
          TabCountries(futureCountries: futureCountries),
        ];
      }); //setState
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covidisticas'),
      ),
      body: children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF23326b),
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.grey[300],
        unselectedItemColor: Color(0xFF384ffc),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
              size: 30,
            ),
            label: 'Mundo',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on_rounded,
              size: 30,
            ),
            label: 'Paises',
          ),
        ],
      ),
    );
  }
}

class CenterProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

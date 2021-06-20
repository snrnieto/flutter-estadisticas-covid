import 'package:pruebaapi/Screens/InfoCard.dart';
import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  final Map<String, dynamic> country;

  Country(this.country);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          country["Country"],
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFF222035),
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Text(
                "Fecha: " + country["Date"].toString().substring(0, 10),
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              InfoCard(
                texto: "Nuevos casos",
                casos: country['NewConfirmed'],
                fondo: Colors.orange,
              ),
              InfoCard(
                texto: "Nuevos Recuperados",
                casos: country['NewRecovered'],
                fondo: Colors.green,
              ),
              InfoCard(
                texto: "Nuevas Muertes:",
                casos: country['NewDeaths'],
                fondo: Colors.red,
              ),
              InfoCard(
                texto: "Total casos confirmados",
                casos: country['TotalConfirmed'],
                fondo: Colors.orange,
              ),
              InfoCard(
                texto: "Total Muertos",
                casos: country['TotalDeaths'],
                fondo: Colors.red,
              ),
              InfoCard(
                texto: "Total Recuperados",
                casos: country['TotalRecovered'],
                fondo: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}

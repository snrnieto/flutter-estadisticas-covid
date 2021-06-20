import 'package:pruebaapi/Screens/InfoCard.dart';
import 'package:flutter/material.dart';

class TabWorld extends StatelessWidget {
  const TabWorld({
    Key? key,
    required this.futureSummary,
  }) : super(key: key);

  final Map<String, dynamic> futureSummary;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF222035),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: futureSummary.length > 0
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InfoCard(
                        texto: "Nuevos casos",
                        casos: futureSummary['NewConfirmed'],
                        fondo: Colors.orange,
                      ),
                      InfoCard(
                        texto: "Nuevos Recuperados",
                        casos: futureSummary['NewRecovered'],
                        fondo: Colors.green,
                      ),
                      InfoCard(
                        texto: "Nuevas Muertes:",
                        casos: futureSummary['NewDeaths'],
                        fondo: Colors.red,
                      ),
                      InfoCard(
                        texto: "Total casos confirmados",
                        casos: futureSummary['TotalConfirmed'],
                        fondo: Colors.orange,
                      ),
                      InfoCard(
                        texto: "Total Muertos",
                        casos: futureSummary['TotalDeaths'],
                        fondo: Colors.red,
                      ),
                      InfoCard(
                        texto: "Total Recuperados",
                        casos: futureSummary['TotalRecovered'],
                        fondo: Colors.green,
                      )
                    ],
                  )
                : CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

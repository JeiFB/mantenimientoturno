import 'package:flutter/material.dart';

class CardElements extends StatelessWidget {
  final String? placa;
  final String? fecha;
  final String? hora;
  const CardElements(this.placa, this.fecha, this.hora, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Card(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.car_repair,
            size: 110,
            color: Colors.purple,
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: 'Placa: ',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Feather Bold',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: placa,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Feather Bold',
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: 'Fecha: ',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Feather Bold',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: fecha,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Feather Bold',
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: 'Hora: ',
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Feather Bold',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: hora,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Feather Bold',
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

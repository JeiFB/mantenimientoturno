// import 'package:flutter/material.dart';
// import 'package:mantenimientoapp/presentation/components/card_elements.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.purple,
//           centerTitle: true,
//           title: const Text(
//             'Mantenimiento',
//             style: TextStyle(color: Colors.white),
//           )),
//       body: ListView(
//         children: [
//           Container(
//               margin: const EdgeInsets.only(top: 20),
//               width: double.infinity,
//               child: const Text(
//                 'Turnos Apartados',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               )),
//           const SizedBox(
//             height: 15,
//           ),
//           Container(
//               margin: const EdgeInsets.symmetric(horizontal: 10),
//               child: const Column(
//                 children: [
//                   CardElements('******', '05/05/2024', '10:00 AM'),
//                   CardElements('******', '05/05/2024', '01:00 PM'),
//                   CardElements('******', '05/05/2024', '02:00 PM'),
//                   CardElements('******', '06/05/2024', '10:00 AM')
//                 ],
//               ))
//         ],
//       ),
//       floatingActionButton: Container(
//         width: 200,
//         child: FloatingActionButton(
//           onPressed: () {
//             Navigator.pushNamed(context, 'agregarturno');
//           },
//           child: const Text(
//             'Aparta tu turno',
//             style: TextStyle(fontSize: 18),
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mantenimientoapp/presentation/components/card_elements.dart';
import 'package:mantenimientoapp/presentation/turno/agregar/agregar_turno.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, String> _turnoAgregado = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text(
          'Mantenimiento',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: double.infinity,
            child: const Text(
              'Tu turno',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: _turnoAgregado != null
                  ? [
                      CardElements(
                        _turnoAgregado['placa'],
                        _turnoAgregado['fecha'],
                        _turnoAgregado['hora'],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Turnos Apartados',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CardElements('******', '2/5/2024', '8:00'),
                      const CardElements('******', '2/5/2024', '9:00')
                    ]
                  : [],
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 200,
        child: FloatingActionButton(
          onPressed: () async {
            final turnoAgregado = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AgregarTurno(
                  (turno) {
                    setState(() {
                      _turnoAgregado = turno;
                    });
                  },
                ),
              ),
            );
          },
          child: const Text(
            'Aparta tu turno',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

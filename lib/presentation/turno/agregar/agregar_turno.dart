import 'package:flutter/material.dart';

class AgregarTurno extends StatefulWidget {
  final Function(Map<String, String>) onTurnoAgregado;

  const AgregarTurno(this.onTurnoAgregado, {super.key});

  @override
  State<AgregarTurno> createState() => _AgregarTurnoState();
}

class _AgregarTurnoState extends State<AgregarTurno> {
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _placaController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    _placaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.purple,
        title: const Text(
          'Agenda tu turno',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _placaController,
                decoration: InputDecoration(labelText: 'Placa del carro'),
              ),
              SizedBox(height: 20.0),
              Text('Fecha del mantenimiento:'),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2025),
                  );

                  if (selectedDate != null) {
                    setState(() {
                      _dateController.text =
                          '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
                    });
                  }
                },
                child: const Text('Seleccionar Fecha'),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Fecha seleccionada',
                ),
              ),
              SizedBox(height: 20.0),
              Text('Hora del mantenimiento:'),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () async {
                  final selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (selectedTime != null) {
                    setState(() {
                      _timeController.text =
                          '${selectedTime.hour}:${selectedTime.minute}';
                    });
                  }
                },
                child: Text('Seleccionar Hora'),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _timeController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Hora seleccionada',
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Verifica que todos los campos estén llenos
                  if (_dateController.text.isNotEmpty &&
                      _timeController.text.isNotEmpty &&
                      _placaController.text.isNotEmpty) {
                    // Crea un mapa con los datos del turno
                    final turno = {
                      'placa': _placaController.text,
                      'fecha': _dateController.text,
                      'hora': _timeController.text,
                    };
                    // Llama a la función proporcionada desde el widget padre y pasa el mapa del turno
                    widget.onTurnoAgregado(turno);
                    // Regresa a la pantalla anterior
                    Navigator.of(context).pop();
                  } else {
                    // Muestra un mensaje de error si algún campo está vacío
                    // Puedes utilizar un SnackBar o showDialog para mostrar el mensaje
                  }
                },
                child: Text('Agendar Turno'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

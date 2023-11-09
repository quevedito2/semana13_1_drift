import 'package:flutter/material.dart';

class VistaListado extends StatefulWidget {
  const VistaListado({Key? key}) : super(key: key);

  @override
  _VistaListadoState createState() => _VistaListadoState();
}

class _VistaListadoState extends State<VistaListado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado'),
      ),
    );
  }
}

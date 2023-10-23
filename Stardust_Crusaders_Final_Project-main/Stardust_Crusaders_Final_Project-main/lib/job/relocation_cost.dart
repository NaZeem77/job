import 'package:flutter/material.dart';


class RelocationPage extends StatefulWidget {
  const RelocationPage({super.key});

  @override
  State<RelocationPage> createState() => RelocationPageState();
}

class RelocationPageState extends State<RelocationPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Relocation'),
        backgroundColor: Colors.green.shade800,
      ),
      body: const Center(

      ),
    );
  }

}
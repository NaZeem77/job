import 'package:flutter/material.dart';


class SalaryPage extends StatefulWidget {
  const SalaryPage({super.key});

  @override
  State<SalaryPage> createState() => SalaryPageState();
}

class SalaryPageState extends State<SalaryPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Salary Comparison'),
        backgroundColor: Colors.green.shade800,
      ),
      body: const Center(

      ),
    );
  }

}
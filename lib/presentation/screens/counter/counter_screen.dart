
import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {

  static const name = 'riverpod_screen'; 


  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final count = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child: Text('Valor: 10', style: Theme.of(context).textTheme.titleLarge,),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add ),
        onPressed: () {},
      ),
    );
  }
}
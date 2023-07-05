import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.arrow_back_ios_rounded ),
        onPressed: () {
          context.pop();
        } ,
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // llegar hasta lo que pueda el padre
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: SizedBox(
          // wrap crea filas según el tamaño de los hijos
          child: Wrap(
            spacing: 10,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
              const ElevatedButton(onPressed: null, child: Text('Elevated Disabled')),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon( Icons.access_alarm_rounded ),
                label: const Text('Elevated icon'),
              ),
              FilledButton(onPressed: () {}, child: const Text('Filled')),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon( Icons.accessibility_new ),
                label: const Text('Filled Icon')
              ),
              OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
              OutlinedButton.icon(
                onPressed: () {},
                label: const Text('Outline Icon'),
                icon: const Icon( Icons.terminal ),
              ),
              TextButton(onPressed: () {}, child: const Text('Text'))
            ],
          ),
        ),
      ),
    );
  }
}
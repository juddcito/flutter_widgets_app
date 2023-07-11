import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar( BuildContext context ){

    //Limpiar el snackbar para que no se acumulen
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar =  SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration( seconds: 2 ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  
  }

  void openDialog(BuildContext context){

    showDialog(
      context: context,
      // Evitar que se cierre el Dialog dando clic en la parte exterior de él
      barrierDismissible: false,
      builder:(context) => AlertDialog(
        title: const Text('Estás seguro?'),
        content: const Text('Occaecat irure magna anim fugiat ullamco enim tempor do officia incididunt enim est adipisicing. Dolore aliqua aliquip aliquip occaecat pariatur dolor nostrud et magna consequat magna occaecat esse. Labore velit incididunt adipisicing laborum amet enim aliquip ut fugiat esse culpa commodo. Duis in aliqua eu incididunt aliquip incididunt id excepteur quis mollit exercitation. Irure do esse exercitation sunt eiusmod. Reprehenderit laboris esse fugiat elit et pariatur consequat eiusmod deserunt officia qui duis. Sint qui fugiat dolor aliquip.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
      ), //algo que se construye en tiempo de ejecuciópn
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogs'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children:[
                    const Text('Sunt dolore non dolor amet.')
                  ]);
              },
              child: Text('Licencias usadas')
            ),
            const SizedBox(height: 30),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: Text('Mostrar diálogo')
            )
          ],
        )
      ),


      floatingActionButton: FloatingActionButton.extended(
        label: Text('Mostrar Snackbar'),
        icon: Icon( Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
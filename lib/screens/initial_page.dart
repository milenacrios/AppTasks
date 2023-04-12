import 'package:flutter/material.dart';
import 'package:projeto_01/components/task_cart.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  bool valueOpacity = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Container(),
          title: const Text(
            'Tarefas',
            style: TextStyle(fontSize: 25),
          )),
      body: AnimatedOpacity(
        opacity: valueOpacity ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
            TaskCart('Estudar Flutter', 'assets/images/flutter.png', 1),
            TaskCart('Andar de bicicleta', 'assets/images/bike.jpg', 2),
            TaskCart('Meditar', 'assets/images/meditacao.jpg', 5),
            TaskCart('Ler 50 páginas', 'assets/images/livro.jpg', 3),
            TaskCart('Jogar', 'assets/images/game.jpg', 2),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            valueOpacity = !valueOpacity;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}

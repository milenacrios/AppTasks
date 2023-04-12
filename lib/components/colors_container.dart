import 'package:flutter/material.dart';

class ColorsContainer extends StatefulWidget {
  final int cor;
  const ColorsContainer({required this.cor, super.key});

  @override
  State<ColorsContainer> createState() => _ColorsContainerState();
}

class _ColorsContainerState extends State<ColorsContainer> {
  List<Color> cores = [
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.purple,
    Colors.black
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      //passar a cor pra cá
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: cores[widget.cor],
      ),
      height: 140,
    );
  }
}

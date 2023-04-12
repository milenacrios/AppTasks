import 'package:flutter/material.dart';
import 'package:projeto_01/components/colors_container.dart';
import 'package:projeto_01/components/star_difficulty.dart';

class TaskCart extends StatefulWidget {
  final String name;
  final String photo;
  final int difficultyLevel;
  const TaskCart(this.name, this.photo, this.difficultyLevel, {super.key});

  @override
  State<TaskCart> createState() => _TaskCartState();
}

class _TaskCartState extends State<TaskCart> {
  int level = 0;
  int levelMax = 10;
  int progressCount = 0;
  int corSelected = 0;

  @override
  Widget build(BuildContext context) {
    //int aux = widget.dificulty;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Stack(
          children: [
            ColorsContainer(cor: corSelected),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26,
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            widget.photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // ignore: sized_box_for_whitespace
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                widget.name,
                                style: const TextStyle(
                                  fontSize: 22,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            StarDifficulty(difficulty: widget.difficultyLevel),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 52,
                        height: 52,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                level++;
                                progressCount++;
                                progressCount ==
                                        (widget.difficultyLevel * levelMax +
                                            1) //reinicia a barra
                                    ? (
                                        progressCount = 1,
                                        (corSelected) >= 6
                                            ? corSelected = 6
                                            : corSelected++,
                                      )
                                    : progressCount;
                              });
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_drop_up),
                                Text(
                                  'UP',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ignore: sized_box_for_whitespace
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        // ignore: sort_child_properties_last
                        child: LinearProgressIndicator(
                            color: Colors.white,
                            value: ((widget.difficultyLevel == 0)
                                ? 1
                                : (progressCount / widget.difficultyLevel) /
                                    10)),
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'nível $level',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

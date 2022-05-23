import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable example'),
      ),
      body: DraggableEvenOddGame(),
    );
  }
}

class DraggableEvenOddGame extends StatefulWidget {
  const DraggableEvenOddGame({Key? key}) : super(key: key);

  @override
  State<DraggableEvenOddGame> createState() => _DraggableEvenOddGameState();
}

class _DraggableEvenOddGameState extends State<DraggableEvenOddGame> {
  int count = 1;

  void showSnackBar(value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.startToEnd,
        content: Text('$value'),
        duration: const Duration(milliseconds: 2500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: SizedBox(
              child: Align(child: Text('Drag the number box and place it on top of even or odd box'),),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: MediaQuery.of(context).size.width / 2 -
                      75, // 75 is the half of the box
                  top: 100,
                  child: Draggable(
                    data: count,
                    child: Square(
                      color: Colors.pink,
                      title: '$count',
                    ),
                    feedback: Square(
                      color: Colors.black,
                      title: '$count',
                    ),
                    childWhenDragging: Square(
                      color: Colors.blueAccent,
                      title: '$count',
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 150,
                  child: Container(
                    width: 150,
                    height: 150,
                    child: DragTarget(
                      builder: (context, candidateData, rejectedData) {
                        return Square(
                          title: 'Odd',
                        );
                      },
                      onWillAccept: (data) {
                        print('from onwillaccept $data');
                        return true;
                      },
                      onAccept: (data) {
                        int value = data! as int;

                        if (value % 2 != 0) {
                          setState(() {
                            count += 1;
                          });
                          showSnackBar('Correct $value is an Odd number');
                        } else {
                          showSnackBar('Wrong');
                        }

                        print('from onAccept => $data');
                      },
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 150,
                  child: Container(
                    width: 150,
                    height: 150,
                    child: DragTarget(
                      builder: (context, candidateData, rejectedData) {
                        print('from target builder, $candidateData, $rejectedData');
                        return Square(
                          title: 'Even',
                        );
                      },
                      onWillAccept: (data) {
                        print('from onwillaccept $data');
                        return true;
                      },
                      onAccept: (data) {
                        int value = data! as int;

                        if (value % 2 == 0) {
                          setState(() {
                            count += 1;
                          });
                          showSnackBar('Correct $value is an even number');
                        } else {
                          showSnackBar('Wrong');
                        }

                        print('from onAccept => $data');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Square extends StatelessWidget {
  const Square(
      {Key? key,
      this.size = 150,
      this.color = Colors.teal,
      this.title = 'none'})
      : super(key: key);

  final double size;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      color: color,
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DraggableDemo extends StatefulWidget {
  const DraggableDemo({Key? key}) : super(key: key);

  @override
  State<DraggableDemo> createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Draggable example')),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // I use flexible for obtain the children height.
            const Flexible(
              // There are three main parts to the Draggable widget:
              // Child: The child parameter is the widget that will be displayed when the draggable is stationary
              // Feedback: The feedback is the widget that will be displayed when the widget is being dragged.
              // Child When Dragging: The childWhenDragging parameter takes the widget to display in the original place of child when the widget is being dragged.
              child: Draggable(
                data: 'ambe',
                // axis: Axis.horizontal,
                child: Square(),
                feedback: Square(
                  color: Colors.black,
                ),
                childWhenDragging: Square(color: Colors.purple),
              ),
            ),

            Container(
              width: 100,
              height: 100,
              color: Colors.pink,
              child: DragTarget(
                builder: (context, candidateData, rejectedData) {
                  print(
                      'candidate data => $candidateData, rejected Data => $rejectedData');
                  return isAccepted ? Square() : Container();
                },
                onWillAccept: (data) {
                  print('data => $data');
                  return true;
                },
                onAccept: (data) {
                  isAccepted = true;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Note
// Callbacks
// The draggable widget supplies callbacks for actions on the widget.

// These callbacks are:

// onDragStarted : This is called when a drag is started on a widget.

// onDragCompleted : When a draggable is dragged to a DragTarget and accepted, this callback is called. We will look atDragTarget is in the next section.

// onDragCancelled : When a draggable does not reach a DragTarget or is rejected, this callback is fired.

class Square extends StatelessWidget {
  final double size;
  final Color color;

  const Square({Key? key, this.size = 50, this.color = Colors.amber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      height: 100.0,
      child: Container(
        color: color,
      ),
    );
  }
}

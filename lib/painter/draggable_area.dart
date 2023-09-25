import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'open_painter.dart';

class DraggableArea extends StatefulWidget {
  const DraggableArea({super.key});

  @override
  State<DraggableArea> createState() => _DraggableAreaState();
}

class _DraggableAreaState extends State<DraggableArea> {
  int acceptedData = 0;

  double _x = 0;
  double _y = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DragTarget<int>(
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return Container(
              height: 1200.0,
              width: 1200.0,
              color: Colors.cyan,
              child: Center(
                child: Text('Value is updated to: $acceptedData'),
              ),
            );
          },
          onAccept: (int data) {
            setState(() {
              acceptedData += data;
            });
          },
        ),
        Positioned(
            left: _x,
            top: _y,
            child: Draggable<int>(
                // Data is the value this Draggable stores.
                data: 10,
                feedback: _draggableItem(),
                childWhenDragging: _draggableItem(),
                onDragEnd: (dragDetails) {
                  setState(() {
                    _x = dragDetails.offset.dx;
                    _y = dragDetails.offset.dy;
                  });
                },
                child: _draggableItem())),
      ],
    );
  }

  Widget _draggableItem() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Card(
            elevation: 5,
            shape: Border.all(width: 1.0, color: Colors.white),
            child: SizedBox(
              height: 100,
              width: 100,
              child: CustomPaint(
                painter: OpenPainter(),
              ),
            )));
  }
}

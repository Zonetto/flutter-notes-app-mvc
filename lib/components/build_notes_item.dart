import 'package:flutter/material.dart';
import 'package:reminders_app/constant/constant.dart';

import 'package:reminders_app/model/todo_mode.dart';

class BuildTaskItem extends StatelessWidget {
  final TodoModel model;
  final BuildContext context;
  final voidCallback onPressedUpdate;
  final voidCallback onPressedDone;
  final voidCallback onPressedDel;

  const BuildTaskItem({
    super.key,
    required this.model,
    required this.context,
    required this.onPressedUpdate,
    required this.onPressedDone,
    required this.onPressedDel,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(
        model.todoId.toString(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                model.time,
                style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 18.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    model.title,
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    model.date,
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 18.0,
            ),
            IconButton(
              onPressed: onPressedDone,
              icon: const Icon(
                Icons.check_box,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: onPressedUpdate,
              icon: const Icon(
                Icons.archive,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
      onDismissed: (direction) async {
        onPressedDel();
      },
    );
  }
}

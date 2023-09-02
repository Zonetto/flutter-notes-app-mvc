import 'package:flutter/material.dart';
import 'package:reminders_app/controller/todo_controller.dart';
import 'package:reminders_app/model/todo_mode.dart';
import 'build_notes_item.dart';
import 'my_divider.dart';

class NotesListRow extends StatelessWidget {
  final List<TodoModel> todoModel;
  final TodoController todoController;
  final void Function() setState;

  const NotesListRow({
    super.key,
    required this.todoModel,
    required this.todoController,
    required this.setState,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        todoModel.isNotEmpty
            ? Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return BuildTaskItem(
                      model: todoModel[index],
                      context: context,
                      onPressedUpdate: () async {
                        todoController.updateData(
                          id: todoModel[index].todoId!,
                          status: 'archive',
                        );
                        setState();
                      },
                      onPressedDone: () {
                        todoController.updateData(
                          id: todoModel[index].todoId!,
                          status: 'done',
                        );
                        setState();
                      },
                      onPressedDel: () {
                        todoController.delete(
                          id: todoModel[index].todoId!,
                        );
                        setState();
                      },
                    );
                  },
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: todoModel.length,
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.menu,
                      size: 100,
                      color: Colors.grey[500],
                    ),
                    Text(
                      'There is no data',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}

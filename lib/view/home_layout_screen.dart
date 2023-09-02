import 'package:flutter/material.dart';
import 'package:notes_app/components/custom_text_from_field.dart';
import 'package:notes_app/components/time_and_date_paicker.dart';
import 'package:notes_app/controller/todo_controller.dart';
import 'package:notes_app/model/todo_mode.dart';
import 'package:notes_app/view/tasks_screen.dart';
import 'archive_screen.dart';
import 'done_screen.dart';

class HomeLayoutScreen extends StatefulWidget {
  const HomeLayoutScreen({super.key});

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  final TodoController controller = TodoController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController timeController = TextEditingController();

  final TextEditingController dateController = TextEditingController();

  bool isShowBottomSheet = false;

  IconData fabIcon = Icons.edit;

  int currentIndex = 0;

  List<String> title = [
    'Tasks',
    'Done',
    'Archive',
  ];

  List<TodoModel> todoModel = [];

  void changeBottomSheetState({
    required bool isShow,
    required IconData icon,
  }) {
    setState(() {
      isShowBottomSheet = isShow;
      fabIcon = icon;
    });
  }

  void fetch() async {
    await controller.fetchDate();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      TasksScreen(todoController: controller),
      DoneScreen(todoController: controller),
      ArchiveScreen(todoController: controller),
    ];
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          title[currentIndex],
        ),
      ),
      body: screen[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (isShowBottomSheet) {
            if (formKey.currentState!.validate()) {
              final String title = titleController.text;
              final String time = timeController.text;
              final String date = dateController.text;

              Map<String, dynamic> data = {
                "title": title,
                "date": date,
                "time": time,
                "status": 'new'
              };
              controller.createData(data);
              fetch();
            }
          } else {
            scaffoldKey.currentState!
                .showBottomSheet(
                  (context) => Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.0),
                        bottom: Radius.circular(20.0),
                      ),
                      color: Color(0xFFF7F7F7),
                    ),
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextFromField(
                              controller: titleController,
                              icon: Icons.title,
                              textInputType: TextInputType.text,
                              hintText: 'Title',
                              onTap: () {},
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'title must not empty';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            CustomTextFromField(
                              controller: timeController,
                              icon: Icons.watch_later,
                              hintText: 'Task Time',
                              readOnly: true,
                              onTap: () async {
                                final String time =
                                    await timePicker(context: context);
                                timeController.text = time;
                              },
                              textInputType: TextInputType.datetime,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'time must not empty';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            CustomTextFromField(
                              controller: dateController,
                              icon: Icons.calendar_today,
                              textInputType: TextInputType.datetime,
                              hintText: 'Task date',
                              readOnly: true,
                              onTap: () async {
                                final String date =
                                    await datePicker(context: context);
                                dateController.text = date;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'date must not empty';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  elevation: 0.0,
                )
                .closed
                .then((value) {
              changeBottomSheetState(
                isShow: false,
                icon: Icons.edit,
              );
            });

            changeBottomSheetState(
              isShow: true,
              icon: Icons.add,
            );
          }
        },
        child: Icon(
          fabIcon,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16.0,
        elevation: 0.0,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
            ),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_circle_outline,
            ),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.archive,
            ),
            label: 'Archive',
          ),
        ],
      ),
    );
  }
}

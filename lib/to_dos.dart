import 'package:flutter/material.dart';
import 'package:note_pad/note_pad_screen.dart';
import 'package:note_pad/sampletodos.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  bool? isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.minimize,
          color: Color.fromARGB(193, 10, 0, 0),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  padding: const EdgeInsets.all(0),
                  child: ElevatedButton(
                    onPressed: () {},

                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                    ),
                    child: const Text(
                      'Sort by alert time',
                      style: TextStyle(color: Colors.white),
                    ), //Icon(Icons.sort),
                  ), //,
                ),
              ];
            },
            child: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'To-dos',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            const Card(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search to-dos',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: sampleTodos.length,
                itemBuilder: (context, index) {
                  return Expanded(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          subtitle: Text(sampleTodos[index].content),
                          trailing: Checkbox(
                            value: isChecked,
                            onChanged: (index) {
                              setState(
                                () {
                                  isChecked = index;
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // SizedBox(
            //   height: 80,
            //   width: double.infinity,
            //   child: Card(
            //     elevation: 5,
            //     child: Padding(
            //       padding: const EdgeInsets.all(10.0),
            //       child: Align(
            //         alignment: Alignment.centerLeft,
            //         child: Row(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: const [
            //             Icon(
            //               Icons.circle_outlined,
            //               size: 15,
            //             ),
            //             SizedBox(
            //               width: 20,
            //             ),
            //             Text(
            //               'Tap on to-do content to edit it',
            //               textAlign: TextAlign.left,
            //             ),
            //             SizedBox(
            //               height: 10,
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 80,
            //   width: double.infinity,
            //   child: Card(
            //     elevation: 5,
            //     child: Padding(
            //       padding: const EdgeInsets.all(10.0),
            //       child: Align(
            //         alignment: Alignment.centerLeft,
            //         child: Row(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: const [
            //             Icon(
            //               Icons.circle_outlined,
            //               size: 15,
            //             ),
            //             SizedBox(
            //               width: 20,
            //             ),
            //             Text(
            //               'create your to-dos by typing',
            //               textAlign: TextAlign.left,
            //             ),
            //             SizedBox(
            //               height: 10,
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

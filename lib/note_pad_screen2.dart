// import 'dart:async';
// import 'dart:developer';

import 'package:flutter/material.dart';

import 'global_variables.dart';

// import 'database/ntdatabase.dart';
// import 'model/note.dart';
// import 'services/noteServices.dart';

class Notes extends StatefulWidget {
  final Note? note;
  const Notes({super.key, this.note});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  @override
  void initState() {
    if (widget.note != null) {
      _titleController = TextEditingController(text: widget.note!.title);
      _contentController = TextEditingController(text: widget.note!.content);
    }

    super.initState();
  }
  // List? _list;
  // Timer? _time;

  // Future getAllNote() async {
  //   _list = await NoteController().fetchAllNote();
  //   log(_list.toString());
  // }

  // @override
  // void initState() {
  //   getAllNote();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   title.dispose();
  //   description.dispose();
  // }

  // void clearInput() {
  //   title.clear();
  //   description.clear();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Expanded(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(DateTime.now().toString()),
                  TextField(
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                    controller: _titleController,
                    decoration: const InputDecoration(
                      hintText: 'Tittle',
                      hintStyle: TextStyle(
                        fontSize: 10,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                  SizedBox(
                    child: TextField(
                      maxLines: null,
                      controller: _contentController,
                      decoration: const InputDecoration(
                        hintText: 'Note something down',
                        hintStyle: TextStyle(
                          fontSize: 10,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Note noteInfo = Note(
                  //       id: null,
                  //       title: title.text,
                  //       description: description.text,
                  //       created_at: DateTime.now().toString(),
                  //     );

                  //   },

                  // child: const Center(
                  //   child: SizedBox(
                  //     child: Padding(
                  //       padding: EdgeInsets.all(8.0),
                  //       child: Text(
                  //         'Save',
                  //         style: TextStyle(
                  //           fontSize: 20,
                  //           color: Colors.blue,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  //child: ,
                  //),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: const Icon(
          Icons.save,
          size: 35,
        ),
        onPressed: () {
          //onPressed: () async {
          Navigator.pop(
              context, [_titleController.text, _contentController.text]);
          // if (title.text.isEmpty || description.text.isEmpty) {
          //   print("All Field are required");
          //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //       backgroundColor: Colors.red,
          //       content: Text('All Field are required')));
          // } else {
          //   Note noteInfo = Note(
          //       id: null,
          //       title: title.text,
          //       description: description.text,
          //       created_at: DateTime.now().toString());

          //   await NoteController().addNote(noteInfo).then((value) {
          //     if (value > 0) {
          //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //           backgroundColor: Colors.green,
          //           content: Text('Note Added Sucessful!')));
          //       log(_list.toString());
          //     } else {
          //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //           backgroundColor: Colors.red,
          //           content: Text('Fail to add note')));
          //     }
          //   });
          //}
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.picture_in_picture,
              color: Colors.white,
            ),
            label: 'Album',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mic,
              color: Colors.white,
            ),
            label: 'Audio',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.task_alt,
              color: Colors.white,
            ),
            label: 'To-do list',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.alarm,
              color: Colors.white,
            ),
            label: 'reminder',
          ),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   elevation: 10,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       Column(
      //         children: [
      //           IconButton(
      //             onPressed: () {},
      //             icon: const Icon(Icons.picture_in_picture),
      //           ),
      //           const Text(
      //             'Albums',
      //             style: TextStyle(
      //               fontSize: 10,
      //             ),
      //           ),
      //         ],
      //       ),
      //       Column(
      //         children: [
      //           IconButton(
      //             onPressed: () {},
      //             icon: const Icon(Icons.mic),
      //           ),
      //           const Text(
      //             'Audio',
      //             style: TextStyle(
      //               fontSize: 10,
      //             ),
      //           ),
      //         ],
      //       ),
      //       Column(
      //         children: [
      //           IconButton(
      //             onPressed: () {},
      //             icon: const Icon(Icons.task_alt),
      //           ),
      //           const Text(
      //             'To-do list',
      //             style: TextStyle(
      //               fontSize: 10,
      //             ),
      //           ),
      //         ],
      //       ),
      //       Column(
      //         children: [
      //           IconButton(
      //             onPressed: () {},
      //             icon: const Icon(
      //               Icons.alarm,
      //             ),
      //           ),
      //           const Text(
      //             'Reminder',
      //             style: TextStyle(
      //               fontSize: 10,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

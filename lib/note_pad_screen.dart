import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note_pad/global_variables.dart';
import 'package:note_pad/note_list.dart';
import 'package:note_pad/services/noteServices.dart';
import 'note_pad_screen2.dart';
import 'to_dos.dart';
import 'dart:ui';

class NotePadScreen extends StatefulWidget {
  const NotePadScreen({super.key});

  @override
  State<NotePadScreen> createState() => _NotePadScreenState();
}

class _NotePadScreenState extends State<NotePadScreen> {
  int currentPage = 0;
  List<Note> filteredNotes = [];

  // List? list;

  // Future getAllNote() async {
  //   list = await NoteController().fetchAllNote();
  //   log(list.toString());
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //     getAllNote();
  //   });
  // }

  void onSearchTextChanged(String searchText) {
    filteredNotes = sampleNotes
        .where((note) =>
            note.content.toLowerCase().contains(searchText.toLowerCase()) ||
            note.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }

  List<Widget> pages = const [NoteList(), ToDo()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Notes',
      //     style: TextStyle(
      //       fontSize: 30,
      //     ),
      //   ),
      // ),
      body: //Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: Column(
          //     children: [
          //       Card(
          //         child: TextField(
          //           onChanged: onSearchTextChanged,
          //           decoration: const InputDecoration(
          //             hintText: 'Search notes',
          //             hintStyle: TextStyle(
          //               color: Colors.white,
          //             ),
          //             prefixIcon: Icon(Icons.search),
          //             border: InputBorder.none,
          //           ),
          //         ),
          //       ),
          //       const SizedBox(
          //         height: 10,
          //       ),
          //       Expanded(
          //         child: ListView.builder(
          //             shrinkWrap: true,
          //             itemCount: list?.length,
          //             itemBuilder: (context, index) {
          //               return ListTile(
          //                 leading: Text(list![index]['id'].toString()),
          //                 title: Text(list![index]['title'].toString()),
          //                 subtitle: Text(list![index]['created_at'].toString()),
          //               );
          //             }),
          //       )
          //     ],
          //   ),
          // ),
          IndexedStack(
        index: currentPage,
        children: pages,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        onPressed: () async {
          if (currentPage == 0) {
            //?

            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Notes(),
              ),
            );
            if (result != null) {
              setState(() {
                sampleNotes.add(
                  Note(
                    id: sampleNotes.length,
                    title: result[0],
                    content: result[1],
                    modifiedTime: DateTime.now(),
                  ),
                );
                filteredNotes = sampleNotes;
              });
            }
          }
          //:
          else {
            showBottomSheet(context: context);
          }
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.note,
            ),
            label: 'Notes',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.task_alt,
            ),
            label: 'To-dos',
          ),
        ],
      ),
    );
  }
}

showBottomSheet({required BuildContext context}) {
  return showModalBottomSheet(
    backgroundColor: const Color.fromARGB(255, 53, 52, 52),
    context: context,
    builder: (context) {
      return Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Add a to-do item',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    DateTime? pickdate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                  },
                  child: Card(
                    elevation: 0,
                    child: Row(
                      children: const [
                        Icon(
                          Icons.alarm,
                          color: Colors.white,
                        ),
                        Text(
                          'Set alerts',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'SAVE',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

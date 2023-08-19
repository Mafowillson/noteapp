import 'package:flutter/material.dart';
import 'package:note_pad/note_pad_screen.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
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
                const PopupMenuItem(
                  child: Text('Sort by alert time'),
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
            SizedBox(
              height: 80,
              width: double.infinity,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.circle_outlined,
                          size: 15,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'welcome to To-do',
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.circle_outlined,
                          size: 15,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Tap on to-do content to edit it',
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.circle_outlined,
                          size: 15,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'create your to-dos by typing',
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        onPressed: () {
          _showBottomSheet(context: context);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotePadScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.article_outlined),
                ),
                const Text(
                  'Notes',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.task_alt),
                ),
                const Text(
                  'To-dos',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showBottomSheet({required BuildContext context}) {
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
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: const [
                            Icon(Icons.alarm),
                            Text(
                              'Set alerts',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Text('SAVE'),
                  ],
                ),
              ),
            ],
          );
        });
  }
}

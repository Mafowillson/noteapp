import 'package:flutter/material.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TextField(
            decoration: InputDecoration(
              hintText: 'Tittle',
              border: InputBorder.none,
            ),
          ),
          SizedBox(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Note something down',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.picture_in_picture),
                ),
                const Text(
                  'Albums',
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
                  icon: const Icon(Icons.mic),
                ),
                const Text(
                  'Audio',
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
                  'To-do list',
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
                  icon: const Icon(
                    Icons.alarm,
                    color: Color.fromARGB(198, 114, 114, 114),
                  ),
                ),
                const Text(
                  'Reminder',
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
}

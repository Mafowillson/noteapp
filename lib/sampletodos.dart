class ToDo {
  int id;
  String content;
  ToDo({required this.id, required this.content});
}

List<ToDo> sampleTodos = [
  ToDo(
    id: 0,
    content: 'welcome to To-do',
  ),
  ToDo(
    id: 1,
    content: 'Tap on to-do to edit it',
  ),
  ToDo(
    id: 2,
    content: 'create your to-dos by typing',
  ),
];

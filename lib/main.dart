import 'package:flutter/material.dart';
import 'package:note_pad/database/ntdatabase.dart';
import 'note_pad_screen.dart';

void main() {
  //async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await NoteDatabase.instance.db;
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(),
      home: const NotePadScreen(),
    );
  }
}

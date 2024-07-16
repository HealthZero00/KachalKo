import 'package:flutter/cupertino.dart';
import 'package:KachalKo/models/note.dart';
import 'package:KachalKo/data/sqlitehelper.dart';

class NoteData extends ChangeNotifier {
  final db = DatabaseHelper();

  List<Note> allNotes = [];

  void initializeNotes() async {
    allNotes = await db.getNotes();
    notifyListeners();
  }

  List<Note> getAllNotes() {
    return allNotes;
  }

  void addNewNote(Note note) async {
    allNotes.add(note);
    await db.insertNote(note);
    notifyListeners();
  }

  void updateNote(Note note, String text) async {
    for (int i = 0; i < allNotes.length; i++) {
      if (allNotes[i].id == note.id) {
        allNotes[i].text = text;
        break;
      }
    }
    await db.updateNote(note);
    notifyListeners();
  }

  void deleteNote(Note note) async {
    allNotes.remove(note);
    await db.deleteNote(note.id);
    notifyListeners();
  }
}

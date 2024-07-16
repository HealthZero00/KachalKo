import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:KachalKo/models/note.dart';
import 'package:KachalKo/pages/editingnotepage.dart';
import 'package:provider/provider.dart';
import 'package:KachalKo/models/note_data.dart';

class Notes extends StatefulWidget {
  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  void initState() {
    super.initState();
    Provider.of<NoteData>(context, listen: false).initializeNotes();
  }

  void createNewNote() {
    int id = Provider.of<NoteData>(context, listen: false).getAllNotes().length;

    Note newNote = Note(
      id: id,
      text: "",
    );

    goToNotePage(newNote, true);
  }

  void goToNotePage(Note note, bool isNewNote) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => Editingnotepage(
        note: note,
        isNewNote: isNewNote,
      ),
    ));
  }

  void deleteNote(Note note) {
    Provider.of<NoteData>(context, listen: false).deleteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Color(0xff006363),
        appBar: AppBar(
          backgroundColor: Color(0xff1D7373),
          title: Text(
            "KachalKo",
            style: TextStyle(fontSize: 24, color: Color(0xffFFAA00)),
          ),
          centerTitle: true,
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                spreadRadius: -2,
                blurRadius: 15,
                offset: Offset(5, 5),
              )
            ]
          ),
          child: FloatingActionButton(
            onPressed: createNewNote,
            backgroundColor: Color(0xff1D7373),
            elevation: 0,
            child: Icon(Icons.add, color: Color(0xffFFAA00)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25, top: 10),
                child: Text(
                  "Заметки",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFFAA00),
                  ),
                ),
              ),
              value.getAllNotes().isEmpty
                  ? Padding(
                padding: EdgeInsets.only(top: 50),
                child: Center(
                  child: Text(
                    "Тут ничего нет...",
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ),
              )
                  : CupertinoListSection.insetGrouped(
                backgroundColor: Color(0xff006363),
                children: List.generate(
                  value.getAllNotes().length,
                      (index) => CupertinoListTile(
                    title: Text(value.getAllNotes()[index].text, style: TextStyle(color: Color(0xffFFAA00)),),
                    backgroundColor: Color(0xff1D7373),
                    onTap: () => goToNotePage(value.getAllNotes()[index], false),
                    backgroundColorActivated:  Color(0xff006363),
                    trailing: IconButton(
                      color: Color(0xffFFAA00),
                      icon: Icon(Icons.delete),
                      onPressed: () => deleteNote(value.getAllNotes()[index]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

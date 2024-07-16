import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:KachalKo/models/note.dart';
import 'package:KachalKo/models/note_data.dart';
import 'package:KachalKo/pages/editingnotepage.dart';
import 'package:provider/provider.dart';

class Editingnotepage extends StatefulWidget{
  Note note;
  bool isNewNote;

  Editingnotepage({super.key, required this.note, required this. isNewNote});

  @override
  State<Editingnotepage> createState() => _EditingnotepageState();
}

class _EditingnotepageState extends State<Editingnotepage> {

  QuillController _controller = QuillController.basic();

  @override
  void initState() {
    super.initState();
    loadExistingNote();
  }


  void loadExistingNote() {
    final doc = Document()..insert(0, widget.note.text);
    setState(() {
      _controller = QuillController(document: doc, selection: TextSelection.collapsed(offset: 0));
    });
  }

  void addNewNote() {
    int id = Provider.of<NoteData>(context, listen: false).getAllNotes().length;
    String text = _controller.document.toPlainText();
    Provider.of<NoteData>(context, listen: false).addNewNote(
      Note(id: id, text: text)
    );
  }

  void updateNote() {
    String text = _controller.document.toPlainText();
    Provider.of<NoteData>(context, listen: false).updateNote(widget.note, text);
  }



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor:Color(0xff006364),
        appBar: AppBar(
          title: Text(
            "KachalKo",
            style: TextStyle(fontSize: 24, color: Color(0xffFFAA00)),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff1D7373),
          leading: IconButton(
            onPressed: () {
              if (widget.isNewNote && !_controller.document.isEmpty()) {
                addNewNote();
              }
              else{
                updateNote();
              }
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Color(0xffFFAA00),
          ),
        ),
        body: Column(
            children: [
              Container(
                color: Color(0xff006364),
                child: QuillToolbar.simple(
                    configurations: QuillSimpleToolbarConfigurations(
                      controller: _controller,
                      showAlignmentButtons: false,
                      showBackgroundColorButton: false,
                      showCenterAlignment: false,
                      showColorButton: false,
                      showCodeBlock: false,
                      showDirection: false,
                      showFontFamily: false,
                      showDividers: false,
                      showIndent: false,
                      showHeaderStyle: false,
                      showLink: false,
                      showSearchButton: false,
                      showInlineCode: false,
                      showQuote: false,
                      showListNumbers: false,
                      showListBullets: false,
                      showClearFormat: false,
                      showBoldButton: false,
                      showFontSize: false,
                      showItalicButton: false,
                      showUnderLineButton: false,
                      showStrikeThrough: false,
                      showListCheck: false,
                    )),
              ),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(25),
                    color: Color(0xff006364),
                    child: QuillEditor.basic(
                      configurations: QuillEditorConfigurations(
                        controller: _controller,
                        customStyles: DefaultStyles(
                          paragraph: DefaultTextBlockStyle(TextStyle(color: Color(0xffFFAA00), fontSize: 16),
                            VerticalSpacing(0,0),
                            VerticalSpacing(0,0),
                            BoxDecoration()
                          )
                        )
                      ),
                    ),
                  )
              )
            ]
        ),
      ),
    );
  }
}
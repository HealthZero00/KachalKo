class Note {
  int id;
  String text;

  Note({
    required this.id,
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
    };
  }
}

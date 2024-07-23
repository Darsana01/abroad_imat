import 'dart:convert';

class University {
  
  final String title;
  final List<String> content;

  University({required this.title, required this.content});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': jsonEncode(content), // Store content as a JSON string
    };
  }

  factory University.fromMap(Map<String, dynamic> map) {
    return University(
      title: map['title'],
      content: List<String>.from(jsonDecode(map['content'])),
    );
  }
}

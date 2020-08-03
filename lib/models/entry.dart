// Model Class for Journal Entry

class Entry {
  final int id;
  final String title;
  final String body;
  final String rating;
  final DateTime date;

  Entry({this.id, this.title,  this.body, this.rating, this.date});
}
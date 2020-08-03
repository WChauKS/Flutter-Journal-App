class JournalEntryDTO {
  String title;
  String body;
  String rating;
  String date;
  
  String toString() {
    return 'Title: $title, Body: $body, Date: $date, Rating: $rating';
  }
}
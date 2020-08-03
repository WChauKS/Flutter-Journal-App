class JournalEntryDTO {
  String title;
  String body;
  int rating;
  String date;
  
  String toString() {
    return 'Title: $title, Body: $body, Date: $date, Rating: $rating';
  }
}
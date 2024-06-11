class Book {
  String bookId;
  String bookName;
  String bookPdfUrl;
  String bookThumbnailUrl;

  Book({
    required this.bookId,
    required this.bookName,
    required this.bookPdfUrl,
    required this.bookThumbnailUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'bookId': bookId,
      'bookName': bookName,
      'bookPdfUrl': bookPdfUrl,
      'bookThumbnailUrl': bookThumbnailUrl,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      bookId: map['bookId'],
      bookName: map['bookName'],
      bookPdfUrl: map['bookPdfUrl'],
      bookThumbnailUrl: map['bookThumbnailUrl'],
    );
  }
}

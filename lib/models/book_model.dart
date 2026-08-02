
import 'dart:convert';

class BookModel {
  final String title;
  final String author;
  final String coverUrl;
  final String workKey;
  final int firstPublishYear;
  
 BookModel({
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.workKey,
    required this.firstPublishYear,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json["title"] ?? "Unknown Title",

      author: json["author_name"] != null &&
              (json["author_name"] as List).isNotEmpty
          ? json["author_name"][0]
          : "Unknown Author",

      coverUrl: json["cover_i"] != null
          ? "https://covers.openlibrary.org/b/id/${json["cover_i"]}-L.jpg"
          : "",

      workKey: json["key"] ?? "",

      firstPublishYear: json["first_publish_year"] ?? 0,
    );
  }


  BookModel copyWith({
    String? title,
    String? author,
    String? coverUrl,
    String? workKey,
    int? firstPublishYear,
  }) {
    return BookModel(
      title: title ?? this.title,
      author: author ?? this.author,
      coverUrl: coverUrl ?? this.coverUrl,
      workKey: workKey ?? this.workKey,
      firstPublishYear: firstPublishYear ?? this.firstPublishYear,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'author': author,
      'coverUrl': coverUrl,
      'workKey': workKey,
      'firstPublishYear': firstPublishYear,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      title: map['title'] as String,
      author: map['author'] as String,
      coverUrl: map['coverUrl'] as String,
      workKey: map['workKey'] as String,
      firstPublishYear: map['firstPublishYear'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  

  @override
  String toString() {
    return 'BookModel(title: $title, author: $author, coverUrl: $coverUrl, workKey: $workKey, firstPublishYear: $firstPublishYear)';
  }

  @override
  bool operator ==(covariant BookModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.author == author &&
      other.coverUrl == coverUrl &&
      other.workKey == workKey &&
      other.firstPublishYear == firstPublishYear;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      author.hashCode ^
      coverUrl.hashCode ^
      workKey.hashCode ^
      firstPublishYear.hashCode;
  }
}

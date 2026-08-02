class BookDetailModel {
  final String description;
  final List<String> subjects;

  BookDetailModel({
    required this.description,
    required this.subjects,
  });

  factory BookDetailModel.fromJson(Map<String, dynamic> json) {
    String description = "No description available.";

    if (json["description"] != null) {
      if (json["description"] is String) {
        description = json["description"];
      } else if (json["description"] is Map) {
        description = json["description"]["value"] ?? "No description available.";
      }
    }

    List<String> subjects = [];

    if (json["subjects"] != null) {
      subjects = List<String>.from(json["subjects"]);
    }

    return BookDetailModel(
      description: description,
      subjects: subjects,
    );
  }
}
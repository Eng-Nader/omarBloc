class CharacterQuotes {
  late String quotes;
  late CharacterAuthor characterAuthor;

  CharacterQuotes.fromJson(Map<String, dynamic> json) {
    quotes = json['sentence'];
    characterAuthor = CharacterAuthor.fromJson(json['character']);
  }
}

class CharacterAuthor {
  late String name, slug;
  CharacterAuthor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
  }
}

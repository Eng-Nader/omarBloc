class CharacterModel {
  final int id;
  final String fullName, firstName, lastName, image, titel, family;

  CharacterModel(
    this.family,
    this.firstName,
    this.fullName,
    this.id,
    this.image,
    this.lastName,
    this.titel,
  );

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      json['family'] ?? '',
      json['firstName'] ?? '',
      json['fullName'] ?? '',
      json['id'] ?? '',
      json['imageUrl'] ?? '',
      json['lastName'] ?? '',
      json['title'] ?? '',
    );
  }
}

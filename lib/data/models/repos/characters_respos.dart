import '../api_erroe.dart';
import '../character_model.dart';
import '../character_quotes.dart';
import '../../web_services/character_web_services.dart';

class CharactersRespos {
  final CharacterWebServices characterWebServices;
  CharactersRespos(this.characterWebServices);

  Future<dynamic> getCharacters() async {
    List<dynamic> characterList = await characterWebServices.getCharacters();

    try {
      return characterList
          .map((character) => CharacterModel.fromJson(character))
          .toList();
    } catch (e) {
      return ApiErroe.handler(e);
    }
  }

  Future<List<CharacterQuotes>> getQuotes() async {
    List<dynamic> quotes = await characterWebServices.getQuotes();
    return quotes.map((quote) => CharacterQuotes.fromJson(quote)).toList();
  }
}

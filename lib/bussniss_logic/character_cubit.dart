import 'package:flutter_bloc/flutter_bloc.dart';
import 'character_state.dart';
import '../data/models/api_erroe.dart';
import '../data/models/character_model.dart';
import '../data/models/repos/characters_respos.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(this.charactersRespos) : super(CharacterIntialState());
  final CharactersRespos charactersRespos;
  List<CharacterModel>? characters;

  List<CharacterModel> getAllCharacters() {
    emit(CharacterLoadingState());
    charactersRespos
        .getCharacters()
        .then(
          (characters) {
            emit(CharacterLoadedState(characters: characters));
            this.characters = characters;
          },
        )
        .catchError((error) {
          emit(
            CharacterFailureState(
              ApiErroe.handler(error),
            ),
          );
        });

    return characters ?? [];
  }

  void provideAllQuotes() {
    emit(CharacterLoadingState());
    charactersRespos.getQuotes().then(
      (quotes) {
        emit(CharacterLoadedQuotesState(quotes));
      },
    );
  }
}

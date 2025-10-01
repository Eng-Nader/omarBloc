import 'package:flutter/foundation.dart';
import '../data/models/api_erroe.dart';
import '../data/models/character_model.dart';
import '../data/models/character_quotes.dart';

sealed class CharacterState {}

class CharacterIntialState extends CharacterState {}

class CharacterLoadingState extends CharacterState {}

class CharacterLoadedState extends CharacterState {
  final List<CharacterModel> characters;
  CharacterLoadedState({required this.characters});
}

class CharacterFailureState extends CharacterState { 
  final ApiErroe apiErroe ; 
  CharacterFailureState(this.apiErroe); 
}



class CharacterLoadedQuotesState extends CharacterState { 
  final List <CharacterQuotes> characterQuotes ; 
  CharacterLoadedQuotesState(this.characterQuotes);
}


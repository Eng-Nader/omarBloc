import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bussniss_logic/character_cubit.dart';
import '../constants/constant.dart';
import '../data/models/character_model.dart';
import '../data/models/repos/characters_respos.dart';
import '../data/web_services/character_web_services.dart';
import '../views/details_view.dart';
import '../views/home_view.dart';

class AppRouter {
  late CharactersRespos charactersRespos;
  late CharacterCubit characterCubit;
  AppRouter() {
    charactersRespos = CharactersRespos(CharacterWebServices());
    characterCubit = CharacterCubit(charactersRespos);
  }
  Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case homeView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => characterCubit,

            child: HomeView(),
          ),
        );
      case detailsView:
        final charcter = setting.arguments as CharacterModel;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CharacterCubit(charactersRespos),
            // todo the character cubit is Created lazy  BlocProvider .of Context for active this provider
            child: DetailsViwe(
              character: charcter,
            ),
          ),
          settings: setting,
        );
    }
    return null;
  }
}

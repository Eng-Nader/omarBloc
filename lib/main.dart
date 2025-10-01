import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bussniss_logic/bloc_observer_implement.dart';
import 'core/app_router.dart';
import 'data/models/repos/characters_respos.dart';

void main() {
  Bloc.observer = BlocObserverImplement();

  runApp(
    OmarBloc(
      appRouter: AppRouter(),
    ),
  );

}

class OmarBloc extends StatelessWidget {
  const OmarBloc({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}

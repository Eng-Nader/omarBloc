

import 'package:flutter_bloc/flutter_bloc.dart';

class BlocObserverImplement extends BlocObserver {
  
  void closeCubit(BlocBase bloc) {
    super.onClose(bloc);
    print('Close Cubit $bloc');
  }


  void createCubit(BlocBase bloc) {
    super.onCreate(bloc);
    print('create Cubit $bloc');
  }
}

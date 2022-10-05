import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/local/shared_helper.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(InitialState()) ;

  static AppCubit get(context) => BlocProvider.of(context);


  bool isDark = false ;

  void changeThemeApp ({bool? fromShared})
  {
    if(fromShared != null){
    isDark = fromShared ;
    emit(NewsChangeThemeAppState());
    }else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeThemeAppState());
      });
    }

        emit(NewsChangeThemeAppState());
  }



}
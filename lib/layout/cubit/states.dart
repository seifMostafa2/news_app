abstract class NewsState{}

class InitialState extends NewsState{}

class BottomNav extends NewsState {}//علشان هغير فى البتوم ناف
class ChangeScreen extends NewsState {}

class NewsBusinessLoading extends NewsState {}

class NewsGetBusinessState extends NewsState {}

class NewsGetBusinessStateError extends NewsState {

  late final String error;
  NewsGetBusinessStateError(this.error);

}

class NewsSportsLoading extends NewsState {}

class NewsGetSportsState extends NewsState {}

class NewsGetSportsStateError extends NewsState {

  late final String error;
  NewsGetSportsStateError(this.error);

}

class NewsScienceLoading extends NewsState {}

class NewsGetScienceState extends NewsState {}

class NewsGetScienceStateError extends NewsState {

  late final String error;
  NewsGetScienceStateError(this.error);

}

class NewsChangeThemeAppState extends NewsState {}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_news_app/layout/cubit/states.dart';
import 'package:full_news_app/modules/business/business_module.dart';
import 'package:full_news_app/modules/science/science_module.dart';
import 'package:full_news_app/modules/sport/sport_module.dart';

import '../../modules/settings/settings.dart';
import '../../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(InitialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: "Business"),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),

  ];
  List<Widget> screen = [BusinessScreen(), ScienceScreen(), SportsScreen(),];

  void changeButtonNavBar(int index) {
    currentIndex = index;
    if (index == 1) getSportsData();
    if (index == 2) getScienceData();
    emit(BottomNav());
  }



  List<dynamic> business = [];


  void getBusinessData()
  {
    emit(NewsBusinessLoading());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '45ac00557b974efbb28ae8638ca1cc1c'
        }).then((value) {
      //print(value?.data['articles'][0]['title']);

      business = value?.data['articles'];

      print(business[0]['title']);
      emit(NewsGetBusinessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessStateError(error.toString()));
    });
  }


  List<dynamic> sports = [];


  void getSportsData()
  {
    emit(NewsBusinessLoading());

    if(sports.length ==0)
      {
        DioHelper.getData(
            url: 'v2/top-headlines',
            query: {
              'country': 'eg',
              'category': 'sports',
              'apiKey': '45ac00557b974efbb28ae8638ca1cc1c'
            }).then((value) {
          //print(value?.data['articles'][0]['title']);

          sports = value?.data['articles'];

          print(sports[0]['title']);
          emit(NewsGetSportsState());
        }).catchError((error) {
          print(error.toString());
          emit(NewsGetSportsStateError(error.toString()));
        });
      }else{
      emit(NewsGetSportsState());
    }


  }

  List<dynamic> science = [];


  void getScienceData()
  {
    emit(NewsBusinessLoading());

    if(science.length ==0)

      {
        DioHelper.getData(
            url: 'v2/top-headlines',
            query: {
              'country': 'eg',
              'category': 'science',
              'apiKey': '45ac00557b974efbb28ae8638ca1cc1c'
            }).then((value) {
          //print(value?.data['articles'][0]['title']);

          science = value?.data['articles'];

          print(science[0]['title']);
          emit(NewsGetScienceState());
        }).catchError((error) {
          print(error.toString());
          emit(NewsGetScienceStateError(error.toString()));
        });
      }else
        {
          emit(NewsGetScienceState());

        }


  }
}

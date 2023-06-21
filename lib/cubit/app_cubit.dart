import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_1/business_screen.dart';
import 'package:flutter_course_1/jobs_screen.dart';
import 'package:flutter_course_1/sports_screen.dart';
import 'package:meta/meta.dart';

import '../dio_helper.dart';
import '../news_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  AppCubit get(context) => BlocProvider.of(context);
  List screens = const [BusinessScreen(), SportScreen(), JobsScreen()];
  int index = 0;
  changeIndex(value) {
    index = value;
    emit(ChangeIndexState());
  }

  NewsModel? newsModel;
  getNews() {
    emit(NewsLoadingState());
    DioHelper.getData("top-headlines", queryParameters: {
      "country": "us",
      "category": "business",
      "apiKey": "a269e4f1de864efc85f38b36f1bae318"
    }).then((value) {
      newsModel = NewsModel.fromJson(value?.data);
      print(newsModel?.articles[0].title);
      emit(GetNewsSuccessState());
    }).catchError((error) {
      emit(GetNewsFailureState());
    });
  }

  NewsModel? searchModel;
  search(String word) {
    emit(SearchLoadingState());
    DioHelper.getData("everything", queryParameters: {
      "q": word,
      "apiKey": "a269e4f1de864efc85f38b36f1bae318"
    }).then((value) {
      searchModel = NewsModel.fromJson(value?.data);
      print(newsModel?.articles[0].title);
      emit(SearchSuccessState());
    }).catchError((error) {
      emit(SearchFailureState());
    });
  }
}

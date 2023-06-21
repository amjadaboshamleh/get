import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_1/components.dart';

import 'cubit/app_cubit.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        return BuildCondition(
          condition: state is! NewsLoadingState,
          builder: (context) {
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    articleController(cubit.newsModel?.articles[index], context),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: cubit.newsModel!.articles.length);
          },
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

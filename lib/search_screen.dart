import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_1/cubit/app_cubit.dart';

import 'components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit().get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        cubit.search(value);
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BuildCondition(
                      condition: state is! SearchLoadingState,
                      builder: (context) {
                        return ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => articleController(
                                cubit.searchModel?.articles[index], context),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 10,
                                ),
                            itemCount: cubit.searchModel?.articles.length ?? 0);
                      },
                      fallback: (context) => const Center(
                        child: LinearProgressIndicator(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

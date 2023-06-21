import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_1/dio_helper.dart';
import 'package:flutter_course_1/search_screen.dart';

import 'cubit/app_cubit.dart';
import 'news_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("NewsApp"),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ));
                  },
                  icon: Icon(Icons.search))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.index,
              onTap: (value) {
                cubit.changeIndex(value);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.newspaper), label: "Business"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports), label: "Sports"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.business_center), label: "jobs"),
              ]),
          body: cubit.screens[cubit.index],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_course_1/web_view_screen.dart';

Widget articleController(model, context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => WebScreen(url: model.url),
      ));
    },
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Image.network(
              "${model.image ?? "https://th.bing.com/th/id/OIP.-C1rBK_UqG-p6dsBS1Qd2QHaFH?w=290&h=200&c=7&r=0&o=5&dpr=1.3&pid=1.7"}",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${model.title}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

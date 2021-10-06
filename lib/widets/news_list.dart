import 'dart:collection';

import 'package:csp_mobile_app/api/news_api.dart';
import 'package:csp_mobile_app/models/news_dara.dart';
import 'package:csp_mobile_app/widets/new_item.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: FutureBuilder<List<New>>(
          future: getAllNews(),
          builder: (BuildContext context, AsyncSnapshot<List<New>> snapshot) {
            if (!snapshot.hasData && snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return NewItem(newItem: snapshot.data![index]);
                },
              );
            }
          }),
    );
  }
}

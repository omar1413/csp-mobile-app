import 'dart:async';
import 'dart:collection';

import 'package:csp_mobile_app/api/news_api.dart';
import 'package:csp_mobile_app/models/news_data.dart';
import 'package:csp_mobile_app/widets/new_item.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      child: FutureBuilder<List<New>>(
        future: getAllNews(),
        builder: (BuildContext context, AsyncSnapshot<List<New>> snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          news = snapshot.data!;

          return NewItem(news: snapshot.data!);
        },
      ),
    );
  }
}

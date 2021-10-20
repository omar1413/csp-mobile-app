import 'package:csp_mobile_app/api/transaction_api.dart';
import 'package:csp_mobile_app/models/transaction_data.dart';
import 'package:csp_mobile_app/widets/custom_appbar.dart';
import 'package:csp_mobile_app/widets/transaction_item.dart';
import 'package:csp_mobile_app/widets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TransactionListScreen extends StatefulWidget {
  static const routeName = '/TransactionListScreen';

  @override
  _TransactionListScreenState createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  bool rendered = false;

  static const _pageSize = 10;

  final PagingController<int, Transaction> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      List<Transaction> newItems;
      newItems = await getAllTransaction(pageNo: pageKey, pageSize: _pageSize);

      rendered = true;
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      print(error);
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppBar(title: "تاريخ المعاملات", context: context),
        body: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          child: PagedListView<int, Transaction>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Transaction>(
              noItemsFoundIndicatorBuilder: (ctx) {
                return Container();
              },
              itemBuilder: (context, item, index) => TransactionIteam(
                transaction: item,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

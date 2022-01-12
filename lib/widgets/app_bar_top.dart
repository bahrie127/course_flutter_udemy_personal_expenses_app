import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

typedef CtxFunc = void Function(BuildContext);

class AppBarTop extends StatelessWidget implements ObstructingPreferredSizeWidget{
  final CtxFunc handler;

  AppBarTop(this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              'Personal Expenses',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => handler(context),
                ),
              ],
            ),
          )
        : AppBar(
            title: Text('Personal Expenses App'),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => handler(context),
              ),
            ],
          );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}

import 'package:flutter/material.dart';

class DrawerSecao extends StatelessWidget {
  final IconData icone;
  final String texto;
  final PageController controller;
  final int page;

  DrawerSecao(this.icone, this.texto, this.controller, this.page);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          controller.jumpToPage(page);
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Icon(
                icone,
                size: 32.0,
                color: controller.page.round() == page
                    ? Theme.of(context).primaryColor
                    : Colors.grey[500],
              ),
              SizedBox(
                width: 32.0,
              ),
              Text(
                texto,
                style: TextStyle(
                  fontSize: 16.0,
                  color: controller.page.round() == page
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

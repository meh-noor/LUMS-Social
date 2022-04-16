

import 'package:flutter/material.dart';

class CustomPopup extends StatefulWidget {
  CustomPopup({
    required this.show,
    required this.items,
    required this.builderFunction,
    
  });

  final bool show;
  final List<dynamic> items;
  final Function(BuildContext context, dynamic item) builderFunction;

  @override
  _CustomPopupState createState() => _CustomPopupState();
}

class _CustomPopupState extends State<CustomPopup> {
  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !widget.show,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: widget.show ? MediaQuery.of(context).size.height / 3 : 0,
        width: MediaQuery.of(context).size.width / 3,
        child: Card(
          elevation: 3,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                Widget item = widget.builderFunction(
                  context,
                  widget.items[index],
                );
                return item;
              },
            ),
          ),
        ),
      ),
    );
  }
}

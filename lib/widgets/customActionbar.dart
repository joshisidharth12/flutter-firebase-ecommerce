import 'package:flutter/material.dart';
import 'package:storeapp/constants.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasBackArrow;
  final bool hasTitle;

  CustomActionBar({Key key, this.title, this.hasBackArrow, this.hasTitle});

  @override
  Widget build(BuildContext context) {
    bool _hasBackArrow = hasBackArrow ?? false;
    bool _hasTitle = hasTitle ?? true;

    return Container(
      padding:
          EdgeInsets.only(top: 50.0, left: 24.0, right: 24.0, bottom: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_hasBackArrow)
            Container(
                width: 42,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)),
                child: Image(
                  image: AssetImage(
                    "assets/images/back_arrow.png"
                  ),
                  color: Colors.white,
                  width: 16,
                  height: 16,
                )),
          if(hasTitle)
            Text(
              title ?? "Action Bar",
              style: Constants.boldHeading,
            ),

          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(8)),
            alignment: Alignment.center,
            child: Text(
              "0",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool outlineBtn;
  final bool isLoading;

  // ignore: non_constant_identifier_names
  CustomButton({this.text, this.onPressed, this.outlineBtn, this.isLoading});

  @override
  Widget build(BuildContext context) {
    bool _outlineBtn = outlineBtn ?? false;
    bool _isLoading = isLoading ?? false;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: _outlineBtn ? Colors.transparent : Colors.black,
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(left: 24, right: 24, bottom: 8),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Stack(
          children: [
            Visibility(
              visible: _isLoading ? false : true,
              child: Center(
                child: Text(
                  text ?? "Text",
                  style: TextStyle(
                      fontSize: 16,
                      color: _outlineBtn ? Colors.black : Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Visibility(
              visible: _isLoading,
              child: Center(
                child: SizedBox(
                    height: 30.0, width: 30.0, child: CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

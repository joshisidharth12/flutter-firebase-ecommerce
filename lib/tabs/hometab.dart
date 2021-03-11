import 'package:flutter/material.dart';
import 'package:storeapp/widgets/customActionbar.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Container(
        child: Stack(
          children: [
            Center(
              child: Text("Home tab"),
            ),
            CustomActionBar(
              title: "Home",
              hasTitle: true,
              hasBackArrow: false,
            ),
          ],
        ),
      );
  }
}

import 'package:flutter/material.dart';
import 'package:storeapp/widgets/customActionbar.dart';

class SavedTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Text("Saved tab"),
          ),
          CustomActionBar(
            title: "Saved",
            hasTitle: true,
            hasBackArrow: true,
          ),
        ],
      ),
    );
  }
}

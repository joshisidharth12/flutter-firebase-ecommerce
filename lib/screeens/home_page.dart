import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/constants.dart';
import 'package:storeapp/tabs/hometab.dart';
import 'package:storeapp/tabs/saved_tab.dart';
import 'package:storeapp/tabs/search_tab.dart';
import 'package:storeapp/widgets/bottom_tabs.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  PageController _tabsPageController ;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              controller: _tabsPageController,
              onPageChanged: (num){
                setState(() {
                  _selectedTab =num;
                });
              },
              children: [
                HomeTab(),

                SearchTab(),

                SavedTab(),
              ],
            ),
          ),

          BottomTabs(
            selectedTab: _selectedTab,
            tabPressed: (num){
              setState(() {
                _tabsPageController.animateToPage(num, duration: Duration(milliseconds: 260), curve: Curves.easeOutCubic);
              });
            },
          ),

        ],
      )
    );
  }
}

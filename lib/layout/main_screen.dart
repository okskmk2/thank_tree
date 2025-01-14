import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thank_tree/common/styles.dart';
import 'package:thank_tree/pages/leaf/leaf_form_lobby_page.dart';
import 'package:thank_tree/pages/post_office_page.dart';
import 'package:thank_tree/pages/home_page.dart';
import 'package:thank_tree/pages/vase_list_page.dart';

class MainScreen extends StatefulWidget {
  final int selectedIndex;
  const MainScreen({Key? key, this.selectedIndex = 0}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  final List<Widget> pages = <Widget>[
    HomePage(),
    LeafFormLobbyPage(),
    VaseListPage(),
    PostOfficePage()
  ];

  @override
  Widget build(BuildContext context) {
    Color inactiveColor = Color(0xffC0C3CA);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10,
        unselectedFontSize: 10,
        selectedItemColor: CustomStyles.primaryColor,
        unselectedItemColor: inactiveColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '홈',
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: inactiveColor,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: CustomStyles.primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            label: '감사카드 쓰기',
            icon: SvgPicture.asset(
              'assets/icons/감사카드쓰기아이콘.svg',
              color: inactiveColor,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/감사카드쓰기아이콘.svg',
              color: CustomStyles.primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            label: '화분 보관함',
            icon: SvgPicture.asset(
              'assets/icons/화분보관함아이콘.svg',
              color: inactiveColor,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/화분보관함아이콘.svg',
              color: CustomStyles.primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            label: '화분 우체국',
            icon: Icon(Icons.local_post_office),
          ),
        ],
      ),
      body: SafeArea(child: pages.elementAt(_selectedIndex)),
    );
  }
}

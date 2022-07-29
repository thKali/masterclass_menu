// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:masterclass_menu/src/assets/db_icons.dart';
import 'package:masterclass_menu/src/home/components/atividades_page/atividades_page.dart';
import 'package:masterclass_menu/src/home/components/bottomNavBar/bottom_nav_bar.dart';

import 'components/bottomNavBar/bottom_nav_bar_item/bottom_nav_bar_item_model.dart';
import 'components/dev_page/dev_page.dart';

class HomePage extends StatefulWidget {
  final void Function() switchDarkMode;

  const HomePage(
    this.switchDarkMode, {
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 1;

  void changeSelectedIndexByPageView(int newindex) {
    selectedIndex = newindex;
    setState(() {});
  }

  void changeSelectedIndex(int newindex) {
    selectedIndex = newindex;
    pageController.animateToPage(selectedIndex,
        duration: Duration(milliseconds: 350), curve: Curves.easeOut);
    setState(() {});
  }

  var pageController = PageController(
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: buildAppBar(context),
      body: PageView(
        controller: pageController,
        children: [
          AtividadesPage(),
          Center(
            child: Text(
              'Nada aqui ainda...',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          DevPage(),
        ],
        onPageChanged: changeSelectedIndexByPageView,
      ),
      bottomNavigationBar: BottomNavBar(
        items: [
          BottomNavBarItemModel(
            icon: Icons.adjust_sharp,
            label: 'Atividades',
          ),
          BottomNavBarItemModel(
            icon: DBIcons.git,
            label: 'Repositórios',
          ),
          BottomNavBarItemModel(
            icon: Icons.person,
            label: 'Sobre o dev',
          ),
        ],
        selectedIndex: selectedIndex,
        callback: changeSelectedIndex,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    var title = selectedIndex == 0
        ? 'Atividades'
        : selectedIndex == 1
            ? 'Repositórios'
            : 'Sobre o dev';

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.asset('assets/images/logo_masterclass.png'),
          ),
          SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.headline1),
              Text(
                'Flutterando Masterclass',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {
            widget.switchDarkMode();
          },
          icon: const Icon(DBIcons.moon),
          color: Theme.of(context).colorScheme.surface,
        ),
      ],
    );
  }
}

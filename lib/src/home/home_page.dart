// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:masterclass_menu/src/app.dart';
import 'package:masterclass_menu/src/assets/db_icons.dart';
import 'package:masterclass_menu/src/home/components/atividades_page/atividades_page.dart';
import 'package:masterclass_menu/src/home/components/bottomNavBar/bottom_nav_bar.dart';

import 'components/bottomNavBar/bottom_nav_bar_item/bottom_nav_bar_item_model.dart';
import 'components/dev_page/dev_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
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
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void callChangeTheme() {
    var myTheme = MyTheme.of(context);
    myTheme.switchDarkMode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: PROBLEMA AO ABRIR URL`S, STATUSBAR
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: buildAppBar(
        context,
        logoVisibility: true,
        selectedIndex: selectedIndex,
        callback: callChangeTheme,
      ),
      body: PageView(
        controller: pageController,
        children: [
          AtividadesPage(
            switchDarkMode: callChangeTheme,
            appBarBuilder: buildAppBar,
          ),
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
            label: 'Reposit??rios',
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

  AppBar buildAppBar(BuildContext context,
      {int? selectedIndex,
      String? title,
      bool? logoVisibility,
      required void Function() callback}) {
    String newTitle;

    if (title == null && selectedIndex != null) {
      newTitle = selectedIndex == 0
          ? 'Atividades'
          : selectedIndex == 1
              ? 'Reposit??rios'
              : 'Sobre o dev';
    } else {
      newTitle = title ?? 'Sem t??tulo';
    }

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          if (logoVisibility ?? false)
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset('assets/images/logo_masterclass.png'),
            )
          else
            IconButton(
              onPressed: () {
                Navigator.canPop(context) ? Navigator.pop(context) : null;
              },
              icon: Icon(Icons.arrow_back_ios,
                  color: Theme.of(context).colorScheme.surface),
            ),
          SizedBox(width: logoVisibility ?? false ? 4 : 0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(newTitle, style: Theme.of(context).textTheme.headline1),
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
          onPressed: callback,
          icon: const Icon(DBIcons.moon),
          color: Theme.of(context).colorScheme.surface,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:snapbuy/helper/network_info.dart';
import 'package:snapbuy/view/screen/chat/inbox_screen.dart';
import 'package:snapbuy/localization/language_constrants.dart';
import 'package:snapbuy/utill/images.dart';
import 'package:snapbuy/view/screen/home/home_screen.dart';
import 'package:snapbuy/view/screen/more/more_screen.dart';
import 'package:snapbuy/view/screen/notification/notification_screen.dart';
import 'package:snapbuy/view/screen/order/order_screen.dart';

class DashBoardScreen extends StatefulWidget {

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  PageController _pageController = PageController();
  int _pageIndex = 0;

  List<Widget> _screens ;

  GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _screens = [
      HomePage(),
    
      InboxScreen(isBackButtonExist: false),
      OrderScreen(isBacButtonExist: false),
      NotificationScreen(isBacButtonExist: false),
      MoreScreen(),
    ];

    NetworkInfo.checkConnectivity(context);

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(_pageIndex != 0) {
          _setPage(0);
          return false;
        }else {
          return true;
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).textTheme.bodyText1.color,
          showUnselectedLabels: true,
          currentIndex: _pageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            _barItem(Images.home_image, getTranslated('home', context), 0),
            //TODO: seller
            _barItem(Images.message_image, getTranslated('inbox', context), 1),
            _barItem(Images.shopping_image, getTranslated('orders', context), 2),
            _barItem(Images.notification, getTranslated('notification', context), 3),
            _barItem(Images.more_image, getTranslated('more', context), 4),
          ],
          onTap: (int index) {
            _setPage(index);
          },
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            return _screens[index];
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _barItem(String icon, String label, int index) {
    return BottomNavigationBarItem(

      icon: Image.asset(
        icon, color: index == _pageIndex ? Theme.of(context).primaryColor : Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5),
        height: 25, width: 25,
      ),
      label: label,
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }

}
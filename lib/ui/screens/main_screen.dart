import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/ui/screens/home_screen.dart';
import 'package:pos/ui/screens/profile_screen.dart';
import 'package:pos/ui/screens/transaction_screen.dart';
import 'package:pos/services/isar_service.dart';
import 'package:pos/ui/widgets/logo.dart';
import 'package:pos/ui/widgets/logout.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String pageActive = 'Home';

  pageView() {
    switch (pageActive) {
      case 'Home':
        return HomeScreen(
          isarService: IsarService(),
        );
      case 'Transaction':
        return const TransactionScreen();
      case 'Profile':
        return ProfileScreen();
      default:
        return Container();
    }
  }

  setPage(String page) {
    setState(() {
      pageActive = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff1f2029),
      body: Row(
        children: [
          Container(
            width: 90,
            padding: const EdgeInsets.only(top: 24, right: 12, left: 12),
            height: MediaQuery.of(context).size.height,
            child: sideMenu(),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 24, right: 12),
              padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                color: Color(0xff17161f),
              ),
              child: pageView(),
            ),
          ),
        ],
      ),
    );
  }

  Widget sideMenu() {
    return Column(
      children: [
        const Logo(),
        const SizedBox(
          height: 150,
        ),
        Expanded(
          child: ListView(
            children: [
              itemMenu(
                menu: 'Home',
                icon: Icons.home,
              ),
              itemMenu(
                menu: 'Transaction',
                icon: Icons.payment,
              ),
              itemMenu(
                menu: 'Profile',
                icon: Icons.account_circle,
              ),
              const SizedBox(
                height: 160,
              ),
              const LogOut(),
            ],
          ),
        ),
      ],
    );
  }

  Widget itemMenu({required String menu, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: GestureDetector(
        onTap: () => setPage(menu),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: AnimatedContainer(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: pageActive == menu ? Colors.red : Colors.transparent,
            ),
            duration: const Duration(milliseconds: 300),
            curve: Curves.slowMiddle,
            child: Column(
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 40,
                  shadows: const [
                    Shadow(color: Colors.black, offset: Offset(4, 2))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  menu,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

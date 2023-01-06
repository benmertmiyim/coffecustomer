import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:coffecustomer/const.dart';
import 'package:coffecustomer/ui/screen/main/campaigns_screen.dart';
import 'package:coffecustomer/ui/screen/main/home_screen.dart';
import 'package:coffecustomer/ui/screen/main/notifications_screen.dart';
import 'package:coffecustomer/ui/screen/main/profile_screen.dart';
import 'package:coffecustomer/ui/screen/main/qr_screen.dart';
import 'package:coffecustomer/ui/theme/app_notifier.dart';
import 'package:coffecustomer/ui/theme/app_theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  final List<Widget> _widgetOptions = const <Widget>[
    HomeScreen(),
    QRScreen(),
    ProfileScreen(),
    CampaignsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        theme = AppTheme.theme;
        customTheme = AppTheme.customTheme;
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: FxText.titleLarge(
              title,
              fontWeight: 700,
            ),
            centerTitle: true,
            actions: [
              IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const NotificationsScreen(),),);
              }, icon: Icon(
                MdiIcons.bellRingOutline,
                size: 22,
                color: theme.colorScheme.onBackground,
              ),),
            ],
          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.background,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8),
                child: GNav(
                  gap: 8,
                  iconSize: 24,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: theme.colorScheme.primaryContainer,
                  tabs: const [
                    GButton(
                      icon: MdiIcons.coffee,
                      text: 'Home',
                    ),
                    GButton(
                      icon: MdiIcons.qrcode,
                      text: 'QR',
                    ),
                    GButton(
                      icon: MdiIcons.faceManProfile,
                      text: 'Profile',
                    ),
                    GButton(
                      icon: MdiIcons.gift,
                      text: 'Campaigns',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (i) {
                    setState(() {
                      _selectedIndex = i;
                    });
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
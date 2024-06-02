import 'package:real_estate/utils/imports/generalImports.dart';

class Dashboard extends HookWidget {
  Dashboard({super.key});

  final Map<TabItem, Widget> pageList = {
    TabItem.search: const SearchScreen(),
    TabItem.message: Container(),
    TabItem.home: const HomeScreen(),
    TabItem.likes: Container(),
    TabItem.profile: Container(),
  };

  @override
  Widget build(BuildContext context) {
    final tabItem = useState(TabItem.home);
    return BaseUi(
      refreshedEnabled: false,
      bottomNavigationBar: BottomNavigation(
        currentTab: tabItem.value,
        onSelectTab: (item) {
          tabItem.value = item;
        },
      ),
      children: [
        PageTransitionSwitcher(
          duration: const Duration(
            milliseconds: 200,
          ),
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              FadeTransition(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation),
            child: child,
          ),
          child: pageList[tabItem.value],
        ),
      ],
    );
  }
}

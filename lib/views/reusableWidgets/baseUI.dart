import 'package:real_estate/utils/imports/generalImports.dart';

class BaseUi extends StatelessWidget {
  final List<Widget> children;
  final FloatingActionButton? floatingActionButton;
  final PreferredSizeWidget? appBar;
  final Widget? endDrawer;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final bool? allowBackButton;
  final bool? safeTop;
  final bool? safeBottom;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Function? onRefreshFunction;
  final bool refreshedEnabled;
  final bool? resizeToAvoidBottomInset;

  const BaseUi({
    super.key,
    this.allowBackButton,
    required this.children,
    this.floatingActionButton,
    this.appBar,
    this.endDrawer,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.safeTop,
    this.safeBottom,
    this.scaffoldKey,
    this.refreshedEnabled = true,
    this.resizeToAvoidBottomInset = true,
    this.onRefreshFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final model = ref.watch(baseUiProvider);
        final screenSize = MediaQuery.of(context).size;
        return PopScope(
          canPop: allowBackButton ?? true,
          child: !refreshedEnabled
              ? Scaffold(
                  key: scaffoldKey,
                  appBar: appBar,
                  bottomSheet: bottomSheet,
                  extendBody: true,
                  bottomNavigationBar: bottomNavigationBar,
                  resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                  body: SafeArea(
                    top: safeTop ?? false,
                    bottom: safeBottom ?? false,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xffF8F8F8),
                            Color(0xffF5D8B4),
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          ...children,
                          model.isBusyState
                              ? Container(
                                  height: screenSize.height,
                                  width: screenSize.width,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground
                                      .withOpacity(0.5),
                                  child: Center(
                                    child: customDialog(
                                      Center(child: loading()),
                                      align: Alignment.center,
                                      height: 150,
                                      width: 150,
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                  floatingActionButton: floatingActionButton,
                  endDrawer: endDrawer,
                )
              : RefreshIndicator(
                  displacement: 100,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  color: Theme.of(context).colorScheme.onPrimary,
                  strokeWidth: 3,
                  triggerMode: RefreshIndicatorTriggerMode.onEdge,
                  onRefresh: () async {
                    if (onRefreshFunction != null) {
                      return onRefreshFunction!();
                    }
                  },
                  child: Scaffold(
                    key: scaffoldKey,
                    appBar: appBar,
                    extendBody: true,
                    bottomNavigationBar: bottomNavigationBar,
                    resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                    body: SafeArea(
                      bottom: safeBottom ?? false,
                      top: safeTop ?? false,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Theme.of(context).colorScheme.background,
                        child: Stack(
                          children: [
                            ...children,
                            model.isBusyState
                                ? Container(
                                    height: screenSize.height,
                                    width: screenSize.width,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(0xffF8F8F8),
                                          Color(0xffF5D8B4),
                                        ],
                                      ),
                                    ),
                                    child: Center(
                                      child: customDialog(
                                        Center(child: loading()),
                                        align: Alignment.center,
                                        height: 150,
                                        width: 150,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    floatingActionButton: floatingActionButton,
                    endDrawer: endDrawer,
                  ),
                ),
        );
      },
    );
  }
}
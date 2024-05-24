import 'package:ecommerce_app/src/routes/app_navigation.dart';
import 'package:ecommerce_app/src/routes/app_pages.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  final Widget child;
  final String path;

  const NavigationPage({
    super.key,
    required this.child,
    required this.path,
  });

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _current = AppPages.bottomPages
        .indexWhere((element) => widget.path.startsWith(element.path));

    debugPrint(_current.toString());
  }

  onTap(int i) {
    AppNavigation.to(AppPages.bottomPages[i]);
  }

  @override
  void didUpdateWidget(covariant NavigationPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _current = AppPages.bottomPages
        .indexWhere((element) => widget.path.startsWith(element.path));
    setState(() {});
    debugPrint(_current.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: widget.child,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(360),
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(360),
            color: Colors.black,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            onTap: onTap,
            backgroundColor: Colors.transparent,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.yellowAccent,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            currentIndex: _current,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.cable),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.offline_pin),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.margin),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DummyPage extends StatelessWidget {
  final int countCross;
  final Color color;

  const DummyPage({
    super.key,
    required this.color,
    required this.countCross,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
      itemCount: 999,
      padding: const EdgeInsets.all(10),
      itemBuilder: (c, i) {
        return InkWell(
          onTap: () {
            AppNavigation.to(AppPages.detailScreen);
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
            child: Text(
              "${i + 1}",
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: countCross,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    ));
  }
}

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("DetailScreen"),
      ),
    );
  }
}

import 'package:flutter/material.dart';
// followed https://stackoverflow.com/questions/54757480/flutter-dynamic-theming

final ThemeData lightMode = ThemeData.light();
final ThemeData darkMode = ThemeData.dark();

class ThemeSwitcher extends InheritedWidget {
  final _ThemeSwitcherWidgetState data;

  const ThemeSwitcher({Key key, this.data, Widget child}) : super(key: key, child: child);

  static _ThemeSwitcherWidgetState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeSwitcher>().data;
  }

  @override
  bool updateShouldNotify(ThemeSwitcher oldWidget) => oldWidget != this;
}

class ThemeSwitcherWidget extends StatefulWidget {
  final ThemeData initTheme;
  final Widget child;

  ThemeSwitcherWidget({Key key, this.initTheme, this.child}) : super(key: key);

  @override
  _ThemeSwitcherWidgetState createState() => _ThemeSwitcherWidgetState();
}

class _ThemeSwitcherWidgetState extends State<ThemeSwitcherWidget> {
  ThemeData curTheme;

  void switchTheme(ThemeData newTheme) {
    setState(() {
      curTheme = newTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    curTheme = curTheme ?? widget.initTheme;
    return ThemeSwitcher(
      data: this,
      child: widget.child,
    );
  }
}
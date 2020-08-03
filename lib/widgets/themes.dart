import 'package:flutter/material.dart';
// followed https://stackoverflow.com/questions/54757480/flutter-dynamic-theming

ThemeData lightMode = ThemeData.light();
ThemeData darkMode = ThemeData.dark();

class ThemeHandler extends InheritedWidget {
  final ThemeData theme;
  ThemeHandler({this.theme, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ThemeHandler of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<ThemeHandler>();
}

class ThemeHandlerWidget extends StatefulWidget {
  final ThemeData initTheme;
  final Widget child;

  ThemeHandlerWidget({Key key, this.initTheme, this.child});

  @override
  _ThemeHandlerWidgetState createState() => _ThemeHandlerWidgetState();
}

class _ThemeHandlerWidgetState extends State<ThemeHandlerWidget> {
  ThemeData theme;

  void changeTheme(ThemeData newTheme) {
    setState(() {
      theme = newTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    theme = theme ?? widget.initTheme;
    return ThemeHandler(
      theme: theme,
      child: widget.child,
    );
  }
}
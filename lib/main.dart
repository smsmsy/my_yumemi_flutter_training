import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final GlobalKey _textKey = GlobalKey();
  double _textHeight = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox =
          _textKey.currentContext!.findRenderObject()! as RenderBox;
      setState(() {
        _textHeight = renderBox.size.height;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final placeholderHeight = screenWidth / 2;
    const paddingHeight = 16.0 * 2; // 上下のPaddingの合計

    final topWidgetsHeight = placeholderHeight + _textHeight + paddingHeight;
    final topOffset = (screenHeight - topWidgetsHeight) / 2;

    final fontSize = Theme.of(context).textTheme.labelLarge?.fontSize;
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: topOffset),
                const Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Placeholder(),
                    ),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      key: _textKey,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '** ℃',
                          style: TextStyle(
                            fontSize: fontSize,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          '** ℃',
                          style: TextStyle(
                            fontSize: fontSize,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 80),
                FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text('Close'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Reload'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

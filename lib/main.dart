import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 2;
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size,
                height: size,
                child: const Placeholder(
                  fallbackHeight: 100,
                  fallbackWidth: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size / 2,
                      child: const Center(
                        child: Text(
                          '** ℃',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size / 2,
                      child: const Center(
                        child: Text(
                          '** ℃',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size / 2,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Close'),
                    ),
                  ),
                  SizedBox(
                    width: size / 2,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Reload'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

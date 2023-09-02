import 'package:assignment_4/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main() {


  testWidgets('SplashScreen widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: SplashScreen(),
      ),
    );
    expect(find.byType(SplashScreen), findsOneWidget);
    expect(find.text('TODO List'), findsOneWidget);
    expect(find.byType(SpinKitFoldingCube), findsOneWidget);
  });

  testWidgets('SplashScreen navigation test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SplashScreen(),
      ),
    );
    await tester.pump(Duration(seconds: 4));
    expect(find.byType(MaterialApp), findsOneWidget);
  });


  final container = ProviderContainer();

  tearDown(() {
    container.dispose();
  });

  testWidgets('MyHomePage widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: MyHomePage(),
        ),
      ),
    );
    expect(find.byType(MyHomePage), findsOneWidget);
    expect(find.text('Todo List'), findsOneWidget);

  });

}




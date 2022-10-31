import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:spread/menuPage/menuView.dart';

import 'login_test.mocks.dart';

void main() {
  group('menuView', () {
    testWidgets('Render title text', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: menuView(),
      ));
      final titleFinder = find.text('Menus');

      expect(titleFinder, findsOneWidget);
    });

    testWidgets('Render any CardTile', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: menuView(),
      ));
      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('Test for num of cards being equal to num of saved menus',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: menuView(),
      ));
      expect(find.byType(Card), findsNWidgets(menuList().entries.length));
    });

    testWidgets('Test onPressed IconButton functionality',
        (WidgetTester tester) async {
      final mockObserve = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: menuView(),
        navigatorObservers: [mockObserve],
      ));
      await tester.tap(find.widgetWithText(Card, 'First placeholder'));
      verify(mockObserve.didPush(any, any));
    });
  });
}

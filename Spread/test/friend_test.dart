import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:spread/friendPage/friendView.dart';

import 'login_test.mocks.dart';

void main() {
  group('friendView', () {
    testWidgets('Render Favorite text', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: friendView(),
      ));
      final titleFinder = find.text('Friend List');

      expect(titleFinder, findsOneWidget);
    });

    testWidgets('Render any CardTile', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: friendView(),
      ));
      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('Test for num of cards being equal to num of favorites',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: friendView(),
      ));
      expect(find.byType(Card), findsNWidgets(friendList().entries.length));
    });
  });

  testWidgets('Test onPressed Card functionality', (WidgetTester tester) async {
    final mockObserve = MockNavigatorObserver();
    await tester.pumpWidget(MaterialApp(
      home: friendView(),
      navigatorObservers: [mockObserve],
    ));
    await tester.tap(find.widgetWithText(Card, 'First placeholder'));
    verify(mockObserve.didPush(any, any));
  });
}

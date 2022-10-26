import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:spread/favPage/favView.dart';

import 'login_test.mocks.dart';

void main() {
  group('favView', () {
    testWidgets('Render any CardTile', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: favView(),
      ));
      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('Test for num of cards being equal to num of favorites',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: favView(),
      ));
      expect(find.byType(Card), findsNWidgets(favList().entries.length));
    });

    testWidgets('Test onPressed Card functionality',
        (WidgetTester tester) async {
      final mockObserve = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: favView(),
        navigatorObservers: [mockObserve],
      ));
      await tester.tap(find.widgetWithText(Card, 'First placeholder'));
      verify(mockObserve.didPush(any, any));
    });

    testWidgets('Render Favorite text', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: favView(),
      ));

      final titleFinder = find.text('Favorites');

      expect(titleFinder, findsOneWidget);
    });

    testWidgets('Render any IconButtons', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: favView(),
      ));
      expect(find.byType(IconButton), findsWidgets);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:spread/searchPage/list_view.dart';
import 'package:spread/searchPage/search_appbar.dart';

import 'login_test.mocks.dart';

void main() {
  group('listView', () {
    testWidgets('Render at least 1 CardTile', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: launchListTile(),
      ));

      expect(find.byType(Card), findsAtLeastNWidgets(1));
    });

    //testWidgets('Cards are sorted by Star Rating',);

    testWidgets('Test onPressed Card functionality',
        (WidgetTester tester) async {
      final mockObserve = MockNavigatorObserver();

      await tester.pumpWidget(MaterialApp(
        home: launchListTile(),
        navigatorObservers: [mockObserve],
      ));

      await tester.tap(find.widgetWithText(Card, 'First placeholder'));
      verify(mockObserve.didPush(any, any));
    });

    /*testWidgets('Test onPressed of Favorite IconButton',
        (WidgetTester tester) async {
      final mockObserve = MockNavigatorObserver();

      await tester.pumpWidget(MaterialApp(
        home: launchListTile(),
        navigatorObservers: [mockObserve],
      ));

      await tester.tap(find.widgetWithText(IconButton, 'Second Placeholder'));
    });*/
    // This should be for when the buttons have their own function and whatnot
  });
}

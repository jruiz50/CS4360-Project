import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:spread/itemPage/itemView.dart';

void main() {
  group('itemView', () {
    testWidgets('Render Icons', (WidgetTester tester) async {
      FlutterError.onError = ignoreOverflowErrors;
      // This is meant to ignore overflow errors

      await tester.pumpWidget(MaterialApp(
        home: itemView(),
      ));
      expect(find.byType(Icon), findsWidgets);
    });

    testWidgets('Render 8 total texts', (WidgetTester tester) async {
      /* This checks for all text fields including the appbar name, appbar restaraunt
      item type, description, ingredients, and notable allergens.

      Keep in mind that these will overflow if the list is too long.
      */

      FlutterError.onError = ignoreOverflowErrors;
      // This is meant to ignore overflow errors
      await tester.pumpWidget(MaterialApp(
        home: itemView(),
      ));

      expect(find.byType(Text), findsNWidgets(8));
    });

    testWidgets('Render two TextButtons', (WidgetTester tester) async {
      /* This checks if only two text buttons are rendered*/

      FlutterError.onError = ignoreOverflowErrors;
      // This is meant to ignore overflow errors
      await tester.pumpWidget(MaterialApp(
        home: itemView(),
      ));

      expect(find.byType(TextButton), findsNWidgets(2));
    });
  });
}

void ignoreOverflowErrors(FlutterErrorDetails details,
    {bool forceReport = false}) {
  bool isOverflowError = false;

  var exception = details.exception;
  if (exception is FlutterError) {
    isOverflowError = !exception.diagnostics.any(
      (e) => e.value.toString().startsWith("A RenderFlex overflowed by"),
    );
  }

  if (isOverflowError) {
    debugPrint('Ignored overflow error.');
  } else {
    FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
  }
}

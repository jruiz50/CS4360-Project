import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:spread/loginPage/loginView.dart';
import 'package:mockito/annotations.dart';
import 'login_test.mocks.dart';


@GenerateMocks(
  [],
  customMocks: [
    MockSpec<NavigatorObserver>(
      returnNullOnMissingStub: true,
    )
  ]
)


void main(){


  group('loginView', () {


    testWidgets('Render two textFields', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: loginView(),
      ));
      expect(find.byType(TextField), findsNWidgets(2));
    });

    testWidgets('Render three ElevatedButtons & One SignInButton', (WidgetTester tester) async{
      await tester.pumpWidget(MaterialApp(
        home: loginView(),
      ));
      expect(find.byType(ElevatedButton), findsNWidgets(3));
      expect(find.byType(SignInButton),findsOneWidget);
    });


    testWidgets('Test for "Crave" & Logo Image', (WidgetTester tester) async{
      await tester.pumpWidget(MaterialApp(
        home: loginView(),
      ));

      String logoPath = 'lib/loginAssets/forkSpoon.png';

      final titleFinder = find.text('Crave');
      final logoAssetExists = File(logoPath).existsSync();

      expect(titleFinder, findsOneWidget);
      expect(logoAssetExists, isTrue);
    });

    testWidgets('Test Button Functionality', (WidgetTester tester) async{
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: loginView(),
        navigatorObservers: [mockObserver],
      ));

      await tester.tap(find.widgetWithText(ElevatedButton, 'Sign In'));
      verify(mockObserver.didPush(any, any));

    });

    testWidgets('Account Button Functionality', (WidgetTester tester) async{
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: loginView(),
        navigatorObservers: [mockObserver],
      ));

      await tester.tap(find.widgetWithText(ElevatedButton, 'Create Account'));
      verify(mockObserver.didPush(any, any));

    });

    testWidgets('Guest Button Functionality', (WidgetTester tester) async{
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: loginView(),
        navigatorObservers: [mockObserver],
      ));

      await tester.tap(find.widgetWithText(ElevatedButton, 'Continue as Guest'));
      verify(mockObserver.didPush(any, any));
    });

    testWidgets('Google Sign In Button Functionality', (WidgetTester tester) async{
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: loginView(),
        navigatorObservers: [mockObserver],
      ));

      await tester.tap(find.byType(SignInButton));
      verify(mockObserver.didPush(any, any));
      //Continue above for the rest of the buttons
    });



  });

}
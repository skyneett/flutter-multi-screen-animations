// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_4/main.dart';

void main() {
  testWidgets('App multi-estado muestra pantalla principal', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our app shows the main screen with the title
    expect(find.text('Pantalla Principal'), findsOneWidget);
    expect(find.text('Selecciona una opción'), findsOneWidget);

    // Verify that the three buttons are present
    expect(find.text('Ir a Pantalla 1'), findsOneWidget);
    expect(find.text('Ir a Pantalla 2'), findsOneWidget);
    expect(find.text('Ir a Pantalla 3'), findsOneWidget);

    // Tap the first button and trigger a frame
    await tester.tap(find.text('Ir a Pantalla 1'));
    await tester.pumpAndSettle();

    // Verify that we navigated to Pantalla 1
    expect(find.text('Pantalla 1'), findsOneWidget);
    expect(find.text('¡Bienvenido a la Pantalla 1!'), findsOneWidget);
  });
}

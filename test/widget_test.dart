import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_app/app.dart';
import 'package:ecommerce_app/screens/home_screen.dart';

void main() {
  testWidgets('App loads home screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify that HomeScreen is rendered.
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}

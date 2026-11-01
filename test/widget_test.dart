import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/app/movie_app.dart';

void main() {
  testWidgets('App menampilkan Now Playing', (WidgetTester tester) async {
    await tester.pumpWidget(const MovieApp());
    expect(find.text('Now Playing'), findsOneWidget);
  });
}

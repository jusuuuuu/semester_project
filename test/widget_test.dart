import 'package:flutter_test/flutter_test.dart';
import 'package:semester_project/main.dart';

void main() {
  testWidgets('LutoReco home page loads', (WidgetTester tester) async {
    await tester.pumpWidget(const LutoRecoApp());

    expect(find.text('LutoReco'), findsWidgets);
    expect(find.text('How LutoReco Works'), findsOneWidget);
  });
}
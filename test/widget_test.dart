import 'package:flutter_test/flutter_test.dart';

import 'package:semester_project/app.dart';

void main() {
  testWidgets('LutoReco app loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const LutoRecoApp());

    expect(find.text('LutoReco'), findsWidgets);
    expect(find.text('How LutoReco Works'), findsOneWidget);
  });
}

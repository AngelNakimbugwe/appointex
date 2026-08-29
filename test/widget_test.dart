import 'package:flutter_test/flutter_test.dart';

import 'package:appointex/app/app.dart';

void main() {
  testWidgets('app boots to /onboarding placeholder', (tester) async {
    await tester.pumpWidget(const AxApp());
    await tester.pumpAndSettle();

    expect(find.text('Client Onboarding'), findsOneWidget);
  });
}

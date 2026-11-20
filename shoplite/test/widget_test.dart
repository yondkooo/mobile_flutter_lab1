import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:shoplite/main.dart';

void main() {
  testWidgets('+ товч тоог нэмэгдүүлнэ', (WidgetTester tester) async {
    await tester.pumpWidget(const ShopLiteApp());

    expect(find.text('0'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('− товч тоог хасна, 0-ээс доош орохгүй', (tester) async {
    await tester.pumpWidget(const ShopLiteApp());

    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('2'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.remove));
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('10 хүрвэл + идэвхгүй, анхааруулга гарна', (tester) async {
    await tester.pumpWidget(const ShopLiteApp());

    for (var i = 0; i < 10; i++) {
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
    }
    expect(find.text('10'), findsOneWidget);
    expect(find.textContaining('10-аас олон'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('10'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);
  });
}

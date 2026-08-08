import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:streak/features/habits/data/habit.dart';
import 'package:streak/services/notification_service.dart';

import '../support/app_harness.dart';

void main() {
  group('categoryFor', () {
    test('negative habit maps to the snooze category', () {
      expect(
        NotificationService.categoryFor(
          testHabit(
            id: 'h',
            name: 'Test',
            color: const Color(0xFF00FF00),
            kind: HabitKind.negative,
          ),
        ),
        NotificationService.actionSnooze,
      );
    });

    test('quantitative habit maps to the add category', () {
      expect(
        NotificationService.categoryFor(
          testHabit(
            id: 'h',
            name: 'Test',
            color: const Color(0xFF00FF00),
            kind: HabitKind.quantitative,
          ),
        ),
        NotificationService.actionAdd,
      );
    });

    test('habit with a target above one maps to the add category', () {
      expect(
        NotificationService.categoryFor(
          testHabit(
            id: 'h',
            name: 'Test',
            color: const Color(0xFF00FF00),
            perDayTarget: 3,
          ),
        ),
        NotificationService.actionAdd,
      );
    });

    test('simple positive habit maps to the done category', () {
      expect(
        NotificationService.categoryFor(
          testHabit(id: 'h', name: 'Test', color: const Color(0xFF00FF00)),
        ),
        NotificationService.actionDone,
      );
    });
  });
}

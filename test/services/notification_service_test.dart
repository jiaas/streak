import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:streak/features/habits/data/habit.dart';
import 'package:streak/services/notification_service.dart';

Habit _habit({HabitKind kind = HabitKind.positive, int target = 1}) => Habit(
      id: 'h',
      name: 'Test',
      color: const Color(0xFF00FF00),
      order: 0,
      kind: kind,
      perDayTarget: target,
    );

void main() {
  group('categoryFor', () {
    test('negative habit maps to the snooze category', () {
      expect(
        NotificationService.categoryFor(_habit(kind: HabitKind.negative)),
        NotificationService.actionSnooze,
      );
    });

    test('quantitative habit maps to the add category', () {
      expect(
        NotificationService.categoryFor(
          _habit(kind: HabitKind.quantitative),
        ),
        NotificationService.actionAdd,
      );
    });

    test('habit with a target above one maps to the add category', () {
      expect(
        NotificationService.categoryFor(_habit(target: 3)),
        NotificationService.actionAdd,
      );
    });

    test('simple positive habit maps to the done category', () {
      expect(
        NotificationService.categoryFor(_habit()),
        NotificationService.actionDone,
      );
    });
  });
}

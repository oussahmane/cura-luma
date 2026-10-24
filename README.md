# CuraLuma

A little care, every day.

CuraLuma is an Android-first medication reminder. It stores the schedule on the phone, rings locally, and does not use an account, ads, a subscription, or a server. It does not diagnose, prescribe, recommend a dose change, or promise that every reminder will fire.

The current version is `1.0.0+1`. The Android application ID is still `com.example.cura_luma`. That ID is the Flutter template and Google Play rejects `com.example`. Change it to a real reverse-DNS ID before publication. Do not change it in source until that ID is chosen.

## Setup

Requirements used for the commands below: Flutter 3.44 stable (Dart 3.12), Android SDK with the platform that matches Flutter's compile SDK, and a JDK 17 toolchain.

```bash
flutter pub get
dart run build_runner build
flutter gen-l10n
flutter test
flutter build apk --release
```

`flutter pub get` generates localization as well, because `pubspec.yaml` sets `flutter: generate: true`. Drift's `lib/database/app_database.g.dart` is already checked in with the schema; run `build_runner` again after changing `lib/database/tables.dart`.

The release APK is signed with the debug keystore (`signingConfig` in `android/app/build.gradle.kts`). Replace that with an upload key before Play. No payment secret or personal data is stored in the project.

## Architecture

```text
lib/
  app/          theme, Riverpod providers, GoRouter, MaterialApp
  core/         dose policy, ids, local dates, time zone lookup, text direction
  database/     Drift schema version 1
  features/     onboarding, today, medicines, history, settings,
                scheduling, notifications, refills, backup
  l10n/         English, French, and Arabic ARB files and generated code
  shared/       layout, status chips, formatting
```

Riverpod owns the database, clock, time zone, preferences, and the reminder service. GoRouter uses a shell for Today, Medicines, History, and Settings. The scheduling rules live in `lib/features/scheduling` and do not depend on widgets. `ReminderService` is the only place that writes doses, supply, and the notification plan.

The database file is `curaluma` (SQLite through Drift). Foreign keys are enabled. Schema version is 1. Dates are stored as `yyyy-MM-dd`. Instants are stored as unix seconds and read back as local `DateTime` values for the same instant.

There is no encryption. A backup is a JSON file the user exports and imports explicitly. Import replaces all local data after the file passes schema checks.

## What the app does

Onboarding states the purpose, that notifications can be missed, the language choice, and that there is no account.

Today lists the day's doses in time order, including upcoming, due, taken, skipped, missed, and postponed doses, plus a next-dose card. Take, skip, and postpone act once. A second tap on an already recorded outcome does not create another row or decrement supply again.

A medicine has a name, an amount and unit typed by the user, a form, notes, instructions, a start date, an optional end date, one or more clock times, weekdays, an optional color, and an optional gallery photo. The amount is a label, not a calculated medical dose. Archive keeps history and stops future reminders. Delete removes the medicine, its doses, its photo file, and its notifications.

History filters by medicine and date and shows weekly and monthly summaries. Adherence uses only doses that are taken, skipped, missed, or still pending after the due window has closed. Upcoming doses, doses still inside the due window, open postponements, and paused doses are left out. The percentage is taken divided by that eligible set, and it is omitted when nothing is eligible. Editing a future schedule does not rewrite rows that were already recorded.

Supply falls only when the amount is a plain number (`10`, `2.5`, or `2,5`) and a remaining quantity was entered. Crossing the threshold schedules one estimate notice. The banner and the notice both say the figure is an estimate. Words and fractions are not decremented or projected. The remaining quantity can be corrected by hand.

Settings cover English, French, Arabic, or the system language, light, dark, or system theme, notification on/off, postpone length (15, 30, or 60 minutes), a privacy note, export, import, delete-all, the app version, and help. Arabic uses a right-to-left layout. A medicine name that starts with Arabic is drawn right-to-left even when the app language is English, and a Latin name stays left-to-right in Arabic.

## Scheduling rules

An occurrence ID is `{medicineId}|{yyyy-MM-dd}|{minutesFromMidnight}`. The minutes are the wall-clock time, not UTC.

Weekdays use Monday as bit 0 through Sunday as bit 6. Every medicine has one weekday mask shared by all of its times.

A dose is upcoming before its scheduled instant, due for 60 minutes after that instant (or after a postpone time), and then missed by the system. Take and skip are allowed early and after a miss. Postpone is allowed while the dose is upcoming, due, or already postponed. A missed dose cannot be postponed.

Rows the user marked taken, skipped, or missed stay that way, including after a time-zone change or a clock rollback. A system miss returns to pending if the clock moves back inside the due window.

A pause covers `[startedAt, endedAt)`. Those doses become paused rather than missed and are not part of adherence. Resume closes the pause. Future paused rows return to pending. Past paused rows stay paused.

Archive stamps `archivedAt`. Occurrences at or after that instant are not created. Future pending, postponed, and paused rows are deleted. History remains.

Creating a medicine fills from its start date, clamped to a 90-day lookback, through 7 days ahead, including past misses. Editing times, weekdays, or the start or end date sets `scheduleRevisedAt` to now and does not invent occurrences before that instant. Opening the app later only fills the gap after `scheduleRevisedAt`, so a newly added evening time is not written as a miss for earlier days.

Daylight saving, using the `timezone` package:

- A missing local time, such as 02:30 on the spring-forward day, moves to the next valid minute.
- A repeated local time, such as 01:30 on the fall-back day, is stored once at the earlier instant.

Changing time zone recomputes the UTC instant for pending, postponed, and paused rows that the user has not locked. IDs stay the same. A postpone time stays an absolute instant. Recorded rows keep their original scheduled instant.

## Notifications

Reminders use `flutter_local_notifications`. The text is “Medication reminder” plus the medicine name and the amount the user entered. Take and skip actions open the app and record the dose there. Exact alarms are requested with `SCHEDULE_EXACT_ALARM` only when the system allows them. Otherwise the app schedules inexact alarms. `USE_EXACT_ALARM` is not declared.

The planner keeps at most 64 notifications inside the next 7 days. Past doses are not scheduled. They remain on Today. If the app stays closed for more than 7 days, later reminders wait until the next open. The plugin's boot receiver restores alarms that were already scheduled. Dart does not run at boot, so the rolling window is not extended until the app opens.

Turning notifications off cancels scheduled alerts. Doses can still be recorded in the app. Archive and delete cancel that medicine's future alerts.

Android permissions: `POST_NOTIFICATIONS`, `RECEIVE_BOOT_COMPLETED`, `SCHEDULE_EXACT_ALARM`, and `VIBRATE`. There is no camera, storage, full-screen intent, or notification-policy permission. Photos come from the gallery.

Notification channel names are fixed by Android after the channel is created. Changing language does not rename an existing channel.

## Tests and the release build

These commands were run in this workspace after the implementation:

| Command | Result |
| --- | --- |
| `flutter analyze` | No issues found |
| `flutter test` | 32 tests passed |
| `flutter test integration_test -d linux` | 5 tests passed |
| `flutter build apk --release` | Built `build/app/outputs/flutter-apk/app-release.apk` (64.6MB) |

The unit tests cover weekday expansion, daylight-saving wall times, dose actions, the reconciler (including user-locked history, pauses, and clock rollback), adherence, refill parsing, the notification cap, backup validation, and SQLite reopen, rollback, and a single supply decrement.

The widget and Linux integration tests cover the empty Today screen, onboarding without an account, Arabic right-to-left layout, rejecting a medicine with no name, and recording one saved dose from Today. The integration target was the Linux desktop. No Android phone or emulator was connected, so notification delivery, the exact-alarm prompt, Do Not Disturb, and boot restore were not run on a device.

## Limits

- Reminders depend on the phone. Battery limits, Do Not Disturb, a denied permission, a force stop, or more than 7 days without opening the app can skip or delay an alert.
- The database and the exported JSON file are not encrypted.
- Supply math is an estimate from the number the user typed. It is not dosing advice.
- One weekday pattern applies to every time on that medicine.
- The release APK is signed with the debug key. Play will not accept it as an upload.
- `com.example.cura_luma` cannot be the Play application ID.
- The in-app privacy page is not a hosted privacy-policy URL.

## Google Play

1. Choose a final application ID, set `namespace` and `applicationId`, and move the Kotlin package to match. Rebuild after that change.
2. Create an upload keystore outside the repo and point the release `signingConfig` at it. Do not commit the keystore or passwords.
3. In Play Console, create the app as a paid one-time download. Put the price, such as $2.99, in the console. There is no in-app purchase code.
4. Host a privacy-policy URL. The app has no account and no network backend. Say that medication names, notes, photos, and history stay on the device, that export is a user action, and that the store is not encrypted.
5. Complete Data safety: data is not collected or shared by the developer. Note that notifications and exact alarms are device permissions, not server collection.
6. Declare the health context honestly. CuraLuma is a personal reminder, not a medical device, and it does not diagnose or treat.
7. Explain `POST_NOTIFICATIONS` and `SCHEDULE_EXACT_ALARM` in the permission declarations. Exact alarms are optional. The app falls back to inexact alarms.
8. Upload a release signed with the upload key. The APK built here is a local debug-signed check, not the Play artifact.
9. On a physical phone, confirm the notification permission, an exact or inexact alarm, take and skip from the notification, a reboot, archive, and delete.

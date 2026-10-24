/// Explicit timing rules shared by scheduling, history, and notifications.
///
/// Due window: a pending dose is "due" from its scheduled instant until
/// [dueGrace] has passed. After that it becomes missed unless it was paused.
///
/// Scheduling horizon: occurrences and notifications are created through
/// [scheduleHorizon] ahead. Android is not given an open-ended alarm list.
///
/// Lookback: when the current schedule has been in effect, missing past
/// occurrences are filled in only back to [lookback]. Older days are left
/// unrecorded rather than invented.
class DosePolicy {
  const DosePolicy._();

  static const dueGrace = Duration(minutes: 60);
  static const scheduleHorizon = Duration(days: 7);
  static const lookback = Duration(days: 90);
  static const maxScheduledNotifications = 64;

  static const postponeChoices = <int>[15, 30, 60];
  static const defaultPostponeMinutes = 15;
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'CuraLuma';

  @override
  String get tagline => 'A little care, every day.';

  @override
  String get navToday => 'Today';

  @override
  String get navMedicines => 'Medicines';

  @override
  String get navHistory => 'History';

  @override
  String get navSettings => 'Settings';

  @override
  String get splashLoading => 'Opening CuraLuma';

  @override
  String get onboardingWelcomeTitle => 'A little care, every day.';

  @override
  String get onboardingWelcomeBody =>
      'CuraLuma keeps the medication schedule you enter and helps you record what you took. There is no account to create.';

  @override
  String get onboardingDisclaimer =>
      'CuraLuma does not diagnose, prescribe, or suggest a dose. It only reminds you of the schedule you saved.';

  @override
  String get onboardingNotificationsTitle => 'Reminders on this phone';

  @override
  String get onboardingNotificationsBody =>
      'Reminders are notifications on this device. You can record a dose from the notification when Android allows actions, or open the app and record it here.';

  @override
  String get onboardingNotificationsLimit =>
      'Android can delay or block a notification because of battery saving, Do Not Disturb, or an exact-alarm setting. CuraLuma cannot promise that every reminder will appear.';

  @override
  String get onboardingLanguageTitle => 'Choose a language';

  @override
  String get onboardingLanguageBody =>
      'You can follow the phone language, or choose English, French, or Arabic. You can change this later in Settings.';

  @override
  String get languageSystem => 'Phone language';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageArabic => 'العربية';

  @override
  String get actionContinue => 'Continue';

  @override
  String get actionBack => 'Back';

  @override
  String get actionStart => 'Start';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get actionConfirm => 'Confirm';

  @override
  String get actionDelete => 'Delete';

  @override
  String get actionSave => 'Save';

  @override
  String get actionArchive => 'Archive';

  @override
  String get actionUnarchive => 'Restore';

  @override
  String get actionClose => 'Close';

  @override
  String get actionEdit => 'Edit';

  @override
  String get actionDiscard => 'Discard';

  @override
  String get actionKeepEditing => 'Keep editing';

  @override
  String onboardingStep(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get todayHeading => 'Today';

  @override
  String get todayEmptyTitle => 'Nothing scheduled yet';

  @override
  String get todayEmptyBody =>
      'Add a medicine and the times you want to be reminded. CuraLuma will list today\'s doses here.';

  @override
  String get actionAddMedicine => 'Add a medicine';

  @override
  String get nextDoseTitle => 'Next dose';

  @override
  String get noNextDose => 'No upcoming dose today';

  @override
  String get scheduleHeading => 'Today\'s schedule';

  @override
  String get statusUpcoming => 'Upcoming';

  @override
  String get statusDue => 'Due';

  @override
  String get statusTaken => 'Taken';

  @override
  String get statusSkipped => 'Skipped';

  @override
  String get statusMissed => 'Missed';

  @override
  String get statusPostponed => 'Postponed';

  @override
  String get statusPaused => 'Paused';

  @override
  String get actionTaken => 'Taken';

  @override
  String get actionSkip => 'Skip';

  @override
  String get actionPostpone => 'Postpone';

  @override
  String get alreadyRecorded => 'This dose is already recorded.';

  @override
  String get actionRejected => 'That change is not available for this dose.';

  @override
  String get doseRecorded => 'Dose recorded.';

  @override
  String semanticsTaken(String name) {
    return 'Record $name as taken';
  }

  @override
  String semanticsSkip(String name) {
    return 'Record $name as skipped';
  }

  @override
  String semanticsPostpone(String name) {
    return 'Postpone $name';
  }

  @override
  String get todayNotificationsOff =>
      'Reminders are turned off. You can still record doses in the app.';

  @override
  String get actionEnableNotifications => 'Turn on reminders';

  @override
  String lowSupplyBanner(String name) {
    return 'The supply you entered for $name is at or below the refill threshold.';
  }

  @override
  String get dueWindowExplain =>
      'A dose stays due for one hour, then it is marked missed unless you record it.';

  @override
  String get medicinesHeading => 'Medicines';

  @override
  String get medicinesEmptyTitle => 'No medicines yet';

  @override
  String get medicinesEmptyBody =>
      'Add the name, the amount you take, and the times. CuraLuma stores this only on this phone.';

  @override
  String get archivedHeading => 'Archived';

  @override
  String get medicineNewTitle => 'New medicine';

  @override
  String get medicineEditTitle => 'Edit medicine';

  @override
  String get medicineDetailsTitle => 'Medicine';

  @override
  String get fieldName => 'Name';

  @override
  String get fieldDoseAmount => 'Amount';

  @override
  String get fieldDoseUnit => 'Unit';

  @override
  String get fieldForm => 'Form';

  @override
  String get fieldNotes => 'Notes';

  @override
  String get fieldInstructions => 'Instructions';

  @override
  String get fieldStartDate => 'Start date';

  @override
  String get fieldEndDate => 'End date';

  @override
  String get fieldNoEndDate => 'No end date';

  @override
  String get fieldTimes => 'Reminder times';

  @override
  String get fieldWeekdays => 'Days';

  @override
  String get fieldColor => 'Color';

  @override
  String get fieldPhoto => 'Photo';

  @override
  String get fieldSupply => 'Supply on hand';

  @override
  String get fieldRefillThreshold => 'Refill threshold';

  @override
  String get nameHint => 'Name you will recognize';

  @override
  String get amountHint => 'As you take it, for example 1 or 5';

  @override
  String get unitHint => 'For example mg, ml, or tablet';

  @override
  String get notesHint => 'Optional note for yourself';

  @override
  String get instructionsHint => 'Optional instructions you already have';

  @override
  String get supplyHint => 'Optional quantity you have left';

  @override
  String get thresholdHint => 'Optional point at which to remind you';

  @override
  String get actionAddTime => 'Add a time';

  @override
  String actionRemoveTime(String time) {
    return 'Remove $time';
  }

  @override
  String get actionChoosePhoto => 'Choose a photo';

  @override
  String get actionRemovePhoto => 'Remove photo';

  @override
  String get formTablet => 'Tablet';

  @override
  String get formCapsule => 'Capsule';

  @override
  String get formLiquid => 'Liquid';

  @override
  String get formDrops => 'Drops';

  @override
  String get formInjection => 'Injection';

  @override
  String get formOther => 'Other';

  @override
  String get weekdayMon => 'Mon';

  @override
  String get weekdayTue => 'Tue';

  @override
  String get weekdayWed => 'Wed';

  @override
  String get weekdayThu => 'Thu';

  @override
  String get weekdayFri => 'Fri';

  @override
  String get weekdaySat => 'Sat';

  @override
  String get weekdaySun => 'Sun';

  @override
  String get validationName => 'Enter a name.';

  @override
  String get validationDose => 'Enter the amount you take.';

  @override
  String get validationUnit => 'Enter a unit.';

  @override
  String get validationTime => 'Add at least one time.';

  @override
  String get validationDuplicateTime => 'That time is already listed.';

  @override
  String get validationWeekday => 'Choose at least one day.';

  @override
  String get validationEndDate =>
      'The end date must be on or after the start date.';

  @override
  String get validationSupply => 'Supply cannot be negative.';

  @override
  String get validationThreshold =>
      'The threshold cannot be negative, and it needs a supply amount.';

  @override
  String get validationLength => 'That text is too long.';

  @override
  String get deleteMedicineTitle => 'Delete this medicine?';

  @override
  String deleteMedicineBody(String name) {
    return 'Delete $name? Its schedule and history will be removed from this phone. This cannot be undone.';
  }

  @override
  String get archiveMedicineTitle => 'Archive this medicine?';

  @override
  String archiveMedicineBody(String name) {
    return 'Archive $name? Future reminders stop. Past records stay in History.';
  }

  @override
  String get pauseMedicine => 'Pause reminders';

  @override
  String get resumeMedicine => 'Resume reminders';

  @override
  String get pausedBanner =>
      'Reminders are paused. Doses during the pause are not counted as missed.';

  @override
  String get scheduleEditNote =>
      'Changing times or days updates future reminders. Doses you already recorded stay as they are.';

  @override
  String get medicineSaved => 'Medicine saved.';

  @override
  String get medicineDeleted => 'Medicine deleted.';

  @override
  String get photoFailed => 'The photo could not be saved.';

  @override
  String get requiredLegend =>
      'Name, amount, unit, a time, and a day are required.';

  @override
  String get discardTitle => 'Discard changes?';

  @override
  String get discardBody => 'Your edits to this medicine will not be saved.';

  @override
  String get clearEndDate => 'Clear end date';

  @override
  String doseLabel(String amount, String unit) {
    return '$amount $unit';
  }

  @override
  String get noNotes => 'No notes';

  @override
  String get instructionsHeading => 'Instructions';

  @override
  String get notesHeading => 'Notes';

  @override
  String get refillHeading => 'Supply';

  @override
  String get refillExplanation =>
      'This estimate uses the amount and schedule you entered. It is not a medical recommendation.';

  @override
  String get refillCannotEstimate =>
      'The amount is not a plain number, so supply is not estimated from the schedule. You can still correct the quantity yourself.';

  @override
  String refillRemaining(String amount) {
    return 'Remaining: $amount';
  }

  @override
  String dosesLeft(int count) {
    return 'About $count scheduled doses left';
  }

  @override
  String get estimatedLabel => 'Estimate';

  @override
  String get manualSupplyLabel => 'Entered by you';

  @override
  String get refillCorrect => 'Correct supply';

  @override
  String get refillSaved => 'Supply updated.';

  @override
  String get refillLow => 'At or below your refill threshold';

  @override
  String get historyHeading => 'History';

  @override
  String get historyEmptyTitle => 'No doses in this range';

  @override
  String get historyEmptyBody =>
      'Recorded, skipped, and missed doses appear here. Upcoming doses stay on Today.';

  @override
  String get filterMedicine => 'Medicine';

  @override
  String get filterAllMedicines => 'All medicines';

  @override
  String get filterFrom => 'From';

  @override
  String get filterTo => 'To';

  @override
  String get summaryWeek => 'This week';

  @override
  String get summaryMonth => 'This month';

  @override
  String get adherenceLabel => 'Recorded as taken';

  @override
  String get adherenceEmpty => 'No doses were due in this period.';

  @override
  String get adherenceExplanation =>
      'The percentage is taken doses divided by doses that were already due. Paused doses and doses still waiting are left out. Changing a future schedule does not change these records.';

  @override
  String countTaken(int count) {
    return 'Taken $count';
  }

  @override
  String countSkipped(int count) {
    return 'Skipped $count';
  }

  @override
  String countMissed(int count) {
    return 'Missed $count';
  }

  @override
  String countEligible(int count) {
    return 'Counted $count';
  }

  @override
  String adherenceValue(String percent) {
    return '$percent%';
  }

  @override
  String get settingsHeading => 'Settings';

  @override
  String get sectionAppearance => 'Appearance';

  @override
  String get sectionLanguage => 'Language';

  @override
  String get sectionNotifications => 'Reminders';

  @override
  String get sectionData => 'Your data';

  @override
  String get sectionAbout => 'About';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get notificationsEnabled => 'Medication reminders';

  @override
  String get exactAlarmTitle => 'Exact alarms';

  @override
  String get exactAlarmGranted =>
      'This phone allows exact alarms, so reminders can use a precise time.';

  @override
  String get exactAlarmMissing =>
      'Exact alarms are off. Reminders still schedule, but Android may deliver them a little later.';

  @override
  String get exactAlarmAction => 'Review exact alarms';

  @override
  String get notificationSettingsAction => 'Notification settings';

  @override
  String get reliabilityTitle => 'When a reminder might not appear';

  @override
  String get reliabilityBody =>
      'Battery optimization, Do Not Disturb, a restart, or a denied notification permission can all stop a reminder. After a restart, already scheduled reminders are restored. The app keeps the next seven days of reminders and refreshes that list when you open it.';

  @override
  String get horizonNote =>
      'Reminders are scheduled for the next 7 days, up to 64 at a time.';

  @override
  String get bootRecoveryNote =>
      'After the phone restarts, Android restores the reminders that were already scheduled.';

  @override
  String get clockChangeNote =>
      'If the clock or time zone changes, future reminders follow the new local time. Doses you already recorded are not rewritten. A missed dose that the app marked by itself returns to the schedule if the clock moves back into its due hour.';

  @override
  String get postponeLabel => 'Postpone length';

  @override
  String get postpone15 => '15 minutes';

  @override
  String get postpone30 => '30 minutes';

  @override
  String get postpone60 => '60 minutes';

  @override
  String get privacyTitle => 'Privacy';

  @override
  String get privacyIntro =>
      'CuraLuma is a paid download with no account, no ads, and no subscription inside the app.';

  @override
  String get privacyLocal =>
      'Medicines, doses, notes, and photos stay in the app\'s storage on this phone.';

  @override
  String get privacyNoAccount =>
      'You do not sign in, and the app does not send your medication list to a server.';

  @override
  String get privacyNoCloud =>
      'There is no cloud backup. Use Export if you want a copy you control.';

  @override
  String get privacyNoAds =>
      'The app does not show ads and does not include an advertising or analytics SDK.';

  @override
  String get privacyNoEncryption =>
      'The on-device database is not encrypted by the app. Someone with access to the unlocked phone, or to an unlocked backup of it, could read the data.';

  @override
  String get privacyNotifications =>
      'Notification text includes the medicine name and the amount you entered, so you can recognize the reminder.';

  @override
  String get helpTitle => 'Help';

  @override
  String get helpAdd =>
      'Add a medicine with the name, the amount you take, a unit, the days, and one or more times.';

  @override
  String get helpRecord =>
      'On Today, record a dose as taken, skipped, or postponed. Recording the same outcome again does not create a second entry.';

  @override
  String get helpReminders =>
      'Reminders use the time you chose. A missing hour when clocks move forward is shifted to the next real minute. A repeated hour when clocks move back is reminded once.';

  @override
  String get helpReliability =>
      'Open the phone\'s battery settings for CuraLuma if reminders are late, and allow notifications and exact alarms if you want a precise time.';

  @override
  String get helpRefill =>
      'If you enter a supply and the amount is a plain number, the remaining quantity decreases when you mark a dose taken. Otherwise, correct the supply yourself. The result is labeled as an estimate.';

  @override
  String get helpNotMedical =>
      'Do not use CuraLuma to decide whether a medicine is right for you or to change a dose. Ask a clinician or pharmacist about medical questions.';

  @override
  String aboutVersion(String version) {
    return 'Version $version';
  }

  @override
  String get aboutPaid =>
      'CuraLuma is sold as a one-time download. Price and purchase are handled by Google Play, not inside the app.';

  @override
  String get exportAction => 'Export data';

  @override
  String get importAction => 'Import data';

  @override
  String get deleteAllAction => 'Delete all data';

  @override
  String get deleteAllTitle => 'Delete all data?';

  @override
  String get deleteAllBody =>
      'This removes medicines, history, photos, and settings from this phone and turns off scheduled reminders. This cannot be undone.';

  @override
  String get exportSuccess => 'Export saved.';

  @override
  String get exportCancelled => 'Export cancelled.';

  @override
  String get importSuccess =>
      'Import finished. Previous data on this phone was replaced.';

  @override
  String get importCancelled => 'Import cancelled.';

  @override
  String get importInvalid =>
      'That file is not a CuraLuma backup this version can read.';

  @override
  String get importReplaceTitle => 'Replace data on this phone?';

  @override
  String get importReplaceBody =>
      'Importing replaces the medicines and history currently stored here.';

  @override
  String get actionFailed => 'That could not be completed.';

  @override
  String get disclaimerTitle => 'Not medical advice';

  @override
  String get notMedicalShort =>
      'CuraLuma reminds you of a schedule you enter. It does not provide medical advice.';

  @override
  String get notificationChannelReminders => 'Medication reminders';

  @override
  String get notificationChannelRemindersDescription =>
      'Reminders for the medication times you saved.';

  @override
  String get notificationChannelRefills => 'Supply reminders';

  @override
  String get notificationChannelRefillsDescription =>
      'A notice when the supply you entered reaches your threshold.';

  @override
  String get notificationTitle => 'Medication reminder';

  @override
  String notificationBody(String name, String dose) {
    return '$name · $dose';
  }

  @override
  String get notificationActionTaken => 'Taken';

  @override
  String get notificationActionSkip => 'Skip';

  @override
  String get refillNotificationTitle => 'Supply threshold';

  @override
  String refillNotificationBody(String name, String remaining) {
    return '$name: about $remaining left, by your entries.';
  }

  @override
  String semanticsColor(int index) {
    return 'Color $index';
  }

  @override
  String get semanticsNav => 'Main sections';

  @override
  String get selectDate => 'Select a date';

  @override
  String get selectTime => 'Select a time';

  @override
  String timezoneLabel(String name) {
    return 'Time zone used for reminders: $name';
  }
}

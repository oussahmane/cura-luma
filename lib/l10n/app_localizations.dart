import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'CuraLuma'**
  String get appTitle;

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'A little care, every day.'**
  String get tagline;

  /// No description provided for @navToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get navToday;

  /// No description provided for @navMedicines.
  ///
  /// In en, this message translates to:
  /// **'Medicines'**
  String get navMedicines;

  /// No description provided for @navHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get navHistory;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @splashLoading.
  ///
  /// In en, this message translates to:
  /// **'Opening CuraLuma'**
  String get splashLoading;

  /// No description provided for @onboardingWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'A little care, every day.'**
  String get onboardingWelcomeTitle;

  /// No description provided for @onboardingWelcomeBody.
  ///
  /// In en, this message translates to:
  /// **'CuraLuma keeps the medication schedule you enter and helps you record what you took. There is no account to create.'**
  String get onboardingWelcomeBody;

  /// No description provided for @onboardingDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'CuraLuma does not diagnose, prescribe, or suggest a dose. It only reminds you of the schedule you saved.'**
  String get onboardingDisclaimer;

  /// No description provided for @onboardingNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Reminders on this phone'**
  String get onboardingNotificationsTitle;

  /// No description provided for @onboardingNotificationsBody.
  ///
  /// In en, this message translates to:
  /// **'Reminders are notifications on this device. You can record a dose from the notification when Android allows actions, or open the app and record it here.'**
  String get onboardingNotificationsBody;

  /// No description provided for @onboardingNotificationsLimit.
  ///
  /// In en, this message translates to:
  /// **'Android can delay or block a notification because of battery saving, Do Not Disturb, or an exact-alarm setting. CuraLuma cannot promise that every reminder will appear.'**
  String get onboardingNotificationsLimit;

  /// No description provided for @onboardingLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a language'**
  String get onboardingLanguageTitle;

  /// No description provided for @onboardingLanguageBody.
  ///
  /// In en, this message translates to:
  /// **'You can follow the phone language, or choose English, French, or Arabic. You can change this later in Settings.'**
  String get onboardingLanguageBody;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'Phone language'**
  String get languageSystem;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageFrench.
  ///
  /// In en, this message translates to:
  /// **'Français'**
  String get languageFrench;

  /// No description provided for @languageArabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get languageArabic;

  /// No description provided for @actionContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get actionContinue;

  /// No description provided for @actionBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get actionBack;

  /// No description provided for @actionStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get actionStart;

  /// No description provided for @actionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// No description provided for @actionConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get actionConfirm;

  /// No description provided for @actionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get actionDelete;

  /// No description provided for @actionSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get actionSave;

  /// No description provided for @actionArchive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get actionArchive;

  /// No description provided for @actionUnarchive.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get actionUnarchive;

  /// No description provided for @actionClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get actionClose;

  /// No description provided for @actionEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get actionEdit;

  /// No description provided for @actionDiscard.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get actionDiscard;

  /// No description provided for @actionKeepEditing.
  ///
  /// In en, this message translates to:
  /// **'Keep editing'**
  String get actionKeepEditing;

  /// No description provided for @onboardingStep.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String onboardingStep(int current, int total);

  /// No description provided for @todayHeading.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get todayHeading;

  /// No description provided for @todayEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing scheduled yet'**
  String get todayEmptyTitle;

  /// No description provided for @todayEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Add a medicine and the times you want to be reminded. CuraLuma will list today\'s doses here.'**
  String get todayEmptyBody;

  /// No description provided for @actionAddMedicine.
  ///
  /// In en, this message translates to:
  /// **'Add a medicine'**
  String get actionAddMedicine;

  /// No description provided for @nextDoseTitle.
  ///
  /// In en, this message translates to:
  /// **'Next dose'**
  String get nextDoseTitle;

  /// No description provided for @noNextDose.
  ///
  /// In en, this message translates to:
  /// **'No upcoming dose today'**
  String get noNextDose;

  /// No description provided for @scheduleHeading.
  ///
  /// In en, this message translates to:
  /// **'Today\'s schedule'**
  String get scheduleHeading;

  /// No description provided for @statusUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get statusUpcoming;

  /// No description provided for @statusDue.
  ///
  /// In en, this message translates to:
  /// **'Due'**
  String get statusDue;

  /// No description provided for @statusTaken.
  ///
  /// In en, this message translates to:
  /// **'Taken'**
  String get statusTaken;

  /// No description provided for @statusSkipped.
  ///
  /// In en, this message translates to:
  /// **'Skipped'**
  String get statusSkipped;

  /// No description provided for @statusMissed.
  ///
  /// In en, this message translates to:
  /// **'Missed'**
  String get statusMissed;

  /// No description provided for @statusPostponed.
  ///
  /// In en, this message translates to:
  /// **'Postponed'**
  String get statusPostponed;

  /// No description provided for @statusPaused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get statusPaused;

  /// No description provided for @actionTaken.
  ///
  /// In en, this message translates to:
  /// **'Taken'**
  String get actionTaken;

  /// No description provided for @actionSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get actionSkip;

  /// No description provided for @actionPostpone.
  ///
  /// In en, this message translates to:
  /// **'Postpone'**
  String get actionPostpone;

  /// No description provided for @alreadyRecorded.
  ///
  /// In en, this message translates to:
  /// **'This dose is already recorded.'**
  String get alreadyRecorded;

  /// No description provided for @actionRejected.
  ///
  /// In en, this message translates to:
  /// **'That change is not available for this dose.'**
  String get actionRejected;

  /// No description provided for @doseRecorded.
  ///
  /// In en, this message translates to:
  /// **'Dose recorded.'**
  String get doseRecorded;

  /// No description provided for @semanticsTaken.
  ///
  /// In en, this message translates to:
  /// **'Record {name} as taken'**
  String semanticsTaken(String name);

  /// No description provided for @semanticsSkip.
  ///
  /// In en, this message translates to:
  /// **'Record {name} as skipped'**
  String semanticsSkip(String name);

  /// No description provided for @semanticsPostpone.
  ///
  /// In en, this message translates to:
  /// **'Postpone {name}'**
  String semanticsPostpone(String name);

  /// No description provided for @todayNotificationsOff.
  ///
  /// In en, this message translates to:
  /// **'Reminders are turned off. You can still record doses in the app.'**
  String get todayNotificationsOff;

  /// No description provided for @actionEnableNotifications.
  ///
  /// In en, this message translates to:
  /// **'Turn on reminders'**
  String get actionEnableNotifications;

  /// No description provided for @lowSupplyBanner.
  ///
  /// In en, this message translates to:
  /// **'The supply you entered for {name} is at or below the refill threshold.'**
  String lowSupplyBanner(String name);

  /// No description provided for @dueWindowExplain.
  ///
  /// In en, this message translates to:
  /// **'A dose stays due for one hour, then it is marked missed unless you record it.'**
  String get dueWindowExplain;

  /// No description provided for @medicinesHeading.
  ///
  /// In en, this message translates to:
  /// **'Medicines'**
  String get medicinesHeading;

  /// No description provided for @medicinesEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No medicines yet'**
  String get medicinesEmptyTitle;

  /// No description provided for @medicinesEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Add the name, the amount you take, and the times. CuraLuma stores this only on this phone.'**
  String get medicinesEmptyBody;

  /// No description provided for @archivedHeading.
  ///
  /// In en, this message translates to:
  /// **'Archived'**
  String get archivedHeading;

  /// No description provided for @medicineNewTitle.
  ///
  /// In en, this message translates to:
  /// **'New medicine'**
  String get medicineNewTitle;

  /// No description provided for @medicineEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit medicine'**
  String get medicineEditTitle;

  /// No description provided for @medicineDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Medicine'**
  String get medicineDetailsTitle;

  /// No description provided for @fieldName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get fieldName;

  /// No description provided for @fieldDoseAmount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get fieldDoseAmount;

  /// No description provided for @fieldDoseUnit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get fieldDoseUnit;

  /// No description provided for @fieldForm.
  ///
  /// In en, this message translates to:
  /// **'Form'**
  String get fieldForm;

  /// No description provided for @fieldNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get fieldNotes;

  /// No description provided for @fieldInstructions.
  ///
  /// In en, this message translates to:
  /// **'Instructions'**
  String get fieldInstructions;

  /// No description provided for @fieldStartDate.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get fieldStartDate;

  /// No description provided for @fieldEndDate.
  ///
  /// In en, this message translates to:
  /// **'End date'**
  String get fieldEndDate;

  /// No description provided for @fieldNoEndDate.
  ///
  /// In en, this message translates to:
  /// **'No end date'**
  String get fieldNoEndDate;

  /// No description provided for @fieldTimes.
  ///
  /// In en, this message translates to:
  /// **'Reminder times'**
  String get fieldTimes;

  /// No description provided for @fieldWeekdays.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get fieldWeekdays;

  /// No description provided for @fieldColor.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get fieldColor;

  /// No description provided for @fieldPhoto.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get fieldPhoto;

  /// No description provided for @fieldSupply.
  ///
  /// In en, this message translates to:
  /// **'Supply on hand'**
  String get fieldSupply;

  /// No description provided for @fieldRefillThreshold.
  ///
  /// In en, this message translates to:
  /// **'Refill threshold'**
  String get fieldRefillThreshold;

  /// No description provided for @nameHint.
  ///
  /// In en, this message translates to:
  /// **'Name you will recognize'**
  String get nameHint;

  /// No description provided for @amountHint.
  ///
  /// In en, this message translates to:
  /// **'As you take it, for example 1 or 5'**
  String get amountHint;

  /// No description provided for @unitHint.
  ///
  /// In en, this message translates to:
  /// **'For example mg, ml, or tablet'**
  String get unitHint;

  /// No description provided for @notesHint.
  ///
  /// In en, this message translates to:
  /// **'Optional note for yourself'**
  String get notesHint;

  /// No description provided for @instructionsHint.
  ///
  /// In en, this message translates to:
  /// **'Optional instructions you already have'**
  String get instructionsHint;

  /// No description provided for @supplyHint.
  ///
  /// In en, this message translates to:
  /// **'Optional quantity you have left'**
  String get supplyHint;

  /// No description provided for @thresholdHint.
  ///
  /// In en, this message translates to:
  /// **'Optional point at which to remind you'**
  String get thresholdHint;

  /// No description provided for @actionAddTime.
  ///
  /// In en, this message translates to:
  /// **'Add a time'**
  String get actionAddTime;

  /// No description provided for @actionRemoveTime.
  ///
  /// In en, this message translates to:
  /// **'Remove {time}'**
  String actionRemoveTime(String time);

  /// No description provided for @actionChoosePhoto.
  ///
  /// In en, this message translates to:
  /// **'Choose a photo'**
  String get actionChoosePhoto;

  /// No description provided for @actionRemovePhoto.
  ///
  /// In en, this message translates to:
  /// **'Remove photo'**
  String get actionRemovePhoto;

  /// No description provided for @formTablet.
  ///
  /// In en, this message translates to:
  /// **'Tablet'**
  String get formTablet;

  /// No description provided for @formCapsule.
  ///
  /// In en, this message translates to:
  /// **'Capsule'**
  String get formCapsule;

  /// No description provided for @formLiquid.
  ///
  /// In en, this message translates to:
  /// **'Liquid'**
  String get formLiquid;

  /// No description provided for @formDrops.
  ///
  /// In en, this message translates to:
  /// **'Drops'**
  String get formDrops;

  /// No description provided for @formInjection.
  ///
  /// In en, this message translates to:
  /// **'Injection'**
  String get formInjection;

  /// No description provided for @formOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get formOther;

  /// No description provided for @weekdayMon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get weekdayMon;

  /// No description provided for @weekdayTue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get weekdayTue;

  /// No description provided for @weekdayWed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get weekdayWed;

  /// No description provided for @weekdayThu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get weekdayThu;

  /// No description provided for @weekdayFri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get weekdayFri;

  /// No description provided for @weekdaySat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get weekdaySat;

  /// No description provided for @weekdaySun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get weekdaySun;

  /// No description provided for @validationName.
  ///
  /// In en, this message translates to:
  /// **'Enter a name.'**
  String get validationName;

  /// No description provided for @validationDose.
  ///
  /// In en, this message translates to:
  /// **'Enter the amount you take.'**
  String get validationDose;

  /// No description provided for @validationUnit.
  ///
  /// In en, this message translates to:
  /// **'Enter a unit.'**
  String get validationUnit;

  /// No description provided for @validationTime.
  ///
  /// In en, this message translates to:
  /// **'Add at least one time.'**
  String get validationTime;

  /// No description provided for @validationDuplicateTime.
  ///
  /// In en, this message translates to:
  /// **'That time is already listed.'**
  String get validationDuplicateTime;

  /// No description provided for @validationWeekday.
  ///
  /// In en, this message translates to:
  /// **'Choose at least one day.'**
  String get validationWeekday;

  /// No description provided for @validationEndDate.
  ///
  /// In en, this message translates to:
  /// **'The end date must be on or after the start date.'**
  String get validationEndDate;

  /// No description provided for @validationSupply.
  ///
  /// In en, this message translates to:
  /// **'Supply cannot be negative.'**
  String get validationSupply;

  /// No description provided for @validationThreshold.
  ///
  /// In en, this message translates to:
  /// **'The threshold cannot be negative, and it needs a supply amount.'**
  String get validationThreshold;

  /// No description provided for @validationLength.
  ///
  /// In en, this message translates to:
  /// **'That text is too long.'**
  String get validationLength;

  /// No description provided for @deleteMedicineTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this medicine?'**
  String get deleteMedicineTitle;

  /// No description provided for @deleteMedicineBody.
  ///
  /// In en, this message translates to:
  /// **'Delete {name}? Its schedule and history will be removed from this phone. This cannot be undone.'**
  String deleteMedicineBody(String name);

  /// No description provided for @archiveMedicineTitle.
  ///
  /// In en, this message translates to:
  /// **'Archive this medicine?'**
  String get archiveMedicineTitle;

  /// No description provided for @archiveMedicineBody.
  ///
  /// In en, this message translates to:
  /// **'Archive {name}? Future reminders stop. Past records stay in History.'**
  String archiveMedicineBody(String name);

  /// No description provided for @pauseMedicine.
  ///
  /// In en, this message translates to:
  /// **'Pause reminders'**
  String get pauseMedicine;

  /// No description provided for @resumeMedicine.
  ///
  /// In en, this message translates to:
  /// **'Resume reminders'**
  String get resumeMedicine;

  /// No description provided for @pausedBanner.
  ///
  /// In en, this message translates to:
  /// **'Reminders are paused. Doses during the pause are not counted as missed.'**
  String get pausedBanner;

  /// No description provided for @scheduleEditNote.
  ///
  /// In en, this message translates to:
  /// **'Changing times or days updates future reminders. Doses you already recorded stay as they are.'**
  String get scheduleEditNote;

  /// No description provided for @medicineSaved.
  ///
  /// In en, this message translates to:
  /// **'Medicine saved.'**
  String get medicineSaved;

  /// No description provided for @medicineDeleted.
  ///
  /// In en, this message translates to:
  /// **'Medicine deleted.'**
  String get medicineDeleted;

  /// No description provided for @photoFailed.
  ///
  /// In en, this message translates to:
  /// **'The photo could not be saved.'**
  String get photoFailed;

  /// No description provided for @requiredLegend.
  ///
  /// In en, this message translates to:
  /// **'Name, amount, unit, a time, and a day are required.'**
  String get requiredLegend;

  /// No description provided for @discardTitle.
  ///
  /// In en, this message translates to:
  /// **'Discard changes?'**
  String get discardTitle;

  /// No description provided for @discardBody.
  ///
  /// In en, this message translates to:
  /// **'Your edits to this medicine will not be saved.'**
  String get discardBody;

  /// No description provided for @clearEndDate.
  ///
  /// In en, this message translates to:
  /// **'Clear end date'**
  String get clearEndDate;

  /// No description provided for @doseLabel.
  ///
  /// In en, this message translates to:
  /// **'{amount} {unit}'**
  String doseLabel(String amount, String unit);

  /// No description provided for @noNotes.
  ///
  /// In en, this message translates to:
  /// **'No notes'**
  String get noNotes;

  /// No description provided for @instructionsHeading.
  ///
  /// In en, this message translates to:
  /// **'Instructions'**
  String get instructionsHeading;

  /// No description provided for @notesHeading.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notesHeading;

  /// No description provided for @refillHeading.
  ///
  /// In en, this message translates to:
  /// **'Supply'**
  String get refillHeading;

  /// No description provided for @refillExplanation.
  ///
  /// In en, this message translates to:
  /// **'This estimate uses the amount and schedule you entered. It is not a medical recommendation.'**
  String get refillExplanation;

  /// No description provided for @refillCannotEstimate.
  ///
  /// In en, this message translates to:
  /// **'The amount is not a plain number, so supply is not estimated from the schedule. You can still correct the quantity yourself.'**
  String get refillCannotEstimate;

  /// No description provided for @refillRemaining.
  ///
  /// In en, this message translates to:
  /// **'Remaining: {amount}'**
  String refillRemaining(String amount);

  /// No description provided for @dosesLeft.
  ///
  /// In en, this message translates to:
  /// **'About {count} scheduled doses left'**
  String dosesLeft(int count);

  /// No description provided for @estimatedLabel.
  ///
  /// In en, this message translates to:
  /// **'Estimate'**
  String get estimatedLabel;

  /// No description provided for @manualSupplyLabel.
  ///
  /// In en, this message translates to:
  /// **'Entered by you'**
  String get manualSupplyLabel;

  /// No description provided for @refillCorrect.
  ///
  /// In en, this message translates to:
  /// **'Correct supply'**
  String get refillCorrect;

  /// No description provided for @refillSaved.
  ///
  /// In en, this message translates to:
  /// **'Supply updated.'**
  String get refillSaved;

  /// No description provided for @refillLow.
  ///
  /// In en, this message translates to:
  /// **'At or below your refill threshold'**
  String get refillLow;

  /// No description provided for @historyHeading.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get historyHeading;

  /// No description provided for @historyEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No doses in this range'**
  String get historyEmptyTitle;

  /// No description provided for @historyEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Recorded, skipped, and missed doses appear here. Upcoming doses stay on Today.'**
  String get historyEmptyBody;

  /// No description provided for @filterMedicine.
  ///
  /// In en, this message translates to:
  /// **'Medicine'**
  String get filterMedicine;

  /// No description provided for @filterAllMedicines.
  ///
  /// In en, this message translates to:
  /// **'All medicines'**
  String get filterAllMedicines;

  /// No description provided for @filterFrom.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get filterFrom;

  /// No description provided for @filterTo.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get filterTo;

  /// No description provided for @summaryWeek.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get summaryWeek;

  /// No description provided for @summaryMonth.
  ///
  /// In en, this message translates to:
  /// **'This month'**
  String get summaryMonth;

  /// No description provided for @adherenceLabel.
  ///
  /// In en, this message translates to:
  /// **'Recorded as taken'**
  String get adherenceLabel;

  /// No description provided for @adherenceEmpty.
  ///
  /// In en, this message translates to:
  /// **'No doses were due in this period.'**
  String get adherenceEmpty;

  /// No description provided for @adherenceExplanation.
  ///
  /// In en, this message translates to:
  /// **'The percentage is taken doses divided by doses that were already due. Paused doses and doses still waiting are left out. Changing a future schedule does not change these records.'**
  String get adherenceExplanation;

  /// No description provided for @countTaken.
  ///
  /// In en, this message translates to:
  /// **'Taken {count}'**
  String countTaken(int count);

  /// No description provided for @countSkipped.
  ///
  /// In en, this message translates to:
  /// **'Skipped {count}'**
  String countSkipped(int count);

  /// No description provided for @countMissed.
  ///
  /// In en, this message translates to:
  /// **'Missed {count}'**
  String countMissed(int count);

  /// No description provided for @countEligible.
  ///
  /// In en, this message translates to:
  /// **'Counted {count}'**
  String countEligible(int count);

  /// No description provided for @adherenceValue.
  ///
  /// In en, this message translates to:
  /// **'{percent}%'**
  String adherenceValue(String percent);

  /// No description provided for @settingsHeading.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsHeading;

  /// No description provided for @sectionAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get sectionAppearance;

  /// No description provided for @sectionLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get sectionLanguage;

  /// No description provided for @sectionNotifications.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get sectionNotifications;

  /// No description provided for @sectionData.
  ///
  /// In en, this message translates to:
  /// **'Your data'**
  String get sectionData;

  /// No description provided for @sectionAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get sectionAbout;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @notificationsEnabled.
  ///
  /// In en, this message translates to:
  /// **'Medication reminders'**
  String get notificationsEnabled;

  /// No description provided for @exactAlarmTitle.
  ///
  /// In en, this message translates to:
  /// **'Exact alarms'**
  String get exactAlarmTitle;

  /// No description provided for @exactAlarmGranted.
  ///
  /// In en, this message translates to:
  /// **'This phone allows exact alarms, so reminders can use a precise time.'**
  String get exactAlarmGranted;

  /// No description provided for @exactAlarmMissing.
  ///
  /// In en, this message translates to:
  /// **'Exact alarms are off. Reminders still schedule, but Android may deliver them a little later.'**
  String get exactAlarmMissing;

  /// No description provided for @exactAlarmAction.
  ///
  /// In en, this message translates to:
  /// **'Review exact alarms'**
  String get exactAlarmAction;

  /// No description provided for @notificationSettingsAction.
  ///
  /// In en, this message translates to:
  /// **'Notification settings'**
  String get notificationSettingsAction;

  /// No description provided for @reliabilityTitle.
  ///
  /// In en, this message translates to:
  /// **'When a reminder might not appear'**
  String get reliabilityTitle;

  /// No description provided for @reliabilityBody.
  ///
  /// In en, this message translates to:
  /// **'Battery optimization, Do Not Disturb, a restart, or a denied notification permission can all stop a reminder. After a restart, already scheduled reminders are restored. The app keeps the next seven days of reminders and refreshes that list when you open it.'**
  String get reliabilityBody;

  /// No description provided for @horizonNote.
  ///
  /// In en, this message translates to:
  /// **'Reminders are scheduled for the next 7 days, up to 64 at a time.'**
  String get horizonNote;

  /// No description provided for @bootRecoveryNote.
  ///
  /// In en, this message translates to:
  /// **'After the phone restarts, Android restores the reminders that were already scheduled.'**
  String get bootRecoveryNote;

  /// No description provided for @clockChangeNote.
  ///
  /// In en, this message translates to:
  /// **'If the clock or time zone changes, future reminders follow the new local time. Doses you already recorded are not rewritten. A missed dose that the app marked by itself returns to the schedule if the clock moves back into its due hour.'**
  String get clockChangeNote;

  /// No description provided for @postponeLabel.
  ///
  /// In en, this message translates to:
  /// **'Postpone length'**
  String get postponeLabel;

  /// No description provided for @postpone15.
  ///
  /// In en, this message translates to:
  /// **'15 minutes'**
  String get postpone15;

  /// No description provided for @postpone30.
  ///
  /// In en, this message translates to:
  /// **'30 minutes'**
  String get postpone30;

  /// No description provided for @postpone60.
  ///
  /// In en, this message translates to:
  /// **'60 minutes'**
  String get postpone60;

  /// No description provided for @privacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacyTitle;

  /// No description provided for @privacyIntro.
  ///
  /// In en, this message translates to:
  /// **'CuraLuma is a paid download with no account, no ads, and no subscription inside the app.'**
  String get privacyIntro;

  /// No description provided for @privacyLocal.
  ///
  /// In en, this message translates to:
  /// **'Medicines, doses, notes, and photos stay in the app\'s storage on this phone.'**
  String get privacyLocal;

  /// No description provided for @privacyNoAccount.
  ///
  /// In en, this message translates to:
  /// **'You do not sign in, and the app does not send your medication list to a server.'**
  String get privacyNoAccount;

  /// No description provided for @privacyNoCloud.
  ///
  /// In en, this message translates to:
  /// **'There is no cloud backup. Use Export if you want a copy you control.'**
  String get privacyNoCloud;

  /// No description provided for @privacyNoAds.
  ///
  /// In en, this message translates to:
  /// **'The app does not show ads and does not include an advertising or analytics SDK.'**
  String get privacyNoAds;

  /// No description provided for @privacyNoEncryption.
  ///
  /// In en, this message translates to:
  /// **'The on-device database is not encrypted by the app. Someone with access to the unlocked phone, or to an unlocked backup of it, could read the data.'**
  String get privacyNoEncryption;

  /// No description provided for @privacyNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notification text includes the medicine name and the amount you entered, so you can recognize the reminder.'**
  String get privacyNotifications;

  /// No description provided for @helpTitle.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get helpTitle;

  /// No description provided for @helpAdd.
  ///
  /// In en, this message translates to:
  /// **'Add a medicine with the name, the amount you take, a unit, the days, and one or more times.'**
  String get helpAdd;

  /// No description provided for @helpRecord.
  ///
  /// In en, this message translates to:
  /// **'On Today, record a dose as taken, skipped, or postponed. Recording the same outcome again does not create a second entry.'**
  String get helpRecord;

  /// No description provided for @helpReminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders use the time you chose. A missing hour when clocks move forward is shifted to the next real minute. A repeated hour when clocks move back is reminded once.'**
  String get helpReminders;

  /// No description provided for @helpReliability.
  ///
  /// In en, this message translates to:
  /// **'Open the phone\'s battery settings for CuraLuma if reminders are late, and allow notifications and exact alarms if you want a precise time.'**
  String get helpReliability;

  /// No description provided for @helpRefill.
  ///
  /// In en, this message translates to:
  /// **'If you enter a supply and the amount is a plain number, the remaining quantity decreases when you mark a dose taken. Otherwise, correct the supply yourself. The result is labeled as an estimate.'**
  String get helpRefill;

  /// No description provided for @helpNotMedical.
  ///
  /// In en, this message translates to:
  /// **'Do not use CuraLuma to decide whether a medicine is right for you or to change a dose. Ask a clinician or pharmacist about medical questions.'**
  String get helpNotMedical;

  /// No description provided for @aboutVersion.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String aboutVersion(String version);

  /// No description provided for @aboutPaid.
  ///
  /// In en, this message translates to:
  /// **'CuraLuma is sold as a one-time download. Price and purchase are handled by Google Play, not inside the app.'**
  String get aboutPaid;

  /// No description provided for @exportAction.
  ///
  /// In en, this message translates to:
  /// **'Export data'**
  String get exportAction;

  /// No description provided for @importAction.
  ///
  /// In en, this message translates to:
  /// **'Import data'**
  String get importAction;

  /// No description provided for @deleteAllAction.
  ///
  /// In en, this message translates to:
  /// **'Delete all data'**
  String get deleteAllAction;

  /// No description provided for @deleteAllTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete all data?'**
  String get deleteAllTitle;

  /// No description provided for @deleteAllBody.
  ///
  /// In en, this message translates to:
  /// **'This removes medicines, history, photos, and settings from this phone and turns off scheduled reminders. This cannot be undone.'**
  String get deleteAllBody;

  /// No description provided for @exportSuccess.
  ///
  /// In en, this message translates to:
  /// **'Export saved.'**
  String get exportSuccess;

  /// No description provided for @exportCancelled.
  ///
  /// In en, this message translates to:
  /// **'Export cancelled.'**
  String get exportCancelled;

  /// No description provided for @importSuccess.
  ///
  /// In en, this message translates to:
  /// **'Import finished. Previous data on this phone was replaced.'**
  String get importSuccess;

  /// No description provided for @importCancelled.
  ///
  /// In en, this message translates to:
  /// **'Import cancelled.'**
  String get importCancelled;

  /// No description provided for @importInvalid.
  ///
  /// In en, this message translates to:
  /// **'That file is not a CuraLuma backup this version can read.'**
  String get importInvalid;

  /// No description provided for @importReplaceTitle.
  ///
  /// In en, this message translates to:
  /// **'Replace data on this phone?'**
  String get importReplaceTitle;

  /// No description provided for @importReplaceBody.
  ///
  /// In en, this message translates to:
  /// **'Importing replaces the medicines and history currently stored here.'**
  String get importReplaceBody;

  /// No description provided for @actionFailed.
  ///
  /// In en, this message translates to:
  /// **'That could not be completed.'**
  String get actionFailed;

  /// No description provided for @disclaimerTitle.
  ///
  /// In en, this message translates to:
  /// **'Not medical advice'**
  String get disclaimerTitle;

  /// No description provided for @notMedicalShort.
  ///
  /// In en, this message translates to:
  /// **'CuraLuma reminds you of a schedule you enter. It does not provide medical advice.'**
  String get notMedicalShort;

  /// No description provided for @notificationChannelReminders.
  ///
  /// In en, this message translates to:
  /// **'Medication reminders'**
  String get notificationChannelReminders;

  /// No description provided for @notificationChannelRemindersDescription.
  ///
  /// In en, this message translates to:
  /// **'Reminders for the medication times you saved.'**
  String get notificationChannelRemindersDescription;

  /// No description provided for @notificationChannelRefills.
  ///
  /// In en, this message translates to:
  /// **'Supply reminders'**
  String get notificationChannelRefills;

  /// No description provided for @notificationChannelRefillsDescription.
  ///
  /// In en, this message translates to:
  /// **'A notice when the supply you entered reaches your threshold.'**
  String get notificationChannelRefillsDescription;

  /// No description provided for @notificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Medication reminder'**
  String get notificationTitle;

  /// No description provided for @notificationBody.
  ///
  /// In en, this message translates to:
  /// **'{name} · {dose}'**
  String notificationBody(String name, String dose);

  /// No description provided for @notificationActionTaken.
  ///
  /// In en, this message translates to:
  /// **'Taken'**
  String get notificationActionTaken;

  /// No description provided for @notificationActionSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get notificationActionSkip;

  /// No description provided for @refillNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Supply threshold'**
  String get refillNotificationTitle;

  /// No description provided for @refillNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'{name}: about {remaining} left, by your entries.'**
  String refillNotificationBody(String name, String remaining);

  /// No description provided for @semanticsColor.
  ///
  /// In en, this message translates to:
  /// **'Color {index}'**
  String semanticsColor(int index);

  /// No description provided for @semanticsNav.
  ///
  /// In en, this message translates to:
  /// **'Main sections'**
  String get semanticsNav;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select a date'**
  String get selectDate;

  /// No description provided for @selectTime.
  ///
  /// In en, this message translates to:
  /// **'Select a time'**
  String get selectTime;

  /// No description provided for @timezoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Time zone used for reminders: {name}'**
  String timezoneLabel(String name);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

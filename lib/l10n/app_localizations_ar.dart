// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'CuraLuma';

  @override
  String get tagline => 'قليل من العناية، كل يوم.';

  @override
  String get navToday => 'اليوم';

  @override
  String get navMedicines => 'الأدوية';

  @override
  String get navHistory => 'السجل';

  @override
  String get navSettings => 'الإعدادات';

  @override
  String get splashLoading => 'جارٍ فتح CuraLuma';

  @override
  String get onboardingWelcomeTitle => 'قليل من العناية، كل يوم.';

  @override
  String get onboardingWelcomeBody =>
      'يحفظ CuraLuma جدول الدواء الذي تدخله ويساعدك على تسجيل ما تناولته. لا حاجة إلى إنشاء حساب.';

  @override
  String get onboardingDisclaimer =>
      'لا يشخّص CuraLuma المرض، ولا يصف دواء، ولا يقترح جرعة. هو يذكّرك فقط بالجدول الذي حفظته.';

  @override
  String get onboardingNotificationsTitle => 'تذكيرات على هذا الهاتف';

  @override
  String get onboardingNotificationsBody =>
      'التذكيرات إشعارات على هذا الجهاز. يمكنك تسجيل الجرعة من الإشعار عندما يسمح أندرويد بذلك، أو فتح التطبيق وتسجيلها هنا.';

  @override
  String get onboardingNotificationsLimit =>
      'قد يؤخر أندرويد الإشعار أو يمنعه بسبب توفير البطارية، أو وضع عدم الإزعاج، أو إعداد المنبّه الدقيق. لا يستطيع CuraLuma أن يضمن ظهور كل تذكير.';

  @override
  String get onboardingLanguageTitle => 'اختر اللغة';

  @override
  String get onboardingLanguageBody =>
      'يمكنك اتباع لغة الهاتف، أو اختيار الإنجليزية أو الفرنسية أو العربية. يمكنك تغيير ذلك لاحقًا من الإعدادات.';

  @override
  String get languageSystem => 'لغة الهاتف';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageArabic => 'العربية';

  @override
  String get actionContinue => 'متابعة';

  @override
  String get actionBack => 'رجوع';

  @override
  String get actionStart => 'ابدأ';

  @override
  String get actionCancel => 'إلغاء';

  @override
  String get actionConfirm => 'تأكيد';

  @override
  String get actionDelete => 'حذف';

  @override
  String get actionSave => 'حفظ';

  @override
  String get actionArchive => 'أرشفة';

  @override
  String get actionUnarchive => 'استعادة';

  @override
  String get actionClose => 'إغلاق';

  @override
  String get actionEdit => 'تعديل';

  @override
  String get actionDiscard => 'تجاهل';

  @override
  String get actionKeepEditing => 'متابعة التعديل';

  @override
  String onboardingStep(int current, int total) {
    return 'الخطوة $current من $total';
  }

  @override
  String get todayHeading => 'اليوم';

  @override
  String get todayEmptyTitle => 'لا يوجد جدول بعد';

  @override
  String get todayEmptyBody =>
      'أضف دواءً والأوقات التي تريد التذكير بها. سيعرض CuraLuma جرعات اليوم هنا.';

  @override
  String get actionAddMedicine => 'إضافة دواء';

  @override
  String get nextDoseTitle => 'الجرعة التالية';

  @override
  String get noNextDose => 'لا توجد جرعة قادمة اليوم';

  @override
  String get scheduleHeading => 'جدول اليوم';

  @override
  String get statusUpcoming => 'قادمة';

  @override
  String get statusDue => 'حان وقتها';

  @override
  String get statusTaken => 'تم التناول';

  @override
  String get statusSkipped => 'تم التخطي';

  @override
  String get statusMissed => 'فائتة';

  @override
  String get statusPostponed => 'مؤجلة';

  @override
  String get statusPaused => 'متوقفة';

  @override
  String get actionTaken => 'تم التناول';

  @override
  String get actionSkip => 'تخطي';

  @override
  String get actionPostpone => 'تأجيل';

  @override
  String get alreadyRecorded => 'هذه الجرعة مسجّلة بالفعل.';

  @override
  String get actionRejected => 'لا يمكن إجراء هذا التغيير لهذه الجرعة.';

  @override
  String get doseRecorded => 'تم تسجيل الجرعة.';

  @override
  String semanticsTaken(String name) {
    return 'تسجيل $name كجرعة تم تناولها';
  }

  @override
  String semanticsSkip(String name) {
    return 'تسجيل $name كجرعة تم تخطيها';
  }

  @override
  String semanticsPostpone(String name) {
    return 'تأجيل $name';
  }

  @override
  String get todayNotificationsOff =>
      'التذكيرات متوقفة. ما زال بإمكانك تسجيل الجرعات داخل التطبيق.';

  @override
  String get actionEnableNotifications => 'تشغيل التذكيرات';

  @override
  String lowSupplyBanner(String name) {
    return 'الكمية التي أدخلتها من $name وصلت إلى حد إعادة التزويد أو انخفضت عنه.';
  }

  @override
  String get dueWindowExplain =>
      'تبقى الجرعة في حالة «حان وقتها» لمدة ساعة، ثم تُعلَّم فائتة إذا لم تسجّلها.';

  @override
  String get medicinesHeading => 'الأدوية';

  @override
  String get medicinesEmptyTitle => 'لا توجد أدوية بعد';

  @override
  String get medicinesEmptyBody =>
      'أضف الاسم والكمية التي تتناولها والأوقات. يحفظ CuraLuma ذلك على هذا الهاتف فقط.';

  @override
  String get archivedHeading => 'المؤرشفة';

  @override
  String get medicineNewTitle => 'دواء جديد';

  @override
  String get medicineEditTitle => 'تعديل الدواء';

  @override
  String get medicineDetailsTitle => 'الدواء';

  @override
  String get fieldName => 'الاسم';

  @override
  String get fieldDoseAmount => 'الكمية';

  @override
  String get fieldDoseUnit => 'الوحدة';

  @override
  String get fieldForm => 'الشكل';

  @override
  String get fieldNotes => 'ملاحظات';

  @override
  String get fieldInstructions => 'تعليمات';

  @override
  String get fieldStartDate => 'تاريخ البدء';

  @override
  String get fieldEndDate => 'تاريخ الانتهاء';

  @override
  String get fieldNoEndDate => 'بدون تاريخ انتهاء';

  @override
  String get fieldTimes => 'أوقات التذكير';

  @override
  String get fieldWeekdays => 'الأيام';

  @override
  String get fieldColor => 'اللون';

  @override
  String get fieldPhoto => 'صورة';

  @override
  String get fieldSupply => 'الكمية المتبقية';

  @override
  String get fieldRefillThreshold => 'حد إعادة التزويد';

  @override
  String get nameHint => 'اسم تعرفه';

  @override
  String get amountHint => 'كما تتناولها، مثل 1 أو 5';

  @override
  String get unitHint => 'مثل ملغ أو مل أو قرص';

  @override
  String get notesHint => 'ملاحظة اختيارية لك';

  @override
  String get instructionsHint => 'تعليمات اختيارية لديك مسبقًا';

  @override
  String get supplyHint => 'كمية اختيارية متبقية لديك';

  @override
  String get thresholdHint => 'حد اختياري للتذكير';

  @override
  String get actionAddTime => 'إضافة وقت';

  @override
  String actionRemoveTime(String time) {
    return 'إزالة $time';
  }

  @override
  String get actionChoosePhoto => 'اختيار صورة';

  @override
  String get actionRemovePhoto => 'إزالة الصورة';

  @override
  String get formTablet => 'قرص';

  @override
  String get formCapsule => 'كبسولة';

  @override
  String get formLiquid => 'سائل';

  @override
  String get formDrops => 'قطرات';

  @override
  String get formInjection => 'حقنة';

  @override
  String get formOther => 'أخرى';

  @override
  String get weekdayMon => 'إثن';

  @override
  String get weekdayTue => 'ثلا';

  @override
  String get weekdayWed => 'أرب';

  @override
  String get weekdayThu => 'خمي';

  @override
  String get weekdayFri => 'جمع';

  @override
  String get weekdaySat => 'سبت';

  @override
  String get weekdaySun => 'أحد';

  @override
  String get validationName => 'أدخل اسمًا.';

  @override
  String get validationDose => 'أدخل الكمية التي تتناولها.';

  @override
  String get validationUnit => 'أدخل وحدة.';

  @override
  String get validationTime => 'أضف وقتًا واحدًا على الأقل.';

  @override
  String get validationDuplicateTime => 'هذا الوقت مضاف بالفعل.';

  @override
  String get validationWeekday => 'اختر يومًا واحدًا على الأقل.';

  @override
  String get validationEndDate =>
      'يجب أن يكون تاريخ الانتهاء في يوم البدء أو بعده.';

  @override
  String get validationSupply => 'لا يمكن أن تكون الكمية المتبقية سالبة.';

  @override
  String get validationThreshold =>
      'لا يمكن أن يكون الحد سالبًا، ويجب إدخال كمية متبقية.';

  @override
  String get validationLength => 'هذا النص طويل جدًا.';

  @override
  String get deleteMedicineTitle => 'حذف هذا الدواء؟';

  @override
  String deleteMedicineBody(String name) {
    return 'حذف $name؟ سيُزال جدوله وسجله من هذا الهاتف. لا يمكن التراجع عن ذلك.';
  }

  @override
  String get archiveMedicineTitle => 'أرشفة هذا الدواء؟';

  @override
  String archiveMedicineBody(String name) {
    return 'أرشفة $name؟ تتوقف التذكيرات القادمة. تبقى السجلات السابقة في السجل.';
  }

  @override
  String get pauseMedicine => 'إيقاف التذكيرات مؤقتًا';

  @override
  String get resumeMedicine => 'استئناف التذكيرات';

  @override
  String get pausedBanner =>
      'التذكيرات متوقفة مؤقتًا. الجرعات أثناء الإيقاف لا تُحسب فائتة.';

  @override
  String get scheduleEditNote =>
      'تغيير الأوقات أو الأيام يحدّث التذكيرات القادمة. الجرعات التي سجّلتها تبقى كما هي.';

  @override
  String get medicineSaved => 'تم حفظ الدواء.';

  @override
  String get medicineDeleted => 'تم حذف الدواء.';

  @override
  String get photoFailed => 'تعذّر حفظ الصورة.';

  @override
  String get requiredLegend => 'الاسم والكمية والوحدة ووقت ويوم مطلوبة.';

  @override
  String get discardTitle => 'تجاهل التغييرات؟';

  @override
  String get discardBody => 'لن تُحفظ تعديلاتك على هذا الدواء.';

  @override
  String get clearEndDate => 'مسح تاريخ الانتهاء';

  @override
  String doseLabel(String amount, String unit) {
    return '$amount $unit';
  }

  @override
  String get noNotes => 'لا توجد ملاحظات';

  @override
  String get instructionsHeading => 'التعليمات';

  @override
  String get notesHeading => 'الملاحظات';

  @override
  String get refillHeading => 'المخزون';

  @override
  String get refillExplanation =>
      'يعتمد هذا التقدير على الكمية والجدول اللذين أدخلتهما. ليس توصية طبية.';

  @override
  String get refillCannotEstimate =>
      'الكمية ليست رقمًا بسيطًا، لذلك لا يُقدَّر المخزون من الجدول. يمكنك تصحيح الكمية بنفسك.';

  @override
  String refillRemaining(String amount) {
    return 'المتبقي: $amount';
  }

  @override
  String dosesLeft(int count) {
    return 'نحو $count من الجرعات المجدولة المتبقية';
  }

  @override
  String get estimatedLabel => 'تقدير';

  @override
  String get manualSupplyLabel => 'أدخلته أنت';

  @override
  String get refillCorrect => 'تصحيح المخزون';

  @override
  String get refillSaved => 'تم تحديث المخزون.';

  @override
  String get refillLow => 'عند حد إعادة التزويد أو دونه';

  @override
  String get historyHeading => 'السجل';

  @override
  String get historyEmptyTitle => 'لا توجد جرعات في هذه الفترة';

  @override
  String get historyEmptyBody =>
      'تظهر هنا الجرعات المسجّلة والمتخطاة والفائتة. تبقى الجرعات القادمة في اليوم.';

  @override
  String get filterMedicine => 'الدواء';

  @override
  String get filterAllMedicines => 'كل الأدوية';

  @override
  String get filterFrom => 'من';

  @override
  String get filterTo => 'إلى';

  @override
  String get summaryWeek => 'هذا الأسبوع';

  @override
  String get summaryMonth => 'هذا الشهر';

  @override
  String get adherenceLabel => 'سُجّلت كمتناولة';

  @override
  String get adherenceEmpty => 'لم تكن هناك جرعات مستحقة في هذه الفترة.';

  @override
  String get adherenceExplanation =>
      'النسبة هي الجرعات المتناولة مقسومة على الجرعات التي حان وقتها. تُستبعد الجرعات المتوقفة والجرعات التي ما زالت بانتظار التسجيل. تغيير الجدول المستقبلي لا يغيّر هذه السجلات.';

  @override
  String countTaken(int count) {
    return 'متناولة $count';
  }

  @override
  String countSkipped(int count) {
    return 'متخطاة $count';
  }

  @override
  String countMissed(int count) {
    return 'فائتة $count';
  }

  @override
  String countEligible(int count) {
    return 'محسوبة $count';
  }

  @override
  String adherenceValue(String percent) {
    return '$percent٪';
  }

  @override
  String get settingsHeading => 'الإعدادات';

  @override
  String get sectionAppearance => 'المظهر';

  @override
  String get sectionLanguage => 'اللغة';

  @override
  String get sectionNotifications => 'التذكيرات';

  @override
  String get sectionData => 'بياناتك';

  @override
  String get sectionAbout => 'حول التطبيق';

  @override
  String get themeSystem => 'النظام';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeDark => 'داكن';

  @override
  String get notificationsEnabled => 'تذكيرات الدواء';

  @override
  String get exactAlarmTitle => 'المنبّهات الدقيقة';

  @override
  String get exactAlarmGranted =>
      'يسمح هذا الهاتف بالمنبّهات الدقيقة، فيمكن للتذكيرات أن تستخدم وقتًا محددًا.';

  @override
  String get exactAlarmMissing =>
      'المنبّهات الدقيقة متوقفة. تُجدول التذكيرات مع ذلك، وقد يوصلها أندرويد بعد الوقت بقليل.';

  @override
  String get exactAlarmAction => 'مراجعة المنبّهات الدقيقة';

  @override
  String get notificationSettingsAction => 'إعدادات الإشعارات';

  @override
  String get reliabilityTitle => 'متى قد لا يظهر التذكير';

  @override
  String get reliabilityBody =>
      'قد يمنع التذكير توفير البطارية، أو وضع عدم الإزعاج، أو إعادة التشغيل، أو رفض إذن الإشعارات. بعد إعادة التشغيل، تُستعاد التذكيرات التي كانت مجدولة. يحتفظ التطبيق بتذكيرات الأيام السبعة القادمة ويحدّث هذه القائمة عند فتحه.';

  @override
  String get horizonNote =>
      'تُجدول التذكيرات للأيام السبعة القادمة، بحد أقصى 64 تذكيرًا في المرة الواحدة.';

  @override
  String get bootRecoveryNote =>
      'بعد إعادة تشغيل الهاتف، يستعيد أندرويد التذكيرات التي كانت مجدولة مسبقًا.';

  @override
  String get clockChangeNote =>
      'إذا تغيّرت الساعة أو المنطقة الزمنية، تتبع التذكيرات القادمة الوقت المحلي الجديد. الجرعات التي سجّلتها لا تُعاد كتابتها. تعود الجرعة التي علّمها التطبيق فائتة إلى الجدول إذا رجعت الساعة إلى ساعة استحقاقها.';

  @override
  String get postponeLabel => 'مدة التأجيل';

  @override
  String get postpone15 => '15 دقيقة';

  @override
  String get postpone30 => '30 دقيقة';

  @override
  String get postpone60 => '60 دقيقة';

  @override
  String get privacyTitle => 'الخصوصية';

  @override
  String get privacyIntro =>
      'CuraLuma تطبيق مدفوع بدون حساب وبدون إعلانات وبدون اشتراك داخل التطبيق.';

  @override
  String get privacyLocal =>
      'تبقى الأدوية والجرعات والملاحظات والصور في تخزين التطبيق على هذا الهاتف.';

  @override
  String get privacyNoAccount =>
      'لا تسجّل الدخول، ولا يرسل التطبيق قائمة أدويتك إلى خادم.';

  @override
  String get privacyNoCloud =>
      'لا توجد نسخة سحابية. استخدم التصدير إذا أردت نسخة تحت سيطرتك.';

  @override
  String get privacyNoAds =>
      'لا يعرض التطبيق إعلانات ولا يتضمن حزمة إعلانات أو تحليلات.';

  @override
  String get privacyNoEncryption =>
      'قاعدة البيانات على الجهاز غير مشفّرة من التطبيق. من يصل إلى الهاتف وهو مفتوح، أو إلى نسخة احتياطية غير مقفلة، قد يقرأ البيانات.';

  @override
  String get privacyNotifications =>
      'يتضمن نص الإشعار اسم الدواء والكمية التي أدخلتها حتى تتعرّف على التذكير.';

  @override
  String get helpTitle => 'مساعدة';

  @override
  String get helpAdd =>
      'أضف دواءً بالاسم والكمية التي تتناولها والوحدة والأيام ووقت واحد أو أكثر.';

  @override
  String get helpRecord =>
      'في اليوم، سجّل الجرعة كمتناولة أو متخطاة أو مؤجلة. تسجيل النتيجة نفسها مرة أخرى لا ينشئ قيدًا ثانيًا.';

  @override
  String get helpReminders =>
      'تستخدم التذكيرات الوقت الذي اخترته. الساعة الناقصة عند تقديم الساعة تنتقل إلى الدقيقة الحقيقية التالية. الساعة المكررة عند تأخير الساعة تُذكَّر مرة واحدة.';

  @override
  String get helpReliability =>
      'افتح إعدادات البطارية في الهاتف لتطبيق CuraLuma إذا تأخرت التذكيرات، واسمح بالإشعارات والمنبّهات الدقيقة إذا أردت وقتًا محددًا.';

  @override
  String get helpRefill =>
      'إذا أدخلت مخزونًا وكانت الكمية رقمًا بسيطًا، تنقص الكمية المتبقية عند تسجيل الجرعة كمتناولة. وإلا فصحّح المخزون بنفسك. تُعرض النتيجة كتقدير.';

  @override
  String get helpNotMedical =>
      'لا تستخدم CuraLuma لتقرير ما إذا كان الدواء مناسبًا لك أو لتغيير الجرعة. اسأل طبيبًا أو صيدليًا عن الأسئلة الطبية.';

  @override
  String aboutVersion(String version) {
    return 'الإصدار $version';
  }

  @override
  String get aboutPaid =>
      'يُباع CuraLuma كشراء لمرة واحدة. السعر والشراء يتمان عبر Google Play وليس داخل التطبيق.';

  @override
  String get exportAction => 'تصدير البيانات';

  @override
  String get importAction => 'استيراد البيانات';

  @override
  String get deleteAllAction => 'حذف كل البيانات';

  @override
  String get deleteAllTitle => 'حذف كل البيانات؟';

  @override
  String get deleteAllBody =>
      'يؤدي ذلك إلى إزالة الأدوية والسجل والصور والإعدادات من هذا الهاتف وإلغاء التذكيرات المجدولة. لا يمكن التراجع عن ذلك.';

  @override
  String get exportSuccess => 'تم حفظ التصدير.';

  @override
  String get exportCancelled => 'أُلغي التصدير.';

  @override
  String get importSuccess =>
      'اكتمل الاستيراد. استُبدلت البيانات السابقة على هذا الهاتف.';

  @override
  String get importCancelled => 'أُلغي الاستيراد.';

  @override
  String get importInvalid =>
      'هذا الملف ليس نسخة CuraLuma يمكن لهذا الإصدار قراءتها.';

  @override
  String get importReplaceTitle => 'استبدال البيانات على هذا الهاتف؟';

  @override
  String get importReplaceBody =>
      'الاستيراد يستبدل الأدوية والسجل المحفوظين هنا حاليًا.';

  @override
  String get actionFailed => 'تعذّر إكمال ذلك.';

  @override
  String get disclaimerTitle => 'ليس نصيحة طبية';

  @override
  String get notMedicalShort =>
      'يذكّرك CuraLuma بجدول تدخله. لا يقدّم نصيحة طبية.';

  @override
  String get notificationChannelReminders => 'تذكيرات الدواء';

  @override
  String get notificationChannelRemindersDescription =>
      'تذكيرات لأوقات الدواء التي حفظتها.';

  @override
  String get notificationChannelRefills => 'تذكيرات المخزون';

  @override
  String get notificationChannelRefillsDescription =>
      'تنبيه عندما تصل الكمية التي أدخلتها إلى الحد الذي حددته.';

  @override
  String get notificationTitle => 'تذكير بالدواء';

  @override
  String notificationBody(String name, String dose) {
    return '$name · $dose';
  }

  @override
  String get notificationActionTaken => 'تم التناول';

  @override
  String get notificationActionSkip => 'تخطي';

  @override
  String get refillNotificationTitle => 'حد المخزون';

  @override
  String refillNotificationBody(String name, String remaining) {
    return '$name: نحو $remaining متبقٍ، حسب ما أدخلته.';
  }

  @override
  String semanticsColor(int index) {
    return 'اللون $index';
  }

  @override
  String get semanticsNav => 'الأقسام الرئيسية';

  @override
  String get selectDate => 'اختر تاريخًا';

  @override
  String get selectTime => 'اختر وقتًا';

  @override
  String timezoneLabel(String name) {
    return 'المنطقة الزمنية للتذكيرات: $name';
  }
}

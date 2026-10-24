// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'CuraLuma';

  @override
  String get tagline => 'Un peu de soin, chaque jour.';

  @override
  String get navToday => 'Aujourd\'hui';

  @override
  String get navMedicines => 'Médicaments';

  @override
  String get navHistory => 'Historique';

  @override
  String get navSettings => 'Réglages';

  @override
  String get splashLoading => 'Ouverture de CuraLuma';

  @override
  String get onboardingWelcomeTitle => 'Un peu de soin, chaque jour.';

  @override
  String get onboardingWelcomeBody =>
      'CuraLuma conserve l\'horaire de médicaments que vous saisissez et vous aide à noter ce que vous avez pris. Aucun compte n\'est nécessaire.';

  @override
  String get onboardingDisclaimer =>
      'CuraLuma ne pose pas de diagnostic, ne prescrit pas et ne propose pas de dose. Il rappelle seulement l\'horaire que vous avez enregistré.';

  @override
  String get onboardingNotificationsTitle => 'Rappels sur ce téléphone';

  @override
  String get onboardingNotificationsBody =>
      'Les rappels sont des notifications sur cet appareil. Vous pouvez noter une prise depuis la notification lorsque Android le permet, ou ouvrir l\'application et la noter ici.';

  @override
  String get onboardingNotificationsLimit =>
      'Android peut retarder ou bloquer une notification à cause de l\'économie de batterie, du mode Ne pas déranger ou d\'un réglage d\'alarme exacte. CuraLuma ne peut pas garantir que chaque rappel s\'affichera.';

  @override
  String get onboardingLanguageTitle => 'Choisir une langue';

  @override
  String get onboardingLanguageBody =>
      'Vous pouvez suivre la langue du téléphone, ou choisir l\'anglais, le français ou l\'arabe. Vous pourrez changer ce choix dans les réglages.';

  @override
  String get languageSystem => 'Langue du téléphone';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageArabic => 'العربية';

  @override
  String get actionContinue => 'Continuer';

  @override
  String get actionBack => 'Retour';

  @override
  String get actionStart => 'Commencer';

  @override
  String get actionCancel => 'Annuler';

  @override
  String get actionConfirm => 'Confirmer';

  @override
  String get actionDelete => 'Supprimer';

  @override
  String get actionSave => 'Enregistrer';

  @override
  String get actionArchive => 'Archiver';

  @override
  String get actionUnarchive => 'Rétablir';

  @override
  String get actionClose => 'Fermer';

  @override
  String get actionEdit => 'Modifier';

  @override
  String get actionDiscard => 'Abandonner';

  @override
  String get actionKeepEditing => 'Continuer la modification';

  @override
  String onboardingStep(int current, int total) {
    return 'Étape $current sur $total';
  }

  @override
  String get todayHeading => 'Aujourd\'hui';

  @override
  String get todayEmptyTitle => 'Rien de prévu pour le moment';

  @override
  String get todayEmptyBody =>
      'Ajoutez un médicament et les heures auxquelles vous voulez un rappel. CuraLuma affichera ici les prises du jour.';

  @override
  String get actionAddMedicine => 'Ajouter un médicament';

  @override
  String get nextDoseTitle => 'Prochaine prise';

  @override
  String get noNextDose => 'Aucune prise à venir aujourd\'hui';

  @override
  String get scheduleHeading => 'Horaire du jour';

  @override
  String get statusUpcoming => 'À venir';

  @override
  String get statusDue => 'Maintenant';

  @override
  String get statusTaken => 'Prise';

  @override
  String get statusSkipped => 'Ignorée';

  @override
  String get statusMissed => 'Manquée';

  @override
  String get statusPostponed => 'Reportée';

  @override
  String get statusPaused => 'En pause';

  @override
  String get actionTaken => 'Prise';

  @override
  String get actionSkip => 'Ignorer';

  @override
  String get actionPostpone => 'Reporter';

  @override
  String get alreadyRecorded => 'Cette prise est déjà notée.';

  @override
  String get actionRejected =>
      'Ce changement n\'est pas possible pour cette prise.';

  @override
  String get doseRecorded => 'Prise notée.';

  @override
  String semanticsTaken(String name) {
    return 'Noter $name comme prise';
  }

  @override
  String semanticsSkip(String name) {
    return 'Noter $name comme ignorée';
  }

  @override
  String semanticsPostpone(String name) {
    return 'Reporter $name';
  }

  @override
  String get todayNotificationsOff =>
      'Les rappels sont désactivés. Vous pouvez tout de même noter les prises dans l\'application.';

  @override
  String get actionEnableNotifications => 'Activer les rappels';

  @override
  String lowSupplyBanner(String name) {
    return 'La réserve saisie pour $name a atteint ou dépassé le seuil de renouvellement.';
  }

  @override
  String get dueWindowExplain =>
      'Une prise reste « maintenant » pendant une heure, puis elle est marquée manquée si vous ne la notez pas.';

  @override
  String get medicinesHeading => 'Médicaments';

  @override
  String get medicinesEmptyTitle => 'Aucun médicament';

  @override
  String get medicinesEmptyBody =>
      'Ajoutez le nom, la quantité que vous prenez et les heures. CuraLuma conserve cela uniquement sur ce téléphone.';

  @override
  String get archivedHeading => 'Archivés';

  @override
  String get medicineNewTitle => 'Nouveau médicament';

  @override
  String get medicineEditTitle => 'Modifier le médicament';

  @override
  String get medicineDetailsTitle => 'Médicament';

  @override
  String get fieldName => 'Nom';

  @override
  String get fieldDoseAmount => 'Quantité';

  @override
  String get fieldDoseUnit => 'Unité';

  @override
  String get fieldForm => 'Forme';

  @override
  String get fieldNotes => 'Notes';

  @override
  String get fieldInstructions => 'Instructions';

  @override
  String get fieldStartDate => 'Date de début';

  @override
  String get fieldEndDate => 'Date de fin';

  @override
  String get fieldNoEndDate => 'Pas de date de fin';

  @override
  String get fieldTimes => 'Heures de rappel';

  @override
  String get fieldWeekdays => 'Jours';

  @override
  String get fieldColor => 'Couleur';

  @override
  String get fieldPhoto => 'Photo';

  @override
  String get fieldSupply => 'Réserve restante';

  @override
  String get fieldRefillThreshold => 'Seuil de renouvellement';

  @override
  String get nameHint => 'Un nom que vous reconnaîtrez';

  @override
  String get amountHint => 'Comme vous la prenez, par exemple 1 ou 5';

  @override
  String get unitHint => 'Par exemple mg, ml ou comprimé';

  @override
  String get notesHint => 'Note facultative pour vous';

  @override
  String get instructionsHint => 'Instructions facultatives que vous avez déjà';

  @override
  String get supplyHint => 'Quantité facultative qu\'il vous reste';

  @override
  String get thresholdHint => 'Seuil facultatif pour un rappel';

  @override
  String get actionAddTime => 'Ajouter une heure';

  @override
  String actionRemoveTime(String time) {
    return 'Retirer $time';
  }

  @override
  String get actionChoosePhoto => 'Choisir une photo';

  @override
  String get actionRemovePhoto => 'Retirer la photo';

  @override
  String get formTablet => 'Comprimé';

  @override
  String get formCapsule => 'Gélule';

  @override
  String get formLiquid => 'Liquide';

  @override
  String get formDrops => 'Gouttes';

  @override
  String get formInjection => 'Injection';

  @override
  String get formOther => 'Autre';

  @override
  String get weekdayMon => 'Lun';

  @override
  String get weekdayTue => 'Mar';

  @override
  String get weekdayWed => 'Mer';

  @override
  String get weekdayThu => 'Jeu';

  @override
  String get weekdayFri => 'Ven';

  @override
  String get weekdaySat => 'Sam';

  @override
  String get weekdaySun => 'Dim';

  @override
  String get validationName => 'Saisissez un nom.';

  @override
  String get validationDose => 'Saisissez la quantité que vous prenez.';

  @override
  String get validationUnit => 'Saisissez une unité.';

  @override
  String get validationTime => 'Ajoutez au moins une heure.';

  @override
  String get validationDuplicateTime => 'Cette heure est déjà indiquée.';

  @override
  String get validationWeekday => 'Choisissez au moins un jour.';

  @override
  String get validationEndDate =>
      'La date de fin doit être le jour de début ou un jour suivant.';

  @override
  String get validationSupply => 'La réserve ne peut pas être négative.';

  @override
  String get validationThreshold =>
      'Le seuil ne peut pas être négatif, et il faut une quantité en réserve.';

  @override
  String get validationLength => 'Ce texte est trop long.';

  @override
  String get deleteMedicineTitle => 'Supprimer ce médicament ?';

  @override
  String deleteMedicineBody(String name) {
    return 'Supprimer $name ? Son horaire et son historique seront retirés de ce téléphone. Cette action est définitive.';
  }

  @override
  String get archiveMedicineTitle => 'Archiver ce médicament ?';

  @override
  String archiveMedicineBody(String name) {
    return 'Archiver $name ? Les rappels à venir s\'arrêtent. Les prises déjà notées restent dans l\'historique.';
  }

  @override
  String get pauseMedicine => 'Mettre les rappels en pause';

  @override
  String get resumeMedicine => 'Reprendre les rappels';

  @override
  String get pausedBanner =>
      'Les rappels sont en pause. Les prises pendant la pause ne comptent pas comme manquées.';

  @override
  String get scheduleEditNote =>
      'Changer les heures ou les jours met à jour les rappels à venir. Les prises déjà notées restent telles quelles.';

  @override
  String get medicineSaved => 'Médicament enregistré.';

  @override
  String get medicineDeleted => 'Médicament supprimé.';

  @override
  String get photoFailed => 'La photo n\'a pas pu être enregistrée.';

  @override
  String get requiredLegend =>
      'Le nom, la quantité, l\'unité, une heure et un jour sont nécessaires.';

  @override
  String get discardTitle => 'Abandonner les modifications ?';

  @override
  String get discardBody => 'Vos modifications ne seront pas enregistrées.';

  @override
  String get clearEndDate => 'Effacer la date de fin';

  @override
  String doseLabel(String amount, String unit) {
    return '$amount $unit';
  }

  @override
  String get noNotes => 'Aucune note';

  @override
  String get instructionsHeading => 'Instructions';

  @override
  String get notesHeading => 'Notes';

  @override
  String get refillHeading => 'Réserve';

  @override
  String get refillExplanation =>
      'Cette estimation utilise la quantité et l\'horaire que vous avez saisis. Ce n\'est pas un conseil médical.';

  @override
  String get refillCannotEstimate =>
      'La quantité n\'est pas un nombre simple, donc la réserve n\'est pas estimée à partir de l\'horaire. Vous pouvez corriger la quantité vous-même.';

  @override
  String refillRemaining(String amount) {
    return 'Restant : $amount';
  }

  @override
  String dosesLeft(int count) {
    return 'Environ $count prises prévues restantes';
  }

  @override
  String get estimatedLabel => 'Estimation';

  @override
  String get manualSupplyLabel => 'Saisi par vous';

  @override
  String get refillCorrect => 'Corriger la réserve';

  @override
  String get refillSaved => 'Réserve mise à jour.';

  @override
  String get refillLow => 'Au seuil de renouvellement ou en dessous';

  @override
  String get historyHeading => 'Historique';

  @override
  String get historyEmptyTitle => 'Aucune prise sur cette période';

  @override
  String get historyEmptyBody =>
      'Les prises notées, ignorées et manquées apparaissent ici. Les prises à venir restent dans Aujourd\'hui.';

  @override
  String get filterMedicine => 'Médicament';

  @override
  String get filterAllMedicines => 'Tous les médicaments';

  @override
  String get filterFrom => 'Du';

  @override
  String get filterTo => 'Au';

  @override
  String get summaryWeek => 'Cette semaine';

  @override
  String get summaryMonth => 'Ce mois-ci';

  @override
  String get adherenceLabel => 'Notées comme prises';

  @override
  String get adherenceEmpty => 'Aucune prise n\'était due sur cette période.';

  @override
  String get adherenceExplanation =>
      'Le pourcentage correspond aux prises notées comme prises, divisées par les prises déjà dues. Les pauses et les prises encore en attente sont exclues. Modifier un horaire futur ne change pas ces enregistrements.';

  @override
  String countTaken(int count) {
    return 'Prises $count';
  }

  @override
  String countSkipped(int count) {
    return 'Ignorées $count';
  }

  @override
  String countMissed(int count) {
    return 'Manquées $count';
  }

  @override
  String countEligible(int count) {
    return 'Comptées $count';
  }

  @override
  String adherenceValue(String percent) {
    return '$percent %';
  }

  @override
  String get settingsHeading => 'Réglages';

  @override
  String get sectionAppearance => 'Apparence';

  @override
  String get sectionLanguage => 'Langue';

  @override
  String get sectionNotifications => 'Rappels';

  @override
  String get sectionData => 'Vos données';

  @override
  String get sectionAbout => 'À propos';

  @override
  String get themeSystem => 'Système';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get notificationsEnabled => 'Rappels de médicaments';

  @override
  String get exactAlarmTitle => 'Alarmes exactes';

  @override
  String get exactAlarmGranted =>
      'Ce téléphone autorise les alarmes exactes : les rappels peuvent utiliser une heure précise.';

  @override
  String get exactAlarmMissing =>
      'Les alarmes exactes sont désactivées. Les rappels sont tout de même prévus, mais Android peut les afficher un peu plus tard.';

  @override
  String get exactAlarmAction => 'Voir les alarmes exactes';

  @override
  String get notificationSettingsAction => 'Réglages des notifications';

  @override
  String get reliabilityTitle => 'Lorsqu\'un rappel peut ne pas s\'afficher';

  @override
  String get reliabilityBody =>
      'L\'optimisation de la batterie, le mode Ne pas déranger, un redémarrage ou une autorisation de notification refusée peuvent empêcher un rappel. Après un redémarrage, les rappels déjà prévus sont rétablis. L\'application conserve les rappels des sept prochains jours et actualise cette liste lorsque vous l\'ouvrez.';

  @override
  String get horizonNote =>
      'Les rappels sont prévus pour les 7 prochains jours, jusqu\'à 64 à la fois.';

  @override
  String get bootRecoveryNote =>
      'Après un redémarrage du téléphone, Android rétablit les rappels qui étaient déjà prévus.';

  @override
  String get clockChangeNote =>
      'Si l\'horloge ou le fuseau horaire change, les rappels à venir suivent la nouvelle heure locale. Les prises déjà notées ne sont pas réécrites. Une prise manquée marquée automatiquement revient à l\'horaire si l\'horloge recule dans son heure due.';

  @override
  String get postponeLabel => 'Durée du report';

  @override
  String get postpone15 => '15 minutes';

  @override
  String get postpone30 => '30 minutes';

  @override
  String get postpone60 => '60 minutes';

  @override
  String get privacyTitle => 'Confidentialité';

  @override
  String get privacyIntro =>
      'CuraLuma est une application payante, sans compte, sans publicité et sans abonnement dans l\'application.';

  @override
  String get privacyLocal =>
      'Les médicaments, les prises, les notes et les photos restent dans le stockage de l\'application sur ce téléphone.';

  @override
  String get privacyNoAccount =>
      'Vous ne vous connectez pas, et l\'application n\'envoie pas votre liste de médicaments à un serveur.';

  @override
  String get privacyNoCloud =>
      'Il n\'y a pas de sauvegarde dans le nuage. Utilisez Exporter si vous voulez une copie que vous contrôlez.';

  @override
  String get privacyNoAds =>
      'L\'application n\'affiche pas de publicité et n\'inclut pas de kit d\'analyse ou de publicité.';

  @override
  String get privacyNoEncryption =>
      'La base de données sur l\'appareil n\'est pas chiffrée par l\'application. Une personne qui accède au téléphone déverrouillé, ou à une sauvegarde déverrouillée, pourrait lire les données.';

  @override
  String get privacyNotifications =>
      'Le texte de la notification comprend le nom du médicament et la quantité que vous avez saisie, afin que vous reconnaissiez le rappel.';

  @override
  String get helpTitle => 'Aide';

  @override
  String get helpAdd =>
      'Ajoutez un médicament avec le nom, la quantité que vous prenez, une unité, les jours et une ou plusieurs heures.';

  @override
  String get helpRecord =>
      'Dans Aujourd\'hui, notez une prise comme prise, ignorée ou reportée. Noter de nouveau le même résultat ne crée pas une seconde entrée.';

  @override
  String get helpReminders =>
      'Les rappels utilisent l\'heure que vous avez choisie. Une heure absente lors du passage à l\'heure d\'été est décalée à la minute réelle suivante. Une heure répétée lors du passage à l\'heure d\'hiver n\'est rappelée qu\'une fois.';

  @override
  String get helpReliability =>
      'Ouvrez les réglages de batterie du téléphone pour CuraLuma si les rappels arrivent en retard, et autorisez les notifications et les alarmes exactes si vous voulez une heure précise.';

  @override
  String get helpRefill =>
      'Si vous saisissez une réserve et que la quantité est un nombre simple, le restant diminue lorsque vous notez une prise. Sinon, corrigez la réserve vous-même. Le résultat est indiqué comme une estimation.';

  @override
  String get helpNotMedical =>
      'N\'utilisez pas CuraLuma pour décider si un médicament vous convient ou pour changer une dose. Adressez vos questions médicales à un clinicien ou à un pharmacien.';

  @override
  String aboutVersion(String version) {
    return 'Version $version';
  }

  @override
  String get aboutPaid =>
      'CuraLuma est vendu en achat unique. Le prix et l\'achat sont gérés par Google Play, pas dans l\'application.';

  @override
  String get exportAction => 'Exporter les données';

  @override
  String get importAction => 'Importer des données';

  @override
  String get deleteAllAction => 'Supprimer toutes les données';

  @override
  String get deleteAllTitle => 'Supprimer toutes les données ?';

  @override
  String get deleteAllBody =>
      'Cela retire de ce téléphone les médicaments, l\'historique, les photos et les réglages, et annule les rappels prévus. Cette action est définitive.';

  @override
  String get exportSuccess => 'Export enregistré.';

  @override
  String get exportCancelled => 'Export annulé.';

  @override
  String get importSuccess =>
      'Import terminé. Les données précédentes de ce téléphone ont été remplacées.';

  @override
  String get importCancelled => 'Import annulé.';

  @override
  String get importInvalid =>
      'Ce fichier n\'est pas une sauvegarde CuraLuma lisible par cette version.';

  @override
  String get importReplaceTitle => 'Remplacer les données de ce téléphone ?';

  @override
  String get importReplaceBody =>
      'L\'import remplace les médicaments et l\'historique actuellement enregistrés ici.';

  @override
  String get actionFailed => 'L\'action n\'a pas pu être terminée.';

  @override
  String get disclaimerTitle => 'Pas un conseil médical';

  @override
  String get notMedicalShort =>
      'CuraLuma rappelle un horaire que vous saisissez. Il ne fournit pas de conseil médical.';

  @override
  String get notificationChannelReminders => 'Rappels de médicaments';

  @override
  String get notificationChannelRemindersDescription =>
      'Rappels pour les heures de médicament que vous avez enregistrées.';

  @override
  String get notificationChannelRefills => 'Rappels de réserve';

  @override
  String get notificationChannelRefillsDescription =>
      'Un avis lorsque la réserve saisie atteint votre seuil.';

  @override
  String get notificationTitle => 'Rappel de médicament';

  @override
  String notificationBody(String name, String dose) {
    return '$name · $dose';
  }

  @override
  String get notificationActionTaken => 'Prise';

  @override
  String get notificationActionSkip => 'Ignorer';

  @override
  String get refillNotificationTitle => 'Seuil de réserve';

  @override
  String refillNotificationBody(String name, String remaining) {
    return '$name : environ $remaining restant, d\'après vos saisies.';
  }

  @override
  String semanticsColor(int index) {
    return 'Couleur $index';
  }

  @override
  String get semanticsNav => 'Sections principales';

  @override
  String get selectDate => 'Choisir une date';

  @override
  String get selectTime => 'Choisir une heure';

  @override
  String timezoneLabel(String name) {
    return 'Fuseau utilisé pour les rappels : $name';
  }
}

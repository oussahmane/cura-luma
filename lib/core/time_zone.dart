import 'package:timezone/timezone.dart' as tz;

/// Resolves an IANA name from the platform. Some platforms report `UTC`
/// even though the timezone database only exposes that zone as [tz.UTC].
tz.Location locationFor(String identifier) {
  const aliases = {'UTC', 'Etc/UTC', 'Etc/Universal', 'GMT', 'Etc/GMT'};
  if (aliases.contains(identifier)) {
    return tz.UTC;
  }
  try {
    return tz.getLocation(identifier);
  } catch (_) {
    return tz.UTC;
  }
}

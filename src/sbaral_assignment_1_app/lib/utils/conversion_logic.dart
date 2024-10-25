const units = ['meters', 'feet', 'kilometers', 'miles', 'inches', 'centimeters'];

final Map<String, double> conversionRates = {
  'meters_feet': 3.28084,
  'feet_meters': 0.3048,
  'meters_kilometers': 0.001,
  'kilometers_meters': 1000.0,
  'miles_kilometers': 1.60934,
  'kilometers_miles': 0.621371,
  'inches_centimeters': 2.54,
  'centimeters_inches': 0.393701,
};

String? convertUnits(double value, String fromUnit, String toUnit) {
  String key = '${fromUnit}_$toUnit';
  double? rate = conversionRates[key];

  if (rate == null) return 'Conversion not possible';

  double result = value * rate;
  return result.toStringAsFixed(3);
}

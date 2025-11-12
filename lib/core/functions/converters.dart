//This file will help me to conver the data from the
//api in json format .some time there is a type mismatch
//to fix the conflict i build this file that contain
//function will fix the conflict.

double? toDoubleValue(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

//لو القيمة انا متوقعة جاية int or i want to be int this will do the job.
int? toIntValue(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}

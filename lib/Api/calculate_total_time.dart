
class TotalTime {
  String calculateTotalTime(DateTime? intime, DateTime? outtime) {
    if (intime == null || outtime == null) {
      return 'Invalid time data';
    }

    final total = outtime.difference(intime);
    final hours = total.inHours;
    final minutes = total.inMinutes.remainder(60);
    return '${hours * 60 + minutes} minutes';
  }
}
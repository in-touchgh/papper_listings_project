class ClockInOutModel {
  final String time;
  final String location;
  final String type;

  ClockInOutModel({
    required this.time,
    required this.location,
    required this.type,
  });

  List<ClockInOutModel> inOut = [];

  clockIn(ClockInOutModel data) {
    inOut.add(data);
  }

  clockOut(ClockInOutModel data) {
    inOut.add(data);
  }
}

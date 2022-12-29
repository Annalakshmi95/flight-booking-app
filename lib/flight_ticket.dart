class FlightTicket {
  String? title;
  String? fromDate;
  String? fromTime;
  String? arriveDate;
  String? arriveTime;
  String? origin;
  String? destination;
  String? elapsedTime;
  bool? isRunning;

FlightTicket(
  {this.title,
  this.fromDate,
  this.fromTime,
  this.arriveDate,
  this.arriveTime,
  this.origin,
  this.destination,
  this.elapsedTime,
  this.isRunning});
}

List<FlightTicket>tiketItems = [
  FlightTicket(
  title:"VACATION IN LONDON",
  fromDate: "oct 20",
  fromTime: "05:50AM",
  arriveDate: "oct 25",
  arriveTime: "04:40PM",
  elapsedTime: "10:50m",
  origin: "Chennai",
  destination: "Heathrow Apt",
  isRunning: false),
FlightTicket(
  title: "VACATION IN NEWYORK",
  fromDate: "Jan 20",
  fromTime: "05:50AM",
  arriveDate: "Jan 25",
  arriveTime: "04:40PM",
  elapsedTime: "10:50m",
  origin: "Chennai",
  destination: "New York",
  isRunning: false
),
FlightTicket(
  title: "VACATION IN CANADA",
  fromDate: "Nov 20",
  fromTime: "05:50AM",
  arriveDate: "Nov 25",
  arriveTime: "04:40PM",
  elapsedTime: "10:50m",
  origin: "Chennai",
  destination: "YYZ",
  isRunning: true
),
FlightTicket(
  title: "VACATION IN  FRANCE",)];
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hello_template/event/event_data_source.dart';
import 'package:flutter_hello_template/event/event_model.dart';
import 'package:flutter_hello_template/event/event_service.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventView extends StatefulWidget {
  const EventView({super.key});

  @override
  State<EventView> createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  final eventService = EventService();
  // danh sách sự kiện 
  List<EventModel> items = [];
  final calendarController = CalendarController();

  @override
  void initState() {
    super.initState();
    calendarController.view = CalendarView.day;
    loadEvents();
  }

  Future<void> loadEvents()async {
    final events = await eventService.getAllEvents();
    setState(() {
      items = events;
    });
  }


  @override
  Widget build(BuildContext context) {
    final al = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(al.appTitle),
      actions: [
        PopupMenuButton<CalendarView>(
          itemBuilder: (context) => CalendarView.values.map((View){
            return PopupMenuItem<CalendarView>(
              value: View, // chư bieye
              child: ListTile(
                title: Text(View.name),
              ),
            );
       
        }).toList(),

        icon: getCalendarViewIcon(calendarController.view!),
        )
      ],
      ),



      body: SfCalendar(
        controller: calendarController,
        dataSource: EventDataSource(items),
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment
        ),
      ),
    );
  }


  Icon getCalendarViewIcon(CalendarView view){
    switch(view) {
      case CalendarView.day:
      return const Icon(Icons.calendar_view_day_outlined);
      case CalendarView.week:
      return const Icon(Icons.calendar_view_week_outlined);
      case CalendarView.workWeek:
      return const Icon(Icons.work_history_outlined);
      case CalendarView.month:
      return const Icon(Icons.calendar_view_month_outlined);
      case CalendarView.schedule:
      return const Icon(Icons.schedule_outlined);
      default:
      return const Icon(Icons.calendar_today_outlined);
    }
  }




}

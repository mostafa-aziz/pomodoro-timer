class TimerSession {
  final String id;
  final String sessionName;
  final DateTime sessionDate;
  final int completedSessions;

  const TimerSession({
    required this.id,
    required this.sessionName,
    required this.sessionDate,
    required this.completedSessions,
  });

  TimerSession copyWith({
    String? id,
    String? sessionName,
    DateTime? sessionDate,
    int? completedSessions,
  }) =>
      TimerSession(
        id: id ?? this.id,
        sessionName: sessionName ?? this.sessionName,
        sessionDate: sessionDate ?? this.sessionDate,
        completedSessions: completedSessions ?? this.completedSessions,
      );
}

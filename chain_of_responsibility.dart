enum LogLevel {
  None,
  Info,
  Debug,
  Warning,
  Error,
  FunctionalMessage,
  FunctionalError,
}

abstract class Logger {
  List<LogLevel> levels;
  Logger _next;

  Logger(this.levels);

  bool get universal => levels.contains(LogLevel.values);
  void set next(Logger nextLogger) => _next = nextLogger;

  void addLevel(LogLevel level) => levels.add(level);

  void log(LogLevel level, String msg) {
    if (levels.contains(level) || universal) {
      write_message(msg);
    }
    _next?.log(level, msg);
  }

  void write_message(String msg);
}

class ConsoleLogger extends Logger {
  ConsoleLogger(List<LogLevel> levels) : super(levels);
  void write_message(String msg) => print("[Console]: $msg");
}

class EmailLogger extends Logger {
  EmailLogger(List<LogLevel> levels) : super(levels);
  void write_message(String msg) => print("[Email]: $msg");
}

class FileLogger extends Logger {
  FileLogger(List<LogLevel> levels) : super(levels);
  void write_message(String msg) => print("[File]: $msg");
}

void main() {
  ConsoleLogger logger = ConsoleLogger(List.from(LogLevel.values));
  EmailLogger eLog = EmailLogger(List.from([LogLevel.FunctionalMessage, LogLevel.FunctionalError]));
  FileLogger fLog = FileLogger(List.from([LogLevel.Warning, LogLevel.Error]));

  logger.next = eLog;
  eLog.next = fLog;

  logger.log(LogLevel.Debug, "Some amazingly helpful debug message");
  logger.log(LogLevel.Info, "Pretty important information");

  logger.log(LogLevel.Warning, "This is a warning!");
  logger.log(LogLevel.Error, "AHHHHHHHHH!");

  logger.log(LogLevel.FunctionalError, "This is not a show stopper");
  logger.log(LogLevel.FunctionalMessage, "This is basically just info");


}
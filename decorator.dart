abstract class INotifier{
  void send();
}

class UserNotifier extends INotifier{
  void send() {
    print('Notify user regularly');
  }
}
abstract class NotifierDecoratorBase extends INotifier{
  late INotifier notifier;
  NotifierDecoratorBase(INotifier notifier){
    this.notifier=notifier;
  }
  void send(){
    notifier.send();
  }
}
class SmsNotifier extends NotifierDecoratorBase{
  SmsNotifier(INotifier notifier) : super(notifier);
  void send(){
    super.send();
    print('Notify user with sms');
  }
}
class EmailNotifier  extends NotifierDecoratorBase{
  EmailNotifier(INotifier notifier) : super(notifier);
  void send(){
    super.send();
    print('Notify user with email');
  }
}
void main(){
  bool isSmsNotificationEnabled    = true;
  bool isEmailNotificationEnabled  = false;
  INotifier notifier =  UserNotifier();


  if (isSmsNotificationEnabled)   notifier = SmsNotifier(notifier);
  if (isEmailNotificationEnabled) notifier =  EmailNotifier(notifier);

  notifier.send();
}

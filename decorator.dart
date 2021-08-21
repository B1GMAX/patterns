abstract class INotifier{
  void Send();
}

class UserNotifier extends INotifier{
  void Send() {
    print('Notify user regularlyyy');
  }
}
abstract class NotifierDecoratorBase extends INotifier{
  INotifier notifier;
  NotifierDecoratorBase(INotifier notifier){
    this.notifier=notifier;
  }
  void Send(){
    notifier.Send();
  }
}
class SmsNotifier extends NotifierDecoratorBase{
  SmsNotifier(INotifier notifier) : super(notifier);
  void Send(){
    super.Send();
    print('Notify user with sms');
  }
}
class EmailNotifier  extends NotifierDecoratorBase{
  EmailNotifier(INotifier notifier) : super(notifier);
  void Send(){
    super.Send();
    print('Notify user with email');
  }
}
void main(){
  bool isSmsNotificationEnabled    = true;
  bool isEmailNotificationEnabled  = false;
  INotifier notifier =  UserNotifier();


  if (isSmsNotificationEnabled)   notifier = SmsNotifier(notifier);
  if (isEmailNotificationEnabled) notifier =  EmailNotifier(notifier);

  notifier.Send();
}

import 'package:get/get_navigation/src/root/internacionalization.dart';

class Language extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US' :{
      'email_hint' : 'Enter email',
      'internet_exception' : 'Internet connection unavailable',
      'general_exception' : "We're unable to process your request.\n Please try again"
    },
    'MM_MY' :{
      'email_hint' : 'အီးမေးလ်ထည့်ပါ။',
      'internet_exception' : 'အင်တာနက်ချိတ်ဆက်မှု မရနိုင်ပါ။',
      'general_exception' : "သင့်တောင်းဆိုချက်ကို ကျွန်ုပ်တို့ လုပ်ဆောင်၍မရပါ။\n ကျေးဇူးပြု၍ ထပ်ကြိုးစားပါ။"
    },
  };

}
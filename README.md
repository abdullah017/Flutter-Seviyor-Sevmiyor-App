# seviyor_sevmiyor_app

## HAKKINDA
Flutter ile yazılmış eğlencelik uygulama.

Uygulama 3 ekrandan oluşuyor. 

1=> Logo ekranı 

2=> Onboard ya da intro ekranı

3=> Ana sayfa

## KULLANILAN PAKETLER
Uygulama içerisinde ki dönen çark için fflutter_fortune_wheel: ^0.4.2 sürümlü paketi,

Logo ekranı için splash_screen_view: ^3.0.0 sürümlü paketi, 

Onboard(intro) ekranı için de introduction_screen: ^2.1.0 sürümlü paketi,

Ve son olarak local storage için de shared_preferences: ^2.0.7 sürümlü paketi kullandım.


## OnBoard Ekranın Bir Kere Çalışması Süreci -İLK ADIM
-Öncelikle lib/views/introslide_view.dart dosyasına erişiyoruz.

-Slide bittiğinde beliren Bitti butonu için atanmış void türünde ki _onIntroEnd metodunu buluyoruz

**Bu metotu sayfanın en başında bulabilirsiniz**

-Local storage kullanacağımız için metodumuzun asenkron yani async olmasını sağlıyoruz

**For examp:
       void _onIntroEnd(context) async { **

-Daha sonra local storage üzerinde tutmak için metot içinde bool bir değişken yaratıyoruz. 

 **For examp:
        void _onIntroEnd(context) async {
    bool isOpened = true; **
    
-Elbette siz oluştururken değer atamak zorunda değilsiniz. Sonraki adımlarda açıklamasını yaparım

-Şimdi sıra geldi local storage paketimizi entegre etmeye

-Metot içerisine aşağıdaki kodları ekliyoruz ve paketi import ediyoruz:
    **SharedPreferences prefs = await SharedPreferences.getInstance();**
    
-Paketide ekledikten sonra bir alt satıra local storage içinde tutması gereken key ve value parametlerini veriyoruz. 

    **For examp:
         await prefs.setBool('onBoard', isOpened);**
         
-Eğer siz başlangıçta bir değer atamadıysanız value yani isOpened kısmına true ya da false değerini verebilirsiniz.

-Daha sonra metot içinde local bir değişken tanımlayıp az önce atadığım değeri anahtar adıyla çağırıyor ve değişkenime atıyorum

  **For examp:
    var a = prefs.getBool('onBoard');**
    
-Değişkenin çağırdığım değeri alıp almadığını kontrol etmek için değişkeni yazdırıyorum

-Son olarak kullanıcıyı ana sayfaya yönlendiriyoruz.

## OnBoard Ekranın Bir Kere Çalışması Süreci -İKİNCİ ADIM

-lib/views/splash_view.dart dosyasına erişiyoruz.

-bool tipinde nullable bir değişken tanımlıyoruz

  **for examp:
        bool? isOpen;**
        
-Daha sonra initState metodu oluşturuyoruz. Bunun nedeni uygulama çalışmaya başlar başlamaz yazacağımız metodu da çalıştırmasını istememiz

   **for examp:
        @override
  void initState() {
    super.initState();
   }**
   
-Local storageden gerekli değeri çekmek için metodumu yazıyorum. 

  **for examp:
     Future<Null> _onBoardValue() async { //asenkron olduğunu ve belirtiyoruz
     SharedPreferences prefs = await SharedPreferences.getInstance(); //gerekli değeri çekip değişkene atıyoruz
      isOpen = (prefs.getBool('onBoard'));
      print('SPLASH A VALUE ******** $isOpen');//değeri çekmiş miyiz kontrol ediyoruz
    }
  
 -SplashScreenView widget özelliği olan navigateRoute özelliğine koşullu yönlendirme ekliyoruz.
        
     **for examp:
             navigateRoute: isOpen == true ? HomeView() : OnBoardingView(),
  
-initState içerine çalışması için metot adımızı yazıyoruz. 
        
   **for examp:
        @override
  void initState() {
    super.initState();
  _onBoardValue();
   }**
        
     ** Ancak bu şekilde bırakırsak hata ile karşılarız. Uygulama value olarak true döndürse dahi değişkenimiz null olarak kalacaktır.
        
          Bunun sebebi Future ve async olarak tanımladığımız metodumuzun henüz işini bitirmemiş olmasıdır. Bu işlemin bittiğini ve bittikten sonra
        
          state alanını yenilemesi bu durumdan haberdar etmesi için init state bölümünü nu şekilde düzenliyoruz
        
        **for examp:
              @override
                   void initState() {
                     super.initState();
   
                       _onBoardValue().whenComplete(() {
                            setState(() {
                               print('İSOPEN VALUE******* $isOpen');//print ile değişkenin değerinin değiştiğini görebilirsiniz.
                             });
        
                         });
-Kodların açıklaması bu şekilde umarım anlaşılır ve faydalı olmuştur.

## Getting Started
  !!! pubspec.yaml dosyasını get etmeyi unutmayın!

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

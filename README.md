# ExportContacts


![](https://img.shields.io/teamcity/codebetter/bt428.svg)
![](https://img.shields.io/badge/swift-4.0-red.svg)
![](https://img.shields.io/badge/xcode-9-blue.svg)
![](https://img.shields.io/badge/platform-iOS-lightgrey.svg)
![](https://img.shields.io/badge/license-Apache%202.0-yellow.svg)

### Uygulama içinden görüntüler
![ScreenShot](https://raw.github.com/mustafagunes/ExportContact/master/README%20Docs/contact.gif)

İÇERİK
------
Aşağıda uygulamada için kullanılan araçlar ve kütüphanelerin listesi yer alıyor.

1. POD - Üçüncü parti kütüphaneleri yüklediğim araç
    - [SwiftyButton](https://github.com/TakeScoop/SwiftyButton) - Basma efektli swift'e import edilmiş güzel bir kütüphane.
    - [paper-onboarding](https://github.com/Ramotion/paper-onboarding) - Uygulama başlangıcında bilgilendirme ekranı için yazılmış.
    - [RevealingSplashView](https://github.com/PiXeL16/RevealingSplashView) - Uygulama başlangıcında LaunchScreen'i kullanarak efektli uygulama başlangıcı sağlıyor.
    
2. GIT - Versiyon Kontrol
    - ```git add -A``` - Bulunduğunuz dosyadaki bütün parçaları alır.
    - ```git commit -m "<description>"``` - Yaptığınız değişikliklerden sonra versiyonla alakalı açıklama kısmı.
    - ```git push -u origin master``` - Yukarıdakileri sırası ile yaptıysanız, bu komutla Github, Gitlab ve BitBucket gibi depolara projenizi gönderebilirsiniz
    
Projeyi İndirme & Kurma
-----------------------

* Elle Kurulum
    - [Bu linke tıkyarak projeyi .zip olarak indirin](https://github.com/mustafagunes/ExportContact/archive/master.zip)
    - İndirme işlemi bittikten sonra, dosyaları çıkartın.
    - Ardından ExportContact(VCard).xcworkspace çift tıklayarak projeyi çalıştırın.

* Terminal ile Kurulum
    - Aşağıdaki komutları sırasıyla terminale yazın ve çalıştırın:
        * ```git clone https://github.com/mustafagunes/ExportContact.git```
        * ```cd ExportContact```
    - Son olarak aşağıdaki komutu yazın ve çalıştırın:
        * ```open ExportContact(VCard).xcworkspace```

# Uygulama Başlatıcı

Windows'ta birden fazla uygulamayı sırayla başlatan basit bir tool.

## Kullanım

1. `apps.txt` dosyasına uygulamaların yollarını yaz
2. `launcher.sh` dosyasını çalıştır
3. Başlatma aralığını gir (saniye)
4. Onaylama yap

## Dosyalar

- `launcher.sh` - Ana script
- `apps.txt` - Uygulamalar listesi
- `launcher.bat` - Windows masaüstü kısayolu

## Örnek (apps.txt)
/c/Program Files/Microsoft SQL Server Management Studio 21/Release/Common7/IDE/SSMS.exe

/c/Program Files/JetBrains/IntelliJ IDEA 2024.1/bin/idea64.exe

/c/Users/username/AppData/Local/Programs/Microsoft VS Code/Code.exe

/c/Users/username/AppData/Local/Postman/Postman.exe

/c/Program Files/Git/git-bash.exe

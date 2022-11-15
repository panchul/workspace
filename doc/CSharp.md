# C#

See Also:

- [AlgorithmsDataStructures](AlgorithmsDataStructures.md)
- [Entity Framework](EntityFramework.md)
- [Futures](Futures.md)
- [Multithreading](Multithreading.md)
- [RAII](RAII.md)
- [Return Type Resolver](ReturnTypeResolver.md)
- [STL](STL.md)
- [Visual Studio Code](VisualStudioCode.md)

My C# sandbox is [https://github.com/panchul/sb_csharp](https://github.com/panchul/sb_csharp).

---

**Content**

 - [Dotnet CLI](CSharp.md#Dotnet-CLI)
 - [Samples](CSharp.md#Samples)
 - [Fundamentals](CSharp.md#Fundamentals)
 - [Libraries and Interop](CSharp.md#libraries-and-interop)
 - [GUI Samples](CSharp.md#gui-samples)
 - [Windows Messaging](CSharp.md#windows-messaging)
 - [Logging](CSharp.md#logging)
 - [Miscellaneous](CSharp.md#Miscellaneous)

---

# Dotnet CLI

    Usage: dotnet [sdk-options] [command] [command-options] [arguments]

To create a solution

    $ dotnet new solution
    $ dotnet new 

To add the project to the solution:

    $ dotnet add projectname.csproj

To run test runner (Xunit, for example):

    $ dotnet test

---

Dotnet on Ubuntu, etc.

- https://docs.microsoft.com/en-us/azure/app-service/quickstart-dotnetcore?tabs=net60&pivots=development-environment-vs
- https://www.michaelcrump.net/part3-aspnetcore/
- https://docs.microsoft.com/en-us/visualstudio/mac/asp-net-core?view=vsmac-2019
- [troubleshooting ssh on aws](https://aws.amazon.com/premiumsupport/knowledge-center/ec2-linux-fix-permission-denied-errors/)
- https://www.davidhayden.me/blog/install-net5-on-ubuntu-20-04
- https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu - good one
- Dotnet on Ubuntu 20 https://tecadmin.net/how-to-install-net-core-on-ubuntu-20-04/

---

## Samples

---

COM and .NET links

Creating C# UI accessable from C++ MFC application.
https://docs.microsoft.com/en-us/cpp/dotnet/how-to-sink-windows-forms-events-from-native-cpp-classes?view=msvc-160
https://docs.microsoft.com/en-us/cpp/dotnet/how-to-create-the-user-control-and-host-in-a-dialog-box?view=msvc-160

Debug in mixed mode
https://docs.microsoft.com/en-us/visualstudio/debugger/how-to-debug-in-mixed-mode?view=vs-2019

A video about Windows Forms and MFC.
https://www.youtube.com/watch?v=za09Qu1Upjc

---

More Windows samples
https://docs.microsoft.com/en-us/samples/browse/?redirectedfrom=MSDN-samples&terms=com

---

## Fundamentals

---

List links
https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.listview.items?view=net-5.0

---

EventHandler Delegate

https://docs.microsoft.com/en-us/dotnet/api/system.eventhandler?view=net-6.0

---

https://learn.microsoft.com/en-us/dotnet/csharp/fundamentals/coding-style/coding-conventions

https://www.reddit.com/r/csharp/comments/w5idwh/i_hate_var_whats_their_big_benefit/

---

## Libraries and Interop

---

Json library
https://docs.microsoft.com/en-us/dotnet/standard/serialization/system-text-json-how-to?pivots=dotnet-6-0

---

Pinvoke samples

https://github.com/rstropek/Samples.git

https://docs.microsoft.com/en-us/dotnet/framework/interop/marshaling-data-with-platform-invoke#pinvokelibdll

---

Using managed COM object from C
https://stackoverflow.com/questions/12429282/using-a-managed-com-object-in-c

---

Trending repos at GitHub
https://github.com/trending/c%23

---

eShop on Containers
https://github.com/dotnet-architecture/eShopOnContainers

---

Build and deploy .net com assembly
https://www.red-gate.com/simple-talk/dotnet/visual-studio/build-and-deploy-a-.net-com-assembly/

---

C++ MFC and DLL tutorials, seems to be very detailed
https://www.tenouk.com/visualcplusmfc/visualcplusmfc16.html

---

Communication between components, Message sending using a MessageHelper.
https://boycook.wordpress.com/2008/07/29/c-win32-messaging-with-sendmessage-and-wm_copydata/

The gist of that MessageHelper
https://gist.github.com/BoyCook/5075907

---

Dll links
https://www.red-gate.com/simple-talk/dotnet/visual-studio/build-and-deploy-a-.net-com-assembly/

Utilities to look inside of the dlls:

 - TlbExp
 - Regasm
 - ildasm

https://www.tenouk.com/visualcplusmfc/visualcplusmfc16.html

---

Using C++ Interop (Implicit PInfoke)

https://docs.microsoft.com/en-us/cpp/dotnet/using-cpp-interop-implicit-pinvoke?redirectedfrom=MSDN&view=msvc-160

---

## COM Interface

COM interface data marshalling

https://limbioliong.wordpress.com/2011/07/14/passing-a-safearray-of-managed-structures-to-unmanaged-code/

https://limbioliong.wordpress.com/2011/07/16/marshaling-a-safearray-of-managed-structures-by-com-interop-part-2/


https://limbioliong.wordpress.com/2011/06/03/passing-structures-between-managed-and-unmanaged-code/


https://limbioliong.wordpress.com/2012/02/28/marshaling-a-safearray-of-managed-structures-by-pinvoke-part-1/

https://limbioliong.wordpress.com/2012/02/29/marshaling-a-safearray-of-managed-structures-by-pinvoke-part-2/

https://limbioliong.wordpress.com/2012/03/01/marshaling-a-safearray-of-managed-structures-by-pinvoke-part-3/

---

## GUI Samples

---

Creating an HTML UI for Desktop .NET Applications
https://www.infoq.com/articles/html-desktop-net/

Uses DotNetBrowser, https://www.teamdev.com/dotnetbrowser

---

DataGridView Link
https://www.youtube.com/watch?v=GyLlpBZGsrE

---

ListView
https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.listview.items?view=net-5.0

---

## Windows Messaging

---

Windows Messaging example
https://docs.microsoft.com/en-us/windows/win32/inputdev/using-keyboard-input
https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-sendmessage?redirectedfrom=MSDN

---

## Logging

---

Creating your own logging provider to log to text files in net core

https://www.roundthecode.com/dotnet/create-your-own-logging-provider-to-log-to-text-files-in-net-core

---

## Miscellaneous

---

Web server in C#

    http://codehosting.net/blog/BlogEngine/post/Simple-C-Web-Server

and some adoption of it:

    https://bitbucket.org/tevert/tinywebserver

---

WebRequest is obsolete and should not be used. HttpClient and HttpClientFactory is the proper way for http communication in .NET.

    https://learn.microsoft.com/en-us/dotnet/core/compatibility/networking/6.0/webrequest-deprecated

    https://dev.azure.com/alpineitw/intelliVIEW-Web/_git/Sandbox?path=/httpclient-aspnetcore

---

SMTP Client, email, etc.

- https://stackoverflow.com/questions/18326738/how-to-send-email-in-asp-net-c-sharp
- https://social.msdn.microsoft.com/Forums/en-US/10a8f6f5-e924-4044-98c8-91d434c14398/mail-authentication-exception-while-sending-a-mail-with-aspnet
- https://stackoverflow.com/questions/8628683/how-to-send-html-formatted-email - Formatted

- https://blog.elmah.io/how-to-send-emails-from-csharp-net-the-definitive-tutorial/ - good one, with alternative smtp clients and libs

Basic usage:

    var smtpClient = new SmtpClient("smtp.gmail.com")
    {
        Port = 587,
        Credentials = new NetworkCredential("email", "password"),
        EnableSsl = true,
    };
    smtpClient.Send("email", "recipient", "subject", "body");

Http body:

    var mailMessage = new MailMessage
    {
        From = new MailAddress("email"),
        Subject = "subject",
        Body = "<h1>Hello</h1>",
        IsBodyHtml = true,
    };
    mailMessage.To.Add("recipient");
    smtpClient.Send(mailMessage);

For the attachment:

    var mailMessage = new MailMessage
    {
    ...
    };
    var attachment = new Attachment("profile.jpg", MediaTypeNames.Image.Jpeg);
    mailMessage.Attachments.Add(attachment);

To use `ConfigurationBuilder`:

declare the info in `appsettings.json`:

    {
       "Smtp": {
           "Host": "smtp.gmail.com",
           "Port": 587,
           "Username": "email",
           "Password": "password"
       }
    }

and in the code:

    var builder = new ConfigurationBuilder()
                       .AddJsonFile("appsettings.json");
    var config = builder.Build();
    var smtpClient = new SmtpClient(config["Smtp:Host"])
    {
        Port = int.Parse(config["Smtp:Port"]),
        Credentials = new NetworkCredential(config["Smtp:Username"], config["Smtp:Password"]),
        EnableSsl = true,
    };

---

The book on C# people on internet recommend:
ISBN-13: 978-0735667457
ISBN-10: 0735667454
CLR via C# (4th Edition) (Developer Reference) 4th Edition
by Jeffrey Richter 

---

Simple command-line compilation and execution on Mac:

    $ mcs Program.cs 
    $ mono Program.exe
    
---

To sleep for 5 sec:

    System.Threading.Thread.Sleep(5000);

---

To execute a command from within .cs file:

    System.Diagnostics.Process process = new System.Diagnostics.Process();
    System.Diagnostics.ProcessStartInfo startInfo = new System.Diagnostics.ProcessStartInfo();
    startInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
    startInfo.FileName = "myprogram_or_command";
    startInfo.Arguments = "some arguments if needed";
    process.StartInfo = startInfo;
    process.Start();
  
    process.WaitForExit(); // if we want to wait for it to finish

---

For JSON serialization, Newtonsoft.Json is no longer needed with .NET Core/5/6/7. Built-in System.Text.Json namespace is the way to go. 

---
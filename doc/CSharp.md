# C#

See Also:

- [AlgorithmsDataStructures](AlgorithmsDataStructures.md)
- [Futures](Futures.md)
- [Multithreading](Multithreading.md)
- [RAII](RAII.md)
- [Return Type Resolver](ReturnTypeResolver.md)
- [STL](STL.md)
- [Visual Studio Code](VisualStudioCode.md)

My C# sandbox is [https://github.com/panchul/sb_csharp](https://github.com/panchul/sb_csharp).

---

**Content**

 - [Samples](#Samples)
 - [Fundamentals](#Fundamentals)
 - [Libraries and Interop](#libraries-and-interop)
 - [GUI Samples](#gui-samples)
 - [Windows Messaging](#windows-messaging)
 - [Miscellaneous](#Miscellaneous)

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

## Libraries and Interop

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

## Miscellaneous

---

Web server in C#

    http://codehosting.net/blog/BlogEngine/post/Simple-C-Web-Server

and some adoption of it:

    https://bitbucket.org/tevert/tinywebserver

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

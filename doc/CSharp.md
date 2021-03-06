# C#

See Also:

- [Multithreading](Multithreading.md)
- [STL](STL.md)
- [AlgorithmsDataStructures](AlgorithmsDataStructures.md)
- [Visual Studio Code](VisualStudioCode.md)
- [RAII](RAII.md)
- [Return Type Resolver](ReturnTypeResolver.md)
- [Futures](Futures.md)

My C# sandbox is [https://github.com/panchul/sb_csharp](https://github.com/panchul/sb_csharp).

---

**Content**

 - [Samples](#Samples)
 - [Fundamentals](#Fundamentals)
 - [Libraries and Interop](#libraries-and-interop)
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

## Libraries and Interop

---

Dll links
https://www.red-gate.com/simple-talk/dotnet/visual-studio/build-and-deploy-a-.net-com-assembly/

Utilities to look inside of the dlls:

 - TlbExp
 - Regasm

https://www.tenouk.com/visualcplusmfc/visualcplusmfc16.html

---

Using C++ Interop (Implicit PInfoke)

https://docs.microsoft.com/en-us/cpp/dotnet/using-cpp-interop-implicit-pinvoke?redirectedfrom=MSDN&view=msvc-160

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

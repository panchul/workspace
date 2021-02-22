# C#

---

More Windows samples
https://docs.microsoft.com/en-us/samples/browse/?redirectedfrom=MSDN-samples&terms=com

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

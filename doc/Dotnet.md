[Home](Readme.md)
# Dotnet

See Also:

- [CSharp](CSharp.md)
- [Visual Studio Code](VisualStudioCode.md)


[https://dotnet.microsoft.com/en-us/](https://dotnet.microsoft.com/en-us/)

My C# sandbox is [https://github.com/panchul/sb_csharp](https://github.com/panchul/sb_csharp).

---

**Content**

- [Installing](Dotnet.md#installing)
- [Dotnet CLI](Dotnet.md#Dotnet-CLI)
- [Dotnet on Ubuntu, etc.](Dotnet.md#dotnet-on-ubuntu-etc)
- [Miscellaneous](Dotnet.md#miscellaneous)

---

## Installing

---

Dotnet SDK for mac:

https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-9.0.101-macos-arm64-installer

---

## Dotnet CLI

See also [CSharp.md](CSharp.md#dotnet-cli)

```bash
    Usage: dotnet [sdk-options] [command] [command-options] [arguments]
```

To create a solution

```bash
    $ dotnet new solution
    $ dotnet new 
```

To add the project to the solution:

```bash
    $ dotnet add projectname.csproj
```

To run test runner (Xunit, for example):

```bash
    $ dotnet test
```

---

## Dotnet on Ubuntu, etc.

- https://docs.microsoft.com/en-us/azure/app-service/quickstart-dotnetcore?tabs=net60&pivots=development-environment-vs
- https://www.michaelcrump.net/part3-aspnetcore/
- https://docs.microsoft.com/en-us/visualstudio/mac/asp-net-core?view=vsmac-2019
- [troubleshooting ssh on aws](https://aws.amazon.com/premiumsupport/knowledge-center/ec2-linux-fix-permission-denied-errors/)
- https://www.davidhayden.me/blog/install-net5-on-ubuntu-20-04
- https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu - good one
- Dotnet on Ubuntu 20 https://tecadmin.net/how-to-install-net-core-on-ubuntu-20-04/

---

## Miscellaneous

---

---
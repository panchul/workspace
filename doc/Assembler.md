# Assembler

See Also:

- [C++](CPP.md)
- [gdb](Gdb.md)
- [Multithreading](Multithreading.md)
- [STL](STL.md)
- [Visual Studio Code](VisualStudioCode.md)

---

**Content**

- [Samples](Assembler.md#Samples)
- [Miscellaneous](Assembler.md#Miscellaneous)

---

## Samples

---

This is unsupported in 64-bit MSVC:

```
int main(int argc, char* argv[])
{
    int n;
    _asm
    {
        mov eax,n;
    }
}
```

---

## Miscellaneous

---

---
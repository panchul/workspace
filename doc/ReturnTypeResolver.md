
# Return Type Resolver

See Also:
 - [CPP](CPP.md) 

Return Type Resolver is a programming concept.
https://dev.to/visheshpatel/7-advanced-c-concepts-you-should-know-4gog

Intent: To deduce the type of the object being initialized or assigned to.
Implementation: Uses templatized conversion operator.
Also known as: Return type overloading

issue:

    int from_string(const char *str) { return std::stoi(str); }
    float from_string(const char *str) { return std::stof(str); } // error
    
A function cannot be overloaded only by its return type.
    
Solution
    
    class from_string
    {
        const string m_str;
    public:
        from_string(const char *str) : m_str(str) {}
        template <typename type>
        operator type(){
            if constexpr(is_same_v<type, float>)        return stof(m_str);
            else if (is_same_v<type, int>)              return stoi(m_str);
        }
    };
    
    int n_int = from_string("123");
    float n_float = from_string("123.111");
    // Will only work with C++17 due to `is_same_v`

---

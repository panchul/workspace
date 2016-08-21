

## UNDER CONSTRUCTION

### Installing

#### Installing from pre-built binary packages

Pre-built packages are probably lagging behind with their versions, and
lack some of the additional functionality. If it is ok, get them like so:  

For Homebrew on OS X: ```brew install erlang```  
For MacPorts on OS X: ```port install erlang```  
For Ubuntu and Debian: ```apt-get install erlang```  
For Fedora: ```yum install erlang```  
For FreeBSD: ```pkg install erlang```  

#### Building and Installing from the souce codes  
[https://github.com/erlang/otp/blob/maint/HOWTO/INSTALL.md](https://github.com/erlang/otp/blob/maint/HOWTO/INSTALL.md)

Tarball is also available like so:  http://erlang.org/download/otp_src_18.3.tar.gz  

Pre-requisites are needed, depending on what you want to do with it.



### Popular open-source system that use Erlang

Popular XMPP server implementation is ejabberd, it has a vagrant dev environment repo:
    https://github.com/processone/ejabberd-vagrant-dev


### Tools

#### rebar  
#### meck  
#### common test(CT)  
#### eunit  

#### Misc snippets in no particular order

Simple Erlang script template

    #!/usr/bin/env escript
    main([Arg]) ->
      case Arg of
        "test" ->
          io:format("Here I am~n");
        _ ->
          io:format("I only process 'test'~n")
      end;
    main(_) ->
        io:format("something else~n").
    


###  Links

[https://www.erlang.org/](https://www.erlang.org/)
[http://erlang.org/mailman/listinfo/erlang-questions](http://erlang.org/mailman/listinfo/erlang-questions) - mailing list
  
[10 Essential Erlang Tools for Erlang Developers](http://tutorials.pluralsight.com/erlang/10-essential-erlang-tools-for-erlang-developers#9OxH46USdVKq2dQw.99)
[Nice refresher about guards](https://medium.com/@elbrujohalcon/there-are-guards-and-guards-71e67d4975d7#.ey1nnyrvf)

  
  
  
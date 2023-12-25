[Home](Readme.md)
# Visual Studio Code

See Also:

 - [CLion](CLion.md)
 - [Eclipse](Eclipse.md)
 - [IntelliJ](IntelliJ.md)

---

Visual Studio Code on Mac.

https://code.visualstudio.com/docs/setup/mac

For `code` to work in terminal, add the path to it:

    $ cat << EOF >> ~/.bash_profile
    # Add Visual Studio Code (code)
    export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
    EOF

Then, to show installed extensions:

    $ code --list-extensions

Create install commands:

    $ code --list-extensions | % { "code --install-extension $_" }

It generates something like this(a useful set for c# and other dotnet web app work):

```
code --install-extension adrianwilczynski.csharp-to-typescript
code --install-extension adrianwilczynski.namespace
code --install-extension alefragnani.Bookmarks
code --install-extension Angular.ng-template
code --install-extension bencoleman.armview
code --install-extension christian-kohler.path-intellisense
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension dbaeumer.vscode-eslint
code --install-extension donjayamanne.githistory
code --install-extension eamodio.gitlens
code --install-extension EditorConfig.EditorConfig
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension formulahendry.dotnet-test-explorer
code --install-extension Fudge.auto-using
code --install-extension GitHub.copilot
code --install-extension GitHub.remotehub
code --install-extension GraphQL.vscode-graphql
code --install-extension humao.rest-client
code --install-extension jbockle.jbockle-format-files
code --install-extension jesschadwick.nuget-reverse-package-search
code --install-extension jflbr.jwt-decoder
code --install-extension josefpihrt-vscode.roslynator
code --install-extension jtlowe.vscode-icon-theme
code --install-extension k--kato.docomment
code --install-extension ms-azure-devops.azure-pipelines
code --install-extension ms-azuretools.vscode-azureappservice
code --install-extension ms-azuretools.vscode-azurefunctions
code --install-extension ms-azuretools.vscode-azureresourcegroups
code --install-extension ms-azuretools.vscode-azurestaticwebapps
code --install-extension ms-azuretools.vscode-azurestorage
code --install-extension ms-azuretools.vscode-azurevirtualmachines
code --install-extension ms-azuretools.vscode-bicep
code --install-extension ms-azuretools.vscode-cosmosdb
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-dotnettools.csharp
code --install-extension ms-dotnettools.vscode-dotnet-runtime
code --install-extension ms-mssql.data-workspace-vscode
code --install-extension ms-mssql.mssql
code --install-extension ms-mssql.sql-bindings-vscode
code --install-extension ms-mssql.sql-database-projects-vscode
code --install-extension ms-toolsai.jupyter-keymap
code --install-extension ms-vscode-remote.remote-containers
code --install-extension ms-vscode.azure-account
code --install-extension ms-vscode.azurecli
code --install-extension ms-vscode.powershell
code --install-extension ms-vscode.remote-repositories
code --install-extension ms-vscode.vs-keybindings
code --install-extension ms-vscode.vscode-node-azure-pack
code --install-extension msazurermtools.azurerm-vscode-tools
code --install-extension Phu1237.vs-browser
code --install-extension PKief.material-icon-theme
code --install-extension rbbit.typescript-hero
code --install-extension ritwickdey.LiveServer
code --install-extension shardulm94.trailing-spaces
code --install-extension shd101wyy.markdown-preview-enhanced
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension vincaslt.highlight-matching-tag
code --install-extension vscode-icons-team.vscode-icons
code --install-extension vscodevim.vim
code --install-extension ybaumes.highlight-trailing-white-spaces
code --install-extension yzhang.markdown-all-in-one
```

---

C++ configs, etc. Some debugging issues with Catalina.
https://code.visualstudio.com/docs/cpp/config-clang-mac

---

Quick 101 on VS (not Code) debugging tricks for multithreading.
https://www.youtube.com/watch?v=ISDaHM1cHXk

---

About std input debugging, etc.

https://stackoverflow.com/questions/64786161/use-input-stdin-in-debug-console-vscode

Another, official documentation for different platforms(has samples of launch.json, tasks.json, etc.):

https://code.visualstudio.com/docs/cpp/config-mingw#_debug-helloworldcpp

---
# Entity Framework

See Also:

  - [CSharp](CSharp.md)
  - 

---

Entity Framework Tutorial

https://www.entityframeworktutorial.net/efcore/configure-one-to-many-relationship-using-fluent-api-in-ef-core.aspx

---

About Chinook EF sample code

https://docs.microsoft.com/en-us/aspnet/core/data/ef-mvc/inheritance?view=aspnetcore-6.0

https://docs.microsoft.com/en-us/aspnet/mvc/overview/getting-started/getting-started-with-ef-using-mvc/handling-concurrency-with-the-entity-framework-in-an-asp-net-mvc-application

---

EF Concurrency data annotations
https://learn.microsoft.com/en-us/ef/core/modeling/concurrency?tabs=data-annotations

Other dotnet, etc. links:

https://learn.microsoft.com/en-us/ef/core/cli/dbcontext-creation?tabs=dotnet-core-cli

https://learn.microsoft.com/en-us/ef/core/managing-schemas/ensure-created

https://learn.microsoft.com/en-us/dotnet/api/microsoft.entityframeworkcore.infrastructure.databasefacade.ensurecreated?view=efcore-6.0

https://learn.microsoft.com/en-us/ef/core/modeling/data-seeding
 
---

Elastic database, etc. Scaled, sharded, etc.

https://docs.microsoft.com/en-us/azure/azure-sql/database/elastic-database-client-library

https://github.com/Azure/elastic-db-tools/tree/master/Samples/EFCodeFirst

Sharding, shard map management samples:

https://docs.microsoft.com/en-us/azure/azure-sql/database/elastic-scale-shard-map-management


About sharding in Azure, https://github.com/Azure/elastic-db-tools

For the samples to work, needed adding this to <PropertyGroup> for the project file. No need to run ef commands manually, etc., only

Had to create the databases that are specified in the Program.cs

`<EmbeddedResourceUseDependentUponConvention>true</EmbeddedResourceUseDependentUponConvention>`


https://stackoverflow.com/questions/12417737/code-first-migrations-missingmanifestresourceexception

entity framework - Code-First Migrations MissingManifestResourceException - Stack Overflow
I ended up figuring this our in the course of pulling together all the information I wanted for asking the question. Namely, trying to reproduce the issue.
stackoverflow.com

There was another suggestion, maybe overkill:

I have the problem with Entity Migration, Entity 6.4 and with Microsoft.Net.SDK style project in Full .Net Framework.

I resolved it by editing my Data project with :

    <ItemGroup>
      <EmbeddedResource Update="**\*.resx">
        <DependentUpon>$([System.String]::Copy('%(FileName)')).cs</DependentUpon>
      </EmbeddedResource>
    </ItemGroup>
 
---

Neat diagrams for the sharded multitenant dbs:

https://docs.microsoft.com/en-us/azure/azure-sql/database/elastic-scale-introduction?view=azuresql

---
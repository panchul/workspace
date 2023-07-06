# Azure

See Also:

  - [AWS](AWS.md)
  - [Digital Ocean](DigitalOcean.md)
  - [GCP, GoogleCloud](GoogleCloud.md)
  - [Jenkins](Jenkins.md)
  - [Kubernetes](Kubernetes.md)
  - [KEDA](KEDA.md)
  - [Kubeflow](Kubeflow.md)
  - [OAuth](OAuth.md)

**Content**

- [Azure Functions](Azure.md#Azure-Functions)
- [Azure Web Apps](Azure.md#Azure-Web-Apps)
- [App Services](Azure.md#App-Services)
- [Azure CLI](Azure.md#Azure-CLI)
- [Azure Service Bus](Azure.md#Azure-Service-Bus)
- [B2C](Azure.md#B2C)
- [Miscellaneous](Azure.md#Miscellaneous)

---

## Azure Functions

---

The guy from Pluralsight, referencing useful links on Azure Functions
https://github.com/markheath/azure-functions-links

---

Azure Functions GitHub repo, with links to other repos, for hosts, ux, etc.

https://github.com/azure/azure-functions

---

Azure Functions in containers, on Kubernetes

KEDA, https://keda.sh

---

## Azure Web Apps

---

Azure Static Web Apps tutorial(workshop)
https://docs.microsoft.com/en-us/learn/modules/publish-app-service-static-web-app-api/

---

- https://github.com/dotnet-architecture/eShopOnContainers

- https://github.com/dotnet-architecture/eShopOnContainers/tree/dev/deploy

---

## Azure Storage

---

Free Microsoft storage explorer (for blobs, queues, etc.)
https://azure.microsoft.com/en-us/features/storage-explorer/

---

## App Services

---

Step-by-step tutorial for App Services

https://learn.microsoft.com/en-us/azure/app-service/quickstart-python?tabs=flask

Probably the same thing, Azure App Service

https://docs.microsoft.com/en-us/azure/app-service/quickstart-python?tabs=bash&pivots=python-framework-flask

---

## Azure CLI

---

https://docs.microsoft.com/en-us/cli/azure/
 
---

- Azure CLI download: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli

---

- Getting Started with Azure CLI: https://docs.microsoft.com/en-us/cli/azure/get-started-with-azure-cli

---

Azure CLI

https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest

https://github.com/Azure/azure-cli

Installing on Mac:

    $ brew update && brew install azure-cli

Then you can log in to your account:

    $ az login    

Azure Cloud Shell is even simpler:
https://docs.microsoft.com/en-us/azure/cloud-shell/quickstart?view=azure-cli-latest


---

## Azure Service Bus

---

- .Net Azure Service Bus https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-dotnet-get-started-with-queues

---

ServiceBusAdministration client
https://docs.microsoft.com/en-us/dotnet/api/azure.messaging.servicebus.administration.servicebusadministrationclient?view=azure-dotnet

---

Azure Service Bus repos

https://github.com/Azure/azure-sdk-for-net

This repository is for active development of the Azure SDK for .NET.
For consumers of the SDK we recommend visiting our public developer docs at
https://docs.microsoft.com/dotnet/azure/ or our versioned developer docs at 
https://azure.github.io/azure-sdk-for-net

---

## B2C

---

Multi-part B2C tutorial, ASP .net Core web app with OpenID Connect

https://github.com/Azure-Samples/active-directory-aspnetcore-webapp-openidconnect-v2/tree/master/1-WebApp-OIDC/1-5-B2C

---

A Console application for Azure AD B2C User Management the Azure AD Graph

B2C console application (might be older, seems like 5-year-old commits)

https://github.com/AzureADQuickStarts/B2C-GraphAPI-DotNet

---

B2C clients

https://github.com/Azure-Samples/active-directory-b2c-dotnet-desktop

---

Adding to b2c via Microsoft Graph POST (probably not the best way to use Graph - there are better client libs)

https://stackoverflow.com/questions/39439830/create-a-new-user-in-azure-active-directory-b2c-with-graph-api-using-http-pos

---

IdentityServer4 – open-source, can host myself.

https://identityserver4.readthedocs.io/

---

MSAL.js and token types

(single-page app to api)

https://docs.microsoft.com/en-us/azure/active-directory/develop/authentication-flows-app-scenarios#scenarios-and-supported-authentication-flows

https://docs.microsoft.com/en-us/azure/active-directory/develop/scenario-spa-overview

https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-oauth2-auth-code-flow

https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-oauth2-auth-code-flow

https://docs.microsoft.com/en-us/azure/active-directory/develop/msal-js-pass-custom-state-authentication-request

https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-certificate-credentials

https://docs.microsoft.com/en-us/azure/active-directory/develop/identity-platform-integration-checklist



https://docs.microsoft.com/en-us/azure/active-directory/develop/access-tokens

https://docs.microsoft.com/en-us/graph/auth-v2-service?view=graph-rest-1.0#4-get-an-access-token

https://docs.microsoft.com/en-us/azure/active-directory/develop/msal-js-pass-custom-state-authentication-request

---

Video about managed identities, has links to docs and his GitHub repo:

https://www.youtube.com/watch?v=sA_mXKy_dKU

---

## Miscellaneous

---

Books on azure, dotnet, etc.

Containerized Docker application lifecycle with Microsoft platform and tools
https://aka.ms/dockerlifecycleebook

.NET Microservices: Architecture for containerized .NET applications
https://aka.ms/microservicesebook

Architecting modern web applications with ASP.NET Core and Azure
https://aka.ms/webappebook

---

Modernize existing .NET applications with Azure cloud and Windows Containers
https://docs.microsoft.com/en-us/dotnet/architecture/modernize-with-azure-containers/

---

AKS GPU-enabling:
https://docs.microsoft.com/en-us/azure/aks/gpu-cluster#:~:text=Graphical%20processing%20units%20%28GPUs%29%20are%20often%20used%20for%2cVMs%2c%20see%20GPU%20optimized%20VM%20sizes%20in%20Azure.

---

GCP to Azure services comparison
https://docs.microsoft.com/en-us/azure/architecture/gcp-professional/services

AWS to Azure services comparison
https://docs.microsoft.com/en-us/azure/architecture/aws-professional/services

---

A lot of blood sweat and tears went into this one, many commits were under my alter ego GitHub account `alek8106`.
https://github.com/Azure-Samples/azure-intelligent-edge-patterns

---

Linear Regression Model || Microsoft Azure Machine learning || Drag and Drop
https://www.youtube.com/watch?v=ZY0y4o-Ta-4

---

Azure Stack slides:
https://github.com/Azure-Samples/Azure-Stack-Hub-Foundation-Core/tree/master/ASF-slides

Azure Stack Videos
https://www.youtube.com/channel/UCCkJEhUc1pWTj84eefLOcRA/videos

Azure Stack videos about AKSe
https://www.youtube.com/watch?v=KitQ2X0GBD0

The certification examples, with some free tutorials:
https://docs.microsoft.com/en-us/learn/certifications/exams/az-300
https://docs.microsoft.com/en-us/learn/certifications/exams/70-537
https://docs.microsoft.com/en-us/learn/certifications/exams/az-301

---

Simple Linux VM on Azure using Portal.
https://docs.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-portal

---

Tutorial about deploying a Python module
https://docs.microsoft.com/en-us/azure/iot-edge/tutorial-python-module

---

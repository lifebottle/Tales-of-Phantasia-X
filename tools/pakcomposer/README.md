# pakcomposer
A .NET 5 version of the "pakcomposer" for cross-platform compatibility.

## dotnet 5.0 Installation

### Windows
Install as usual

### Linux
Do NOT use `snap` more details to come.

## Compile Instructions
`dotnet publish -r linux-x64 -c Release /p:PublishSingleFile=true --self-contained false`

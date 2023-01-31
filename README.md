# Información Pública
[<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Visual_Studio_Icon_2022.svg/193px-Visual_Studio_Icon_2022.svg.png" alt="Visual Studio 2022" width="24px" height="24px" /> v2022 vb APS.NET](https://visualstudio.microsoft.com/es/vs/)

El sistema de información pública se realiza con el fin de obtener solicitudes por usuarios externos a la institución. Las cuales se realizan al llenar un formulario con información general del usuario previo al acceso de esta aplicación.

Al obtener la solicitud, esta se procesa dentro del sistema y lleva una serie de pasos y asignaciones a distintos usuarios administrativos para que se pueda dar una respuesta acorde a lo solicitado. Existen distintas restricciones bajo un rol y en ella se contempla el manejo y almacenamiento de archivos de forma local y en base de datos.

## Table of Contents
* [Información Pública](#Información-Pública)
* [Technology](#Technology)
* [File Structure](#File-Structure)
* [Browsers Support](#Browsers-Support)
* [Demo](#Demo)
  * [Dashboard](#Dashboard)
  * [Administrar Solicitudes](#Administrar-Solicitudes)
    * [Detalle de Solicitud](#Detalle-de-Solicitud)
    * [Agregar Información](#Agregar-Información)
    * [Asignar Solicitud](#Asignar-Solicitud)
    * [Responder Solicitud](#Responder-Solicitud)
  * [Consultar Solicitud](#Consultar-Solicitud)

## Technology

La tecnología utilizada para el proyecto es la siguiente:
* FRONT END:
  * Template Base: [Falcon Admin v3.10.0](https://themes.getbootstrap.com/product/falcon-admin-dashboard-webapp-template/)
  * Free Version: [Falcon Admin v3.4.0](https://www.upload.ee/files/13565097/falcon-3.4.0.zip.html)
  * Pugins Agregados:
    * [JQuery](https://jquery.com/)
    * [DataTables](https://datatables.net/)
    * [InputMask](https://plugins.jquery.com/jquery.inputmask/)
    * [SweetAlert2](https://sweetalert2.github.io/)
    * [FontAwesome Icon](https://fontawesome.com/v5/search?o=r&m=free)
    * [MaxLenght](http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js)
    * [MaxLenght2](https://htmldom.dev/count-the-number-of-characters-of-a-textarea/)
  * [JavaScript](https://developer.mozilla.org/es/docs/Web/JavaScript)
  * [LocalStorage](https://developer.mozilla.org/es/docs/Web/API/Window/localStorage)
  * [SessionStorage](https://developer.mozilla.org/es/docs/Web/API/Window/sessionStorage)
  * [Cookies](https://learn.microsoft.com/es-es/aspnet/web-api/overview/advanced/http-cookies)
  * [Save Uploaded File](https://www.aspsnippets.com/questions/136240/Save-Uploaded-File-in-specific-location-using-C-and-VBNet-in-ASPNet/)

## File Structure
Within the download you’ll find the following directories and files:

```
informacion-publica/
├── README.md
├── informacion-publica/
  ├── InfoPublica/
  │ ├── folders/...
  │ ├── files/...
  │ ├── masters/
  │ │ ├── Site.Master
  │ │ ├── Site.Master.cs
  │ │ ├── Site.Master.designer.cs
  │ ├── pages/
  │ │ ├── auth/
  │ │ │ ├── lock.aspx
  │ │ │ ├── lock.aspx.cs
  │ │ │ ├── lock.aspx.designer.cs
  │ │ │ ├── login.aspx
  │ │ │ ├── login.aspx.cs
  │ │ │ ├── login.aspx.designer.cs
  │ │ ├── error/
  │ │ │ ├── 404.html
  │ │ ├── request/
  │ │   ├── check-request.aspx
  │ │   ├── check-request.aspx.cs
  │ │   ├── check-request.aspx.designer.cs
  │ │   ├── dashboard.aspx
  │ │   ├── dashboard.aspx.cs
  │ │   ├── dashboard.aspx.designer.cs
  │ │   ├── manage-request.aspx
  │ │   ├── manage-request.aspx.cs
  │ │   ├── manage-request.aspx.designer.cs
  │ ├── InfoPublica.csproj
  │ ├── Global.asax
  │ ├── Web.config
  └── packages/
  │ ├── Microsoft.CodeDom.Providers.DotNetCompilerPlatform.2.0.1/
  │   ├── build/...
  │   ├── content/...
  │   ├── lib/...
  │   ├── tools/...
  │   ├── .signature
  │   ├── Microsoft.CodeDom.Providers.DotNetCompilerPlatform.2.0.1.nupkg
  └── autenticacion.sln
```

## Browsers Support

<img src="https://raw.githubusercontent.com/alrra/browser-logos/master/src/edge/edge_48x48.png" alt="IE / Edge" width="24px" height="24px" />   <img src="https://raw.githubusercontent.com/alrra/browser-logos/master/src/chrome/chrome_48x48.png" alt="Chrome" width="24px" height="24px" />   <img src="https://raw.githubusercontent.com/alrra/browser-logos/master/src/safari/safari_48x48.png" alt="Safari" width="24px" height="24px" />   <img src="https://raw.githubusercontent.com/alrra/browser-logos/master/src/firefox/firefox_48x48.png" alt="Firefox" width="24px" height="24px" />


## Demo
### Dashboard
![Alt text](/informacion-publica/InfoPublica/assets/manual/1.png "dashboard")
![Alt text](/informacion-publica/InfoPublica/assets/manual/2.png "Información")
![Alt text](/informacion-publica/InfoPublica/assets/manual/3.png "Notificaciones")

### Administrar Solicitudes
![Alt text](/informacion-publica/InfoPublica/assets/manual/4.png "Administrar Solicitudes")
![Alt text](/informacion-publica/InfoPublica/assets/manual/5.png "Administrar Solicitudes")

#### Detalle de Solicitud
![Alt text](/informacion-publica/InfoPublica/assets/manual/6.png "Datos Principales")
![Alt text](/informacion-publica/InfoPublica/assets/manual/7.png "Información Técnica")
![Alt text](/informacion-publica/InfoPublica/assets/manual/8.png "Oficios y Archivos")
![Alt text](/informacion-publica/InfoPublica/assets/manual/9.png "Datos del Participante")

#### Agregar Información
![Alt text](/informacion-publica/InfoPublica/assets/manual/10.png "Agregar Información")
![Alt text](/informacion-publica/InfoPublica/assets/manual/11.png "Agregar Información 2")

#### Asignar Solicitud
![Alt text](/informacion-publica/InfoPublica/assets/manual/12.png "Asignar Solicitud")

#### Responder Solicitud
![Alt text](/informacion-publica/InfoPublica/assets/manual/13.png "Responder Solicitud")
![Alt text](/informacion-publica/InfoPublica/assets/manual/14.png "Mensaje de respuesta")

### Consultar Solicitud
![Alt text](/informacion-publica/InfoPublica/assets/manual/15.png "Consultar Solicitud")
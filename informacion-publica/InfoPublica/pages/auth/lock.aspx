<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="lock.aspx.vb" Inherits="InfoPublica.lock" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr">

  <head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Falcon | Dashboard &amp; Web App Template</title>


    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="/assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="/assets/img/favicons/favicon.ico">
    <link rel="manifest" href="/assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="/assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
    <script src="/assets/js/config.js"></script>
    <script src="/assets/vendors/overlayscrollbars/OverlayScrollbars.min.js"></script>


    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:300,400,500,600,700,800,900&amp;display=swap" rel="stylesheet">
    <link href="/assets/vendors/overlayscrollbars/OverlayScrollbars.min.css" rel="stylesheet">
    <link href="/assets/css/theme-rtl.min.css" rel="stylesheet" id="style_rtl">
    <link href="/assets/css/theme.min.css" rel="stylesheet" id="style_default">
    <link href="/assets/css/user-rtl.min.css" rel="stylesheet" id="user_style_rtl">
    <link href="/assets/css/user.min.css" rel="stylesheet" id="user_style_default">
    <script>
      var isRTL = JSON.parse(localStorage.getItem('isRTL'));
      if (isRTL) {
        var linkDefault = document.getElementById('style_default');
        var userLinkDefault = document.getElementById('user_style_default');
        linkDefault.setAttribute('disabled', true);
        userLinkDefault.setAttribute('disabled', true);
        document.querySelector('html').setAttribute('dir', 'rtl');
      } else {
        var linkRTL = document.getElementById('style_rtl');
        var userLinkRTL = document.getElementById('user_style_rtl');
        linkRTL.setAttribute('disabled', true);
        userLinkRTL.setAttribute('disabled', true);
      }
    </script>
  </head>


  <body>
    <form runat="server">
      <!-- ===============================================-->
      <!--    Main Content-->
      <!-- ===============================================-->
      <main class="main" id="top">
        <div class="container" data-layout="container">
          <script>
            var isFluid = JSON.parse(localStorage.getItem('isFluid'));
            if (isFluid) {
              var container = document.querySelector('[data-layout]');
              container.classList.remove('container');
              container.classList.add('container-fluid');
            }
          </script>
          <div class="row flex-center min-vh-100 py-6 text-center">
            <div class="col-sm-10 col-md-8 col-lg-6 col-xl-5 col-xxl-4">
              <a class="d-flex flex-center mb-4" href="JavaScript:Void(0)">
                <span class="font-sans-serif fw-bolder fs-5 d-inline-block">Información Pública</span>
              </a>
              <div class="card">
                <div class="card-body p-4 p-sm-5">
                  <div class="avatar avatar-4xl">
                    <i class="fas fa-user-alt fa-6x"></i>
                    <%--<img class="rounded-circle" src="/assets/img/team/1.jpg" alt="" />--%>
                  </div>
                  <h5 id="nit" class="mt-3 mb-0"></h5>
                  <small>Ingrese su nit para acceder al sitio nuevamente.</small>
                  <div class="mt-4 row g-0 mx-sm-4">
                    <div class="col">
                      <input type="hidden" id="systemId" class="form-control me-2 mb-2" placeholder="Sistema" aria-describedby="login" runat="server"/>
                      <input type="hidden" id="username" class="form-control me-2 mb-2" placeholder="Nit" aria-describedby="login" runat="server"/>
                      <input type="password" id="password" class="form-control me-2 mb-2" placeholder="password" aria-describedby="login" runat="server"/>
                    </div>
                    <div class="col-auto ps-2">
                      <a id="unlock" href="/pages/request/dashboard.aspx" class="btn btn-primary mx-2" runat="server">unlock</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div id="toast_position" class="position-fixed toast-container p-3">
            <div id="toast_notifications"></div>
          </div>
        </div>
      </main>

      <!-- ===============================================-->
      <!--    JavaScripts-->
      <!-- ===============================================-->
      <script src="/assets/vendors/popper/popper.min.js"></script>
      <script src="/assets/vendors/bootstrap/bootstrap.min.js"></script>
      <script src="/assets/vendors/anchorjs/anchor.min.js"></script>
      <script src="/assets/vendors/is/is.min.js"></script>
      <script src="/assets/vendors/fontawesome/all.min.js"></script>
      <script src="/assets/vendors/lodash/lodash.min.js"></script>
      <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
      <script src="/assets/vendors/list.js/list.min.js"></script>
      <script src="/assets/js/theme.js"></script>
      <script type="text/javascript">
        if (sessionStorage.getItem('NIT') !== null && sessionStorage.getItem('SYS') !== null) {
          document.getElementById('nit').innerText = sessionStorage.getItem('NIT');
          document.getElementById('username').value = sessionStorage.getItem('NIT');
          document.getElementById('systemId').value = sessionStorage.getItem('SYS');
        }

        //function loginSession() {
        //  if (sessionStorage.getItem('sysEncrypted') !== null && sessionStorage.getItem('nitEncrypted') !== null) {
        //    window.location.href = '/pages/request/dashboard?n=' + sessionStorage.getItem('nitEncrypted') + '&s=' + sessionStorage.getItem('sysEncrypted');
        //  } else {
        //    window.location.href = '/pages/request/dashboard?n=' + sessionStorage.getItem('nitEncrypted') + '&s=' + sessionStorage.getItem('sysEncrypted');
        //  }
        //}

        function showToast(position, title, subtitle, body, headerStyle, bodyStyle) {
          const rnd = Math.random().toString().substr(2, 4);
          document.getElementById('toast_position').setAttribute('class', 'position-fixed toast-container p-3 ' + position);

          var newElement = document.createElement("div");
          var code = "<div id=\"liveToast\" class=\"toast fade show mb-2\" role=\"alert\" aria-live=\"assertive\" aria-atomic=\"true\">" +
            "  <div class=\"toast-header " + headerStyle + "\">" +
            "    <strong class=\"me-auto\">" + title + "</strong>" +
            "    <small>" + subtitle + "</small>" +
            "    <button class=\"btn-close btn-close-white\" type=\"button\" data-bs-dismiss=\"toast\" aria-label=\"Close\"></button>" +
            "  </div>" +
            "  <div class=\"toast-body " + bodyStyle + "\">" + body + "</div>" +
            "</div>"
          newElement.innerHTML += code;
          document.getElementById("toast_notifications").appendChild(newElement);
        }
      </script>
    </form>
  </body>

</html>

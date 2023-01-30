<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="InfoPublica.login" %>

<!DOCTYPE html>

<html lang="es" dir="ltr">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Login</title>

  <!-- ===============================================-->
  <!--    Favicons                                    -->
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
  <!--    Stylesheets                                 -->
  <!-- ===============================================-->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:300,400,500,600,700,800,900&amp;display=swap" rel="stylesheet">
  <link href="/assets/vendors/overlayscrollbars/OverlayScrollbars.min.css" rel="stylesheet">
  <link href="/assets/css/theme-rtl.min.css" rel="stylesheet" id="style_rtl">
  <link href="/assets/css/theme.min.css" rel="stylesheet" id="style_default">
  <link href="/assets/css/user-rtl.min.css" rel="stylesheet" id="user_style_rtl">
  <link href="/assets/css/user.min.css" rel="stylesheet" id="user_style_default">
  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="/assets/sweetalert2/css/bootstrap-4.min.css">
  <script>
    var isRTL = JSON.parse(localStorage.getItem('isRTL'));
    if (isRTL) {
      var linkDefault = document.getElementById('style_default');
      var userLinkDefault = document.getElementById('user_style-default');
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
  <form id="form1" runat="server">
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
        <div class="row flex-center min-vh-100 py-6">
          <div class="col-sm-10 col-md-8 col-lg-6 col-xl-5 col-xxl-4">
            <img class="bg-auth-circle-shape" src="/assets/img/icons/spot-illustrations/bg-shape.png" alt="" width="250">
            <img class="bg-auth-circle-shape-2" src="/assets/img/icons/spot-illustrations/shape-1.png" alt="" width="150">
            <a class="d-flex flex-center mb-4" href="/index.html">
              <span class="font-sans-serif fw-bolder fs-5 d-inline-block">Información Pública</span>
            </a>
            <div class="card">
              <div class="card-body p-4 p-sm-5">
                <div class="row flex-between-center mb-4">
                  <div class="col-auto">
                    <h5>Log in</h5>
                  </div>
                </div>
                <div>
                  <div class="mb-3">
                    <input type="text" id="username" class="form-control" placeholder="NIT" runat="server"/>
                  </div>
                  <div class="mb-3">
                    <input type="password" id="password" class="form-control" placeholder="Contraseña" runat="server"/>
                  </div>
                  <%--<div class="row flex-between-center mt-5 mb-4">
                    <div class="col-auto">
                      <div class="form-check mb-0">
                        <input class="form-check-input" type="checkbox" id="basic-checkbox" checked="checked" />
                        <label class="form-check-label mb-0" for="basic-checkbox">Remember me</label>
                      </div>
                    </div>
                    <div class="col-auto"><a class="fs--1" href="/pages/authentication/simple/forgot-password.html">Forgot Password?</a></div>
                  </div>--%>
                  <div class="mb-3">
                    <a href="/pages/request/dashboard.aspx" class="btn btn-primary d-block w-100 mt-3">Log in</a>
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

    <!-- SweetAlert2 -->
    <script src="/assets/sweetalert2/js/sweetalert2.min.js"></script>

    <script type="text/javascript">
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
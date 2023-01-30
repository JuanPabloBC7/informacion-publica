<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="check-request.aspx.vb" Inherits="InfoPublica.check_request" %>

<!DOCTYPE html>
<html lang="es">

<head runat="server">
  <!-- ======================================================== -->
  <!-- * Author:  (8104) - Juan Pablo Balan                     -->
  <!-- * Versión: 02.08.2022                                    -->
  <!-- ======================================================== -->
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Consulta de Solicitud - Información Pública</title>

  <asp:PlaceHolder runat="server">
    <%: Scripts.Render("~/bundles/modernizr") %>
  </asp:PlaceHolder>
  <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />

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
  <link href="/assets/vendors/choices/choices.min.css" rel="stylesheet">
  <link href="/assets/vendors/prism/prism-okaidia.css" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:300,400,500,600,700,800,900&amp;display=swap" rel="stylesheet">
  <link href="/assets/vendors/overlayscrollbars/OverlayScrollbars.min.css" rel="stylesheet">
  <link href="/assets/css/theme-rtl.min.css" rel="stylesheet" id="style_rtl">
  <link href="/assets/css/theme.min.css" rel="stylesheet" id="style_default">
  <link href="/assets/css/user-rtl.min.css" rel="stylesheet" id="user_style_rtl">
  <link href="/assets/css/user.min.css" rel="stylesheet" id="user_style_default">

  <!-- DataTables -->
  <link rel="stylesheet" href="/assets/datatable/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="/assets/datatable/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="/assets/datatable/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="/assets/sweetalert2/css/bootstrap-4.min.css">
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
<body class="hold-transition sidebar-mini layout-navbar-fixed layout-fixed">
  <form runat="server">
    <!-- ===============================================-->
    <!--    Main Content                                -->
    <!-- ===============================================-->
    <main class="main" id="top">
      <div class="container-fluid" data-layout="container">
        <div class="content">

          <!-- ===============================================-->
          <!--    MainContent                                 -->
          <!-- ===============================================-->
          <div class="card mb-3 mt-5">
            <div class="bg-holder d-none d-lg-block bg-card" style="background-image:url(/assets/img/icons/spot-illustrations/corner-4.png);"></div>
            <div class="card-body position-relative">
              <div class="row">
                <div class="col-lg-10">
                  <h2 class="text-bold" style="color: #003772">Ingrese token y correlativo</h2>
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mt-2">
                      <li class="breadcrumb-item active" aria-current="page">Consulta de Solicitud</li>
                    </ol>
                  </nav>
                  <p class="mb-0">En esta página puedes consultar el estatus en el que se encuentra tu solicitud, ingresando el token de acceso y el correlativo correspondiente.</p>
                </div>
              </div>
            </div>
          </div>

          <div class="card mb-3">
            <div class="card-header">
              <div class="row flex-between-end">
                <div class="col-auto align-self-center">
                  <h5 class="mb-0" data-anchor="data-anchor"><i class="fas fa-file-alt"></i> Consulta de Solicitud</h5>
                </div>
              </div>
            </div>
            <div class="card-body bg-light">
              <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12">
                  <div class="row justify-content-center">
                    <div class="col-sm-12 col-md-6 col-lg-6 mb-2">
                      <div class="form-group">
                        <input type="text" name="token" id="token" class="form-control" maxlength="6" placeholder="token" style="text-align: center" runat="server" />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row justify-content-center">
                <div class="col-sm-12 col-md-3 col-lg-3 mb-2">
                  <input type="text" name="correlative" id="correlative" class="form-control" maxlength="4" placeholder="Correlativo" runat="server" />
                </div>
                <div class="col-sm-12 col-md-3 col-lg-3 mb-2">
                  <div class="form-group">
                    <input type="text" name="currentYear" id="currentYear" class="form-control" maxlength="4" placeholder="Año" runat="server" />
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12 text-center my-3">
                  <div class="form-group">
                    <button id="search" class="btn btn-primary mx-2" runat="server"><i class="fas fa-search"></i> Buscar</button>
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col-12">
                  <div class="card theme-wizard my-5">
                    <div class="card-body pb-2">
                      <asp:Literal ID="wizard" runat="server"></asp:Literal>
                    </div>
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col-6">
                  <!--PRINCIPAL DATA-->
                  <div class="card mb-3">
                    <div class="card-header">
                      <div class="row flex-between-end">
                        <div class="col-auto align-self-center">
                          <h5 class="mb-0" style="color: #003772;" data-anchor="data-anchor"><i class="fas fa-file-alt"></i> Datos Principales</h5>
                        </div>
                      </div>
                    </div>
                    <div class="card-body bg-light">
                      <asp:Literal ID="principalData" runat="server">Sin Información</asp:Literal>
                    </div>
                  </div>
                </div>
                <div class="col-6">
                  <!--FILES DATA-->
                  <div class="card mb-3">
                    <div class="card-header">
                      <div class="row flex-between-end">
                        <div class="col-auto align-self-center">
                          <h5 class="mb-0" style="color: #003772;" data-anchor="data-anchor"><i class="fas fa-folder"></i> Archivos Adjuntos</h5>
                        </div>
                      </div>
                    </div>
                    <div class="card-body bg-light">
                      <asp:Literal ID="filesData" runat="server">Sin Información</asp:Literal>
                    </div>
                  </div>
                </div>
                <div class="col-12">
                  <!--USER DATA-->
                  <div class="card mb-3">
                    <div class="card-header">
                      <div class="row flex-between-end">
                        <div class="col-auto align-self-center">
                          <h5 class="mb-0" style="color: #003772;" data-anchor="data-anchor"><i class="fas fa-user-alt"></i> Datos del Participante</h5>
                        </div>
                      </div>
                    </div>
                    <div class="card-body bg-light">
                      <asp:Literal ID="userData" runat="server">Sin Información</asp:Literal>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div id="toast_position" class="position-fixed toast-container p-3">
            <div id="toast_notifications"></div>
          </div>

          <!-- ===============================================-->
          <!--    Footer                                      -->
          <!-- ===============================================-->
          <footer class="footer">
            <div class="row g-0 justify-content-between fs--1 mt-4 mb-3">
              <div class="col-12 col-sm-auto text-center">
                <p class="mb-0 text-600">
                  Ministerio de Desarrollo Social 
                  <span class="d-none d-sm-inline-block">| </span>
                  <br class="d-sm-none" />
                  2022 &copy; 
                  <a href="https://www.mides.gob.gt">mides.gob.gt</a>.
                  Todos los derechos reservados.
                </p>
              </div>
              <div class="col-12 col-sm-auto text-center">
                <p class="mb-0 text-600">v3.10.0</p>
              </div>
            </div>
          </footer>
        </div>
      </div>
    </main>
    <!-- ===============================================-->
    <!--    JavaScripts                                 -->
    <!-- ===============================================-->
    <script src="/assets/vendors/popper/popper.min.js"></script>
    <script src="/assets/vendors/bootstrap/bootstrap.min.js"></script>
    <script src="/assets/vendors/anchorjs/anchor.min.js"></script>
    <script src="/assets/vendors/is/is.min.js"></script>
    <script src="/assets/vendors/choices/choices.min.js"></script>
    <script src="/assets/vendors/prism/prism.js"></script>
    <script src="/assets/vendors/echarts/echarts.min.js"></script>
    <script src="/assets/vendors/chart/chart.min.js"></script>
    <script src="/assets/vendors/dayjs/dayjs.min.js"></script>
    <script src="/assets/vendors/fontawesome/all.min.js"></script>
    <script src="/assets/vendors/lodash/lodash.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="/assets/vendors/list.js/list.min.js"></script>
    <script src="/assets/js/theme.js"></script>

    <!-- jQuery -->
    <script src="/assets/jquery/jquery.min.js"></script>

    <!-- DataTables  & Plugins -->
    <script src="/assets/datatable/datatables/jquery.dataTables.min.js"></script>
    <script src="/assets/datatable/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="/assets/datatable/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="/assets/datatable/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
    <script src="/assets/datatable/datatables-buttons/js/dataTables.buttons.min.js"></script>
    <script src="/assets/datatable/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
    <script src="/assets/datatable/datatables-buttons/js/buttons.html5.min.js"></script>
    <script src="/assets/datatable/datatables-buttons/js/buttons.print.min.js"></script>
    <script src="/assets/datatable/datatables-buttons/js/buttons.colVis.min.js"></script>
    <!-- SweetAlert2 -->
    <script src="/assets/sweetalert2/js/sweetalert2.min.js"></script>
    <!-- ================================================ -->
    <!-- * InputMask                                      -->
    <!-- * https://github.com/RobinHerbots/Inputmask      -->
    <!-- ================================================ -->
    <script src="/assets/inputmask/jquery.inputmask.min.js"></script>

    <script type="text/javascript">
      function openModal(modal) {
        new bootstrap.Modal($(modal)).show();
        //var myModal = new bootstrap.Modal(document.getElementById('error-modal'))
        //myModal.show();
      }

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

    <script>
      $(function () {
        $('#correlative').inputmask({ regex: '[0-9]*' });
        $('#currentYear').inputmask({ regex: '[0-9]*' });
        $('#token').inputmask({ regex: '[0-9]*' });
      })      
    </script>
  </form>
</body>
</html>

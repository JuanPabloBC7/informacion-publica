<%@ Page Title="Dashboard" Language="vb" AutoEventWireup="false" MasterPageFile="~/masters/Site.Master" CodeBehind="dashboard.aspx.vb" Inherits="InfoPublica.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="link" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
  <div class="card mb-3">
    <div class="bg-holder d-none d-lg-block bg-card" style="background-image:url(/assets/img/icons/spot-illustrations/corner-4.png);"></div>
    <div class="card-body position-relative">
      <div class="row">
        <div class="col-lg-8">
          <h3>Dashboard</h3>
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb mt-2">
              <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
            </ol>
          </nav>
          <p class="mb-0">Página principal que muestra Indicadores.</p>
        </div>
      </div>
    </div>
  </div>

  <div class="card mb-3">
    <div class="card-header">
      <div class="row flex-between-end">
        <div class="col-auto align-self-center">
          <h5 class="mb-0" data-anchor="data-anchor"><i class="fas fa-file-alt me-2"></i>Bienvenido al Sistema de Información Pública</h5>
        </div>
      </div>
    </div>
    <div class="card-body bg-light">
      
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="message" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
  <script type="text/javascript"> 
    isExpanded('lvl1T');
    isShow('lvl1C');
    isActive('lvl1_0T');
  </script>
</asp:Content>

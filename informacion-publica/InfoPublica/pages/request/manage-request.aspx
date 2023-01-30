<%@ Page Title="Mantenimiento de Solicitudes" Language="vb" AutoEventWireup="false" MasterPageFile="~/masters/Site.Master" CodeBehind="manage-request.aspx.vb" Inherits="InfoPublica.manage_request" %>
<asp:Content ID="Content1" ContentPlaceHolderID="link" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
  <div class="card mb-3">
    <div class="bg-holder d-none d-lg-block bg-card" style="background-image:url(/assets/img/icons/spot-illustrations/corner-4.png);"></div>
    <div class="card-body position-relative">
      <div class="row">
        <div class="col-lg-8">
          <h3><i class="fas fa-folder-open"></i> Solicitudes</h3>
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb mt-2">
              <li class="breadcrumb-item"><a href="/pages/request/dashboard">Dashboard</a></li>
              <li class="breadcrumb-item active" aria-current="page">Administrar Solicitudes</li>
            </ol>
          </nav>
          <p class="mb-0">Página para la administración de las solicitudes de Información Pública.</p>
        </div>
      </div>
    </div>
  </div>

  <div class="card mb-3">
    <div class="card-header">
      <div class="row flex-between-end">
        <div class="col-auto align-self-center">
          <h5 class="mb-0" data-anchor="data-anchor"><i class="fas fa-file-alt"></i> Administrar Solicitudes</h5>
        </div>
      </div>
    </div>
    <div class="card-body bg-light">
      <div class="row mb-2 d-flex justify-content-center">
        <div class="col-sm-12 col-md-4 col-lg-3 mb-1">
          <div class="form-group">
            <label for="fYear">Año:</label>
            <input type="number" id="fYear" placeholder="Sin información" class="form-control" min="2022" runat="server">
          </div>
        </div>
        <div class="col-sm-12 col-md-4 col-lg-5 mb-1">
          <div class="form-group">
            <label for="fStatus">Estatus:</label>
            <select id="fStatus" class="form-select js-choice" size="1" data-options='{"removeItemButton":true,"placeholder":true}' runat="server">
              <option value="">Seleccione una opción</option>
              <option value="N" selected>Todos</option>
              <option value="1">Ingresada</option>
				      <option value="2">Asignada</option>
				      <option value="3">En Proceso</option>
				      <option value="4">Finalizada</option>
				      <option value="5">No Aplica</option>
            </select>
          </div>
        </div>
        <div class="col-sm-12 col-md-12 col-lg-8 mb-1">
          <div class="form-group">
            <label for="fuser">Responsable:</label>
            <select id="fuser" class="form-select js-choice" size="1" data-options='{"removeItemButton":true,"placeholder":true}' runat="server">
              <option>Sin resutados</option>
            </select>
          </div>
        </div>
      </div>

      <div class="row mb-4">
        <div class="col-sm-12 col-md-12 col-lg-12 text-center my-3">
          <button type="button" id="search" class="btn btn-falcon-default mx-2" runat="server"><i class="fas fa-search me-2"></i>Buscar</button>
        </div>
      </div>

      <div class="card mb-3">
        <div class="card-header">
          <div class="row flex-between-end">
            <div class="col-auto align-self-center">
              <h5 class="mb-0" data-anchor="data-anchor"><i class="fas fa-table"></i> Tabla de Solicitudes</h5>
              <p>En esta tabla se encuentran todas las solicitudes ingresadas, para que puedan ser procesadas y atendidas correspondientemente.</p>
            </div>
          </div>
        </div>
        <div class="card-body">
          <div class="table-responsive scrollbar">
            <asp:GridView ID="RequestsTable" runat="server" AutoGenerateColumns="false" class="display table table-hover table-striped overflow-hidden table-bordered align-middle table-sm"
              ClientIDMode="Static" BorderWidth="0">
              <Columns>
                <asp:BoundField DataField="SOLINFOPUB_ID" HeaderText="ID" />
                <asp:BoundField DataField="SOLTC_CORRELATIVO" HeaderText="Correlativo" />
                <asp:BoundField DataField="SOLINFOPUB_IDENSOLICITANTE" HeaderText="Solicitante" />              
                <asp:BoundField DataField="SOLINFOPUB_EMAIL" HeaderText="Correo" />
                <asp:BoundField DataField="SOLINFOPUB_TELEFONO" HeaderText="Teléfono" />
                <asp:BoundField DataField="SOLTC_STATUS" HeaderText="Estatus" />
                <asp:BoundField DataField="SOLINFOPUB_FECHA" HeaderText="Fecha" />
                <asp:BoundField DataField="SOLD_DIAS_TRANSCURRIDOS" HeaderText="Días" />
                <asp:TemplateField HeaderText="Acciones">
                  <ItemTemplate>
                    <div class="row">
                      <div class="col-6 text-center">
                        <asp:LinkButton ID="view" data-bs-toggle="tooltip" title="Ver detalle" runat="server"  Style="color: #fb7be5"><i class="fas fa-eye"></i>
                        </asp:LinkButton>
                      </div>
                      <div class="col-6 text-center">
                        <asp:LinkButton ID="assign" data-bs-toggle="tooltip" title="Asignar a usuario" runat="server" Style="color: #29a846"><i class="fas fa-user-plus"></i></asp:LinkButton>
                      </div>
                      <div class="col-6 text-center">
                        <asp:LinkButton ID="addInfo" data-bs-toggle="tooltip" title="Agregar información complementaria" runat="server" Style="color: #1e36e5"><i class="fas fa-edit"></i></asp:LinkButton>
                      </div>
                      <div class="col-6 text-center">
                        <asp:LinkButton ID="reply" data-bs-toggle="tooltip" title="Responder solicitud" runat="server" Style="color: #e51e1e"><i class="fas fa-reply"></i></asp:LinkButton>
                      </div>
                    </div>
                  </ItemTemplate>
                </asp:TemplateField>
              </Columns>
            </asp:GridView>
          </div>
        </div>
      </div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="message" runat="server">
  <div class="modal fade" id="modal-view" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content position-relative">
        <div class="position-absolute top-0 end-0 mt-2 me-2 z-index-1">
          <button class="btn-close btn btn-sm btn-circle d-flex flex-center transition-base" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body p-0">
          <div class="rounded-top-lg py-3 ps-4 pe-6 bg-light">
            <h4 id="viewTitle" class="mb-1" runat="server">Sin título</h4>
          </div>
          <div class="p-4 pb-0">
            <div class="row">
              <!--PRINCIPAL DATA-->
              <div class="col-sm-12 col-md-12 col-lg-12">
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
              <!--TECHNICAL INFORMATION-->
              <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="card mb-3">
                  <div class="card-header">
                    <div class="row flex-between-end">
                      <div class="col-auto align-self-center">
                        <h5 class="mb-0" style="color: #003772;" data-anchor="data-anchor"><i class="fas fa-info-circle"></i> Información Técnica</h5>
                      </div>
                    </div>
                  </div>
                  <div class="card-body bg-light">
                    <asp:Literal ID="technicalInformation" runat="server">Sin Información</asp:Literal>
                  </div>
                </div>
              </div>
              <!--REQUEST DATA-->
              <div class="col-sm-12 col-md-12 col-lg-6">
                <div class="card mb-3">
                  <div class="card-header">
                    <div class="row flex-between-end">
                      <div class="col-auto align-self-center">
                        <h5 class="mb-0" style="color: #003772;" data-anchor="data-anchor"><i class="fas fa-file-alt"></i> Oficios Asociados</h5>
                      </div>
                    </div>
                  </div>
                  <div class="card-body bg-light">
                    <asp:Literal ID="requestData" runat="server">Sin Información</asp:Literal>
                  </div>
                </div>
              </div>
              <!--FILES DATA-->
              <div class="col-sm-12 col-md-12 col-lg-6">
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
              <!--USER DATA-->
              <div class="col-sm-12 col-md-12 col-lg-12">
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
        <div class="modal-footer">
          <button type="button" class="btn btn-falcon-default" data-bs-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="modal-assign-agin" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content position-relative">
        <div class="position-absolute top-0 end-0 mt-2 me-2 z-index-1">
          <button class="btn-close btn btn-sm btn-circle d-flex flex-center transition-base" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body p-0">
          <div class="p-4 pb-0">
            <div class="row mb-2 text-center">
              <div class="col-lg-12 col-md-12 col-sm-12 mb-3">
                <i class="far fa-question-circle text-warning fw-light fa-7x"></i>
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12 mb-3">
                <h4 class="mb-1">Solicitud Asignada!</h4>
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12 mb-3">
                <asp:Literal id="assignAginLabel" runat="server"></asp:Literal>
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12 mb-3">
                <button type="button" class="btn btn-falcon-primary" data-bs-toggle="modal" data-bs-target="#modal-assign">Si, continuar</button>
                <button type="button" class="btn btn-falcon-danger" data-bs-dismiss="modal">Cancelar</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="modal-assign" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content position-relative">
        <div class="position-absolute top-0 end-0 mt-2 me-2 z-index-1">
          <button class="btn-close btn btn-sm btn-circle d-flex flex-center transition-base" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body p-0">
          <div class="rounded-top-lg py-3 ps-4 pe-6 bg-light">
            <h4 id="assignTitle" class="mb-1" runat="server">Sin título</h4>
          </div>
          <div class="p-4 pb-0">
            <div class="row mb-2">
              <div class="col-lg-12 col-md-12 col-sm-12 mb-3">
                <div class="form-group" runat="server">
                  <label runat="server">
                    <span class="text-danger">* </span>Usuario
                  </label>
                  <select id="users" class="form-select js-choice" required runat="server">
                    <option value="0">No hay registros</option>
                  </select>
                </div>
              </div>
              <div class="col-sm-12 col-md-12 col-lg-12 mb-3">
                <div class="form-group">
                  <label>
                    Descripción
                  </label>
                  <textarea id="descriptionAssign" placeholder="Descripción de la asignación..." class="form-control" rows="3" runat="server"></textarea>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" id="assign" class="btn btn-falcon-primary" runat="server"><i class="fas fa-user-plus"></i> Asignar</button>
          <button type="button" class="btn btn-falcon-default" data-bs-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="modal-add-detail" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content position-relative">
        <div class="position-absolute top-0 end-0 mt-2 me-2 z-index-1">
          <button class="btn-close btn btn-sm btn-circle d-flex flex-center transition-base" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body p-0">
          <div class="rounded-top-lg py-3 ps-4 pe-6 bg-light">
            <h4 id="addDetailTitle" class="mb-1" runat="server">Sin título</h4>
          </div>
          <div class="p-4 pb-0">
            <div id="adminPermission" class="row mb-2 d-flex align-items-center" runat="server">
              <div class="col-sm-12 col-md-6 col-lg-6 mb-3">
                <div class="form-group" runat="server">
                  <label>
                    Días transcurridos <strong>(<span id="daysLabel" runat="server">0</span>)</strong>
                  </label>
                  <input type="number" id="days" placeholder="días" class="form-control" maxlength="2" runat="server">
                </div>
              </div>
              <div class="col-sm-12 col-md-6 col-lg-6 mb-3">
                <div class="form-group" runat="server">
                  <label>Estatus</label>
                  <select id="status" class="form-select js-choice" runat="server">
                    <option value="0" selected>Seleccione una opción</option>
                    <option value="1">Ingresada</option>
                    <option value="2">Asignada</option>
                    <option value="3">En Proceso</option>
                    <option value="4">Finalizada</option>
                    <option value="5">No Aplica</option>
                  </select>
                </div>
              </div>
              <div class="col-sm-12 col-md-12 col-lg-12 text-center">
                <button type="button" id="updateAdmin" class="btn btn-falcon-primary" runat="server"><i class="fas fa-pencil-alt me-2"></i>Actualizar Información</button>
              </div>
            </div>
            <div class="row mb-2">
              <div class="col-sm-12 col-md-2 col-lg-2 mb-3">
                <div class="form-group" runat="server">
                  <label runat="server">
                    No de Oficio
                  </label>
                  <input type="text" id="noReq" placeholder="Oficio" class="form-control" maxlength="4" runat="server">
                </div>
              </div>
              <div class="col-sm-12 col-md-10 col-lg-10 mb-3">
                <div class="form-group">
                  <label>
                    Unidad Ejecutora
                  </label>
                  <select id="operativeUnit" class="form-select js-choice" required runat="server">
                    <option value="0">No hay registros</option>
                  </select>
                </div>
              </div>
              <div class="col-sm-12 col-md-6 col-lg-6 mb-3">
                <div class="form-group">
                  <label>
                    Modo de Recepción
                  </label>
                  <select id="receive" class="form-select js-choice" required runat="server">
                    <option value="0">Seleccione una opción</option>
                    <option value="1">Física</option>
                    <option value="2">Electrónica</option>
                    <option value="3">Verbal</option>
                  </select>
                </div>
              </div>
              <div class="col-sm-12 col-md-12 col-lg-12 mb-3">
                <div class="form-group">
                  <label>Aclaración</label>
                  <textarea id="clarification" placeholder="Descripción de la aclaración..." class="form-control" maxlength="2000" rows="3" runat="server"></textarea>
                </div>
              </div>
              <div class="col-sm-12 col-md-12 col-lg-12 d-flex justify-content-center text-center mb-2">
                <%--<div for="extensionLabel" class="form-check form-switch">
                  <asp:CheckBox ID="extension" class="form-check-input" Text="-" runat="server" />
                  <label id="extensionLabel" for="message_extension">No</label>
                  <label for="message_extension" class="form-check-label">
                    tiene prorroga
                  </label>
                </div>--%>
                <div for="extensionLabel" class="form-check form-switch">
                  <input type="checkbox" id="extension" class="form-check-input" runat="server">
                  <label id="extensionLabel" onclick="isChecked('message_extension', '0');" class="form-check-label" for="extension" runat="server">Tiene prorroga</label>
                </div>
              </div>
              <div class="col-sm-12 col-md-12 col-lg-12 mb-3">
                <div class="form-group">
                  <label>Justificación de la prorroga</label>
                  <textarea id="extensionJustification" placeholder="Descripción de la justificación..." class="form-control" maxlength="1000" rows="3" runat="server"></textarea>
                </div>
              </div>
              <div class="col-sm-12 col-md-12 col-lg-12 mb-2">
                <%--<div for="reviewLabel" class="custom-checkbox">
                  <asp:CheckBox ID="review" class="icheck-primary d-inline" onclick="isChecked('reviewLabel', 'message_review', '0')" Text="-" runat="server" />
                  <label id="reviewLabel" for="message_review">No</label>
                  <label for="message_review" class="form-label">
                    tiene recurso de revisión
                  </label>
                </div>--%>
                <div for="reviewLabel" class="form-check form-switch">
                  <input type="checkbox" id="review" class="form-check-input" runat="server">
                  <label id="reviewLabel" onclick="isChecked('message_review', '0');" class="form-check-label" for="review">
                    Tiene recurso de revisión
                  </label>
                </div>
              </div>
              <div class="col-sm-12 col-md-12 col-lg-12 mb-2">
                <%--<div for="affirmativeLabel" class="custom-checkbox">
                  <asp:CheckBox ID="affirmative" class="icheck-primary d-inline" onclick="isChecked('affirmativeLabel', 'message_affirmative', '0')" Text="-" runat="server" />
                  <label id="affirmativeLabel" for="message_affirmative">No</label>
                  <label for="message_affirmative" class="form-label">
                    tiene afirmativa ficta
                  </label>
                </div>--%>
                <div for="affirmativeLabel" class="form-check form-switch">
                  <input  type="checkbox" id="affirmative" class="form-check-input" runat="server">
                  <label id="affirmativeLabel" onclick="isChecked('message_affirmative', '0');" class="form-check-label" for="affirmative">Tiene afirmativa ficta</label>
                </div>
              </div>
              <div class="col-sm-12 col-md-6 col-lg-6 mb-3">
                <div class="form-group">
                  <label>
                    Fecha de Resolución
                  </label>
                  <input type="date" id="resolution" placeholder="Resolución" class="form-control" runat="server">
                </div>
              </div>
              <div class="col-sm-12 col-md-6 col-lg-6 mb-3">
                <div class="form-group">
                  <label>
                    Modo de Entrega
                  </label>
                  <select id="delivery" class="form-select js-choice" required runat="server">
                    <option value="0">Seleccione una opción</option>
                    <option value="1">Física</option>
                    <option value="2">Electrónica</option>
                    <option value="3">Verbal</option>
                  </select>
                </div>
              </div>
              <div class="col-sm-12 col-md-12 col-lg-12">
                <div class="card border h-100 border-dark">
                  <div class="card-body">
                    <div class="card-title"><i class="fas fa-file-alt"></i> Oficios Asociados</div>
                    <div class="row">
                      <div class="col-sm-12 col-md-12 col-lg-12">
                        <div class="table-responsive scrollbar">
                          <asp:GridView ID="oficioTable" runat="server" AutoGenerateColumns="false" class="display table table-hover table-striped overflow-hidden table-bordered align-middle table-sm"
                            ClientIDMode="Static" BorderWidth="0">
                            <Columns>
                              <asp:BoundField DataField="SOLDO_ID" HeaderText="ID" />
                              <asp:BoundField DataField="UNIDAD_OPERATIVA" HeaderText="Oficio, Unidad Operativa" />
                              <asp:TemplateField HeaderText="Acciones">
                                <ItemTemplate>
                                  <div class="row">
                                    <div class="col-6 text-center">
                                      <asp:LinkButton ID="confirmOficioEdit" data-bs-toggle="tooltip" title="Editar" runat="server" Style="color: #1e36e5"><i class="fas fa-edit"></i></asp:LinkButton>
                                    </div>
                                    <div class="col-6 text-center">
                                      <asp:LinkButton ID="confirmOficioDelete" data-bs-toggle="tooltip" title="Eliminar" data-bs-target="#modal-confirm-delete-oficio" runat="server" Style="color: #e51e1e"><i class="fas fa-trash-alt"></i></asp:LinkButton>
                                    </div>
                                  </div>
                                </ItemTemplate>
                              </asp:TemplateField>
                            </Columns>
                          </asp:GridView>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer d-flex justify-content-between">
          <button type="button" id="sendmail" class="btn btn-falcon-warning" runat="server"><i class="fas fa-paper-plane"></i> Enviar Correo</button>
          <button type="button" id="add_detail" class="btn btn-falcon-primary" runat="server"><i class="fas fa-list-ul"></i> Agregar Información</button>
          <button type="button" class="btn btn-falcon-default" data-bs-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="modal-edit-oficio" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content position-relative">
        <div class="position-absolute top-0 end-0 mt-2 me-2 z-index-1">
          <button class="btn-close btn btn-sm btn-circle d-flex flex-center transition-base" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body p-0">
          <div class="rounded-top-lg py-3 ps-4 pe-6 bg-light">
            <h4 id="modalEditOficioTitle" class="mb-1" runat="server">Sin título</h4>
          </div>
          <div class="p-4 pb-0">
            <div class="row mb-2">
              <div class="col-sm-12 col-md-2 col-lg-2 mb-3">
                <div class="form-group" runat="server">
                  <label runat="server">
                    No de Oficio
                  </label>
                  <input type="text" id="newOficio" placeholder="Oficio" class="form-control" maxlength="4" runat="server">
                </div>
              </div>
              <div class="col-sm-12 col-md-10 col-lg-10 mb-3">
                <div class="form-group">
                  <label>
                    Unidad Ejecutora
                  </label>
                  <select id="newOperativeUnit" class="form-select js-choice" required runat="server">
                    <option value="0">No hay registros</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
        </div>
         <div class="modal-footer">
           <button type="button" id="editOficio" class="btn btn-falcon-primary" runat="server">Actualizar</button>
           <button type="button" class="btn btn-falcon-default" data-bs-dismiss="modal">Cerrar</button>
         </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="modal-delete-oficio" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content position-relative">
        <div class="position-absolute top-0 end-0 mt-2 me-2 z-index-1">
          <button class="btn-close btn btn-sm btn-circle d-flex flex-center transition-base" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body p-0">
          <div class="p-4 pb-0">
            <div class="row mb-2 text-center">
              <div class="col-lg-12 col-md-12 col-sm-12 mb-3">
                <i class="far fa-question-circle text-warning fw-light fa-7x"></i>
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12 mb-3">
                <h4 class="mb-1">Esta seguro que desea eliminar!</h4>
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12 mb-3">
                <p>Esta acción solo se puede realizar una sola vez, no podrá revertir los cambios.</p>
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12 mb-3">
                <button type="button" id="deleteOficio" class="btn btn-falcon-primary" runat="server">Si, continuar</button>
                <button type="button" class="btn btn-falcon-danger" data-bs-dismiss="modal">Cancelar</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="modal-reply-agin" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content position-relative">
        <div class="position-absolute top-0 end-0 mt-2 me-2 z-index-1">
          <button class="btn-close btn btn-sm btn-circle d-flex flex-center transition-base" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body p-0">
          <div class="p-4 pb-0">
            <div class="row mb-2 text-center">
              <div class="col-lg-12 col-md-12 col-sm-12 mb-3">
                <i class="far fa-question-circle text-warning fw-light fa-7x"></i>
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12 mb-3">
                <h4 class="mb-1">Solicitud Contestada!</h4>
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12 mb-3">
                <span>
                  Esta solicitud ya se encuentra con una respuesta. Desea responderla nuevamente? 
                  <br />
                </span>
                <span class="fs--1">
                  <strong><i>Nota:</i></strong>
                  <i>Al contestarla nuevamente se enviara una nueva notificación al usuario.</i>
                </span>
              </div>
              <div class="col-lg-12 col-md-12 col-sm-12 mb-3">
                <button type="button" class="btn btn-falcon-primary" data-bs-toggle="modal" data-bs-target="#modal-reply">Si, continuar</button>
                <button type="button" class="btn btn-falcon-danger" data-bs-dismiss="modal">Cancelar</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="modal-reply" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content position-relative">
        <div class="position-absolute top-0 end-0 mt-2 me-2 z-index-1">
          <button class="btn-close btn btn-sm btn-circle d-flex flex-center transition-base" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body p-0">
          <div class="rounded-top-lg py-3 ps-4 pe-6 bg-light">
            <h4 id="replyTitle" class="mb-1" runat="server">Sin título</h4>
          </div>
          <div class="p-4 pb-0">
            <div class="row mb-2">
              <%--<div class="col-lg-12 col-md-12 col-sm-12 mb-3">
                <div class="dropzone dropzone-multiple p-0" id="my_awesome_dropzone" data-dropzone="data-dropzone" action="#!" runat="server">
                  <div class="fallback"><input type="file" name="dropzoneFile" id="dropzoneFile"  multiple="multiple" accept=".xlsx,.xls,.doc,.docx,.pdf" runat="server"/></div>
                  <div class="dz-message" data-dz-message="data-dz-message">
                    <img class="me-2" src="/assets/img/icons/cloud-upload.svg" width="25" alt="" />Puedes soltar tus archivos aquí
                  </div>
                  <div class="dz-preview dz-preview-multiple m-0 d-flex flex-column">
                    <div class="d-flex media mb-3 pb-3 border-bottom btn-reveal-trigger">
                      <img class="dz-image" src="/assets/img/generic/image-file-2.png" alt="..." data-dz-thumbnail="data-dz-thumbnail" />
                      <div class="flex-1 d-flex flex-between-center">
                        <div>
                          <h6 data-dz-name="data-dz-name"></h6>
                          <div class="d-flex align-items-center">
                            <p class="mb-0 fs--1 text-400 lh-1" data-dz-size="data-dz-size"></p>
                            <div class="dz-progress"><span class="dz-upload" data-dz-uploadprogress=""></span></div>
                          </div>
                          <span class="fs--2 text-danger" data-dz-errormessage="data-dz-errormessage"></span>
                        </div>
                        <div class="dropdown font-sans-serif">
                          <button class="btn btn-link text-600 btn-sm dropdown-toggle btn-reveal dropdown-caret-none" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h"></span></button>
                          <div class="dropdown-menu dropdown-menu-end border py-2"><a class="dropdown-item" href="#!" data-dz-remove="data-dz-remove">Eliminar archivo</a></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>--%>
              <div class="col-lg-12 col-md-12 col-sm-12 mb-3">
                <div class="form-group">
                  <label>Adjuntos</label>
                  <div class="custom-file">
                    <input type="file" id="files" class="custom-file-input" accept=".xlsx,.xls,.doc,.docx,.pdf" multiple max-file-size="2097152" runat="server">
                    <label class="custom-file-label" for="customFile">Cargar archivos (max 400 MB)</label>
                  </div>
                </div>
              </div>
              <div class="col-sm-12 col-md-12 col-lg-12 mb-3">
                <div class="form-group">
                  <label>
                    Descripción
                  </label>
                  <textarea id="descriptionReply" placeholder="Descripción de la respuesta..." class="form-control" rows="3" runat="server"></textarea>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer d-flex justify-content-between">
          <button type="button" id="notApply" class="btn btn-falcon-danger" runat="server"><i class="fas fa-ban me-2"></i>Anular</button>
          <button type="button" id="replyReuqest" class="btn btn-falcon-primary" runat="server"><i class="fas fa-reply me-2"></i>Responder</button>
          <button type="button" class="btn btn-falcon-default" data-bs-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="server">
  <script type="text/javascript"> 
    isExpanded('lvl1T');
    isShow('lvl1C');
    isActive('lvl1_1T');

    $(function () {
      $('#RequestsTable').DataTable({
        "bStateSave": true,
        "fnStateSave": function (oSettings, oData) {
          sessionStorage.setItem('offersDataTables', JSON.stringify(oData));
        },
        "fnStateLoad": function (oSettings) {
          return JSON.parse(sessionStorage.getItem('offersDataTables'));
        }
      })
    });

    //$("#RequestsTable").DataTable({
    //  "responsive": false,
    //  "lengthChange": false,
    //  "autoWidth": false,
    //  "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    //}).buttons().container().appendTo('#RequestsTable_wrapper .col-md-6:eq(0)');

    function isChecked(element, input) {
      if (document.querySelector('#' + element).checked) {
        document.getElementById(element).checked = false

        if (input != '0') {
          document.getElementById(input).removeAttribute('disabled')
        }
      } else {
        document.getElementById(element).checked = true

        if (input != '0') {
          document.getElementById(input).setAttribute('disabled', '')
        }
      }
    };

    function exampleSwal() {
      Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
      }).then((result) => {
        if (result.isConfirmed) {
          Swal.fire(
            'Deleted!',
            'Your file has been deleted.',
            'success'
          )
        }
      })
    };
  </script>
</asp:content>

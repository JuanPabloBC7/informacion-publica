Imports System.Web.Optimization

Public Class Global_asax
  Inherits HttpApplication
  Private Shared gen As New general

  Sub Application_Start(sender As Object, e As EventArgs)
    ' Se desencadena al iniciar la aplicación
    RouteConfig.RegisterRoutes(RouteTable.Routes)
    BundleConfig.RegisterBundles(BundleTable.Bundles)
  End Sub

  Sub Session_End(sender As Object, e As EventArgs)
    Try
      Session.Clear()
      Session.Abandon()
    Catch ex As Exception
      Throw
    End Try
  End Sub
End Class
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="amazon.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta http-equiv=”Content-Type” content=”text/html; charset=UTF-8″ />
  <link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/mdb.min.css">
  <link rel="stylesheet" href="css/style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" type="text/css" href="recursos/css/alta.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Altas</title>
</head>
<body>
<%
BDController controladorBD = new BDController();
ArrayList<Amazon> amazons = controladorBD.dameAmazons();
ArrayList<Seccion> secciones = controladorBD.dameSecciones();
ArrayList<Departamento> departamentos = controladorBD.dameDepartamentos();
ArrayList<Almacen> almacenes = controladorBD.dameAlmacenes();
ArrayList<Producto> productos = controladorBD.dameProductos();
ArrayList<Cliente> clientes = controladorBD.dameClientes();
ArrayList<Pedido> pedidos = controladorBD.damePedidos();
ArrayList<Empleado> empleados = controladorBD.dameEmpleadosSeccion("Atención al Cliente");
String usuario = "admin";
String password = "admin";

%>

<div class="d-flex p-2 " style="background: #232f3e;" >
<nav class="navbar navbar-expand-lg navbar-light " style="width: 100%;  ">
   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation" >
    <span class="navbar-toggler-icon" ></span>
  </button>
  <div style="width: 50%;" >
    <div class="img"></div>
    </div>
    
    <div class="collapse navbar-collapse alineador" id="navbarNavAltMarkup">
    <div class="navbar-nav alineador">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle aNav" id="color" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Bajas
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="baja.jsp?tipo=bajaAmazon">Amazon</a>
          <a class="dropdown-item" href="baja.jsp?tipo=bajaProveedor">Proveedor</a>
          <a class="dropdown-item" href="baja.jsp?tipo=bajaEmpleado">Empleado</a>
          <a class="dropdown-item" href="baja.jsp?tipo=bajaAlmacen">Almacen</a>
          <a class="dropdown-item" href="baja.jsp?tipo=bajaSeccion">Seccion</a>
          <a class="dropdown-item" href="baja.jsp?tipo=bajaDepartamento">Departamento</a>
          <a class="dropdown-item" href="baja.jsp?tipo=bajaProducto">Producto</a>
          <a class="dropdown-item" href="baja.jsp?tipo=bajaCliente">Cliente</a>
          <a class="dropdown-item" href="baja.jsp?tipo=bajaPedido">Pedido</a>
          <a class="dropdown-item" href="baja.jsp?tipo=bajaServicio">Servicio-Postventa</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle aNav" id="color" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Altas
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="alta.jsp?tipo=inicioAdministrador&usuario=<%= usuario %>&password=<%= password %>">Amazon</a>
          <a class="dropdown-item" href="alta.jsp?tipo=altaProveedor">Proveedor</a>
          <a class="dropdown-item" href="alta.jsp?tipo=altaEmpleado">Empleado</a>
          <a class="dropdown-item" href="alta.jsp?tipo=altaAlmacen">Almacen</a>
          <a class="dropdown-item" href="alta.jsp?tipo=altaSeccion">Seccion</a>
          <a class="dropdown-item" href="alta.jsp?tipo=altaDepart">Departamento</a>
          <a class="dropdown-item" href="alta.jsp?tipo=altaProduct">Producto</a>
          <a class="dropdown-item" href="alta.jsp?tipo=altaPedido">Pedido</a>
          <a class="dropdown-item" href="alta.jsp?tipo=altaServc">Servicio-Postventa</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle aNav" id="color" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Modificaciones
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="modificacion.jsp?tipo=modAmazon">Amazon</a>
          <a class="dropdown-item" href="modificacion.jsp?tipo=modProveedor">Proveedor</a>
          <a class="dropdown-item" href="modificacion.jsp?tipo=modEmple">Empleado</a>
          <a class="dropdown-item" href="modificacion.jsp?tipo=modAlmacen">Almacen</a>
          <a class="dropdown-item" href="modificacion.jsp?tipo=modSeccion">Seccion</a>
          <a class="dropdown-item" href="modificacion.jsp?tipo=modDepart">Departamento</a>
          <a class="dropdown-item" href="modificacion.jsp?tipo=modProduct">Producto</a>
          <a class="dropdown-item" href="modificacion.jsp?tipo=modCliente">Cliente</a>
          <a class="dropdown-item" href="modificacion.jsp?tipo=modPedido">Pedido</a>
          <a class="dropdown-item" href="modificacion.jsp?tipo=modServ">Servicio-Postventa</a>
        </div>
      </li>

        </div>
      </div>
  </nav>
</div>


<%//ALTA AMAZON

if(request.getParameter("tipo").equalsIgnoreCase("inicioAdministrador")){
	if(request.getParameter("usuario").equalsIgnoreCase("admin") && request.getParameter("password").equalsIgnoreCase("admin")){%>
		
<h1 align="center">Alta Amazon</h1>

	<form action="operaciones.jsp?tipo=altaAmazon" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Pais de Amazon</label>
    <input type="text" class="form-control" name="paisAmazon" placeholder="Ej.: Argentina">
  </div>
  <div class="form-group form-check">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
	<%}
	
	
	//ALTA PROVEEDOR
	
	
}else if(request.getParameter("tipo").equalsIgnoreCase("altaProveedor")){%>
<h1 align="center">Alta Proveedor</h1>

	<form action="operaciones.jsp?tipo=altaProveedor" method="post">
  <div class="form-group">
    <label>Nombre del proveedor</label>
    <input type="text" class="form-control" name="nombreProveedor" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="">
  </div>
  <div class="form-group">
    <label>Direccion del Proveedor</label>
    <input type="text" class="form-control" name="direccionProveedor" id="exampleInputPassword1" placeholder="">
  </div>
  <div class="form-group">
    <label>Teléfono del Proveedor</label>
    <input type="number" class="form-control" name="tlfProveedor" id="exampleInputPassword1" placeholder="">
  </div>
  <div class="form-group">
    <label>Correo del Proveedor</label>
    <input type="email" class="form-control" name="correoProveedor" id="exampleInputPassword1" placeholder="">
  </div>
  <div class="form-group">
                            <label for="select" class="col-12 col-form-label">Amazon Perteneciente</label>
                            <div class="col-12">
                            	<select id="select" name="id_amazon" class="custom-select">
                            		<%for(int i = 0; i < amazons.size(); i++){ %>
                            			<option value="<%= amazons.get(i).getId_amazon() %>"> <%= amazons.get(i).getPais() %></option>
                            		<%} %>
                            	</select>
                            </div>
                            </div>
  <div class="form-group form-check">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
	
<%

//ALTA EMPLEADO

}else if(request.getParameter("tipo").equalsIgnoreCase("altaEmpleado")){%>
<h1 align="center">Alta Empleado</h1>

	<form action="operaciones.jsp?tipo=altaEmpleado" method="post">
	<div class="form-group">
    <label>DNI del empleado</label>
    <input type="text" class="form-control" name="dniEmpleado" placeholder="">
  </div>
  <div class="form-group">
    <label>Nombre del empleado</label>
    <input type="text" class="form-control" name="nombreEmpleado" placeholder="">
  </div>
  <div class="form-group">
    <label>Apellido(s) del empleado</label>
    <input type="text" class="form-control" name="apellidoEmpleado" placeholder="">
  </div>
  <div class="form-group">
    <label>Dirección del empleado</label>
    <input type="text" class="form-control" name="direccionEmpleado" placeholder="">
  </div>
  <div class="form-group">
    <label>Teléfono del empleado</label>
    <input type="number" class="form-control" name="tlfEmpleado" placeholder="">
  </div>
  <div class="form-group">
                            <label for="select" class="col-12 col-form-label">Amazon de Trabajo</label>
                            <div class="col-12">
                            	<select id="select" name="id_amazon" class="custom-select">
                            		<%for(int i = 0; i < amazons.size(); i++){ %>
                            			<option value="<%= amazons.get(i).getId_amazon() %>"> <%= amazons.get(i).getPais() %></option>
                            		<%} %>
                            	</select>
                            </div>
                            </div>
  <div class="form-group form-check">
  <label for="select" class="col-12 col-form-label">Sección de Trabajo</label>
                            <div class="col-12">
                            	<select id="select" name="id_seccion" class="custom-select">
                            		<%for(int i = 0; i < secciones.size(); i++){ %>
                            			<option value="<%= secciones.get(i).getId_seccion() %>"> <%= secciones.get(i).getNombreSeccion() %></option>
                            		<%} %>
                            	</select>
                            </div>
                            </div>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>



	
<%

//ALTA ALMACEN

}else if(request.getParameter("tipo").equalsIgnoreCase("altaAlmacen")){%>
<h1 align="center">Alta Almacén</h1>

<form action="operaciones.jsp?tipo=altaAlmacen" method="post">
<div class="form-group">
<label>Provincia del almacén</label>
<input type="text" class="form-control" name="provinciaAlmacen" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="">
</div>
<div class="form-group">
<label>Localidad del almacén</label>
<input type="text" class="form-control" name="localidadAlmacen" id="exampleInputPassword1" placeholder="">
</div>
<div class="form-group">
                        <label for="select" class="col-12 col-form-label">Amazon Perteneciente</label>
                        <div class="col-12">
                        	<select id="select" name="id_amazon" class="custom-select">
                        		<%for(int i = 0; i < amazons.size(); i++){ %>
                        			<option value="<%= amazons.get(i).getId_amazon() %>"> <%= amazons.get(i).getPais() %></option>
                        		<%} %>
                        	</select>
                        </div>
                        </div>
<div class="form-group form-check">
<label for="select" class="col-12 col-form-label">Añadir departamento</label>
                        <div class="col-12">
                        	<select id="select" name="id_departamento" class="custom-select">
                        		<%for(int i = 0; i < departamentos.size(); i++){ %>
                        			<option value="<%= departamentos.get(i).getId_departamento() %>"> <%= departamentos.get(i).getNombreDepartamento() %></option>
                        		<%} %>
                        	</select>
                        </div>
                        </div>
</div>
<button type="submit" class="btn btn-primary">Submit</button>
</form>
<%

//ALTA SECCION

}else if(request.getParameter("tipo").equalsIgnoreCase("altaSeccion")){%>
<h1 align="center">Alta Sección</h1>

<form action="operaciones.jsp?tipo=altaSeccion" method="post">
<div class="form-group">
<label>Nombre de la Seccion</label>
<input type="text" class="form-control" name="nombreSeccion" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="">
</div>

<button type="submit" class="btn btn-primary">Submit</button>
</form>
<%

//ALTA DEPARTAMENTO

}else if(request.getParameter("tipo").equalsIgnoreCase("altaDepart")){%>
<h1 align="center">Alta Departamento</h1>

<form action="operaciones.jsp?tipo=altaDepart" method="post">
<div class="form-group">
<label>Nombre del Departamento</label>
<input type="text" class="form-control" name="nomDepart" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="">
</div>
<div class="form-group form-check">
<label for="select" class="col-12 col-form-label">Añadir almacen</label>
                        <div class="col-12">
                        	<select id="select" name="id_almacen" class="custom-select">
                        		<%for(int i = 0; i < almacenes.size(); i++){ %>
                        			<option value="<%= almacenes.get(i).getId_almacen() %>"> <%= almacenes.get(i).getLocalidad() %></option>
                        		<%} %>
                        	</select>
                        </div>
                        </div>
</div>
<button type="submit" class="btn btn-primary">Submit</button>
</form>

<%

//ALTA PRODUCTO

}else if(request.getParameter("tipo").equalsIgnoreCase("altaProduct")){%>
<h1 align="center">Alta Producto</h1>

<form action="operaciones.jsp?tipo=altaProduct" method="post">
<div class="form-group">
<label>Pais Produccion</label>
<input type="text" class="form-control" name="paisProd" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="">
</div>
<div class="form-group">
<label>Precio</label>
<input type="number" class="form-control" name="precio" placeholder="" step="0.01" min="0" max="1000">
</div>
<div class="form-group">
<label>Nombre del producto</label>
<input type="text" class="form-control" name="nomProdu" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="">
</div>
<div class="form-group">
<label>Marca</label>
<input type="text" class="form-control" name="marca" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="">
</div>
<div class="form-group">
<label>Modelo</label>
<input type="text" class="form-control" name="modelo" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="">
</div>
<div class="form-group">
<label>Especificaciones</label>
<input type="text" class="form-control" name="especific" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="">
</div>
<div class="form-group">
<label>Existencias</label>
<input type="number" class="form-control" name="existencias" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="">
</div>
<div class="form-group form-check">
<label for="select" class="col-12 col-form-label">Añadir a departamento</label>
                        <div class="col-12">
                        	<select id="select" name="id_departamento" class="custom-select">
                        		<%for(int i = 0; i < departamentos.size(); i++){ %>
                        			<option value="<%= departamentos.get(i).getId_departamento() %>"> <%= departamentos.get(i).getNombreDepartamento() %></option>
                        		<%} %>
                        	</select>
                        </div>
                        </div>
</div>
<button type="submit" class="btn btn-primary">Submit</button>
</form>

<%

//ALTA PEDIDO

}else if(request.getParameter("tipo").equalsIgnoreCase("altaPedido")){%>
<h1 align="center">Alta Pedido</h1>

<form action="operaciones.jsp?tipo=altaPedido" method="post">
<div class="form-group">
<label>Fecha realizada</label>
<input type="text" class="form-control" name="fechaRealizada" placeholder="YYYY-MM-DD" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))">
</div>
<div class="form-group">
<label>Fecha entrega prevista</label>
<input type="text" class="form-control" name="fechaEntrePrev" placeholder="YYYY-MM-DD" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))">
</div>
<div class="form-group">
<label>Fecha Despachada</label>
<input type="text" class="form-control" name="fechaDespachada" placeholder="YYYY-MM-DD" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))">
</div>
<div class="form-group">
<label>Fecha Entregada</label>
<input type="text" class="form-control" name="fechaEntregada" placeholder="YYYY-MM-DD" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))">
</div>
<div class="form-group">
<label for="select" class="col-12 col-form-label">Estado del pedido</label>
                        <div class="col-12">
                        	<select id="select" name="estadoPedido" class="custom-select">
                        		
                        			<option value="Entregado">Entregado</option>
                        			<option value="En Camino">En Camino</option>
                        			<option value="Entregado con Retraso">Entregado con Retraso</option>
                        			<option value="En Reparto">En Reparto</option>
                        			<option value="Producto Perdido">Producto Perdido</option>
                        	</select>
                        </div>
                        </div>
</div>
<div class="form-group">
<label>Review cliente</label>
<input type="text" class="form-control" name="review" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="">
</div>
<div class="form-group">
<label>Monto del Pedido</label>
<input type="number" class="form-control" name="monto" placeholder="" step="0.01" min="0" max="1000">
</div>
<div class="form-group">
<label>Gastos de envío</label>
<input type="number" class="form-control" name="gastos" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="">
</div>
<div class="form-group">
<label for="select" class="col-12 col-form-label">Cliente que compró</label>
                        <div class="col-12">
                        	<select id="select" name="id_cliente" class="custom-select">
                        		<%for(int i = 0; i < clientes.size(); i++){ %>
                        			<option value="<%= clientes.get(i).getId_cliente() %>"> <%= clientes.get(i).getNombreCliente() %></option>
                        		<%} %>
                        	</select>
                        </div>
                        </div>
</div>
<div class="form-group">
<label for="select" class="col-12 col-form-label">Producto comprado</label>
                        <div class="col-12">
                        	<select id="select" name="id_producto" class="custom-select">
                        		<%for(int i = 0; i < productos.size(); i++){ %>
                        			<option value="<%= productos.get(i).getId_producto() %>"> <%= productos.get(i).getNombreProducto() %></option>
                        		<%} %>
                        	</select>
                        </div>
                        </div>
</div>
<button type="submit" class="btn btn-primary">Submit</button>
</form>

<%

//ALTA SERVICIO-POSTVENTA

}else if(request.getParameter("tipo").equalsIgnoreCase("altaServc")){%>
<h1 align="center">Alta Servicio-Postventa</h1>

<form action="operaciones.jsp?tipo=altaServc" method="post">
<div class="form-group">
<label for="select" class="col-12 col-form-label">Tipo de Servicio</label>
                        <div class="col-12">
                        	<select id="select" name="tipoServ" class="custom-select">
                        		
                        			<option value="Devolución">Devolucion</option>
                        			<option value="Garantía">Garantía</option>
                        			<option value="Logística">Logística</option>
                        			
                        		
                        	</select>
                        </div>
                        </div>
<div class="form-group">
<label for="select" class="col-12 col-form-label">Estado del Servicio</label>
                        <div class="col-12">
                        	<select id="select" name="estadoServ" class="custom-select">
                        		
                        			<option value="Progreso">En Progreso</option>
                        			<option value="Finalizado">Finalizado</option>
                        			
                        		
                        	</select>
                        </div>
                        </div>
<div class="form-group">
<label for="select" class="col-12 col-form-label">Añadir a Empleado</label>
                        <div class="col-12">
                        	<select id="select" name="dniEmple" class="custom-select">
                        		<%for(int i = 0; i < empleados.size(); i++){ %>
                        			<option value="<%= empleados.get(i).getDni() %>"> <%= empleados.get(i).getNombreEmpleado() %></option>
                        		<%} %>
                        	</select>
                        </div>
                        </div>
<div class="form-group">
<label for="select" class="col-12 col-form-label">Pedido Afectado</label>
                        <div class="col-12">
                        	<select id="select" name="id_pedido" class="custom-select">
                        		<%for(int i = 0; i < pedidos.size(); i++){ %>
                        			<option value="<%= pedidos.get(i).getId_pedido() %>"> <%= pedidos.get(i).getId_pedido() %></option>
                        		<%} %>
                        	</select>
                        </div>
                        </div>
<button type="submit" class="btn btn-primary">Submit</button>
</form>

<%
}
%>

<footer class="page-footer font-small cyan darken-3 ">
  <div class="container">
    <div class="row text-center">
      <div class="col-md-12 py-5">
        <div class="mb-5 flex-center">
          <a class="fb-ic">
            <i class="fab fa-facebook-f fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
          </a>
          <a class="tw-ic">
            <i class="fab fa-twitter fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
          </a>
          <a class="gplus-ic">
            <i class="fab fa-google-plus-g fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
          </a>
          <a class="li-ic">
            <i class="fab fa-linkedin-in fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
          </a>
          <a class="ins-ic">
            <i class="fab fa-instagram fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
          </a>
          <a class="pin-ic">
            <i class="fab fa-pinterest fa-lg white-text fa-2x"> </i>
          </a>
          <div class="footer text-center py-3">
       		<small>Contacto: amazon.support@amazonworld.com</small>
  		</div>
  		<div class="footer text-center py-3">
  		<small>Teléfono: +49-654-65-654-9</small>
  		</div>
        </div>
      </div>
    </div>
  </div>

  <div class="footer-copyright text-center py-3">
       <a href="index.jsp">Volver a vista Usuario</a>
  </div>
  
</footer>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
      <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/popper.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/mdb.min.js"></script>
  <script type="text/javascript"></script>
</body>
</html>
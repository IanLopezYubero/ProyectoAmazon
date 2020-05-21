<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="amazon.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta http-equiv=”Content-Type” content=”text/html; charset=UTF-8″ />
<link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mdb.min.css">
<link rel="stylesheet" href="css/style.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="recursos/css/alta.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<title>Bajas</title>
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
ArrayList<Proveedor> proveedores = controladorBD.dameProveedores();
ArrayList<Empleado> empleados = controladorBD.dameEmpleados();
ArrayList<Servicio_Postventa> servicios = controladorBD.dameServicios();
String usuario = "admin";
String password = "admin";
%>

	<div class="d-flex p-2 " style="background: #232f3e;">
		<nav class="navbar navbar-expand-lg navbar-light "
			style="width: 100%;">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div style="width: 50%;">
				<div class="img"></div>
			</div>

			<div class="collapse navbar-collapse alineador"
				id="navbarNavAltMarkup">
				<div class="navbar-nav alineador">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle aNav" id="color" href="#"
						id="navbarDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> Bajas </a>
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
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle aNav" id="color" href="#"
						id="navbarDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> Altas </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item"
								href="alta.jsp?tipo=inicioAdministrador&usuario=<%= usuario %>&password=<%= password %>">Amazon</a>
							<a class="dropdown-item" href="alta.jsp?tipo=altaProveedor">Proveedor</a>
							<a class="dropdown-item" href="alta.jsp?tipo=altaEmpleado">Empleado</a>
							<a class="dropdown-item" href="alta.jsp?tipo=altaAlmacen">Almacen</a>
							<a class="dropdown-item" href="alta.jsp?tipo=altaSeccion">Seccion</a>
							<a class="dropdown-item" href="alta.jsp?tipo=altaDepart">Departamento</a>
							<a class="dropdown-item" href="alta.jsp?tipo=altaProduct">Producto</a>
							<a class="dropdown-item" href="alta.jsp?tipo=altaPedido">Pedido</a>
							<a class="dropdown-item" href="alta.jsp?tipo=altaServc">Servicio-Postventa</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle aNav" id="color" href="#"
						id="navbarDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> Modificaciones </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="modificacion.jsp?tipo=modAmazon">Amazon</a>
							<a class="dropdown-item"
								href="modificacion.jsp?tipo=modProveedor">Proveedor</a> <a
								class="dropdown-item" href="modificacion.jsp?tipo=modEmple">Empleado</a>
							<a class="dropdown-item" href="modificacion.jsp?tipo=modAlmacen">Almacen</a>
							<a class="dropdown-item" href="modificacion.jsp?tipo=modSeccion">Seccion</a>
							<a class="dropdown-item" href="modificacion.jsp?tipo=modDepart">Departamento</a>
							<a class="dropdown-item" href="modificacion.jsp?tipo=modProduct">Producto</a>
							<a class="dropdown-item" href="modificacion.jsp?tipo=modCliente">Cliente</a>
							<a class="dropdown-item" href="modificacion.jsp?tipo=modPedido">Pedido</a>
							<a class="dropdown-item" href="modificacion.jsp?tipo=modServ">Servicio-Postventa</a>
						</div></li>

				</div>
			</div>
		</nav>
	</div>


	<%

//BAJA AMAZON
if(request.getParameter("tipo").equalsIgnoreCase("bajaAmazon")){%>
	<h1 align="center">Baja Amazon</h1>

	<form action="operaciones.jsp?tipo=bajaAmazon" method="post">
		<div class="form-group">
			<label for="select" class="col-12 col-form-label">Selecciona
				Amazon</label>
			<div class="col-12">
				<select id="select" name="id_amazon" class="custom-select">
					<%for(int i = 0; i < amazons.size(); i++){ %>
					<option value="<%= amazons.get(i).getId_amazon() %>">
						<%= amazons.get(i).getPais() %></option>
					<%} %>
				</select>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>

	<%

//BAJA PROVEEDOR

}else if(request.getParameter("tipo").equalsIgnoreCase("bajaProveedor")){%>
	<h1 align="center">Baja Proveedor</h1>

	<form action="operaciones.jsp?tipo=bajaProveedor" method="post">
		<div class="form-group">
			<label for="select" class="col-12 col-form-label">Selecciona
				Amazon</label>
			<div class="col-12">
				<select id="select" name="id_proveedor" class="custom-select">
					<%for(int i = 0; i < proveedores.size(); i++){ %>
					<option value="<%= proveedores.get(i).getId_proveedor() %>">
						<%= proveedores.get(i).getNombreProveedor() %></option>
					<%} %>
				</select>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>

	<%

//BAJA EMPLEADO

}else if(request.getParameter("tipo").equalsIgnoreCase("bajaEmpleado")){%>
	<h1 align="center">Baja Empleado</h1>

	<form action="operaciones.jsp?tipo=bajaEmpleado" method="post">
		<div class="form-group">
			<label for="select" class="col-12 col-form-label">Selecciona
				Baja Empleado</label>
			<div class="col-12">
				<select id="select" name="dniEmpleado" class="custom-select">
					<%for(int i = 0; i < empleados.size(); i++){ %>
					<option value="<%= empleados.get(i).getDni() %>">
						<%= empleados.get(i).getNombreEmpleado() %></option>
					<%} %>
				</select>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>

	<%

//BAJA ALMACEN

}else if(request.getParameter("tipo").equalsIgnoreCase("bajaAlmacen")){%>
	<h1 align="center">Baja Almacén</h1>

	<form action="operaciones.jsp?tipo=bajaAlmacen" method="post">
		<div class="form-group">
			<label for="select" class="col-12 col-form-label">Selecciona
				Almacén</label>
			<div class="col-12">
				<select id="select" name="id_almacen" class="custom-select">
					<%for(int i = 0; i < almacenes.size(); i++){ %>
					<option value="<%= almacenes.get(i).getId_almacen() %>">
						<%= almacenes.get(i).getLocalidad() %></option>
					<%} %>
				</select>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>

	<%

//BAJA SECCION

}else if(request.getParameter("tipo").equalsIgnoreCase("bajaSeccion")){%>
	<h1 align="center">Baja Sección</h1>

	<form action="operaciones.jsp?tipo=bajaSeccion" method="post">
		<div class="form-group">
			<label for="select" class="col-12 col-form-label">Selecciona
				Sección</label>
			<div class="col-12">
				<select id="select" name="id_seccion" class="custom-select">
					<%for(int i = 0; i < secciones.size(); i++){ %>
					<option value="<%= secciones.get(i).getId_seccion() %>">
						<%= secciones.get(i).getNombreSeccion() %></option>
					<%} %>
				</select>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>

	<%

//BAJA DEPARTAMENTO

}else if(request.getParameter("tipo").equalsIgnoreCase("bajaDepartamento")){%>
	<h1 align="center">Baja Departamento</h1>

	<form action="operaciones.jsp?tipo=bajaDepartamento" method="post">
		<div class="form-group">
			<label for="select" class="col-12 col-form-label">Selecciona
				Departamento</label>
			<div class="col-12">
				<select id="select" name="id_departamento" class="custom-select">
					<%for(int i = 0; i < departamentos.size(); i++){ %>
					<option value="<%= departamentos.get(i).getId_departamento() %>">
						<%= departamentos.get(i).getNombreDepartamento() %></option>
					<%} %>
				</select>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>

	<%

//BAJA PRODUCTO

}else if(request.getParameter("tipo").equalsIgnoreCase("bajaProducto")){%>
	<h1 align="center">Baja Producto</h1>

	<form action="operaciones.jsp?tipo=bajaProducto" method="post">
		<div class="form-group">
			<label for="select" class="col-12 col-form-label">Selecciona
				Producto</label>
			<div class="col-12">
				<select id="select" name="id_producto" class="custom-select">
					<%for(int i = 0; i < productos.size(); i++){ %>
					<option value="<%= productos.get(i).getId_producto() %>">
						<%= productos.get(i).getMarca() %>
						<%= productos.get(i).getModelo() %></option>
					<%} %>
				</select>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>

	<%

//BAJA CLIENTE

}else if(request.getParameter("tipo").equalsIgnoreCase("bajaCliente")){%>
	<h1 align="center">Baja Cliente</h1>

	<form action="operaciones.jsp?tipo=bajaCliente" method="post">
		<div class="form-group">
			<label for="select" class="col-12 col-form-label">Selecciona
				Cliente</label>
			<div class="col-12">
				<select id="select" name="id_cliente" class="custom-select">
					<%for(int i = 0; i < clientes.size(); i++){ %>
					<option value="<%= clientes.get(i).getId_cliente() %>">
						<%= clientes.get(i).getNombreCliente() %>
						<%= clientes.get(i).getApellidoCliente() %></option>
					<%} %>
				</select>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>

	<%

//BAJA PEDIDO

}else if(request.getParameter("tipo").equalsIgnoreCase("bajaPedido")){%>
	<h1 align="center">Baja Pedido</h1>

	<form action="operaciones.jsp?tipo=bajaPedido" method="post">
		<div class="form-group">
			<label for="select" class="col-12 col-form-label">Selecciona
				Pedido</label>
			<div class="col-12">
				<select id="select" name="id_pedido" class="custom-select">
					<%for(int i = 0; i < pedidos.size(); i++){ %>
					<option value="<%= pedidos.get(i).getId_pedido() %>">
						ID_PEDIDO:
						<%= pedidos.get(i).getId_pedido() %>, ID_CLIENTE:
						<%= pedidos.get(i).getId_cliente() %></option>
					<%} %>
				</select>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>

	<%

//BAJA SERVICIO-POSTVENTA

}else if(request.getParameter("tipo").equalsIgnoreCase("bajaServicio")){%>
	<h1 align="center">Baja Servicio-Postventa</h1>

	<form action="operaciones.jsp?tipo=bajaServicio" method="post">
		<div class="form-group">
			<label for="select" class="col-12 col-form-label">Selecciona
				Servicio-Postventa</label>
			<div class="col-12">
				<select id="select" name="id_servicio" class="custom-select">
					<%for(int i = 0; i < servicios.size(); i++){ %>
					<option value="<%= servicios.get(i).getId_servicio() %>">
						ID_SERVICIO:
						<%= servicios.get(i).getId_servicio() %>, ID_PEDIDO:
						<%= servicios.get(i).getId_pedido() %></option>
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
						<a class="fb-ic"> <i
							class="fab fa-facebook-f fa-lg white-text mr-md-5 mr-3 fa-2x">
						</i>
						</a> <a class="tw-ic"> <i
							class="fab fa-twitter fa-lg white-text mr-md-5 mr-3 fa-2x"> </i>
						</a> <a class="gplus-ic"> <i
							class="fab fa-google-plus-g fa-lg white-text mr-md-5 mr-3 fa-2x">
						</i>
						</a> <a class="li-ic"> <i
							class="fab fa-linkedin-in fa-lg white-text mr-md-5 mr-3 fa-2x">
						</i>
						</a> <a class="ins-ic"> <i
							class="fab fa-instagram fa-lg white-text mr-md-5 mr-3 fa-2x">
						</i>
						</a> <a class="pin-ic"> <i
							class="fab fa-pinterest fa-lg white-text fa-2x"> </i>
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



	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/popper.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/mdb.min.js"></script>
	<script type="text/javascript"></script>
</body>
</html>
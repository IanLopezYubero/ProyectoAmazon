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
<title>Modificaciones</title>
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
ArrayList<Empleado> empleadosSeccion = controladorBD.dameEmpleadosSeccion("Atención al Cliente");
ArrayList<Servicio_Postventa> servicios = controladorBD.dameServicios();
int id_amazon = 0;
String mensaje = "";
String operacion = "correcta";
int id_cliente = 0;
String direccionCliente = "";
String nombreCliente = "";
String apellidoCliente = "";
String correoCliente = "";
String tlfCliente = "";
String tipoSuscripcion = "";
String durSuscripcion = "";
String paisAmazon = "";
int id_proveedor = 0;
String nombreProveedor = "";
String direccionProveedor = "";
String tlfProveedor = "";
String correoProveedor = "";
String dniEmpleado = "";
String nomEmple = "";
String apeEmple = "";
String direcEmple = "";
String tlfEmple = "";
int id_seccion = 0;
int id_almacen = 0;
String provinciaAlmacen = "";
String localidadAlmacen = "";
int id_departamento = 0;
String nomDepart = "";
String nombreSeccion = "";
int id_producto = 0;
String paisProd = "";
double precio = 0;
String nomProdu = "";
String marca = "";
String modelo = "";
String especific = "";
int existencias = 0;
int id_pedido = 0;
String fechaRealizada = "";
String fechaEntrePrev = "";
String fechaDespachada = "";
String fechaEntregada = "";
String estadoPedido = "";
String review = "";
double monto = 0;
double gastos = 0;
int id_servicio = 0;
String estadoServ = "";
String tipoServ = "";
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

<%

//MODIFICAR AMAZON
if(request.getParameter("tipo").equalsIgnoreCase("modAmazon")){
id_amazon = Integer.parseInt(request.getParameter("id_amazon"));
Amazon amazon = new Amazon();
for(int i = 0; i < amazons.size(); i++){
	if(amazons.get(i).getId_amazon() == id_amazon){
		amazon = new Amazon(amazons.get(i).getId_amazon(), amazons.get(i).getPais());
	}
}
%>
<h1 align="center">Modificación Amazon</h1>
<form action="operaciones.jsp?tipo=modAmazon" method="post">
 <div class="form-group">
    <label>Pais Amazon</label>
    <input type="text" class="form-control" name="pais" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= amazon.getPais() %>">
    <input type="hidden" class="form-control" name="id_amazon" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= amazon.getId_amazon() %>">
  </div>
<button type="submit" class="btn btn-primary">Submit</button>
</form>

<%

//MODIFICAR PROVEEDOR

}else if(request.getParameter("tipo").equalsIgnoreCase("modProveedor")){
	id_proveedor = Integer.parseInt(request.getParameter("id_proveedor"));
	Proveedor proveedor = new Proveedor();
	for(int i = 0; i < proveedores.size(); i++){
		if(proveedores.get(i).getId_proveedor() == id_proveedor){
			proveedor = new Proveedor(proveedores.get(i).getId_proveedor(), proveedores.get(i).getNombreProveedor(), proveedores.get(i).getDireccion(), proveedores.get(i).getTlf(), proveedores.get(i).getCorreoProveedor());
		}
	}
	%>
	<h1 align="center">Modificación Proveedor</h1>
	<form action="operaciones.jsp?tipo=modProveedor" method="post">
  <div class="form-group">
    <label>Nombre del proveedor</label>
    <input type="text" class="form-control" name="nombreProveedor" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= proveedor.getNombreProveedor() %>">
  </div>
  <div class="form-group">
    <label>Direccion del Proveedor</label>
    <input type="text" class="form-control" name="direccionProveedor" id="exampleInputPassword1" placeholder="" value="<%= proveedor.getDireccion() %>">
  </div>
  <div class="form-group">
    <label>Teléfono del Proveedor</label>
    <input type="number" class="form-control" name="tlfProveedor" id="exampleInputPassword1" placeholder="" value="<%= proveedor.getTlf() %>">
  </div>
  <div class="form-group">
    <label>Correo del Proveedor</label>
    <input type="email" class="form-control" name="correoProveedor" id="exampleInputPassword1" placeholder="" value="<%= proveedor.getCorreoProveedor() %>">
    <input type="hidden" class="form-control" name="id_proveedor" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= proveedor.getId_proveedor() %>">
  </div>
  <div class="form-group form-check">
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>

<%

//MODIFICACION EMPLEADO

}else if(request.getParameter("tipo").equalsIgnoreCase("modEmple")){
	dniEmpleado = request.getParameter("dni");
	Empleado empleado = new Empleado();
	for(int i = 0; i < empleados.size(); i++){
		if(empleados.get(i).getDni().equalsIgnoreCase(dniEmpleado)){
			empleado = new Empleado(empleados.get(i).getDni(), empleados.get(i).getNombreEmpleado(), empleados.get(i).getApellidoEmpleado(), empleados.get(i).getDireccion(), empleados.get(i).getTlf(), empleados.get(i).getId_amazon());
		}
	}
	%>
	<h1 align="center">Modificación Empleado</h1>

	<form action="operaciones.jsp?tipo=modEmple" method="post">
	<div class="form-group">
    <label>DNI del empleado</label>
    <input type="text" class="form-control" name="dniEmpleado" placeholder="" value="<%= empleado.getDni() %>">
  </div>
  <div class="form-group">
    <label>Nombre del empleado</label>
    <input type="text" class="form-control" name="nombreEmpleado" placeholder="" value="<%= empleado.getNombreEmpleado() %>">
  </div>
  <div class="form-group">
    <label>Apellido(s) del empleado</label>
    <input type="text" class="form-control" name="apellidoEmpleado" placeholder="" value="<%= empleado.getApellidoEmpleado() %>">
  </div>
  <div class="form-group">
    <label>Dirección del empleado</label>
    <input type="text" class="form-control" name="direccionEmpleado" placeholder="" value="<%= empleado.getDireccion() %>">
  </div>
  <div class="form-group">
    <label>Teléfono del empleado</label>
    <input type="number" class="form-control" name="tlfEmpleado" placeholder="" value="<%= empleado.getTlf() %>">
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
  <div class="form-group">
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

//MODIFICACION ALMACEN

}else if(request.getParameter("tipo").equalsIgnoreCase("modAlmacen")){
	id_almacen = Integer.parseInt(request.getParameter("id_almacen"));
	Almacen almacen = new Almacen();
	for(int i = 0; i < almacenes.size(); i++){
		if(almacenes.get(i).getId_almacen() == id_almacen){
			almacen = new Almacen(almacenes.get(i).getId_almacen(), almacenes.get(i).getProvincia(), almacenes.get(i).getLocalidad(), almacenes.get(i).getId_amazon());
		}
	}
	%>
	<h1 align="center">Modificación Empleado</h1>

	<form action="operaciones.jsp?tipo=modAlmacen" method="post">
<div class="form-group">
<label>Provincia del almacén</label>
<input type="text" class="form-control" name="provinciaAlmacen" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= almacen.getProvincia() %>">
</div>
<div class="form-group">
<label>Localidad del almacén</label>
<input type="text" class="form-control" name="localidadAlmacen" id="exampleInputPassword1" placeholder="" value="<%= almacen.getLocalidad() %>">
<input type="hidden" class="form-control" name="id_almacen" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= almacen.getId_almacen() %>">
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
<button type="submit" class="btn btn-primary">Submit</button>
</form>
<%

//MODIFICACION SECCION

}else if(request.getParameter("tipo").equalsIgnoreCase("modSeccion")){
	id_seccion = Integer.parseInt(request.getParameter("id_seccion"));
	Seccion seccion = new Seccion();
	for(int i = 0; i < secciones.size(); i++){
		if(secciones.get(i).getId_seccion() == id_seccion){
			seccion = new Seccion(secciones.get(i).getId_seccion(), secciones.get(i).getNombreSeccion());
		}
	}
	%>
	<h1 align="center">Modificación Empleado</h1>

	<form action="operaciones.jsp?tipo=modSeccion" method="post">
<div class="form-group">
<label>Nombre de la Seccion</label>
<input type="text" class="form-control" name="nombreSeccion" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= seccion.getNombreSeccion() %>">
<input type="hidden" class="form-control" name="id_seccion" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= seccion.getId_seccion() %>">
</div>

<button type="submit" class="btn btn-primary">Submit</button>
</form>
<%

//MODIFICACION DEPARTAMENTO

}else if(request.getParameter("tipo").equalsIgnoreCase("modDepart")){
	id_departamento = Integer.parseInt(request.getParameter("id_departamento"));
	Departamento depart = new Departamento();
	for(int i = 0; i < departamentos.size(); i++){
		if(departamentos.get(i).getId_departamento() == id_departamento){
			depart = new Departamento(departamentos.get(i).getId_departamento(), departamentos.get(i).getNombreDepartamento());
		}
	}
	%>
	<h1 align="center">Modificación Departamento</h1>

<form action="operaciones.jsp?tipo=modDepart" method="post">
<div class="form-group">
<label>Nombre del Departamento</label>
<input type="text" class="form-control" name="nomDepart" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= depart.getNombreDepartamento() %>">
<input type="hidden" class="form-control" name="id_departamento" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= depart.getId_departamento() %>">
</div>
<div class="form-group form-check">
<label for="select" class="col-12 col-form-label">Cambiar almacen</label>
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

//MODIFICACION PRODUCTO

}else if(request.getParameter("tipo").equalsIgnoreCase("modProduct")){
	id_producto = Integer.parseInt(request.getParameter("id_producto"));
	Producto product = new Producto();
	for(int i = 0; i < productos.size(); i++){
		if(productos.get(i).getId_producto() == id_producto){
			product = new Producto(productos.get(i).getId_producto(), productos.get(i).getNombreProducto(), productos.get(i).getPaisProduccion(), productos.get(i).getPrecio(), productos.get(i).getMarca(), productos.get(i).getModelo(), productos.get(i).getEspecificaciones(), productos.get(i).getExistencias(), productos.get(i).getId_departamento());
		}
	}
	%>
	<h1 align="center">Modificación Producto</h1>

<form action="operaciones.jsp?tipo=modProduct" method="post">
<div class="form-group">
<label>Pais Produccion</label>
<input type="text" class="form-control" name="paisProd" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= product.getPaisProduccion() %>">
</div>
<div class="form-group">
<label>Precio</label>
<input type="number" class="form-control" name="precio" placeholder="" step="0.01" min="0" max="1000" value="<%= product.getPrecio() %>">
</div>
<div class="form-group">
<label>Nombre del producto</label>
<input type="text" class="form-control" name="nomProdu" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= product.getNombreProducto() %>">
</div>
<div class="form-group">
<label>Marca</label>
<input type="text" class="form-control" name="marca" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= product.getMarca() %>">
</div>
<div class="form-group">
<label>Modelo</label>
<input type="text" class="form-control" name="modelo" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= product.getModelo() %>">
</div>
<div class="form-group">
<label>Especificaciones</label>
<input type="text" class="form-control" name="especific" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= product.getEspecificaciones() %>">
</div>
<div class="form-group">
<label>Existencias</label>
<input type="number" class="form-control" name="existencias" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= product.getExistencias() %>">
<input type="hidden" class="form-control" name="id_producto" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= product.getId_producto() %>">
</div>
<div class="form-group form-check">
<label for="select" class="col-12 col-form-label">Asignar departamento</label>
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

//MODIFICACION CLIENTE

}else if(request.getParameter("tipo").equalsIgnoreCase("modCliente")){
	id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
	Cliente cliente = new Cliente();
	for(int i = 0; i < clientes.size(); i++){
		if(clientes.get(i).getId_cliente() == id_cliente){
			cliente = new Cliente(clientes.get(i).getId_cliente(), clientes.get(i).getDireccion(), clientes.get(i).getNombreCliente(), clientes.get(i).getApellidoCliente(), clientes.get(i).getCorreoCliente(), clientes.get(i).getTlf(), clientes.get(i).getTipoSuscripcion(), clientes.get(i).getDuracionSuscripcion(), clientes.get(i).getId_amazon());
		}
	}
	%>
	<h1 align="center">Modificación Producto</h1>

<form action="operaciones.jsp?tipo=modCliente" method="post">
<div class="form-group">
<label>Nombre Cliente</label>
<input type="text" class="form-control" name="nomClien" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= cliente.getNombreCliente() %>">
</div>
<div class="form-group">
<label>Apellido(s) Cliente</label>
<input type="text" class="form-control" name="apeClien" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= cliente.getApellidoCliente() %>">
</div>
<div class="form-group">
<label>Tlf Cliente</label>
<input type="text" class="form-control" name="tlfClien" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= cliente.getTlf() %>">
</div>
<div class="form-group">
<label>Correo Cliente</label>
<input type="text" class="form-control" name="correoClien" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= cliente.getCorreoCliente() %>">
</div>
<div class="form-group">
<label>Dirección Cliente</label>
<input type="text" class="form-control" name="direcClien" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= cliente.getDireccion() %>">
</div>
<div class="form-group">
<label>Duración Suscripción Cliente</label>
<input type="text" class="form-control" name="duracionSuscrip" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="AAAA-MM-DD" value="<%= cliente.getDuracionSuscripcion() %>" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))">
</div>
<input type="hidden" class="form-control" name="id_cliente" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= cliente.getId_cliente() %>">
<input type="hidden" class="form-control" name="id_amazon" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= cliente.getId_amazon() %>">
<div class="form-group">
<label for="select" class="col-12 col-form-label">Tipo Suscripción</label>
                        <div class="col-12">
                        	<select id="select" name="tipoSuscripcion" class="custom-select">
                        		
                        			<option value="Basica">Basica</option>
                        			<option value="Prime">Prime</option>
                        	</select>
                        </div>
                        </div>
<button type="submit" class="btn btn-primary">Submit</button>
</form>
<%

//MODIFICACION PEDIDO

}else if(request.getParameter("tipo").equalsIgnoreCase("modPedido")){
	id_pedido = Integer.parseInt(request.getParameter("id_pedido"));
	Pedido pedido = new Pedido();
	for(int i = 0; i < pedidos.size(); i++){
		if(pedidos.get(i).getId_pedido() == id_pedido){
			pedido = new Pedido(pedidos.get(i).getId_pedido(), pedidos.get(i).getFechaRealizada(), pedidos.get(i).getFechaEntregaPrevista(), pedidos.get(i).getFechaDespachada(), pedidos.get(i).getFechaEntregada(), pedidos.get(i).getEstadoPedido(), pedidos.get(i).getReview(), pedidos.get(i).getMonto(), pedidos.get(i).getGastosEnvio(), pedidos.get(i).getId_cliente());
		}
	}
	System.out.println(id_pedido);
	%>
	<h1 align="center">Modificación Pedido</h1>

<form action="operaciones.jsp?tipo=modPedido" method="post">
<div class="form-group">
<label>Fecha realizada</label>
<input type="text" class="form-control" name="fechaRealizada" placeholder="YYYY-MM-DD" value="<%= pedido.getFechaRealizada() %>" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))">
</div>
<div class="form-group">
<label>Fecha entrega prevista</label>
<input type="text" class="form-control" name="fechaEntrePrev" placeholder="YYYY-MM-DD" value="<%= pedido.getFechaEntregaPrevista() %>" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))">
</div>
<div class="form-group">
<label>Fecha Despachada</label>
<input type="text" class="form-control" name="fechaDespachada" placeholder="YYYY-MM-DD" value="<%= pedido.getFechaDespachada() %>" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))">
</div>
<div class="form-group">
<label>Fecha Entregada</label>
<input type="text" class="form-control" name="fechaEntregada" placeholder="YYYY-MM-DD" value="<%= pedido.getFechaEntregada() %>" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))">
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
<input type="text" class="form-control" name="review" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= pedido.getReview() %>">
</div>
<div class="form-group">
<label>Monto del Pedido</label>
<input type="number" class="form-control" name="monto" placeholder="" step="0.01" min="0" max="1000" value="<%= pedido.getMonto() %>">
</div>
<div class="form-group">
<label>Gastos de envío</label>
<input type="number" class="form-control" name="gastos" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= pedido.getGastosEnvio() %>">

</div>
<input type="hidden" class="form-control" name="id_cliente" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= pedido.getId_cliente() %>">
<input type="hidden" class="form-control" name="id_pedido" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= pedido.getId_pedido() %>">
<button type="submit" class="btn btn-primary">Submit</button>
</form>
<%

//MODIFICACION SERVICIO-POSTVENTA	

}else if(request.getParameter("tipo").equalsIgnoreCase("modServ")){
	id_servicio = Integer.parseInt(request.getParameter("id_servicio"));
	Servicio_Postventa servicio = new Servicio_Postventa();
	for(int i = 0; i < servicios.size(); i++){
		if(servicios.get(i).getId_servicio() == id_servicio){
			servicio = new Servicio_Postventa(servicios.get(i).getId_servicio(), servicios.get(i).getId_pedido(), servicios.get(i).getDni(), servicios.get(i).getTipoServicio(), servicios.get(i).getEstadoCaso());
			System.out.println(servicios.get(i).getId_pedido());
		}
	}

%>
<h1 align="center">Modificación Servicio-Postventa</h1>

<form action="operaciones.jsp?tipo=modServ" method="post">
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
                        		<%for(int i = 0; i < empleadosSeccion.size(); i++){ %>
                        			<option value="<%= empleadosSeccion.get(i).getDni() %>"> <%= empleadosSeccion.get(i).getNombreEmpleado() %></option>
                        		<%} %>
                        	</select>
                        </div>
                        </div>
<div class="form-group">
<%
System.out.println(servicio.getId_pedido());
System.out.println(id_servicio);
%>
<input type="hidden" class="form-control" name="id_servicio" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= servicio.getId_servicio() %>">
<input type="hidden" class="form-control" name="id_pedido" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="" value="<%= servicio.getId_pedido() %>">
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
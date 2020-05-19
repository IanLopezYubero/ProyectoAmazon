<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="amazon.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Resultado Operación</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
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
<link rel="stylesheet" type="text/css" href="recursos/css/pedidos.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>
	<%
String id_amazon = request.getParameter("id_amazon");
BDController controladorBD = new BDController();

//Variables
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
int id_amazon_registro = 0;
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
					<a class="nav-item nav-link active aNav" id="color"
						href="amazonMain.jsp?id_amazon=<%= id_amazon %>">Inicio <span
						class="sr-only">(current)</span></a> <a class="nav-item nav-link aNav"
						id="color" href="pedidos.jsp?id_amazon=<%= id_amazon %>">Pedidos</a>
					<a class="nav-item nav-link aNav" id="color"
						href="registro.jsp?id_amazon=<%= id_amazon %>">Registrarte</a> <a
						class="nav-item nav-link aNav" id="color" href="#"><img
						src="recursos/images/logo/shopping-cart.png" width="50"
						height="50"></a>

				</div>
			</div>
		</nav>
	</div>

	<%
//Alta de cliente
if(request.getParameter("tipo").equalsIgnoreCase("registroCliente")){
	id_cliente = controladorBD.calcularIdCliente()+1;
	if(request.getParameter("nombreCliente").equalsIgnoreCase("")){
		mensaje = "El nombre del cliente no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("apellidoCliente").equalsIgnoreCase("")){
		mensaje = "El apellido del cliente no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("tlfCliente").equalsIgnoreCase("")){
		mensaje = "El telefono del cliente no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("durSuscripcion").equalsIgnoreCase("") && request.getParameter("tipoSuscripcion").equalsIgnoreCase("Prime")){
		mensaje = "La duracion de suscripcion con prime del cliente no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(!request.getParameter("durSuscripcion").isEmpty() && request.getParameter("tipoSuscripcion").equalsIgnoreCase("Basica")){
		mensaje = "La duracion de suscripcion tiene que estar vacia con basica, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("direccionCliente").equalsIgnoreCase("")){
		mensaje = "La direccion del cliente no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("correoCliente").equalsIgnoreCase("")){
		mensaje = "El correo del cliente no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(operacion.equalsIgnoreCase("correcta")){
		nombreCliente = request.getParameter("nombreCliente");
		apellidoCliente = request.getParameter("apellidoCliente");
		tlfCliente = request.getParameter("tlfCliente");
		durSuscripcion = request.getParameter("durSuscripcion");
		tipoSuscripcion = request.getParameter("tipoSuscripcion");
		direccionCliente = request.getParameter("direccionCliente");
		correoCliente = request.getParameter("correoCliente");
		id_amazon_registro = Integer.parseInt(request.getParameter("id_amazon"));
		Cliente cliente = new Cliente(id_cliente, direccionCliente, nombreCliente, apellidoCliente, correoCliente, tlfCliente, tipoSuscripcion, durSuscripcion, id_amazon_registro);
		controladorBD.insertarCliente(cliente);
		mensaje = "Operacion realizada exitosamente";
	}
}

//Alta de Amazon
if(request.getParameter("tipo").equalsIgnoreCase("altaAmazon")){
	id_amazon_registro = controladorBD.calcularIdAmazon()+1;
	if(request.getParameter("paisAmazon").equalsIgnoreCase("")){
		mensaje = "El pais del amazon no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(operacion.equalsIgnoreCase("correcta")){
		paisAmazon = request.getParameter("paisAmazon");
		Amazon amazon = new Amazon(id_amazon_registro, paisAmazon);
		controladorBD.insertarAmazon(amazon);
		mensaje = "Operacion realizada exitosamente";
	}
}

//Alta de Proveedor
if(request.getParameter("tipo").equalsIgnoreCase("altaProveedor")){
	id_proveedor = controladorBD.calcularIdProveedor()+1;
	if(request.getParameter("nombreProveedor").equalsIgnoreCase("")){
		mensaje = "El nombre del proveedor no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("direccionProveedor").equalsIgnoreCase("")){
		mensaje = "La direccion del proveedor no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("tlfProveedor").equalsIgnoreCase("")){
		mensaje = "El tlf del proveedor no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("correoProveedor").equalsIgnoreCase("")){
		mensaje = "El correo del proveedor no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(operacion.equalsIgnoreCase("correcta")){
		nombreProveedor = request.getParameter("nombreProveedor");
		direccionProveedor = request.getParameter("direccionProveedor");
		tlfProveedor = request.getParameter("tlfProveedor");
		correoProveedor = request.getParameter("correoProveedor");
		id_amazon_registro = Integer.parseInt(request.getParameter("id_amazon"));
		Proveedor proveedor = new Proveedor(id_proveedor, nombreProveedor, direccionProveedor, tlfProveedor, correoProveedor);
		controladorBD.insertarProveedor(proveedor, id_amazon_registro);
		mensaje = "Operacion realizada exitosamente";
	}
}

//Alta de empleado
if(request.getParameter("tipo").equalsIgnoreCase("altaEmpleado")){
	if(controladorBD.existeEmpleado(request.getParameter("dniEmpleado")) == true){
		mensaje = "El dni del empleado ya existe, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("dniEmpleado").equalsIgnoreCase("")){
		mensaje = "El dni del empleado no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("nombreEmpleado").equalsIgnoreCase("")){
		mensaje = "El nombre del empleado no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("apellidoEmpleado").equalsIgnoreCase("")){
		mensaje = "El apellido del empleado no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("direccionEmpleado").equalsIgnoreCase("")){
		mensaje = "La direccion del empleado no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("tlfEmpleado").equalsIgnoreCase("")){
		mensaje = "El tlf del empleado no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(operacion.equalsIgnoreCase("correcta")){
		dniEmpleado = request.getParameter("dniEmpleado");
		nomEmple = request.getParameter("nombreEmpleado");
		apeEmple = request.getParameter("apellidoEmpleado");
		direcEmple = request.getParameter("direccionEmpleado");
		tlfEmple = request.getParameter("tlfEmpleado");
		id_amazon_registro = Integer.parseInt(request.getParameter("id_amazon"));
		Empleado empleado = new Empleado (dniEmpleado, nomEmple, apeEmple,direcEmple, tlfEmple, id_amazon_registro);
		id_seccion = Integer.parseInt(request.getParameter("id_seccion"));
		controladorBD.insertarEmpleado(empleado, id_seccion);
		mensaje = "Operacion realizada exitosamente";
	}
}

//Alta de Almacén
if(request.getParameter("tipo").equalsIgnoreCase("altaAlmacen")){
	id_almacen = controladorBD.calcularIdAlmacen()+1;
	if(request.getParameter("provinciaAlmacen").equalsIgnoreCase("")){
		mensaje = "La provincia del almacen no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("localidadAlmacen").equalsIgnoreCase("")){
		mensaje = "La localidad del almacen no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(operacion.equalsIgnoreCase("correcta")){
		provinciaAlmacen = request.getParameter("provinciaAlmacen");
		localidadAlmacen = request.getParameter("localidadAlmacen");
		id_departamento = Integer.parseInt(request.getParameter("id_departamento"));
		id_amazon_registro = Integer.parseInt(request.getParameter("id_amazon"));
		Almacen almacen = new Almacen(id_almacen, provinciaAlmacen, localidadAlmacen, id_amazon_registro);
		controladorBD.insertarAlmacen(almacen, id_departamento);
		mensaje = "Operacion realizada exitosamente";
	}
}

//Alta de Seccion
if(request.getParameter("tipo").equalsIgnoreCase("altaSeccion")){
	id_seccion = controladorBD.calcularIdSeccion()+1;
	if(request.getParameter("nombreSeccion").equalsIgnoreCase("")){
		mensaje = "El nombre de la secccion no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(controladorBD.existeSeccion(request.getParameter("nombreSeccion")) == true){
		mensaje = "La seccion ya existe, repita la operacion";
		operacion = "incorrecta";
	}else if(operacion.equalsIgnoreCase("correcta")){
		nombreSeccion = request.getParameter("nombreSeccion");
		Seccion seccion = new Seccion(id_seccion, nombreSeccion);
		controladorBD.insertarSeccion(seccion);
		mensaje = "Operacion realizada exitosamente";
	}
}

//Alta de Departamento
if(request.getParameter("tipo").equalsIgnoreCase("altaDepart")){
	id_departamento = controladorBD.calcularIdDepartamento()+1;
	if(request.getParameter("nomDepart").equalsIgnoreCase("")){
		mensaje = "El nombre del departamento no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(controladorBD.existeDepart(request.getParameter("nomDepart")) == true){
		mensaje = "El nombre del departamento ya existe, repita la operacion";
		operacion = "incorrecta";
	}else if(operacion.equalsIgnoreCase("correcta")){
		nomDepart = request.getParameter("nomDepart");
		Departamento departamento = new Departamento(id_departamento, nomDepart);
		id_almacen = Integer.parseInt(request.getParameter("id_almacen"));
		controladorBD.insertarDepartamento(departamento, id_almacen);
		mensaje = "Operacion realizada exitosamente";
	}
}

//Alta de Producto
if(request.getParameter("tipo").equalsIgnoreCase("altaProduct")){
	id_producto = controladorBD.calcularIdProducto()+1;
	if(request.getParameter("paisProd").equalsIgnoreCase("")){
		mensaje = "El pais del producto no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("precio").equalsIgnoreCase("")){
		mensaje = "El precio del producto no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("nomProdu").equalsIgnoreCase("")){
		mensaje = "El nombre del producto no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("marca").equalsIgnoreCase("")){
		mensaje = "La marca del producto no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("modelo").equalsIgnoreCase("")){
		mensaje = "El modelo del producto no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("especific").equalsIgnoreCase("")){
		mensaje = "Las especificaciones del producto no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("existencias").equalsIgnoreCase("")){
		mensaje = "Las existencias del producto no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(operacion.equalsIgnoreCase("correcta")){
		paisProd = request.getParameter("paisProd");
		precio = Double.parseDouble(request.getParameter("precio"));
		nomProdu = request.getParameter("nomProdu");
		marca = request.getParameter("marca");
		modelo = request.getParameter("modelo");
		especific = request.getParameter("especific");
		existencias = Integer.parseInt(request.getParameter("existencias"));
		id_departamento = Integer.parseInt(request.getParameter("id_departamento"));
		Producto producto = new Producto(id_producto, nomProdu, paisProd, precio, marca, modelo, especific, existencias, id_departamento);
		controladorBD.insertarProducto(producto);
		mensaje = "Operacion realizada exitosamente";
	}
}

//Alta de Pedido
if(request.getParameter("tipo").equalsIgnoreCase("altaPedido")){
	id_pedido = controladorBD.calcularIdPedido()+1;
	if(request.getParameter("fechaRealizada").equalsIgnoreCase("")){
		mensaje = "La fecha ralizada del pedido no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("fechaEntrePrev").equalsIgnoreCase("")){
		mensaje = "La fecha entrega prevista del pedido no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("monto").equalsIgnoreCase("")){
		mensaje = "El monto del pedido no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("fechaDespachada").equalsIgnoreCase("")){
		mensaje = "Fecha despachada no puede estar vacia, repita la operacion";
		operacion = "incorrecta";
	}
	else if(request.getParameter("estadoPedido").equalsIgnoreCase("Entregado") || request.getParameter("estadoPedido").equalsIgnoreCase("Entregado con Retraso")){
		if(request.getParameter("fechaEntregada").equalsIgnoreCase("")){
			mensaje = "En pedidos entregados no puede haber fechas vacías, repita la operacion";
			operacion = "incorrecta";
		}else if(operacion.equalsIgnoreCase("correcta")){
			fechaRealizada = request.getParameter("fechaRealizada");
			fechaEntrePrev = request.getParameter("fechaEntrePrev");
			fechaDespachada = request.getParameter("fechaDespachada");
			fechaEntregada = request.getParameter("fechaEntregada");
			estadoPedido = request.getParameter("estadoPedido");
			review = request.getParameter("review");
			monto = Double.parseDouble(request.getParameter("monto"));
			if(request.getParameter("gastos").isEmpty()){
				gastos = 0;
			}else{
				gastos = Double.parseDouble(request.getParameter("gastos"));
			}
			
			id_producto = Integer.parseInt(request.getParameter("id_producto"));
			id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
			Pedido pedido = new Pedido(id_pedido, fechaRealizada, fechaEntrePrev, fechaDespachada, fechaEntregada, estadoPedido, review, monto, gastos, id_cliente);
			controladorBD.insertarPedido(pedido, id_producto);
			mensaje = "Operacion realizada exitosamente";
			
		}
	}else if(request.getParameter("estadoPedido").equalsIgnoreCase("En Camino") || request.getParameter("estadoPedido").equalsIgnoreCase("En Reparto") || request.getParameter("estadoPedido").equalsIgnoreCase("Producto Perdido")){
		if(!request.getParameter("fechaEntregada").equalsIgnoreCase("")){
			mensaje = "En pedidos en camino no puede haber fecha entregada, repita la operacion";
			operacion = "incorrecta";
		}else if(operacion.equalsIgnoreCase("correcta")){
			fechaRealizada = request.getParameter("fechaRealizada");
			fechaEntrePrev = request.getParameter("fechaEntrePrev");
			fechaDespachada = request.getParameter("fechaDespachada");
			fechaEntregada = request.getParameter("fechaEntregada");
			estadoPedido = request.getParameter("estadoPedido");
			review = request.getParameter("review");
			monto = Double.parseDouble(request.getParameter("monto"));
			if(request.getParameter("gastos").isEmpty()){
				gastos = 0;
			}else{
				gastos = Double.parseDouble(request.getParameter("gastos"));
			}
			id_producto = Integer.parseInt(request.getParameter("id_producto"));
			id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
			Pedido pedido = new Pedido(id_pedido, fechaRealizada, fechaEntrePrev, fechaDespachada, fechaEntregada, estadoPedido, review, monto, gastos, id_cliente);
			controladorBD.insertarPedido(pedido, id_producto);
			mensaje = "Operacion realizada exitosamente";
			
		}
	}
}

//Alta de Servicio-Postventa
if(request.getParameter("tipo").equalsIgnoreCase("altaServc")){
	id_servicio = controladorBD.calcularIdServicio()+1;
	tipoServ = request.getParameter("tipoServ");
	estadoServ = request.getParameter("estadoServ");
	dniEmpleado = request.getParameter("dniEmple");
	id_pedido = Integer.parseInt(request.getParameter("id_pedido"));
	Servicio_Postventa servPost = new Servicio_Postventa(id_servicio, id_pedido, dniEmpleado, tipoServ, estadoServ);
	controladorBD.insertarServPost(servPost);
	mensaje = "Operacion realizada exitosamente";
}

//Baja amazon
if(request.getParameter("tipo").equalsIgnoreCase("bajaAmazon")){
	id_amazon_registro = Integer.parseInt(request.getParameter("id_amazon"));
	controladorBD.bajaAmazon(id_amazon_registro);
	mensaje = "Operacion realizada exitosamente";
}

//Baja proveedor
if(request.getParameter("tipo").equalsIgnoreCase("bajaProveedor")){
	id_proveedor = Integer.parseInt(request.getParameter("id_proveedor"));
	controladorBD.bajaProveedor(id_proveedor);
	mensaje = "Operacion realizada exitosamente";
}

//Baja empleado
if(request.getParameter("tipo").equalsIgnoreCase("bajaEmpleado")){
	dniEmpleado = request.getParameter("dniEmpleado");
	controladorBD.bajaEmpleado(dniEmpleado); 
	mensaje = "Operacion realizada exitosamente";
}

//Baja almacen
if(request.getParameter("tipo").equalsIgnoreCase("bajaAlmacen")){
	id_almacen = Integer.parseInt(request.getParameter("id_almacen"));
	controladorBD.bajaAlmacen(id_almacen); 
	mensaje = "Operacion realizada exitosamente";
}

//Baja seccion
if(request.getParameter("tipo").equalsIgnoreCase("bajaSeccion")){
	id_seccion = Integer.parseInt(request.getParameter("id_seccion"));
	controladorBD.bajaSeccion(id_seccion); 
	mensaje = "Operacion realizada exitosamente";
}

//Baja departamento
if(request.getParameter("tipo").equalsIgnoreCase("bajaDepartamento")){
	id_departamento = Integer.parseInt(request.getParameter("id_departamento"));
	controladorBD.bajaDepartamento(id_departamento); 
	mensaje = "Operacion realizada exitosamente";
}

//Baja producto
if(request.getParameter("tipo").equalsIgnoreCase("bajaProducto")){
	id_producto = Integer.parseInt(request.getParameter("id_producto"));
	controladorBD.bajaProducto(id_producto); 
	mensaje = "Operacion realizada exitosamente";
}

//Baja cliente
if(request.getParameter("tipo").equalsIgnoreCase("bajaCliente")){
	id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
	controladorBD.bajaCliente(id_cliente); 
	mensaje = "Operacion realizada exitosamente";
}

//Baja pedido
if(request.getParameter("tipo").equalsIgnoreCase("bajaPedido")){
	id_pedido = Integer.parseInt(request.getParameter("id_pedido"));
	controladorBD.bajaPedido(id_pedido); 
	mensaje = "Operacion realizada exitosamente";
}

//Baja servicio-postventa
if(request.getParameter("tipo").equalsIgnoreCase("bajaServicio")){
	id_servicio = Integer.parseInt(request.getParameter("id_servicio"));
	controladorBD.bajaServicio(id_servicio); 
	mensaje = "Operacion realizada exitosamente";
}

//Modificacion amazon
if(request.getParameter("tipo").equalsIgnoreCase("modAmazon")){
	if(request.getParameter("pais").equalsIgnoreCase("")){
		mensaje = "El pais del amazon no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(operacion.equalsIgnoreCase("correcta")){
		paisAmazon = request.getParameter("pais");
		id_amazon_registro = Integer.parseInt(request.getParameter("id_amazon"));
		Amazon amazon = new Amazon(id_amazon_registro, paisAmazon);
		controladorBD.modAmazon(amazon);
		mensaje = "Operacion realizada exitosamente";
	}
}

//Modificacion proveedor
if(request.getParameter("tipo").equalsIgnoreCase("modProveedor")){
	if(request.getParameter("nombreProveedor").equalsIgnoreCase("")){
		mensaje = "El nombre del proveedor no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("direccionProveedor").equalsIgnoreCase("")){
		mensaje = "La direccion del proveedor no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("tlfProveedor").equalsIgnoreCase("")){
		mensaje = "El tlf del proveedor no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("correoProveedor").equalsIgnoreCase("")){
		mensaje = "El correo del proveedor no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(operacion.equalsIgnoreCase("correcta")){
		nombreProveedor = request.getParameter("nombreProveedor");
		direccionProveedor = request.getParameter("direccionProveedor");
		tlfProveedor = request.getParameter("tlfProveedor");
		correoProveedor = request.getParameter("correoProveedor");
		id_amazon_registro = Integer.parseInt(request.getParameter("id_amazon"));
		id_proveedor = Integer.parseInt(request.getParameter("id_proveedor"));
		Proveedor proveedor = new Proveedor(id_proveedor, nombreProveedor, direccionProveedor, tlfProveedor, correoProveedor);
		controladorBD.modProveedor(proveedor);
		mensaje = "Operacion realizada exitosamente";
	}
}

//Modificacion empleado
if(request.getParameter("tipo").equalsIgnoreCase("modEmple")){
	if(controladorBD.existeEmpleado(request.getParameter("dniEmpleado")) == true){
		mensaje = "El dni del empleado ya existe, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("dniEmpleado").equalsIgnoreCase("")){
		mensaje = "El dni del empleado no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("nombreEmpleado").equalsIgnoreCase("")){
		mensaje = "El nombre del empleado no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("apellidoEmpleado").equalsIgnoreCase("")){
		mensaje = "El apellido del empleado no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("direccionEmpleado").equalsIgnoreCase("")){
		mensaje = "La direccion del empleado no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("tlfEmpleado").equalsIgnoreCase("")){
		mensaje = "El tlf del empleado no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(operacion.equalsIgnoreCase("correcta")){
		dniEmpleado = request.getParameter("dniEmpleado");
		nomEmple = request.getParameter("nombreEmpleado");
		apeEmple = request.getParameter("apellidoEmpleado");
		direcEmple = request.getParameter("direccionEmpleado");
		tlfEmple = request.getParameter("tlfEmpleado");
		id_amazon_registro = Integer.parseInt(request.getParameter("id_amazon"));
		Empleado empleado = new Empleado (dniEmpleado, nomEmple, apeEmple,direcEmple, tlfEmple, id_amazon_registro);
		id_seccion = Integer.parseInt(request.getParameter("id_seccion"));
		controladorBD.modEmpleado(empleado, id_seccion);
		mensaje = "Operacion realizada exitosamente";
	}
}

//Modificacion almacen
if(request.getParameter("tipo").equalsIgnoreCase("modAlmacen")){
	if(request.getParameter("provinciaAlmacen").equalsIgnoreCase("")){
		mensaje = "La provincia del almacen no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("localidadAlmacen").equalsIgnoreCase("")){
		mensaje = "La localidad del almacen no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(operacion.equalsIgnoreCase("correcta")){
		provinciaAlmacen = request.getParameter("provinciaAlmacen");
		localidadAlmacen = request.getParameter("localidadAlmacen");
		id_amazon_registro = Integer.parseInt(request.getParameter("id_amazon"));
		id_almacen = Integer.parseInt(request.getParameter("id_almacen"));
		Almacen almacen = new Almacen(id_almacen, provinciaAlmacen, localidadAlmacen, id_amazon_registro);
		controladorBD.modAlmacen(almacen);
		mensaje = "Operacion realizada exitosamente";
	}
}

//Modificacion seccion
if(request.getParameter("tipo").equalsIgnoreCase("modSeccion")){
	if(request.getParameter("nombreSeccion").equalsIgnoreCase("")){
		mensaje = "El nombre de la secccion no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(controladorBD.existeSeccion(request.getParameter("nombreSeccion")) == true){
		mensaje = "La seccion ya existe, repita la operacion";
		operacion = "incorrecta";
	}else if(operacion.equalsIgnoreCase("correcta")){
		nombreSeccion = request.getParameter("nombreSeccion");
		id_seccion = Integer.parseInt(request.getParameter("id_seccion"));
		Seccion seccion = new Seccion(id_seccion, nombreSeccion);
		controladorBD.modSeccion(seccion);
		mensaje = "Operacion realizada exitosamente";
	}
}

//Modificacion departamento
if(request.getParameter("tipo").equalsIgnoreCase("modDepart")){
	if(request.getParameter("nomDepart").equalsIgnoreCase("")){
		mensaje = "El nombre del departamento no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(controladorBD.existeDepart(request.getParameter("nomDepart")) == true){
		mensaje = "El nombre del departamento ya existe, repita la operacion";
		operacion = "incorrecta";
	}else if(operacion.equalsIgnoreCase("correcta")){
		nomDepart = request.getParameter("nomDepart");
		id_departamento = Integer.parseInt(request.getParameter("id_departamento"));
		Departamento depart = new Departamento(id_departamento, nomDepart);
		id_almacen = Integer.parseInt(request.getParameter("id_almacen"));
		controladorBD.modDepart(depart, id_almacen);
		mensaje = "Operacion realizada exitosamente";
	}
}

//Modificacion producto
if(request.getParameter("tipo").equalsIgnoreCase("modProduct")){
	if(request.getParameter("paisProd").equalsIgnoreCase("")){
		mensaje = "El pais del producto no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("precio").equalsIgnoreCase("")){
		mensaje = "El precio del producto no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("nomProdu").equalsIgnoreCase("")){
		mensaje = "El nombre del producto no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("marca").equalsIgnoreCase("")){
		mensaje = "La marca del producto no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("modelo").equalsIgnoreCase("")){
		mensaje = "El modelo del producto no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("especific").equalsIgnoreCase("")){
		mensaje = "Las especificaciones del producto no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("existencias").equalsIgnoreCase("")){
		mensaje = "Las existencias del producto no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(operacion.equalsIgnoreCase("correcta")){
		paisProd = request.getParameter("paisProd");
		precio = Double.parseDouble(request.getParameter("precio"));
		nomProdu = request.getParameter("nomProdu");
		marca = request.getParameter("marca");
		modelo = request.getParameter("modelo");
		especific = request.getParameter("especific");
		existencias = Integer.parseInt(request.getParameter("existencias"));
		id_producto = Integer.parseInt(request.getParameter("id_producto"));
		id_departamento = Integer.parseInt(request.getParameter("id_departamento"));
		Producto producto = new Producto(id_producto, nomProdu, paisProd, precio, marca, modelo, especific, existencias, id_departamento);
		controladorBD.modProducto(producto);
		mensaje = "Operacion realizada exitosamente";
	}
}

//Modificacion cliente
if(request.getParameter("tipo").equalsIgnoreCase("modCliente")){
	if(request.getParameter("nomClien").equalsIgnoreCase("")){
		mensaje = "El nombre del cliente no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("apeClien").equalsIgnoreCase("")){
		mensaje = "El apellido del cliente no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("tlfClien").equalsIgnoreCase("")){
		mensaje = "El telefono del cliente no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if((request.getParameter("duracionSuscrip").equalsIgnoreCase("") && request.getParameter("tipoSuscripcion").equalsIgnoreCase("Prime")) || (request.getParameter("duracionSuscrip").equalsIgnoreCase("null") && request.getParameter("tipoSuscripcion").equalsIgnoreCase("Prime"))){
		mensaje = "La duracion de suscripcion con prime del cliente no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(!request.getParameter("duracionSuscrip").isEmpty() && request.getParameter("tipoSuscripcion").equalsIgnoreCase("Basica")){
		mensaje = "La duracion de suscripcion tiene que estar vacia con basica, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("direcClien").equalsIgnoreCase("")){
		mensaje = "La direccion del cliente no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("correoClien").equalsIgnoreCase("")){
		mensaje = "El correo del cliente no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(operacion.equalsIgnoreCase("correcta")){
		nombreCliente = request.getParameter("nomClien");
		apellidoCliente = request.getParameter("apeClien");
		tlfCliente = request.getParameter("tlfClien");
		durSuscripcion = request.getParameter("duracionSuscrip");
		tipoSuscripcion = request.getParameter("tipoSuscripcion");
		direccionCliente = request.getParameter("direcClien");
		correoCliente = request.getParameter("correoClien");
		id_amazon_registro = Integer.parseInt(request.getParameter("id_amazon"));
		id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
		Cliente cliente = new Cliente(id_cliente, direccionCliente, nombreCliente, apellidoCliente, correoCliente, tlfCliente, tipoSuscripcion, durSuscripcion, id_amazon_registro);
		controladorBD.modCliente(cliente);
		mensaje = "Operacion realizada exitosamente";
	}
}

//Modificacion pedido
if(request.getParameter("tipo").equalsIgnoreCase("modPedido")){
	id_pedido = Integer.parseInt(request.getParameter("id_pedido"));
	id_cliente = Integer.parseInt(request.getParameter("id_cliente"));
	if(request.getParameter("fechaRealizada").equalsIgnoreCase("")){
		mensaje = "La fecha ralizada del pedido no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("fechaEntrePrev").equalsIgnoreCase("")){
		mensaje = "La fecha entrega prevista del pedido no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("monto").equalsIgnoreCase("")){
		mensaje = "El monto del pedido no puede estar vacio, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("fechaDespachada").equalsIgnoreCase("")){
		mensaje = "Fecha despachada no puede estar vacia, repita la operacion";
		operacion = "incorrecta";
	}else if(request.getParameter("estadoPedido").equalsIgnoreCase("Entregado") || request.getParameter("estadoPedido").equalsIgnoreCase("Entregado con Retraso")){
		if(request.getParameter("fechaEntregada").equalsIgnoreCase("")){
			mensaje = "En pedidos entregados no puede haber fechas vacías, repita la operacion";
			operacion = "incorrecta";
		}else if(operacion.equalsIgnoreCase("correcta")){
			fechaRealizada = request.getParameter("fechaRealizada");
			fechaEntrePrev = request.getParameter("fechaEntrePrev");
			fechaDespachada = request.getParameter("fechaDespachada");
			fechaEntregada = request.getParameter("fechaEntregada");
			estadoPedido = request.getParameter("estadoPedido");
			review = request.getParameter("review");
			monto = Double.parseDouble(request.getParameter("monto"));
			if(request.getParameter("gastos").isEmpty()){
				gastos = 0;
			}else{
				gastos = Double.parseDouble(request.getParameter("gastos"));
			}
			Pedido pedido = new Pedido(id_pedido, fechaRealizada, fechaEntrePrev, fechaDespachada, fechaEntregada, estadoPedido, review, monto, gastos, id_cliente);
			controladorBD.modPedido(pedido);
			mensaje = "Operacion realizada exitosamente";
			
		}
	}else if(request.getParameter("estadoPedido").equalsIgnoreCase("En Camino") || request.getParameter("estadoPedido").equalsIgnoreCase("En Reparto") || request.getParameter("estadoPedido").equalsIgnoreCase("Producto Perdido")){
		if(!request.getParameter("fechaEntregada").equalsIgnoreCase("")){
			mensaje = "En pedidos en camino no puede haber fecha entregada, repita la operacion";
			operacion = "incorrecta";
		}else if(operacion.equalsIgnoreCase("correcta")){
			fechaRealizada = request.getParameter("fechaRealizada");
			fechaEntrePrev = request.getParameter("fechaEntrePrev");
			fechaDespachada = request.getParameter("fechaDespachada");
			fechaEntregada = request.getParameter("fechaEntregada");
			estadoPedido = request.getParameter("estadoPedido");
			review = request.getParameter("review");
			monto = Double.parseDouble(request.getParameter("monto"));
			if(request.getParameter("gastos").isEmpty()){
				gastos = 0;
			}else{
				gastos = Double.parseDouble(request.getParameter("gastos"));
			}
			Pedido pedido = new Pedido(id_pedido, fechaRealizada, fechaEntrePrev, fechaDespachada, fechaEntregada, estadoPedido, review, monto, gastos, id_cliente);
			controladorBD.modPedido(pedido);
			mensaje = "Operacion realizada exitosamente";
			
		}
	}
}

//Modificacion servicio
if(request.getParameter("tipo").equalsIgnoreCase("modServ")){
	id_servicio = Integer.parseInt(request.getParameter("id_servicio"));
	tipoServ = request.getParameter("tipoServ");
	estadoServ = request.getParameter("estadoServ");
	dniEmpleado = request.getParameter("dniEmple");
	id_pedido = Integer.parseInt(request.getParameter("id_pedido"));
	Servicio_Postventa servPost = new Servicio_Postventa(id_servicio, id_pedido, dniEmpleado, tipoServ, estadoServ);
	controladorBD.modServ(servPost);
	mensaje = "Operacion realizada exitosamente";
}
%>

	<section class="wrapper style1" style="height: 500px;">
		<div class="container">
			<div id="content">

				<!-- Content -->

				<article>

					<section class="col-6 col-12-narrower">
						<h3 align="center"><%= mensaje %></h3>

					</section>
				</article>
			</div>
		</div>
	</section>

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
			<a href="inicioAdmin.jsp">Acceso Administrador</a>
		</div>
	</footer>

</body>
</html>
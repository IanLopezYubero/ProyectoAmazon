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
<link rel="stylesheet" type="text/css" href="recursos/css/registro.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<title>Registro Cliente</title>
</head>
<body>
	<%
		String id_amazon = request.getParameter("id_amazon");
		BDController controladorBD = new BDController();
		ArrayList<Amazon> amazons = controladorBD.dameAmazons();
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
						href="amazonMain.jsp?id_amazon=<%=id_amazon%>">Inicio <span
						class="sr-only">(current)</span></a> <a class="nav-item nav-link aNav"
						id="color" href="pedidos.jsp?id_amazon=<%=id_amazon%>">Pedidos</a>
					<a class="nav-item nav-link aNav" id="color"
						href="registro.jsp?id_amazon=<%=id_amazon%>">Registrarte</a> <a
						class="nav-item nav-link aNav" id="color" href="#"><img
						src="recursos/images/logo/shopping-cart.png" width="50"
						height="50"></a>

				</div>
			</div>
		</nav>
	</div>
	<form action="operaciones.jsp?tipo=registroCliente" method="post">
		<div class="container register-form">
			<div class="form">
				<div class="note">
					<p>Registrar Nuevo Cliente de Amazon</p>
				</div>

				<div class="form-content">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" name="nombreCliente"
									id="nombreCliente" placeholder="Nombre" value="" required />
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="apellidoCliente"
									id="apellidoCliente" placeholder="Apellidos" value="" />
							</div>
							<div class="form-group">
								<input type="number" class="form-control" name="tlfCliente"
									id="tlfCliente" placeholder="Teléfono" value="" />
							</div>
							<div class="form-group">
								<input type="email" class="form-control" name="correoCliente"
									id="correoCliente" placeholder="Correo Electrónico" value="" />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control" name="direccionCliente"
									id="direccionCliente" placeholder="Dirección" value="" />
							</div>
							<div class="form-group">
								<input type="text"
									pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))"
									class="form-control" name="durSuscripcion" id="durSuscripcion"
									placeholder="AAAA-MM-DD" value="" />
							</div>

							<div class="form-group">
								<label for="select" class="col-12 col-form-label">Tipo
									Suscripción</label>
								<div class="col-12">
									<select id="select" name="tipoSuscripcion"
										class="custom-select">

										<option value="Basica">Basica</option>
										<option value="Prime">Prime</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label for="select" class="col-4 col-form-label">Amazon
									Perteneciente</label>
								<div class="col-8">
									<select id="select" name="id_amazon" class="custom-select">
										<%
											for (int i = 0; i < amazons.size(); i++) {
										%>
										<option value="<%=amazons.get(i).getId_amazon()%>">
											<%=amazons.get(i).getPais()%></option>
										<%
											}
										%>
									</select>
								</div>

							</div>
						</div>
					</div>
					<button type="submit" class="btnSubmit">Registrar</button>
				</div>
			</div>
		</div>
	</form>

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
	<script type="text/javascript">
		$('.dropdown-menu a').click(function() {
			$('#selected').text($(this).text());
		});
	</script>

</body>
</html>
package amazon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Clase que controla la base de datos con métodos
 * 
 * @author Ian Lopez
 * @version 19/05/2020
 */

/**
 * En esta como en todas las páginas .jsp, he indentado, tabulado y creado
 * espacios para mejorar la legibilidad para futuros programadores No tener el
 * código muy pegado, no dejar lineas muy largas y en vez haciendo un simple
 * enter, y continuar en la siguiente línea mejora mucho a la vista.
 */
public class BDController {
	private Connection conexion;

	/**
	 * Constructor vacio del controlador de la base de datos
	 * 
	 * @param
	 */
	public BDController() {
		super();
		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			this.conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/amazon", "root", "");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en el constructor vacio del BDController");
			e.printStackTrace();
		}
	}

	/**
	 * Método para recibir la conexion
	 * 
	 * @param
	 */
	public Connection getConexion() {
		return conexion;
	}

	/**
	 * Método para realizar la conexion con la base de datos
	 * 
	 * @param
	 */
	public void setConexion(Connection conexion) {
		this.conexion = conexion;
	}

	/**
	 * Método para insertar nueva seccion en la base de datos
	 * 
	 * @param seccion
	 */
	public void insertarSeccion(Seccion seccion) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("INSERT INTO secciones VALUES (" + seccion.getId_seccion() + ", '"
					+ seccion.getNombreSeccion() + "')");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarSeccion");
			e.printStackTrace();
		}
	}

	/**
	 * Método para insertar nuevo empleado en la base de datos
	 * 
	 * @param empleado, id_seccion
	 */
	public void insertarEmpleado(Empleado empleado, int id_seccion) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("INSERT INTO empleados VALUES ('" + empleado.getDni() + "', '"
					+ empleado.getNombreEmpleado() + "', '" + empleado.getApellidoEmpleado() + "', '"
					+ empleado.getDireccion() + "', '" + empleado.getTlf() + "', " + empleado.getId_amazon() + ")");
			miStatement.executeUpdate("INSERT INTO pertenece VALUES ('" + empleado.getDni() + "', " + id_seccion + ")");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarEmpleado");
			e.printStackTrace();
		}
	}

	/**
	 * Método para insertar nuevo servicio postventa en la base de datos
	 * 
	 * @param servPost
	 */
	public void insertarServPost(Servicio_Postventa servPost) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("INSERT INTO servicios_postventa VALUES (" + servPost.getId_servicio() + ", "
					+ servPost.getId_pedido() + ", '" + servPost.getTipoServicio() + "', '" + servPost.getEstadoCaso()
					+ "', '" + servPost.getDni() + "')");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarServPost");
			e.printStackTrace();
		}
	}

	/**
	 * Método para insertar nuevo producto en la base de datos
	 * 
	 * @param producto
	 */
	public void insertarProducto(Producto producto) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("INSERT INTO productos VALUES (" + producto.getId_producto() + ", '"
					+ producto.getPaisProduccion() + "', " + producto.getPrecio() + ", '" + producto.getNombreProducto()
					+ "', '" + producto.getMarca() + "', '" + producto.getModelo() + "', '"
					+ producto.getEspecificaciones() + "', " + producto.getExistencias() + ", "
					+ producto.getId_departamento() + ")");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarProducto");
			e.printStackTrace();
		}
	}

	/**
	 * Método para insertar nuevo pedido a la base de datos
	 * 
	 * @param pedido, id_producto
	 */
	public void insertarPedido(Pedido pedido, int id_producto) {
		try {
			Statement miStatement = this.conexion.createStatement();
			if (pedido.getFechaEntregada().isEmpty()) {
				if (pedido.getReview().isEmpty()) {
					if (pedido.getGastosEnvio() == 0) {
						miStatement.executeUpdate("INSERT INTO pedidos VALUES (" + pedido.getId_pedido() + ", '"
								+ pedido.getFechaRealizada() + "', '" + pedido.getFechaEntregaPrevista() + "', '"
								+ pedido.getFechaDespachada() + "', null , '" + pedido.getEstadoPedido() + "', null , "
								+ pedido.getMonto() + ", null , " + pedido.getId_cliente() + ")");
					}
					miStatement.executeUpdate("INSERT INTO pedidos VALUES (" + pedido.getId_pedido() + ", '"
							+ pedido.getFechaRealizada() + "', '" + pedido.getFechaEntregaPrevista() + "', '"
							+ pedido.getFechaDespachada() + "', null , '" + pedido.getEstadoPedido() + "', null , "
							+ pedido.getMonto() + ", " + pedido.getGastosEnvio() + ", " + pedido.getId_cliente() + ")");
				}
				miStatement.executeUpdate("INSERT INTO pedidos VALUES (" + pedido.getId_pedido() + ", '"
						+ pedido.getFechaRealizada() + "', '" + pedido.getFechaEntregaPrevista() + "', '"
						+ pedido.getFechaDespachada() + "', null , '" + pedido.getEstadoPedido() + "', '"
						+ pedido.getReview() + "', " + pedido.getMonto() + ", " + pedido.getGastosEnvio() + ", "
						+ pedido.getId_cliente() + ")");
			} else {
				miStatement.executeUpdate("INSERT INTO pedidos VALUES (" + pedido.getId_pedido() + ", '"
						+ pedido.getFechaRealizada() + "', '" + pedido.getFechaEntregaPrevista() + "', '"
						+ pedido.getFechaDespachada() + "', '" + pedido.getFechaEntregada() + "', '"
						+ pedido.getEstadoPedido() + "', '" + pedido.getReview() + "', " + pedido.getMonto() + ", "
						+ pedido.getGastosEnvio() + ", " + pedido.getId_cliente() + ")");
			}
			miStatement.executeUpdate("INSERT INTO esta VALUES (" + pedido.getId_pedido() + ", " + id_producto + ")");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarPedido");
			e.printStackTrace();
		}
	}

	/**
	 * Método para insertar nuevo departamento en la base de datos
	 * 
	 * @param departamento, id_almacen
	 */
	public void insertarDepartamento(Departamento departamento, int id_almacen) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("INSERT INTO departamentos VALUES (" + departamento.getId_departamento() + ", '"
					+ departamento.getNombreDepartamento() + "')");
			miStatement.executeUpdate(
					"INSERT INTO tiene VALUES (" + id_almacen + ", " + departamento.getId_departamento() + ")");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarDepartamento");
			e.printStackTrace();
		}
	}

	/**
	 * Método para insertar nuevo almacen en la base de datos
	 * 
	 * @param almacen, id_departamento
	 */
	public void insertarAlmacen(Almacen almacen, int id_departamento) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("INSERT INTO almacenes VALUES (" + almacen.getId_almacen() + ", '"
					+ almacen.getProvincia() + "', '" + almacen.getLocalidad() + "', " + almacen.getId_amazon() + ")");
			miStatement.executeUpdate(
					"INSERT INTO tiene VALUES (" + almacen.getId_almacen() + ", " + id_departamento + ")");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarAlmacen");
			e.printStackTrace();
		}
	}

	/**
	 * Método para insertar un nuevo proveedor a la base de datos
	 * 
	 * @param proveedor, id_amazon
	 */
	public void insertarProveedor(Proveedor proveedor, int id_amazon) {
		String cadena = "INSERT INTO proveedores VALUES (" + proveedor.getId_proveedor() + ", '"
				+ proveedor.getNombreProveedor() + "', '" + proveedor.getDireccion() + "', '" + proveedor.getTlf()
				+ "', '" + proveedor.getCorreoProveedor() + "')";
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate(cadena);
			miStatement.executeUpdate(
					"INSERT INTO contratos VALUES (" + id_amazon + ", " + proveedor.getId_proveedor() + ")");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarProveedor " + cadena);
			e.printStackTrace();
		}
	}

	/**
	 * Método para insertar nuevo amazon en la base de datos
	 * 
	 * @param amazon
	 */
	public void insertarAmazon(Amazon amazon) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate(
					"INSERT INTO amazon VALUES (" + amazon.getId_amazon() + ", '" + amazon.getPais() + "')");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarAmazon");
			e.printStackTrace();
		}
	}

	/**
	 * Método para insertar un nuevo cliente a la base de datos
	 * 
	 * @param cliente
	 */
	public void insertarCliente(Cliente cliente) {
		try {
			Statement miStatement = this.conexion.createStatement();
			if (cliente.getDuracionSuscripcion().isEmpty()) {
				miStatement.executeUpdate("INSERT INTO clientes VALUES (" + cliente.getId_cliente() + ", '"
						+ cliente.getNombreCliente() + "', '" + cliente.getApellidoCliente() + "', '"
						+ cliente.getDireccion() + "', '" + cliente.getCorreoCliente() + "', '" + cliente.getTlf()
						+ "', '" + cliente.getTipoSuscripcion() + "', null , " + cliente.getId_amazon() + ")");
			} else {
				miStatement.executeUpdate("INSERT INTO clientes VALUES (" + cliente.getId_cliente() + ", '"
						+ cliente.getNombreCliente() + "', '" + cliente.getApellidoCliente() + "', '"
						+ cliente.getDireccion() + "', '" + cliente.getCorreoCliente() + "', '" + cliente.getTlf()
						+ "', '" + cliente.getTipoSuscripcion() + "', '" + cliente.getDuracionSuscripcion() + "', "
						+ cliente.getId_amazon() + ")");
			}

			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en insertarCliente");
			e.printStackTrace();
		}
	}

	/**
	 * Método para validar dni del empleado
	 * 
	 * @param dni
	 * @return boolean
	 */
	public boolean existeEmpleado(String dni) {
		boolean existe = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT dni FROM empleados WHERE dni = " + dni);
			if (rs.first()) {
				existe = true;
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en metodo existeEmpleado");
			e.printStackTrace();
		}
		return existe;
	}

	/**
	 * Método para calcular el identificador maximo de servicios
	 * 
	 * @param
	 * @return int id_servicio
	 */
	public int calcularIdServicio() {
		int id_servicio = 1;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(id_servicio) FROM servicios_postventa");
			if (rs.first() == true) {
				id_servicio = rs.getInt(1);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en metodo calcularIdServicio");
			e.printStackTrace();
		}
		return id_servicio;
	}

	/**
	 * Método para calcular el identificador maximo de pedidos
	 * 
	 * @param
	 * @return int id_pedido
	 */
	public int calcularIdPedido() {
		int id_pedido = 1;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(id_pedido) FROM pedidos");
			if (rs.first() == true) {
				id_pedido = rs.getInt(1);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en metodo calcularIdPedido");
			e.printStackTrace();
		}
		return id_pedido;
	}

	/**
	 * Método para calcular el identificador maximo de productos
	 * 
	 * @param
	 * @return int id_producto
	 */
	public int calcularIdProducto() {
		int id_producto = 1;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(id_producto) FROM productos");
			if (rs.first() == true) {
				id_producto = rs.getInt(1);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en metodo calcularIdProducto");
			e.printStackTrace();
		}
		return id_producto;
	}

	/**
	 * Método para calcular el identificador maximo de secciones
	 * 
	 * @param
	 * @return int id_seccion
	 */
	public int calcularIdSeccion() {
		int id_seccion = 1;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(id_seccion) FROM secciones");
			if (rs.first() == true) {
				id_seccion = rs.getInt(1);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en metodo calcularIdSeccion");
			e.printStackTrace();
		}
		return id_seccion;
	}

	/**
	 * Método para calcular el identificador maximo de proveedores
	 * 
	 * @param
	 * @return int id_proveedor
	 */
	public int calcularIdProveedor() {
		int id_proveedor = 1;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(id_proveedor) FROM proveedores");
			if (rs.first() == true) {
				id_proveedor = rs.getInt(1);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en metodo calcularIdProveedor");
			e.printStackTrace();
		}
		return id_proveedor;
	}

	/**
	 * Método para calcular el identificador maximo de amazons
	 * 
	 * @param
	 * @return int id_amazon
	 */
	public int calcularIdAmazon() {
		int id_amazon = 1;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(id_amazon) FROM amazon");
			if (rs.first() == true) {
				id_amazon = rs.getInt(1);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en metodo calcularIdAmazon");
			e.printStackTrace();
		}
		return id_amazon;
	}

	/**
	 * Método para calcular el identificador maximo de almacenes
	 * 
	 * @param
	 * @return int id_almacen
	 */
	public int calcularIdAlmacen() {
		int id_almacen = 1;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(id_almacen) FROM almacenes");
			if (rs.first() == true) {
				id_almacen = rs.getInt(1);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en metodo calcularIdAlmacen");
			e.printStackTrace();
		}
		return id_almacen;
	}

	/**
	 * Método calcular el identificador maximo de departamentos
	 * 
	 * @param
	 * @return int id_departamento
	 */
	public int calcularIdDepartamento() {
		int id_departamento = 1;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(id_departamento) FROM departamentos");
			if (rs.first() == true) {
				id_departamento = rs.getInt(1);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en metodo calcularIdCliente");
			e.printStackTrace();
		}
		return id_departamento;
	}

	/**
	 * Método para calcular el identificador maximo de clientes
	 * 
	 * @param
	 * @return int id_cliente
	 */
	public int calcularIdCliente() {
		int id_cliente = 1;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT MAX(id_cliente) FROM clientes");
			if (rs.first() == true) {
				id_cliente = rs.getInt(1);
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en metodo calcularIdCliente");
			e.printStackTrace();
		}
		return id_cliente;
	}

	/**
	 * Método para comprobar existencia de departamento
	 * 
	 * @param String nomDepart
	 * @return boolean
	 */
	public boolean existeDepart(String nomDepart) {
		boolean existe = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement
					.executeQuery("SELECT * FROM departamentos WHERE nombreDepartamento = '" + nomDepart + "'");
			while (rs.next()) {
				existe = true;
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeDepart");
			e.printStackTrace();
		}
		return existe;
	}

	/**
	 * Método para comprobar existencia de cliente
	 * 
	 * @param int id_cliente
	 * @return boolean
	 */
	public boolean existeCliente(int id_cliente) {
		boolean existe = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM clientes WHERE id_cliente = " + id_cliente);
			while (rs.next()) {
				existe = true;
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeCliente");
			e.printStackTrace();
		}
		return existe;
	}

	/**
	 * Método comprobar existencia seccion
	 * 
	 * @param String nombreSeccion
	 * @return boolean
	 */
	public boolean existeSeccion(String nombreSeccion) {
		boolean existe = false;
		try {
			Statement miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement
					.executeQuery("SELECT * FROM secciones WHERE nombreSeccion = '" + nombreSeccion + "'");
			while (rs.next()) {
				existe = true;
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en existeSeccion");
			e.printStackTrace();
		}
		return existe;
	}

	/**
	 * Método devuelve listado de almacenes
	 * 
	 * @param
	 * @return ArrayList<Almacen> almacenes
	 */
	public ArrayList<Almacen> dameAlmacenes() {
		ArrayList<Almacen> almacenes = new ArrayList<Almacen>();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM almacenes");
			while (rs.next()) {
				almacenes.add(new Almacen(rs.getInt("id_almacen"), rs.getString("provincia"), rs.getString("localidad"),
						rs.getInt("id_amazon")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en dameAlmacenes");
			e.printStackTrace();
		}
		return almacenes;
	}

	/**
	 * Método devuelve empleado de cierta seccion
	 * 
	 * @param String seccion
	 * @return ArrayList<Empleado> empleados
	 */
	public ArrayList<Empleado> dameEmpleadosSeccion(String seccion) {
		ArrayList<Empleado> empleados = new ArrayList<Empleado>();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery(
					"SELECT * FROM empleados WHERE dni IN (SELECT dniEmpleado FROM pertenece WHERE id_seccion IN (SELECT id_seccion FROM secciones WHERE nombreSeccion = '"
							+ seccion + "'));");
			while (rs.next()) {
				empleados.add(new Empleado(rs.getString("dni"), rs.getString("nombreEmpleado"),
						rs.getString("apellidosEmpleado"), rs.getString("direccion"), rs.getString("tlf"),
						rs.getInt("id_amazon")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en dameEmpleadosSeccion");
			e.printStackTrace();
		}
		return empleados;
	}

	/**
	 * Método devuelve listado de empleados
	 * 
	 * @param
	 * @return ArrayList<Empleado> empleados
	 */
	public ArrayList<Empleado> dameEmpleados() {
		ArrayList<Empleado> empleados = new ArrayList<Empleado>();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM empleados");
			while (rs.next()) {
				empleados.add(new Empleado(rs.getString("dni"), rs.getString("nombreEmpleado"),
						rs.getString("apellidosEmpleado"), rs.getString("direccion"), rs.getString("tlf"),
						rs.getInt("id_amazon")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en dameEmpleados");
			e.printStackTrace();
		}
		return empleados;
	}

	/**
	 * Método devuelve listado de departamentos
	 * 
	 * @param
	 * @return ArrayList<Departamento> departamentos
	 */
	public ArrayList<Departamento> dameDepartamentos() {
		ArrayList<Departamento> departamentos = new ArrayList<Departamento>();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM departamentos");
			while (rs.next()) {
				departamentos.add(new Departamento(rs.getInt("id_departamento"), rs.getString("nombreDepartamento")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en dameDepartamentos");
			e.printStackTrace();
		}
		return departamentos;
	}

	/**
	 * Método devuele listado de secciones
	 * 
	 * @param
	 * @return ArrayList<Seccion> secciones
	 */
	public ArrayList<Seccion> dameSecciones() {
		ArrayList<Seccion> secciones = new ArrayList<Seccion>();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM secciones");
			while (rs.next()) {
				secciones.add(new Seccion(rs.getInt("id_seccion"), rs.getString("nombreSeccion")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en dameSecciones");
			e.printStackTrace();
		}
		return secciones;
	}

	/**
	 * Método devuele listado de servicios
	 * 
	 * @param
	 * @return ArrayList<Servicio_Postventa> servicios
	 */
	public ArrayList<Servicio_Postventa> dameServicios() {
		ArrayList<Servicio_Postventa> servicios = new ArrayList<Servicio_Postventa>();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM servicios_postventa");
			while (rs.next()) {
				servicios.add(new Servicio_Postventa(rs.getInt("id_servicio"), rs.getInt("id_pedido"),
						rs.getString("dniEmpleado"), rs.getString("tipoServicio"), rs.getString("estadoServicio")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en dameServicios");
			e.printStackTrace();
		}
		return servicios;
	}

	/**
	 * Método devuelve array de clientes
	 * 
	 * @param
	 * @return ArrayList<Cliente> clientes
	 */
	public ArrayList<Cliente> dameClientes() {
		ArrayList<Cliente> clientes = new ArrayList<Cliente>();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM clientes");
			while (rs.next()) {
				clientes.add(new Cliente(rs.getInt("id_cliente"), rs.getString("direccion"),
						rs.getString("nombre_cliente"), rs.getString("apellidos_cliente"),
						rs.getString("correo_cliente"), rs.getString("tlf"), rs.getString("tipoSuscripcion"),
						rs.getString("duracion_suscripcion"), rs.getInt("id_amazon")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en dameClientes");
			e.printStackTrace();
		}
		return clientes;
	}

	/**
	 * Método devuelve array de productos
	 * 
	 * @param
	 * @return ArrayList<Producto> productos
	 */
	public ArrayList<Producto> dameProductos() {
		ArrayList<Producto> productos = new ArrayList<Producto>();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM productos");
			while (rs.next()) {
				productos.add(new Producto(rs.getInt("id_producto"), rs.getString("nombreProducto"),
						rs.getString("pais_produccion"), rs.getDouble("precio"), rs.getString("marca"),
						rs.getString("modelo"), rs.getString("especificaciones"), rs.getInt("existencias"),
						rs.getInt("id_departamento")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en dameProductos");
			e.printStackTrace();
		}
		return productos;
	}

	/**
	 * Método devuelve array de proveedores
	 * 
	 * @param
	 * @return ArrayList<Proveedor> proveedores
	 */
	public ArrayList<Proveedor> dameProveedores() {
		ArrayList<Proveedor> proveedores = new ArrayList<Proveedor>();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM proveedores");
			while (rs.next()) {
				proveedores.add(new Proveedor(rs.getInt("id_proveedor"), rs.getString("nombreProveedor"),
						rs.getString("direccionProveedor"), rs.getString("tlf"), rs.getString("correoProveedor")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en dameProductoPedido");
			e.printStackTrace();
		}
		return proveedores;
	}

	/**
	 * Método devuelve nombre del producto de un pedido especifico
	 * 
	 * @param int id_pedido
	 * @return String nombreProducto
	 */
	public String dameProductoPedido(int id_pedido) {
		String nombreProducto = "";
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery(
					"SELECT nombreProducto FROM productos WHERE id_producto in (SELECT id_producto FROM esta WHERE id_pedido ="
							+ id_pedido + ")");
			while (rs.next()) {
				nombreProducto = rs.getString("nombreProducto");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en dameProductoPedido");
			e.printStackTrace();
		}
		return nombreProducto;
	}

	/**
	 * Método devuelve arraylist de pedidos
	 * 
	 * @param
	 * @return ArrayList<Pedido> pedidos
	 */
	public ArrayList<Pedido> damePedidos() {
		ArrayList<Pedido> pedidos = new ArrayList<Pedido>();
		try {
			Statement miStatement;
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM pedidos");
			while (rs.next()) {
				pedidos.add(new Pedido(rs.getInt("id_pedido"), rs.getString("fechaRealizada"),
						rs.getString("fechaEntregaPrevista"), rs.getString("fechaDespachada"),
						rs.getString("fechaEntregada"), rs.getString("estadoPedido"), rs.getString("reviewCliente"),
						rs.getDouble("montoPedido"), rs.getDouble("gastosEnvio"), rs.getInt("id_cliente")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en damePedidos");
			e.printStackTrace();
		}

		return pedidos;
	}

	/**
	 * Método devuelve un objeto amazon que coincida con un codigo
	 * 
	 * @param int id_amazon
	 * @return amazon
	 */
	public Amazon dameAmazon(int id_amazon) {
		Amazon amazon = new Amazon();
		try {
			Statement miStatement;
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM amazon WHERE id_amazon =" + id_amazon);
			while (rs.next()) {
				amazon = new Amazon(rs.getInt("id_amazon"), rs.getString("pais"));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en controladorBD damePaisAmazon");
			e.printStackTrace();
		}
		return amazon;
	}

	/**
	 * Método devuelve todos los amazon
	 * 
	 * @param
	 * @return ArrayList<Amazon> amazons
	 */
	public ArrayList<Amazon> dameAmazons() {
		ArrayList<Amazon> amazons = new ArrayList<Amazon>();
		try {
			Statement miStatement;
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery("SELECT * FROM amazon");
			while (rs.next()) {
				amazons.add(new Amazon(rs.getInt("id_amazon"), rs.getString("pais")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en dameAmazons");
			e.printStackTrace();
		}

		return amazons;
	}

	/**
	 * Método devuelve todos los productos que pertenezcan a cierto amazon
	 * 
	 * @param int id_amazon
	 * @return ArrayList<Producto> productos
	 */
	public ArrayList<Producto> dameProductosAmazon(int id_amazon) {
		ArrayList<Producto> productos = new ArrayList<Producto>();
		Statement miStatement;
		try {
			miStatement = this.conexion.createStatement();
			ResultSet rs = miStatement.executeQuery(
					"SELECT * FROM productos WHERE id_departamento in (SELECT id_departamento FROM departamentos WHERE id_departamento in (SELECT id_departamento FROM tiene WHERE id_almacen in (SELECT id_almacen FROM almacenes WHERE id_amazon="
							+ id_amazon + ")))");
			while (rs.next()) {
				productos.add(new Producto(rs.getInt("id_producto"), rs.getString("nombreProducto"),
						rs.getString("pais_produccion"), rs.getDouble("precio"), rs.getString("marca"),
						rs.getString("modelo"), rs.getString("especificaciones"), rs.getInt("existencias"),
						rs.getInt("id_departamento")));
			}
			miStatement.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en dameProductosAmazon");
			e.printStackTrace();
		}

		return productos;
	}

	/**
	 * Método elimina amazon de la base de datos
	 * 
	 * @param int id_amazon
	 * @return
	 */
	public void bajaAmazon(int id_amazon) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("DELETE FROM amazon WHERE id_amazon = " + id_amazon + "");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en bajaAmazon");
			e.printStackTrace();
		}
	}

	/**
	 * Método elimina proveedor de la base de datos
	 * 
	 * @param int id_proveedor
	 * @return
	 */
	public void bajaProveedor(int id_proveedor) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("DELETE FROM proveedores WHERE id_proveedor = " + id_proveedor + "");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en bajaProveedor");
			e.printStackTrace();
		}
	}

	/**
	 * Método elimina empleado de la base de datos
	 * 
	 * @param String dniEmpleado
	 * @return
	 */
	public void bajaEmpleado(String dniEmpleado) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("DELETE FROM empleados WHERE dni = '" + dniEmpleado + "'");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en bajaEmpleado");
			e.printStackTrace();
		}
	}

	/**
	 * Método elimina almacen de la base de datos
	 * 
	 * @param int id_almacen
	 * @return
	 */
	public void bajaAlmacen(int id_almacen) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("DELETE FROM almacenes WHERE id_almacen = " + id_almacen + "");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en bajaAlmacen");
			e.printStackTrace();
		}
	}

	/**
	 * Método elimina seccion de la base de datos
	 * 
	 * @param int id_seccion
	 * @return
	 */
	public void bajaSeccion(int id_seccion) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("DELETE FROM secciones WHERE id_seccion = " + id_seccion + "");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en bajaSeccion");
			e.printStackTrace();
		}
	}

	/**
	 * Método elimina departamento de la base de datos
	 * 
	 * @param int id_departamento
	 * @return
	 */
	public void bajaDepartamento(int id_departamento) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("DELETE FROM departamentos WHERE id_departamento = " + id_departamento + "");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en bajaDepartamento");
			e.printStackTrace();
		}
	}

	/**
	 * Método elimina producto de la base de datos
	 * 
	 * @param int id_producto
	 * @return
	 */
	public void bajaProducto(int id_producto) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("DELETE FROM productos WHERE id_producto = " + id_producto + "");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en bajaProducto");
			e.printStackTrace();
		}
	}

	/**
	 * Método elimina cliente de la base de datos
	 * 
	 * @param int id_cliente
	 * @return
	 */
	public void bajaCliente(int id_cliente) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("DELETE FROM clientes WHERE id_cliente = " + id_cliente + "");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en bajaCliente");
			e.printStackTrace();
		}
	}

	/**
	 * Método elimina pedido de la base de datos
	 * 
	 * @param int id_pedido
	 * @return
	 */
	public void bajaPedido(int id_pedido) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("DELETE FROM pedidos WHERE id_pedido = " + id_pedido + "");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en bajaPedido");
			e.printStackTrace();
		}
	}

	/**
	 * Método elimina servicio de la base de datos
	 * 
	 * @param int id_servicio
	 * @return
	 */
	public void bajaServicio(int id_servicio) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("DELETE FROM servicios_postventa WHERE id_servicio = " + id_servicio + "");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en bajaServicio");
			e.printStackTrace();
		}
	}

	/**
	 * Método modifica amazon de la base de datos
	 * 
	 * @param Amazon amazon
	 * @return
	 */
	public void modAmazon(Amazon amazon) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("UPDATE amazon SET pais = '" + amazon.getPais() + "' WHERE id_amazon = "
					+ amazon.getId_amazon() + "");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en modAmazon");
			e.printStackTrace();
		}
	}

	/**
	 * Método modifica proveedor de la base de datos
	 * 
	 * @param Proveedor proveedor
	 * @return
	 */
	public void modProveedor(Proveedor proveedor) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("UPDATE proveedores SET nombreProveedor = '" + proveedor.getNombreProveedor()
					+ "', direccionProveedor = '" + proveedor.getDireccion() + "', tlf = '" + proveedor.getTlf()
					+ "', correoProveedor = '" + proveedor.getCorreoProveedor() + "' WHERE id_proveedor = "
					+ proveedor.getId_proveedor() + "");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en modProveedor");
			e.printStackTrace();
		}
	}

	/**
	 * Método modifica empleado de la base de datos
	 * 
	 * @param Empleado empleado, int id_seccion
	 * @return
	 */
	public void modEmpleado(Empleado empleado, int id_seccion) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("UPDATE empleados SET nombreEmpleado = '" + empleado.getNombreEmpleado()
					+ "', apellidosEmpleado = '" + empleado.getApellidoEmpleado() + "', direccion = '"
					+ empleado.getDireccion() + "', tlf = '" + empleado.getTlf() + "', id_amazon = "
					+ empleado.getId_amazon() + " WHERE dni = '" + empleado.getDni() + "'");
			miStatement.executeUpdate("UPDATE pertenece SET id_seccion = " + id_seccion + " WHERE dniEmpleado = '"
					+ empleado.getDni() + "'");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en modEmpleado");
			e.printStackTrace();
		}
	}

	/**
	 * Método modifica almacen de la base de datos
	 * 
	 * @param Almacen almacen
	 * @return
	 */
	public void modAlmacen(Almacen almacen) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("UPDATE almacenes SET provincia = '" + almacen.getProvincia() + "', localidad = '"
					+ almacen.getLocalidad() + "', id_amazon = " + almacen.getId_amazon() + " WHERE id_almacen = "
					+ almacen.getId_almacen() + "");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en modAlmacen");
			e.printStackTrace();
		}
	}

	/**
	 * Método modifica seccion de la base de datos
	 * 
	 * @param Seccion seccion
	 * @return
	 */
	public void modSeccion(Seccion seccion) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("UPDATE secciones SET nombreSeccion = '" + seccion.getNombreSeccion()
					+ "' WHERE id_seccion = " + seccion.getId_seccion() + "");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en modSeccion");
			e.printStackTrace();
		}
	}

	/**
	 * Método modifica departamento de la base de datos
	 * 
	 * @param Departamento depart, int id_almacen
	 * @return
	 */
	public void modDepart(Departamento depart, int id_almacen) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("UPDATE departamentos SET nombreDepartamento = '" + depart.getNombreDepartamento()
					+ "' WHERE id_departamento = " + depart.getId_departamento() + "");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en modDepart");
			e.printStackTrace();
		}
	}

	/**
	 * Método modifica producto de la base de datos
	 * 
	 * @param Producto producto
	 * @return
	 */
	public void modProducto(Producto producto) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("UPDATE productos SET pais_produccion = '" + producto.getPaisProduccion()
					+ "', precio = " + producto.getPrecio() + ", nombreProducto = '" + producto.getNombreProducto()
					+ "', marca = '" + producto.getMarca() + "', modelo = '" + producto.getModelo()
					+ "', especificaciones = '" + producto.getEspecificaciones() + "', existencias = "
					+ producto.getExistencias() + ", id_departamento = " + producto.getId_departamento()
					+ " WHERE id_producto = " + producto.getId_producto() + "");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en modProducto");
			e.printStackTrace();
		}
	}

	/**
	 * Método modifica cliente de la base de datos
	 * 
	 * @param Cliente cliente
	 * @return
	 */
	public void modCliente(Cliente cliente) {
		try {
			Statement miStatement = this.conexion.createStatement();
			if (cliente.getDuracionSuscripcion().isEmpty()
					|| cliente.getDuracionSuscripcion().equalsIgnoreCase("null")) {
				miStatement.executeUpdate("UPDATE clientes SET nombre_cliente = '" + cliente.getNombreCliente()
						+ "', apellidos_cliente = '" + cliente.getApellidoCliente() + "', direccion = '"
						+ cliente.getDireccion() + "', correo_cliente = '" + cliente.getCorreoCliente() + "', tlf = '"
						+ cliente.getTlf() + "', tipoSuscripcion = '" + cliente.getTipoSuscripcion()
						+ "', duracion_suscripcion = null, id_amazon = " + cliente.getId_amazon()
						+ " WHERE id_cliente = " + cliente.getId_cliente() + "");
			} else {
				miStatement.executeUpdate("UPDATE clientes SET nombre_cliente = '" + cliente.getNombreCliente()
						+ "', apellidos_cliente = '" + cliente.getApellidoCliente() + "', direccion = '"
						+ cliente.getDireccion() + "', correo_cliente = '" + cliente.getCorreoCliente() + "', tlf = '"
						+ cliente.getTlf() + "', tipoSuscripcion = '" + cliente.getTipoSuscripcion()
						+ "', duracion_suscripcion = '" + cliente.getDuracionSuscripcion() + "', id_amazon = "
						+ cliente.getId_amazon() + " WHERE id_cliente = " + cliente.getId_cliente() + "");
			}
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en modCliente");
			e.printStackTrace();
		}
	}

	/**
	 * Método modifica pedido de la base de datos
	 * 
	 * @param Pedido pedido
	 * @return
	 */
	public void modPedido(Pedido pedido) {
		System.out.println("UPDATE pedidos SET fechaRealizada = '" + pedido.getFechaRealizada()
				+ "', fechaEntregaPrevista = '" + pedido.getFechaEntregaPrevista() + "', fechaDespachada = '"
				+ pedido.getFechaDespachada() + "', fechaEntregada = '" + pedido.getFechaEntregada()
				+ "', estadoPedido = '" + pedido.getEstadoPedido() + "', reviewCliente = '" + pedido.getReview()
				+ "', montoPedido = " + pedido.getMonto() + ", gastosEnvio = " + pedido.getGastosEnvio()
				+ ", id_cliente = " + pedido.getId_cliente() + " WHERE id_pedido = " + pedido.getId_pedido() + "");
		try {
			Statement miStatement = this.conexion.createStatement();
			if (pedido.getFechaEntregada().isEmpty() || pedido.getFechaEntregada().equalsIgnoreCase("null")) {
				if (pedido.getReview().isEmpty() || pedido.getReview().equalsIgnoreCase("null")) {
					if (pedido.getGastosEnvio() == 0 || Double.toString(pedido.getGastosEnvio()).isEmpty()) {
						miStatement.executeUpdate("UPDATE pedidos SET fechaRealizada = '" + pedido.getFechaRealizada()
								+ "', fechaEntregaPrevista = '" + pedido.getFechaEntregaPrevista()
								+ "', fechaDespachada = '" + pedido.getFechaDespachada()
								+ "', fechaEntregada = null , estadoPedido = '" + pedido.getEstadoPedido()
								+ "', reviewCliente = null , montoPedido = " + pedido.getMonto()
								+ ", gastosEnvio = null , id_cliente = " + pedido.getId_cliente()
								+ " WHERE id_pedido = " + pedido.getId_pedido() + "");
					}
					miStatement.executeUpdate("UPDATE pedidos SET fechaRealizada = '" + pedido.getFechaRealizada()
							+ "', fechaEntregaPrevista = '" + pedido.getFechaEntregaPrevista()
							+ "', fechaDespachada = '" + pedido.getFechaDespachada()
							+ "', fechaEntregada = null , estadoPedido = '" + pedido.getEstadoPedido()
							+ "', reviewCliente = null , montoPedido = " + pedido.getMonto() + ", gastosEnvio = "
							+ pedido.getGastosEnvio() + ", id_cliente = " + pedido.getId_cliente()
							+ " WHERE id_pedido = " + pedido.getId_pedido() + "");
				}
				miStatement.executeUpdate("UPDATE pedidos SET fechaRealizada = '" + pedido.getFechaRealizada()
						+ "', fechaEntregaPrevista = '" + pedido.getFechaEntregaPrevista() + "', fechaDespachada = '"
						+ pedido.getFechaDespachada() + "', fechaEntregada = null , estadoPedido = '"
						+ pedido.getEstadoPedido() + "', reviewCliente = '" + pedido.getReview() + "', montoPedido = "
						+ pedido.getMonto() + ", gastosEnvio = " + pedido.getGastosEnvio() + ", id_cliente = "
						+ pedido.getId_cliente() + " WHERE id_pedido = " + pedido.getId_pedido() + "");
			} else {
				miStatement.executeUpdate("UPDATE pedidos SET fechaRealizada = '" + pedido.getFechaRealizada()
						+ "', fechaEntregaPrevista = '" + pedido.getFechaEntregaPrevista() + "', fechaDespachada = '"
						+ pedido.getFechaDespachada() + "', fechaEntregada = '" + pedido.getFechaEntregada()
						+ "', estadoPedido = '" + pedido.getEstadoPedido() + "', reviewCliente = '" + pedido.getReview()
						+ "', montoPedido = " + pedido.getMonto() + ", gastosEnvio = " + pedido.getGastosEnvio()
						+ ", id_cliente = " + pedido.getId_cliente() + " WHERE id_pedido = " + pedido.getId_pedido()
						+ "");
			}
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en modPedido");
			e.printStackTrace();
		}
	}

	/**
	 * Método modifica servicio de la base de datos
	 * 
	 * @param Servicio_Postventa servPost
	 * @return
	 */
	public void modServ(Servicio_Postventa servPost) {
		try {
			Statement miStatement = this.conexion.createStatement();
			miStatement.executeUpdate("UPDATE servicios_postventa SET id_pedido = " + servPost.getId_pedido()
					+ ", tipoServicio = '" + servPost.getTipoServicio() + "', estadoServicio = '"
					+ servPost.getEstadoCaso() + "', dniEmpleado = '" + servPost.getDni() + "' WHERE id_servicio = "
					+ servPost.getId_servicio() + "");
			miStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Error en modServ");
			e.printStackTrace();
		}
	}
}

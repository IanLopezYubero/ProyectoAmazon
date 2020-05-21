package amazon;

/**
 * Clase para usar los objetos de tipo Cliente
 * 
 * @author Ian Lopez
 * @version 19/05/2020
 */

public class Cliente {
	private int id_cliente;
	private String direccion;
	private String nombreCliente;
	private String apellidoCliente;
	private String correoCliente;
	private String tlf;
	private String tipoSuscripcion;
	private String duracionSuscripcion;
	private int id_amazon;
	
	public Cliente() {
		super();
	}

	public Cliente(int id_cliente, String direccion, String nombreCliente, String apellidoCliente, String correoCliente,
			String tlf, String tipoSuscripcion, String duracionSuscripcion, int id_amazon) {
		super();
		this.id_cliente = id_cliente;
		this.direccion = direccion;
		this.nombreCliente = nombreCliente;
		this.apellidoCliente = apellidoCliente;
		this.correoCliente = correoCliente;
		this.tlf = tlf;
		this.tipoSuscripcion = tipoSuscripcion;
		this.duracionSuscripcion = duracionSuscripcion;
		this.id_amazon = id_amazon;
	}

	public int getId_cliente() {
		return id_cliente;
	}

	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getNombreCliente() {
		return nombreCliente;
	}

	public void setNombreCliente(String nombreCliente) {
		this.nombreCliente = nombreCliente;
	}

	public String getApellidoCliente() {
		return apellidoCliente;
	}

	public void setApellidoCliente(String apellidoCliente) {
		this.apellidoCliente = apellidoCliente;
	}

	public String getCorreoCliente() {
		return correoCliente;
	}

	public void setCorreoCliente(String correoCliente) {
		this.correoCliente = correoCliente;
	}

	public String getTlf() {
		return tlf;
	}

	public void setTlf(String tlf) {
		this.tlf = tlf;
	}

	public String getTipoSuscripcion() {
		return tipoSuscripcion;
	}

	public void setTipoSuscripcion(String tipoSuscripcion) {
		this.tipoSuscripcion = tipoSuscripcion;
	}

	public String getDuracionSuscripcion() {
		return duracionSuscripcion;
	}

	public void setDuracionSuscripcion(String duracionSuscripcion) {
		this.duracionSuscripcion = duracionSuscripcion;
	}

	public int getId_amazon() {
		return id_amazon;
	}

	public void setId_amazon(int id_amazon) {
		this.id_amazon = id_amazon;
	}
	
	
}

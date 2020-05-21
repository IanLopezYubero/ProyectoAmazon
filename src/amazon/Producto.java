package amazon;

/**
 * Clase para usar los objetos de tipo Producto
 * 
 * @author Ian Lopez
 * @version 19/05/2020
 */

public class Producto {
	private int id_producto;
	private String nombreProducto;
	private String paisProduccion;
	private double precio;
	private String marca;
	private String modelo;
	private String especificaciones;
	private int existencias;
	private int id_departamento;
	
	public Producto() {
		super();
	}

	public Producto(int id_producto, String nombreProducto, String paisProduccion, double precio, String marca,
			String modelo, String especificaciones, int existencias, int id_departamento) {
		super();
		this.id_producto = id_producto;
		this.nombreProducto = nombreProducto;
		this.paisProduccion = paisProduccion;
		this.precio = precio;
		this.marca = marca;
		this.modelo = modelo;
		this.especificaciones = especificaciones;
		this.existencias = existencias;
		this.id_departamento = id_departamento;
	}

	public int getId_producto() {
		return id_producto;
	}

	public void setId_producto(int id_producto) {
		this.id_producto = id_producto;
	}

	public String getNombreProducto() {
		return nombreProducto;
	}

	public void setNombreProducto(String nombreProducto) {
		this.nombreProducto = nombreProducto;
	}

	public String getPaisProduccion() {
		return paisProduccion;
	}

	public void setPaisProduccion(String paisProduccion) {
		this.paisProduccion = paisProduccion;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public String getEspecificaciones() {
		return especificaciones;
	}

	public void setEspecificaciones(String especificaciones) {
		this.especificaciones = especificaciones;
	}

	public int getExistencias() {
		return existencias;
	}

	public void setExistencias(int existencias) {
		this.existencias = existencias;
	}

	public int getId_departamento() {
		return id_departamento;
	}

	public void setId_departamento(int id_departamento) {
		this.id_departamento = id_departamento;
	}
	
	
}

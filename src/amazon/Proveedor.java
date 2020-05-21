package amazon;

/**
 * Clase para usar los objetos de tipo Proveedor
 * 
 * @author Ian Lopez
 * @version 19/05/2020
 */

public class Proveedor {
	private int id_proveedor;
	private String nombreProveedor;
	private String direccion;
	private String tlf;
	private String correoProveedor;
	
	public Proveedor() {
		super();
	}

	public Proveedor(int id_proveedor, String nombreProveedor, String direccion, String tlf, String correoProveedor) {
		super();
		this.id_proveedor = id_proveedor;
		this.nombreProveedor = nombreProveedor;
		this.direccion = direccion;
		this.tlf = tlf;
		this.correoProveedor = correoProveedor;
	}

	public int getId_proveedor() {
		return id_proveedor;
	}

	public void setId_proveedor(int id_proveedor) {
		this.id_proveedor = id_proveedor;
	}

	public String getNombreProveedor() {
		return nombreProveedor;
	}

	public void setNombreProveedor(String nombreProveedor) {
		this.nombreProveedor = nombreProveedor;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getTlf() {
		return tlf;
	}

	public void setTlf(String tlf) {
		this.tlf = tlf;
	}

	public String getCorreoProveedor() {
		return correoProveedor;
	}

	public void setCorreoProveedor(String correoProveedor) {
		this.correoProveedor = correoProveedor;
	}
	
	
}

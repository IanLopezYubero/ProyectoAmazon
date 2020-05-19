package amazon;

public class Empleado {
	private String dni;
	private int id_amazon;
	private String direccion;
	private String tlf;
	private String nombreEmpleado;
	private String apellidoEmpleado;
	
	public Empleado() {
		super();
	}

	public Empleado(String dni, String nombreEmpleado, String apellidoEmpleado, String direccion, String tlf, int id_amazon) {
		super();
		this.dni = dni;
		this.id_amazon = id_amazon;
		this.direccion = direccion;
		this.tlf = tlf;
		this.nombreEmpleado = nombreEmpleado;
		this.apellidoEmpleado = apellidoEmpleado;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public int getId_amazon() {
		return id_amazon;
	}

	public void setId_amazon(int id_amazon) {
		this.id_amazon = id_amazon;
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

	public String getNombreEmpleado() {
		return nombreEmpleado;
	}

	public void setNombreEmpleado(String nombreEmpleado) {
		this.nombreEmpleado = nombreEmpleado;
	}

	public String getApellidoEmpleado() {
		return apellidoEmpleado;
	}

	public void setApellidoEmpleado(String apellidoEmpleado) {
		this.apellidoEmpleado = apellidoEmpleado;
	}
	
	
}

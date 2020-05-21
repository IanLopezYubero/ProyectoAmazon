package amazon;

/**
 * Clase para usar los objetos de tipo Servicio_postventa
 * 
 * @author Ian Lopez
 * @version 19/05/2020
 */

public class Servicio_Postventa {
	private int id_servicio;
	private int id_pedido;
	private String dni;
	private String tipoServicio;
	private String estadoCaso;

	public Servicio_Postventa() {
		super();
	}

	public Servicio_Postventa(int id_servicio, int id_pedido, String dni, String tipoServicio, String estadoCaso) {
		super();
		this.id_servicio = id_servicio;
		this.id_pedido = id_pedido;
		this.dni = dni;
		this.tipoServicio = tipoServicio;
		this.estadoCaso = estadoCaso;
	}

	public int getId_servicio() {
		return id_servicio;
	}

	public void setId_servicio(int id_servicio) {
		this.id_servicio = id_servicio;
	}

	public int getId_pedido() {
		return id_pedido;
	}

	public void setId_pedido(int id_pedido) {
		this.id_pedido = id_pedido;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getTipoServicio() {
		return tipoServicio;
	}

	public void setTipoServicio(String tipoServicio) {
		this.tipoServicio = tipoServicio;
	}

	public String getEstadoCaso() {
		return estadoCaso;
	}

	public void setEstadoCaso(String estadoCaso) {
		this.estadoCaso = estadoCaso;
	}

}

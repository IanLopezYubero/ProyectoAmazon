package amazon;

public class Almacen {
	private int id_almacen;
	private String provincia;
	private String localidad;
	private int id_amazon;
	
	public Almacen() {
		super();
	}

	public Almacen(int id_almacen, String provincia, String localidad, int id_amazon) {
		super();
		this.id_almacen = id_almacen;
		this.provincia = provincia;
		this.localidad = localidad;
		this.id_amazon = id_amazon;
	}

	public int getId_almacen() {
		return id_almacen;
	}

	public void setId_almacen(int id_almacen) {
		this.id_almacen = id_almacen;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getLocalidad() {
		return localidad;
	}

	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}

	public int getId_amazon() {
		return id_amazon;
	}

	public void setId_amazon(int id_amazon) {
		this.id_amazon = id_amazon;
	}
	
	
}

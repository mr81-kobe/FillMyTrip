package tt;

public class Cl {

	private String lot = "aa"; 
	private String lat = "aa";
	private String name;
	private String big;
	private int time =11;
	private float la = 0.1f; 
	private float lo =0.1f;
	private String src; 
	private String add; 
	private String ph;
	
	

	public Cl(String lot, String lat, String name ,String ph,String add,String src) {
		super();
		this.lot = lot;
		this.lat = lat;
		this.name = name;
		this.ph = ph; 
				this.src = src; 
				this.add = add;
	}
 

	


	/**
	 * @return the lot
	 */
	public String getLot() {
		return lot;
	}

	/**
	 * @param lot the lot to set
	 */
	public void setLot(String lot) {
		this.lot = lot;
	}

	/**
	 * @return the lat
	 */
	public String getLat() {
		return lat;
	}

	/**
	 * @param lat the lat to set
	 */
	public void setLat(String lat) {
		this.lat = lat;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the big
	 */
	public String getBig() {
		return big;
	}

	/**
	 * @param big the big to set
	 */
	public void setBig(String big) {
		this.big = big;
	}

	/**
	 * @return the la
	 */
	public float getLa() {
		return la;
	}

	/**
	 * @param la the la to set
	 */
	public void setLa(float la) {
		this.la = la;
	}

	/**
	 * @return the lo
	 */
	public float getLo() {
		return lo;
	}

	/**
	 * @param lo the lo to set
	 */
	public void setLo(float lo) {
		this.lo = lo;
	}

	/**
	 * @return the src
	 */
	public String getSrc() {
		return src;
	}

	/**
	 * @param src the src to set
	 */
	public void setSrc(String src) {
		this.src = src;
	}

	/**
	 * @return the add
	 */
	public String getAdd() {
		return add;
	}

	/**
	 * @param add the add to set
	 */
	public void setAdd(String add) {
		this.add = add;
	}

	/**
	 * @return the ph
	 */
	public String getPh() {
		return ph;
	}

	/**
	 * @param ph the ph to set
	 */
	public void setPh(String ph) {
		this.ph = ph;
	}

	public void value() 
	{ 
		
		this.la =Float.parseFloat(this.lat) ;
		this.lo =Float.parseFloat(this.lot) ;


} 
}

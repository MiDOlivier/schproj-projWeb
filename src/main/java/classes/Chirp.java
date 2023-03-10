package classes;

import database.DBQuery;

public class Chirp {
	
	private int chirpid = 0;
	private int chirpusersource = 0;
	private String chirptextcontent = "";
	private String chirpimagecontent = "";
	
	private String tableName	= "ccrc_db.chirp"; 
	private String fieldsName	= "chirpid, chirpusersource, chirptextcontent, chirpimagecontent";  
	private String fieldKey		= "chirpid";
	
	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);
	
	public Chirp(int source, String content) {
		this.setChirpusersource(source);
		this.setChirptextcontent(content);
	}
	
	public void save() {
		if( this.getChirpid() > 0 ) {
			this.dbQuery.update(this.toArray());
		}else {
			this.dbQuery.insert(this.toArray());
		}
	}
	
	private String[] toArray() {
		
		String[] temp =  new String[] {
				this.getChirpid()+"",
				this.getChirpusersource()+"",
				this.getChirptextcontent(),
				this.getChirpimagecontent()
		};
		return(temp);
	}

	public int getChirpid() {
		return chirpid;
	}

	public void setChirpid(int chirpid) {
		this.chirpid = chirpid;
	}

	public int getChirpusersource() {
		return chirpusersource;
	}

	public void setChirpusersource(int chirpusersource) {
		this.chirpusersource = chirpusersource;
	}

	public String getChirptextcontent() {
		return chirptextcontent;
	}

	public void setChirptextcontent(String chirptextcontent) {
		this.chirptextcontent = chirptextcontent;
	}

	public String getChirpimagecontent() {
		return chirpimagecontent;
	}

	public void setChirpimagecontent(String chirpimagecontent) {
		this.chirpimagecontent = chirpimagecontent;
	}

}

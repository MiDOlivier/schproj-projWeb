package classes;

import java.util.Date;
import java.util.Locale;
import java.text.SimpleDateFormat;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.io.IOException;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;

public class FileManager {
	
	private String location;
	
	public FileManager() {
		File currentDirFile = new File("");
		String helper = currentDirFile.getAbsolutePath();
		setLocation(helper);
	}
	
	public String create(String base64string) throws IOException {
	
	String filename = new SimpleDateFormat("yyyy-MM-dd'T'HH-mm-ss-SSS", Locale.ENGLISH).format(new Date());
	filename += ".base64";
	String caminho = getLocation() + File.separator +  filename;
	Path path = Paths.get(caminho);
	//byte[] bytes = base64string.getBytes();
	Files.writeString(path, base64string, StandardOpenOption.CREATE);
	Files.readAllBytes(Paths.get(caminho));
	
	return filename;
	
	}
	
	public String read(String filename) throws IOException {
		
		String filepath = getLocation() + File.separator + filename;
		
		BufferedReader reader = new BufferedReader(new FileReader(filepath));
	    String inputStream = reader.readLine();
	    
	    reader.close();
	     
	    if (inputStream != null) {
	        	return inputStream;
	    } else {
	    	return "";
	    }
	    
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String caminho) {
		this.location = caminho;
	}

}

package jython;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Jp {
	public String judgegreen(String filename) {
		// TODO Auto-generated method stub
		String result = "ERROR";
		try {
			String[] args = new String[] { "python", "E:\\´óÈýÉÏ\\UML\\½¡¿µÂë\\WebContent\\resource\\recoginze.py",
					String.valueOf(filename) };
			Process proc = Runtime.getRuntime().exec(args);
			BufferedReader in = new BufferedReader(new InputStreamReader(proc.getInputStream()));
			String line = null;
			while ((line = in.readLine()) != null) {
				result = line;
			}
			in.close();
			proc.waitFor();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return result;
	}
}

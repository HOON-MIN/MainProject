package com.main.ateam.modules;

import java.io.FileWriter;
import java.io.IOException;

import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
@Component
public class GsonModule {
	public void saveGsonFile(Object vo, String gsonName) {
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		try (FileWriter fw = new FileWriter(gsonName);){
			gson.toJson(vo, fw);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

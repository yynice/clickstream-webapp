package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;
import org.mongojack.JacksonDBCollection;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.util.JSON;

import datatype.WebParams;

public class Analytics extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MongoClient mongoClient;
	private MongoDatabase database;
	private MongoCollection<Document> collection;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		
		String host = System.getenv("MONGODB_SERVICE_HOST");
		String port = System.getenv("MONGODB_SERVICE_PORT");
		
		String mongoUri = "mongodb://admin:support123@" + host + ":" + port;

		//mongoClient = new MongoClient(new ServerAddress(host, port), Arrays.asList(credential));
		mongoClient = new MongoClient(new MongoClientURI(mongoUri));
		database = mongoClient.getDatabase("sampledb");
		//database.createCollection("testcollection");
		collection = database.getCollection("testcollection");
		
		System.out.println(mongoClient.getConnectPoint());
		System.out.println(database.getName());
		System.out.println(collection.toString());
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FindIterable<Document> docs = collection.find();
		
		StringBuilder sb = new StringBuilder();
		sb.append("[");
		
		for (Document doc: docs){
			System.out.println(doc.toJson());
			sb.append(doc.toJson());
			sb.append(",");
		}
		
		sb.deleteCharAt(sb.length()-1);
		sb.append("]");
		
		System.out.println("********************************************");
		System.out.println(sb.toString());
		System.out.println("********************************************");
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(sb.toString());
		
	}

	@Override
	public void destroy() {

		System.out.println("Destroyed");

		super.destroy();
	}
}

package servlets;

import java.io.IOException;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;
import org.bson.conversions.Bson;

import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.util.JSON;
import com.sun.org.apache.xalan.internal.xslt.Process;

import datatype.WebParams;
import sun.java2d.loops.ProcessPath;

/**
 * Servlet implementation class Startup
 */
public class Startup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MongoClient mongoClient;
	private MongoDatabase database;
	private MongoCollection<Document> collection;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		
		String host = System.getenv("MONGODB_SERVICE_HOST");
		String port = System.getenv("MONGODB_SERVICE_PORT");
		
		String mongoUri = "mongodb://admin:support123@" + host + ":" + port;

		System.out.println("*************************************************************");
		System.out.println(System.getenv("MONGODB_SERVICE_HOST"));
		System.out.println(System.getenv("MONGODB_SERVICE_PORT"));
		System.out.println("*************************************************************");
		
		//mongoClient = new MongoClient(new ServerAddress(host, port), Arrays.asList(credential));
		mongoClient = new MongoClient(new MongoClientURI(mongoUri));
		database = mongoClient.getDatabase("sampledb");
		//database.createCollection("testcollection");
		collection = database.getCollection("testcollection");
		System.out.println(mongoClient.getConnectPoint());
		System.out.println(database.getName());
		System.out.println(collection.toString());
		
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		//		PrintWriter out;

		String iPAddress = request.getRemoteAddr();
		//System.out.println(request.getRequestURL().toString());
		URL sourceURL = new URL(request.getRequestURL().toString());

		DateFormat timestampFormat = new SimpleDateFormat("YYYY-MM-dd hh:mm:ss");
		DateFormat yearFormat = new SimpleDateFormat("YYYY");
		DateFormat monthFormat = new SimpleDateFormat("MM");
		DateFormat dayFormat = new SimpleDateFormat("dd");
		DateFormat hrFormat = new SimpleDateFormat("hh");
		DateFormat minFormat = new SimpleDateFormat("mm");
		DateFormat secFormat = new SimpleDateFormat("ss");

		Calendar cal = Calendar.getInstance();

		request.setAttribute("ip", iPAddress);

		System.out.println("website : " + sourceURL.getProtocol()+sourceURL.getAuthority());

		WebParams clickStreamObj = new WebParams();
		clickStreamObj.setTimestamp(timestampFormat.format(cal.getTime()).toString());
		clickStreamObj.setYear(yearFormat.format(cal.getTime()).toString());
		clickStreamObj.setMonthOfYear(monthFormat.format(cal.getTime()).toString());
		clickStreamObj.setDayOfMonth(dayFormat.format(cal.getTime()).toString());
		clickStreamObj.setHourOfDay(hrFormat.format(cal.getTime()).toString());
		clickStreamObj.setMinuteOfHour(minFormat.format(cal.getTime()).toString());
		clickStreamObj.setSecondOfMinute(secFormat.format(cal.getTime()).toString());
		clickStreamObj.setIPAddress(iPAddress);
		clickStreamObj.setWebsite(sourceURL.getProtocol()+"://"+sourceURL.getAuthority());


		if(request.getParameter("ref")!=null){
			clickStreamObj.setReferrer(request.getParameter("ref"));
			//clickStreamObj.setPageAccessType("entry");

			request.setAttribute("ip", iPAddress);
			request.setAttribute("source", clickStreamObj.getReferrer());
			request.setAttribute("currPg", "Home");
			request.setAttribute("access", "entry");

		}

		System.out.println(request.getParameter("action"));


		if(request.getParameter("action")!=null){
			System.out.println("ActionCalled");

			/*if(request.getParameter("action").equalsIgnoreCase("exit"));{

			}*/

			clickStreamObj.setUserID(request.getParameter("userid"));
			clickStreamObj.setUserName(request.getParameter("username"));
			clickStreamObj.setPage(request.getParameter("currPg"));
			clickStreamObj.setUserAgentBrowser(request.getParameter("userAgent"));
			clickStreamObj.setUserAgentOS(request.getParameter("userOS"));
			clickStreamObj.setDurationPageVisit(request.getParameter("duration"));
			clickStreamObj.setReferrer((String) request.getParameter("source"));
			clickStreamObj.setPageAccessType((String) request.getParameter("access"));

			//clickStreamObj.setPage(request.getParameter("nextPage"));


			clickStreamObj.setPageAccessType((String) request.getParameter("access"));

			request.setAttribute("access", "clickthrough");
			request.setAttribute("source", request.getParameter("currPg"));
			request.setAttribute("currPg", request.getParameter("nextPage"));


			System.out.println(clickStreamObj.toString());
			

			Document document = createDBObject(clickStreamObj);	
			
			collection.insertOne(document);
			
			
			
			
			
			/*	String topic = "webstream1";

			BufferedReader reader = null;
			try {
				reader = new BufferedReader (new FileReader("/usr/share/VARS.txt"));
			} catch (FileNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String line2;

			String kfka = "";
			String zk = "";
			try {
				while ( null != reader && null != (line2 = reader.readLine())) {
					if (kfka.equals("")) {
						kfka = line2;
					} else {
						zk = line2;
					}
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}




			Properties props = new Properties();
			//		    props.put("metadata.broker.list", "10.101.115.213:9092");
			props.put("metadata.broker.list", kfka + ":9092"); //kafka
			props.put("serializer.class", "kafka.serializer.StringEncoder");
			props.put("partitioner.class", "servlets.SimplePartitioner");
			props.put("controlled.shutdown.max.retries", 0);
			props.put("request.required.acks", "0");
			props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
			props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");
			props.put("acks", "all");
			props.put("batch.size", 16384);
			props.put("linger.ms", 1);
			props.put("buffer.memory", 33554432);
			props.put("zookeeper.connect", zk + ":2181");
			props.put("host.name", kfka);
			props.put("advertised.host.name", kfka);


			ProducerConfig config = new ProducerConfig(props);


			Producer<String, String> producer = new Producer<String, String>(config);

			//String line= request.getParameter("cookie");

			if(request.getParameter("action").equalsIgnoreCase("abc")){ //change to "abc" to make it crash again...

				String line = clickStreamObj.toString();
				KeyedMessage<String, String> data = new KeyedMessage<String, String>(topic, line);
				producer.send(data);
				producer.close();

			}


			//			out.println(""+request.getParameter("action"));

			if(request.getParameter("action").equalsIgnoreCase("exit")){

				clickStreamObj.setPage("");
				clickStreamObj.setDurationPageVisit("0");
				clickStreamObj.setReferrer(request.getParameter("currPg"));
				clickStreamObj.setPageAccessType("exit");

				System.out.println(clickStreamObj.toString());
				String line= clickStreamObj.toString();
				KeyedMessage<String, String> data2 = new KeyedMessage<String, String>(topic, line);
				producer.send(data2);
			}

			producer.close();*/

//			BasicDBObject doc = new BasicDBObject();
//			doc.put("name", "first sample document for testing");
//			doc.put("type", "database");
//			doc.put("crazy-value", 10000101);
//			BasicDBObject child = new BasicDBObject();
//			child.put("orphan",true);
//			child.put("child-name", "John the Second");
//			doc.put("child", child);

		}

		request.getRequestDispatcher("bankSite.jsp").forward(request, response);
	}
	
	public Document createDBObject(WebParams webParams){
		
		Document doc = new Document();
		
		doc.append("website", webParams.getWebsite());
		doc.append("page", webParams.getPage());
		doc.append("pageAccessType", webParams.getPageAccessType());
		doc.append("referrer", webParams.getReferrer());
		doc.append("year", webParams.getYear());
		doc.append("monthOfYear", webParams.getMonthOfYear());
		doc.append("dayOfMonth", webParams.getDayOfMonth());
		doc.append("hourOfDay", webParams.getHourOfDay());
		doc.append("minuteOfHour", webParams.getMinuteOfHour());
		doc.append("secondOfMinute", webParams.getSecondOfMinute());
		doc.append("ipAddress", webParams.getIPAddress());
		doc.append("userAgentBrowser", webParams.getUserAgentBrowser());
		doc.append("userAgentOS", webParams.getUserAgentOS());
		doc.append("userID", webParams.getUserID());
		doc.append("userName", webParams.getUserName());
		doc.append("durationPageVisit", webParams.getDurationPageVisit());
		doc.append("timestamp", webParams.getTimestamp());
		
		
		return doc;
	}

	@Override
	public void destroy() {

		System.out.println("Destroyed");

		super.destroy();
	}
}

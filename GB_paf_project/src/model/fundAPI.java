package model;

import model.funding;
import java.io.IOException; 
import java.util.HashMap; 
import java.util.Map; 
import java.util.Scanner;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class PatientsAPI
 */
@WebServlet("/fundAPI")
public class fundAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	funding fundObj = new funding();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fundAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String output = fundObj.insertFund(request.getParameter("funderName"),      
				request.getParameter("fundDate"),     
				request.getParameter("fundPrice"),        
				request.getParameter("fundCate"),
				request.getParameter("fundDesc"));
	 
				response.getWriter().write(output);
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stu

		Map paras = getParasMap(request); 
		 
		 String output = fundObj.updateFund(paras.get("hidFundIDSave").toString(),     
		    		paras.get("funderName").toString(),     
		    		paras.get("fundDate").toString(),        
		    		paras.get("fundPrice").toString(),
		    		paras.get("fundCate").toString(), 
		    		paras.get("fundDesc").toString()); 
		 
		 			response.getWriter().write(output);
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Map fundMapp = getParasMap(request); 
		 
		 String output = fundObj.deleteFund(fundMapp.get("fundId").toString());  
		 
		 response.getWriter().write(output);
	}
	
	// Convert request parameters to a Map
		private static Map getParasMap(HttpServletRequest request)
		{
		 Map<String, String> map = new HashMap<String, String>();
		try
		 {
		 Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
		 String queryString = scanner.hasNext() ?
		 scanner.useDelimiter("\\A").next() : "";
		 scanner.close();
		 String[] params = queryString.split("&");
		 for (String param : params)
		 { 
		
		String[] p = param.split("=");
		 map.put(p[0], p[1]);
		 }
		 }
		catch (Exception e)
		 {
		 }
		return map;
		}

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.BlogDAO;
import dto.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Blog;
import model.Slider;

/**
 *
 * @author Admin
 */
@WebServlet(name = "BlogAjaxSearch", urlPatterns = {"/ajaxsearch"})
public class BlogAjaxSearch extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        BlogDAO dao = new BlogDAO();
        String search_raw = request.getParameter("search");
        String key = request.getParameter("key");
        if (search_raw == null) {
            search_raw = "";
        }
        if (key == null) {
            key = "";
        }
        System.out.println(search_raw);
        //goi sanpham 
        List<Blog> listB = dao.searchByName(key);
        List<Blog> listB1 = dao.getRelatedBlog();
        
        SliderDAO sdao = new SliderDAO();
        List<Slider> listS1 = sdao.getAllSliderBlog();
        
        
        Gson gson = new Gson();
        String list1 = gson.toJson(listB);
        String list2 = gson.toJson(listB1);
        String listS = gson.toJson(listS1);
        
        JsonObject jsonobj = new JsonObject();
        jsonobj.addProperty("list1", list1);
        jsonobj.addProperty("list2", list2);
        jsonobj.addProperty("listS", listS);
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonobj.toString());
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

package com.parking.parkinglot.servlets;


import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.parkinglot.common.UserDto;
import org.example.parkinglot.ejb.CarsBean;
import org.example.parkinglot.ejb.UserBean;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddCarServlet", value = "/AddCarServlet")
public class AddCar extends HttpServlet {
    @Inject
    UserBean userBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<UserDto> users = userBean.findAllUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/WEB-INF/pages/addCar.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String licensePlate = request.getParameter( "license_plate");
        String parkingSpot = request.getParameter( "parking_spot");
        Long userId = Long.parseLong(request.getParameter( "owner_id"));

        carsBean.createCar(licensePlate, parkingSpot, userId);

        response.sendRedirect( request.getContextPath() + "/CarsServlet");
    }
    @Inject
    CarsBean carsBean;
}
package org.example.parkinglot.servlets.cars;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.parkinglot.common.CarPhotoDto;
import org.example.parkinglot.ejb.CarsBean;

import java.io.IOException;

@WebServlet(name = "CarPhoto", value = "/CarPhoto")
public class CarPhoto extends HttpServlet {

    @Inject
    CarsBean carsBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        Integer carId = Integer.parseInt(idParam);
        CarPhotoDto photo = carsBean.findPhotoByCarId(carId);

        if (photo != null && photo.getFileContent() != null) {
            response.setContentType(photo.getFileType());
            response.setContentLength(photo.getFileContent().length);

            response.getOutputStream().write(photo.getFileContent());
            response.getOutputStream().flush();
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}
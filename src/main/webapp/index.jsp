<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Add Car Photo">
    <h1>Add Car Photo</h1>

    <div class="container mt-3">
        <p>License plate: ${car.licensePlate}</p>

        <form class="needs-validation" novalidate method="POST"  enctype="multipart/form-data"
              action="${pageContext.request.contextPath}/AddCarPhoto">

            <div class="row">
                <div class="col-md-6 md-3">
                    License Plate: ${car.licensePlate}
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 md-3">
                    <label for="photo">Photo</label>
                    <input type="file" name="file" id="file" required>
                    <div class="invalid-feedback">
                        Phote is required.
                    </div>
                </div>
            </div>

            <input type="hidden" name="carId" value="${car.id}" />

            <button type="submit" class="btn btn-primary">Save</button>
        </form>
    </div>
</t:pageTemplate>
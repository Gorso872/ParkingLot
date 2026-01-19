<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Add Car Photo">
  <h1>Add Car Photo</h1>

  <div class="container mt-3">
    <p>License plate: ${car.licensePlate}</p>

    <form method="POST"
          enctype="multipart/form-data"
          action="${pageContext.request.contextPath}/AddCarPhoto">

      <div class="row mb-3">
        <label for="photo" class="col-sm-1 col-form-label">Photo</label>
        <div class="col-sm-4">
          <input type="file" name="file" id="photo" class="form-control" required>
        </div>
      </div>

      <hr/>

      <input type="hidden" name="carId" value="${car.id}" />

      <button type="submit" class="btn btn-primary">Save</button>
    </form>
  </div>
</t:pageTemplate>
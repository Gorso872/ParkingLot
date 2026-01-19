<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<t:pageTemplate pageTitle="editCar">
  <body>

  <form class="needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/EditCarServlet">

    <div class="row">
      <!-- License Plate -->
      <div class="col-md-6 mb-3">
        <label for="license_plate">License Plate</label>
        <input type="text" class="form-control" id="license_plate"
               name="license_plate"
               placeholder=""value="${car.licensePlate}" required>
        <div class="invalid-feedback">
          Please enter a license plate.
        </div>
      </div>

      <!-- Parking Spot -->
      <div class="col-md-6 mb-3">
        <label for="parking_spot">Parking Spot</label>
        <input type="text" class="form-control" id="parking_spot"
               name="parking_spot"
               placeholder=""value="${car.parkingSpot}"required>
        <div class="invalid-feedback">
          Please enter a parking spot.
        </div>
      </div>
    </div>

    <div class="row">
      <!-- Owner Dropdown -->
      <div class="col-md-6 mb-3">
        <label for="owner_id">Owner</label>
        <select class="custom-select d-block w-100" id="owner_id" name="owner_id" required>
          <option value="">Chose...</option>
          <c:forEach var="user" items="${users}" varStatus="status">
            <option value="${user.id}"${car.ownerName eq user.username ? 'selected':''}>${user.username}</option>
          </c:forEach>
        </select>
        <div class="invalid-feedback">
          Please select an owner.
        </div>
      </div>
      <hr class="mb-4">
      <input  type="hidden" name="car_id" value="${car.id}"/>
    </div>

    <!-- Save button -->

    <button class="btn btn-primary" type="submit">Save</button>


  </form>
  <script src="${pageContext.request.contextPath}/scripts/form-validation.js"></script>

  </body>
</t:pageTemplate>
</html>

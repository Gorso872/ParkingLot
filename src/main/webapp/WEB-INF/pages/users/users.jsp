<%@page contentType="text/html; charset=UTF-8"  %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:pageTemplate pageTitle="Users">
  <h1>Users</h1>

  <c:set var="canWriteUsers" value="${pageContext.request.isUserInRole('WRITE_USERS')}" />


  <form method="POST" action="${pageContext.request.contextPath}/UsersServlet">

    <div class="mb-3">
      <a href="${pageContext.request.contextPath}/AddUser" class="btn btn-primary">Add User</a>


      <c:if test="${canWriteUsers}">
        <button class="btn btn-secondary" type="submit">Invoice</button>
      </c:if>
    </div>

    <div class="container text-center">
      <c:forEach var="user" items="${users}">
        <div class="row mb-2">

          <div class="col-1">
            <c:if test="${canWriteUsers}">
              <input type="checkbox" name="userIds" value="${user.id}" />
            </c:if>
          </div>

          <div class="col">${user.username}</div>
          <div class="col">${user.email}</div>
        </div>
      </c:forEach>
    </div>
  </form>

  <c:if test="${not empty invoices}">
    <hr/>
    <h2 class="mt-4">Invoices</h2>
    <div class="text-start ms-5">
      <c:forEach var="username" items="${invoices}" varStatus="status">
        <div>${status.index + 1}. ${username}</div>
      </c:forEach>
    </div>
  </c:if>

</t:pageTemplate>
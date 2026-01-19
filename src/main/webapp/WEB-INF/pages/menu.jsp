
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header data-bs-theme="pink">
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <div class="container-fluid">

            <a class="navbar-brand" href="${pageContext.request.contextPath}/">Parking Lot</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                    aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">

                    <li class="nav-item">
                        <a class="nav-link ${pageContext.request.requestURI.substring(pageContext.request.requestURI.lastIndexOf("/")) eq '/about.jsp' ? ' active' : ''}"
                           href="${pageContext.request.contextPath}/About">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${pageContext.request.requestURI.substring(pageContext.request.requestURI.lastIndexOf("/")) eq '/cars.jsp' ? ' active' : ''}"
                           href="${pageContext.request.contextPath}/CarsServlet">Cars</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link ${pageContext.request.requestURI.substring(pageContext.request.requestURI.lastIndexOf("/")) eq '/cars.jsp' ? ' active' : ''}"
                           href="${pageContext.request.contextPath}/UsersServlet">Users</a>
                    </li>




                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <c:choose>
                            <c:when test="${pageContext.request.getRemoteUser()== null}">
                                <a class="nav-link" href="${pageContext.request.contextPath}/Login">Login</a>
                            </c:when>
                            <c:otherwise>
                                <a class="nav-link" href="${pageContext.request.contextPath}/Logout">Logout</a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </ul>

                <li class="nav-item">
                    <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
                        <a class="nav-link" href="${pageContext.request.contextPath}/CarsServlet">Cars</a>
                    </c:if>
                </li>
                <li class="nav-item">
                    <c:if test="${pageContext.request.isUserInRole('WRITE_USERS')}">
                        <a class="nav-link" href="${pageContext.request.contextPath}/UsersServlet">Users</a>
                    </c:if>
                </li>


            </div>
        </div>
    </nav>
</header>

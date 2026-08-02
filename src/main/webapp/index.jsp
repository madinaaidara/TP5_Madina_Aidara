<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- Redirection vers la liste des cours --%>
<%
    response.sendRedirect(request.getContextPath() + "/cours?action=liste");
%>
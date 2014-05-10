<%-- 
    Document   : home
    Created on : May 3, 2014, 10:35:40 PM
    Author     : h10t93
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Home</title>
            <link rel="stylesheet" href="css/temp.css"/>
            <link rel="stylesheet" href="css/bootstrap-theme.css"/>
            <link rel="stylesheet" href="css/bootstrap-theme.css.map"/>
            <link rel="stylesheet" href="css/bootstrap.css"/>
            <link rel="stylesheet" href="css/bootstrap.css.map"/>
            <link rel="stylesheet" href="css/bootstrap-theme.min.css"/>
            <link rel="stylesheet" href="css/bootstrap.min.css"/>
        </head>
        <body>
            <div id="header">
                <div id="img"></div>
                <div class="log">

                    <c:if test="${sessionScope.user != null}">   
                        <form action="Servlet?action=logout" method="POST">
                            <table>
                                <tr>
                                    <td>Welcome : <c:out value="${sessionScope.user}"></c:out></td>
                                        <td><input type="submit" style="margin-left: 
                                                   10px;border:0px ;height: 30px;border-radius: 0px;" 
                                                   value="Logout" class="btn btn-danger"/>
                                        </td>    
                                    </tr>
                            </form>
                            </table>
                    </c:if>
                    <c:if test="${sessionScope.user == null}">
                        <form action="Servlet?action=login" method="POST">
                            <table cellspacing="0">
                                <tr>
                                    <td><input name="id" type="text" tabindex="1"
                                               style="border:0px ;height: 30px;border-radius: 0px;"class="form-control"
                                               " 
                                               placeholder="Enter ID"/></td>
                                    <td><input name="password" type="password" tabindex="2" 
                                               style="border:0px ;height: 30px;border-radius: 0px;" 
                                               class="form-control"
                                               placeholder="Password"/></td>
                                    <td><input tabindex="3" type="submit" style="margin-left: 10px;border:0px ;height: 30px;border-radius: 0px;" value="Login" class="btn btn-danger"/></td>
                                </tr>
                                <tr>
                                    <td><input tabindex="4" type="checkbox">Remember me</td>
                                    <td><a>Forgot password</a></td>
                                </tr>
                            </table>
                        </form>
                    </c:if>
                </div>	
            </div>

            <div id="content_left">   
                <p>add data</p>
                <h:form>
                    <div>
                        <table>
                            <tr>
                                <td>Categorize:</td>
                                <td>
                                    <h:selectOneMenu>
                                        <f:selectItem itemValue="rau" itemLabel="raulb"></f:selectItem>
                                        <f:selectItem itemValue="rau1" itemLabel="raulb1"></f:selectItem>
                                        <f:selectItem itemValue="rau2" itemLabel="raulb2"></f:selectItem>
                                    </h:selectOneMenu>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <p>unit</p><h:inputText value="#{productBean.productUnit}"/>
                    <p>price</p><h:inputText value="#{productBean.price}"/>
                    <h:commandButton action="#{productBean.addBill()}" value="add"/>
                </h:form>
            </div>

            <div id="content_right">
                <p>product purchased list</p>
                <h:dataTable value="#{productBean.product}" var="p">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Product ID"></h:outputText>
                        </f:facet>
                        <h:outputText value="#{p.productID}"></h:outputText>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="User Name"> </h:outputText>
                        </f:facet>
                        <h:outputText value="#{p.productName}"></h:outputText>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Product Name"></h:outputText>
                        </f:facet>
                        <h:outputText value="#{p.productName}"></h:outputText>
                    </h:column>  
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Product Unit"> </h:outputText>
                        </f:facet>
                        <h:outputText value="#{p.productUnit}"></h:outputText>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Product Price"></h:outputText>
                        </f:facet>
                        <h:outputText value="#{p.price}"></h:outputText>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Date Buy"></h:outputText>
                        </f:facet>
                        <h:outputText value="#{p.date}"></h:outputText>
                    </h:column>        
                </h:dataTable>
            </div>
            <div class="clear"></div>
            <div id="footer"></div>


        </body>
    </html>
</f:view>

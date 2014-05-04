<%-- 
    Document   : home
    Created on : May 3, 2014, 10:35:40 PM
    Author     : h10t93
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
        </head>
        <body>
            <h1><h:outputText value="Hello hoangtuan!"/></h1>
            <h:dataTable value="#{accountManagedBean.list}" var="p">
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="id"></h:outputText>
                    </f:facet>
                    <h:outputText value="#{p.id}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="name"></h:outputText>
                    </f:facet>
                    <h:outputText value="#{p.name}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="username"></h:outputText>
                    </f:facet>
                    <h:outputText value="#{p.username}"></h:outputText>
                </h:column>
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="password"></h:outputText>
                    </f:facet>
                    <h:outputText value="#{p.pass}"></h:outputText>
                </h:column>
            </h:dataTable>
        </body>
    </html>
</f:view>

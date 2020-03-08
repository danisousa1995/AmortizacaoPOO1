<%-- 
    Document   : amortizacao-americana
    Created on : 07/03/2020, 20:08:32
    Author     : danisousa
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='pt-br'>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização americana</title>
        <link rel="stylesheet" href="estilo.css">
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        
        <%DecimalFormat df = new DecimalFormat("R$ #,##0.00");%>

        <div style='border: solid black 2px; background-color: #87CEFA'>
        <h1 align='center'>Amortização Americana</h1>
        </div>    
        <br>

        <div style='width: 100%; text-align: center;'>
        <form>
            <input type="text" name="capital" placeholder="Valor do empréstimo">
            <label unit="%">
                <input type="number" step='0.01'  min="0.01" max="70.00" name="taxa" placeholder="juros">
            </label>
            <input type="text" name="tempo" placeholder="Numero de Parcelas">
            <input type="submit" name="enviar" value="Calcular">
        </form>
        </div>

        <% if(request.getParameter("enviar") !=null){ %>    
        <%try{%>
        
        <% int capital = Integer.parseInt(request.getParameter("capital")); %>
        <% int tempo = Integer.parseInt(request.getParameter("tempo")); %>
        <% double i = Double.parseDouble(request.getParameter("taxa")); %>
        <% double j; %>
        <% double s; %>
        <% double p; %>

        <br><br>
        
    <table border="3" style='margin-left: 23%; border-radius: 3px'>

            <% i = (capital * i)/100; %>
            
            <tr>
                <th style='background-color:#87CEFA'>Meses</th>
                <th style='background-color:#87CEFA'>Saldo Devedor</th>
                <th style='background-color:#87CEFA'>Amortização</th>
                <th style='background-color:#87CEFA'>Juros</th>
                <th style='background-color:#87CEFA'>Prestações</th>
            </tr>

            <% for(int c = 0; c <= tempo; c++) { %>

            
            <tr> 
                <td><%=c%></td>                 
                <td><%=df.format(capital)%></td>
                <td>-</td>
                <td><%= df.format(i)%></td>
                <td><%= df.format(i)%></td>
            </tr>

            <%}%>

            <tr>
                <td style='background-color:#87CEFA'>-</td>
                <td style='background-color:#87CEFA'>-</td>
                <td style='background-color:#87CEFA'>-</td>
                <td style='background-color:#87CEFA'>-</td>
                <td style='background-color:#87CEFA'>-</td>                   
            </tr>

            <tr>
                <td>Total</td>                 
                <td>-</td>
                <td><%= df.format(capital) %></td>
                <td><%= df.format(p = i * tempo)%></td>
                <td><%= df.format(capital + p) %></td>
            </tr>

        </table>
        <br>
        <% }catch(Exception ex){ %>
            <h3 style="color: red"> Insira um parâmetro válido!</h3>
        <% } %>
        <% }else{ %>
        <% } %> 

        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
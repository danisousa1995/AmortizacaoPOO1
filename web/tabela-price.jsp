<%-- 
    Document   : tabela-price
    Created on : 07/03/2020, 20:09:09
    Author     : danisousa
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html  lang='pt-br'>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
        <link rel="stylesheet" href="estilo.css">
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
       
        <%DecimalFormat df = new DecimalFormat("R$ #,##0.00");%>
                
        <div style='border: solid black 2px; background-color: #87CEFA'>
            <h1 align='center'>Tabela Price</h1>
        </div>    
        <br>

        <div style='width: 100%; text-align: center;'>
            <form>
                <input type="number" name="v" placeholder="Valor do empréstimo">
                <label unit="%">
                    <input type="number" step='0.01'  min="0.01" max="70.00" name="j" placeholder="juros">
                </label>
                <input type="number" name="p" placeholder="Numero de Parcelas">
                <input type="submit" name="valor" value="Calcular">
            </form>
        </div>
            
        
        <%if(request.getParameter("valor") !=null){ %>
        
        <% try{ %>
        <% int p = Integer.parseInt(request.getParameter("p")); %>
        <% double j = Double.parseDouble(request.getParameter("j")); %>
        <% double v = Double.parseDouble(request.getParameter("v")); %>
        
        <%double aux = Math.pow(1+j/100,p);%>
        <%double prestacao = v *((aux*j/100)/(aux-1));%>
        <br>
        <br>
        
        <table border="3" style='margin-left: 23%; border-radius: 3px'>
            <tr>
                <th style='background-color:#87CEFA'>Mês</th>
                <th style='background-color:#87CEFA'>Prestação</th>
                <th style='background-color:#87CEFA'>Valor Juros</th>
                <th style='background-color:#87CEFA'>Amortização</th>
                <th style='background-color:#87CEFA'>Saldo Devedor</th>
            </tr>
             <tr>
                    <td><%= 0 %></td>
                    <td><%= 0 %></td>
                    <td><%= 0 %></td>
                    <td><%= 0 %></td>
                    <td><%= df.format(v) %></td>                        
                </tr>
        <% double valorjuros = v*j/100; %>
        <% double amortizacao = prestacao-valorjuros; %> 
        <% double devedor = v; %>
        <% double totalprestacao = 0; %>
        <% double totaljuros = 0; %>
        <% double totalamortizacao = 0; %>
        
            <% for(int i=1; i<=p; i++){ %>                
            
               <% amortizacao = prestacao-valorjuros; %> 
               <% devedor = devedor-amortizacao; %>
               <%if ( devedor <= 0){
                    devedor = 0; %>
            <% } %>
                <tr>
                    <td><%= i %></td>
                    <td><%= df.format(prestacao) %></td>
                    <td><%= df.format(valorjuros) %></td>
                    <td><%= df.format(amortizacao) %></td>
                    <td><%= df.format(devedor) %></td> 
                    
                    <%valorjuros = devedor*j/100;%>
                    <% totalprestacao = totalprestacao + prestacao; %>
                    <% totaljuros = totaljuros + valorjuros; %>
                    <% totalamortizacao = totalamortizacao + amortizacao; %>
                </tr>
            <% } %>
                <tr>
                    <td style='background-color:'><%= "-" %></td>
                    <td style='background-color:#87CEFA'><%= "-" %></td>
                    <td style='background-color:#87CEFA'><%= "-" %></td>
                    <td style='background-color:#87CEFA'><%= "-" %></td>
                    <td style='background-color:#87CEFA'><%= "-" %></td>                                            
                </tr>
                <tr>
                    <td><%= "Total" %></td>
                    <td><%= df.format(totalprestacao) %></td>
                    <td><%= df.format(totaljuros) %></td>
                    <td><%= df.format(totalamortizacao) %></td>
                    <td><%= "-" %></td>                        
                </tr>    
            <% }catch(Exception ex){ %>
                <h3> Deu Ruim</h3>
            <% } %>
            <% }else{ %>
        <% } %>
        </table>
        <br>
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>

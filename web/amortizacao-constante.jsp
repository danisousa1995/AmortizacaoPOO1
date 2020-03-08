<%-- 
    Document   : amortizcao-constante
    Created on : 04/03/2020, 22:12:08
    Author     : Alana
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="estilo.css">
        <title>Amortização Constante</title>
    </head>
    <body>
    <%@include file="WEB-INF/jspf/header.jspf"%>
    <%@include file="WEB-INF/jspf/menu.jspf"%>
    
    
      
    <div style="text-align: center"> 
        <div style='border: solid black 2px; background-color: #87CEFA'>
        <h1 align='center'>Amortização Constante</h1>
        </div>       
        <br>
        <div style='width: 100%; text-align: center;'>
            <h2> Calculando a amortização </h2>
        <p>
            Para encontrar o valor fixo da amortização basta dividir a dívida 
            pelo numero de parcelas. Para encontrar o valor da amortização de 
            uma dívida de 300.000 que sera pafa em 360 prestações basta dividir 
            300.000/360. O valor da amortização será de 833,33.
        </p>
        
        <h2>Calculando os Juros</h2>
        <p>
            Para achar o juros você precisa multiplicar o valor da divida atual 
            pelos juros. No nosso exemplo se a taxa de juros for de 1% ao mês 
            entao o valor dos juros será de 300.000 x 1% que é equivalente a R$
            3000,00.
        </p>
        
        <h2> Calculando a parcela</h2>
        <p>
            Sabendo o valor da amortização e o de juros você saberá o valor da
            parcela. No nosso exemplo é R$833,33 de amortização + R$3000,00
            de juros. Com isso nessa parcela será de R$3833,33.
        </p>
            <form>
                <input type="number" name="d" placeholder="Valor do empréstimo">
                <label unit="%">
                    <input type="number" step='0.01'  min="0.01" max="70.00" name="j" placeholder="juros">
                </label>
                <input type="number" name="p" placeholder="Numero de Parcelas">
                <input type="submit" name="constante" value="Calcular">
            </form>
        </div>
        <br>
        <% try{ %>
        <% if(request.getParameter("constante") == null){ %>
        
        
        
        
        <% }else{ %>
        
            <%
            DecimalFormat df = new DecimalFormat();
            df.applyPattern("R$ #,##0.00");
        
            String sald = request.getParameter("d");
            String temp = request.getParameter("p");
            String juro = request.getParameter("j");
            
            double saldo = Double.parseDouble(sald);
            double tempo = Double.parseDouble(temp);
            double juros = Double.parseDouble(juro);
            
            double j=0;
            double p=0;
            double somajuros=0;  
            double somaparcelas=0;
            
            double amort = saldo / tempo; 
            %>
            
            <% if((saldo > 0)||(tempo > 0)){ %>
            <table border="3" style='margin-left: 23%; border-radius: 3px'>
            <br>
          
            <tr>
                <th style='background-color:#87CEFA'>Meses</th>
                <th style='background-color:#87CEFA'>Amortização</th>
                <th style='background-color:#87CEFA'>Parcelas</th>
                <th style='background-color:#87CEFA'>Valor Juros</th>
                <th style='background-color:#87CEFA'>Saldo Devedor</th>
            </tr>
            
            <tr>
            <td>0</td>
            <td>-</td>  
            <td>-</td>  
            <td>-</td>  
            <td><%= df.format(saldo) %></td>  
            </tr>
            
                <% for(int c = 1; c <= tempo; c++) { %>           
            <tr>
                    <% p = amort + saldo * (juros/100); %>
                    <% j =saldo * (juros/100); %>
                    <td><%= (c) %></td>
                    <td><%= df.format(amort) %></td>
                    <td><%= df.format(p) %></td>
                    <td><%= df.format(j) %></td>  
                    <td><%= df.format(saldo = saldo - amort) %></td>   
                    <%somaparcelas = somaparcelas + p;%>
                    <% somajuros = somajuros + j; %>
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
                <td><%= df.format(amort = amort * tempo)  %></td>
                <td><%= df.format(somaparcelas)%></td>
                <td><%= df.format(somajuros)%></td>
                <td>-</td>
            </tr>    
            </table>    
                
            <% }else{ %>            
            <h2 style="color: red"> Somente valores VALIDOS</h2>          
            <% } %>
            
        <% } %>     
        
        <% }catch(Exception ex){ %>        
            <h2 style="color: red"> Por favor, preencha todos os campos. </h2>
        <% } %>
        
    </div>
        <BR><%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
        
</html>
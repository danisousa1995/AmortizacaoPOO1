<%-- 
    Document   : index
    Created on : 04/03/2020, 22:12:28
    Author     : Alana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <center><title>Home</title></center> 
        <link rel="stylesheet" href="estilo.css">
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        
        <h2> Equipe </h2>
        <p> 
            Alana Pagani - Desenvolveu a home e a amortização constante assim 
            como a página de cálculo. <br> 
            Daniela Oliveira - Desenvolveu a amortização americana e tabela 
            price assim como as 2 páginas de cálculo correspondentes.
        </p>
        
        <h2> Amortização</h2>
        <p>  Amortização é um processo de extinção de uma dívida através de 
            pagamentos periódicos, que são realizados em função de um 
            planejamento, de modo que cada prestação corresponde à soma do 
            reembolso do capital ou do pagamento dos juros do saldo devedor, 
            podendo ser o reembolso de ambos, sendo que os juros são sempre 
            calculados sobre o saldo devedor. <br>

             No Brasil, existe amortização contábil, cujo conceito não se 
            restringe à diminuição de dívidas, mas também a direitos intangíveis
            classificados no ativo (conta de balanço), derivado da teoria de 
            dimensão econômica dos fundos contábeis. A amortização contábil a é 
            redução de valor de um ativo intangível em decorrência de perda de 
            direito</p>
        
        <h2>Amortização Constante</h2>
        <p>   Neste sistema o saldo devedor é reembolsado em valores de amortização 
            iguais. Desta forma, no sistema SAC o valor das prestações é 
            decrescente, já que os juros diminuem a cada prestação. O valor da 
            amortização é calculado, dividindo-se o valor do principal pelo 
            número de períodos de pagamento, ou seja, de parcelas. Por sua vez, 
            os juros são calculados sobre o saldo devedor, multiplicando-se a 
            taxa pelo saldo. Finalmente, a soma da amortização e dos juros 
            resultam no valor da parcela.<br>

            O SAC é um dos tipos de sistema de amortização utilizados em 
            financiamentos imobiliários. A principal característica do SAC é que 
            ele amortiza um percentual fixo do valor principal (emissão), desde o
            início do financiamento. Esse percentual de amortização é sempre o 
            mesmo, o que faz com que a parcela de amortização da dívida seja 
            maior no início do financiamento, fazendo com que o saldo devedor 
            caia mais rapidamente do que em outros mecanismos de amortização.</p>
        
        <h2> Amortização Americana</h2>
        <p>  O Sistema Americano de Amortização é um tipo de quitação de 
            empréstimo que favorece aqueles que desejam pagar o valor principal 
            através de uma única parcela, porém os juros devem ser pagos 
            periodicamente ou, dependendo do contrato firmado entre as partes, 
            os juros são capitalizados e pagos junto ao valor principal</p>
        
        <h2>Tabela Price</h2>
        <p>Tabela Price, também chamado de sistema francês de amortização, é um 
            método usado em amortização de empréstimo cuja principal 
            característica é apresentar prestações (ou parcelas) iguais. 
            O método foi apresentado em 1771 por Richard Price em sua obra 
            "Observações sobre Pagamentos Remissivos". <br>

            O método foi idealizado pelo seu autor para pensões e 
            aposentadorias. No entanto, foi a partir da 2ª revolução industrial
            que sua metodologia de cálculo foi aproveitada para cálculos de 
            amortização de empréstimo.</p>
        
        
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>

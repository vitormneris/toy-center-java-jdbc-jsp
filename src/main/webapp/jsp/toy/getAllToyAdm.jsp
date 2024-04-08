<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="br.edu.toycenter.model.Toy"%>
<%@ page import="br.edu.toycenter.model.Category"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>TOY Center</title>
  <link rel="stylesheet" href="css/styleAdm.css">
  <link rel="stylesheet" href="css/styleindex.css">
</head>
<body>
    <header>
        <nav class="nav-bar">
            <div class="logo">
           		<a href="ToyController?action=getAllToy">
                <img src="image/newLogo.svg" alt=""></a>
            </div>

            <div class="store_name">
                <h1>TOY CENTER</h1>
            </div>

            <div class="space"></div>
        </nav>

    </header>

    <nav class="menu">
        <div class="menuList">
            <a href="ToyController?action=getAllToy">Home</a>
            <a href="CategoryController?action=getAllCategory">Catálogo</a>
            <a href="ToyController?action=getAllToyAdm">Administração</a>
            <a href="html/sobre_a_equipe.html">Sobre a Equipe</a>
        </div>
    </nav>
    
	<div class="containerAdm">
	  <div class="camada0">
	    <div class="camada1">
	        <h2 class="subtitulo">Administração : Catalogo de Brinquedos</h2>
	            <div class="tabela">
	            <table>
	                <thead>
	                    <tr>
	                        <th>Toy Code</th>
	                        <th>Toy Image</th>
	                        <th>Toy Name</th>
	                        <th>Toy Category</th>
	                        <th>Toy Brand</th>
	                        <th>Toy Price</th>
	                        <th>Toy Description</th>
	                        <th>Toy Details</th>
	                        <th>Toy Operations</th>
	                    </tr>
	                </thead>
	                <tbody>
			        <%
					List<Toy> list = (ArrayList) request.getAttribute("toyList");
					String message = (String) request.getAttribute("message");
					for (Toy toy : list) {
					%>
						<% if (toy.getToyCode() % 2 == 0) { %>
							<tr class="trb">
						<%	} else { %>
							<tr class="trw">
						<% } %>
							<td><%= toy.getToyCode() %></td>
							<td><a href="ToyController?action=getOneToy&toy_code=<%= toy.getToyCode() %>">
									<img src="<%= toy.getToyImage() %>" width="100px" height="100px">
								</a>
							</td>
							<td><%= toy.getToyName() %></td>
							<td>
								<% for (Category category : toy.getToyCategories()) { 
										out.print(category.getCategoryName()); %> <br>
								<%	
									} 
								%> 
							</td>
							<td><%= toy.getToyBrand() %></td>
							<td><%= toy.getToyPrice() %></td>
							<td><%= toy.getToyDescription() %></td>
							<td><%= toy.getToyDetails() %></td>
							<td class="controls">
								<a class="linkEdit" href="ToyController?action=deleteToy&toy_code=<%= toy.getToyCode() %>">Delete</a>
							    <a class="linkDelete" href="ToyController?action=updateToy&toy_code=<%= toy.getToyCode() %>">Update</a>
							</td>
						</tr>
					<%
					}
					%>
	                </tbody>
	            </table>
	            
	        </div>
	        <br><br>
	        
	        <a class="botao" href="ToyController?action=insertToy">Adicionar</a>
	       	<a class="botao" href="UserController?action=getAllUser">User ADM</a>
	        <a class="botao" href="CategoryController?action=getAllCategoryAdm">Category ADM</a>
	       	<a class="botao" href="UserController?action=logOut">Deslogar</a>
	        
	    </div>
	  </div>
	</div>
	<p> <% if (!(message == null)) out.print(message); %> </p>

</body>
</html>
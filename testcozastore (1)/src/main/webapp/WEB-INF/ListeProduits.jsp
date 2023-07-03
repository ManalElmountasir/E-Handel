<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
     
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap CRUD Data Table for Database with Modal Form</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




<sql:setDataSource
        var="myDS"
        driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/ecom?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"
        user="root" password="zineb123"
    />
    
    
    <sql:setDataSource
        var="myDS1"
        driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/ecom?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"
        user="root" password="zineb123"
    />
    
     <sql:query var="produit" dataSource="${myDS}">
       SELECT * FROM ecom.produit;
    </sql:query>
    
    
     <sql:query var="famille" dataSource="${myDS1}">
       SELECT * FROM ecom.famille;
    </sql:query>
    
   
  
  <body>
    <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
						<h2>Gestion des <b>Produits </b></h2>
					</div>
					<div class="col-sm-6">
						<a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Ajouter produits</span></a>
						<a href="#" class="btn " data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Liste </span></a>						
						
					</div>
                </div>
            </div>
            
            <table class="table table-striped table-hover" id="thetable">
                <thead>
                    <tr>
						<th>
							<span class="custom-checkbox">
								<input type="checkbox" id="selectAll">
								<label for="selectAll"></label>
							</span>
						</th>
						 <th>Id produit</th>
                        <th>prix par unité</th>
                        <th>nom produit</th>
						<th>Famille </th>
                      
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                
               
               
             
                <c:forEach var="produit" items="${produit.rows}">
              
                    <tr>
						<td>
							<span class="custom-checkbox">
								<input type="checkbox" id="checkbox1" name="options[]" value="1">
								<label for="checkbox1"></label>
							</span>
						</td>
						
						<td>
						<c:out value="${produit.numPro}" />
						</td>
						<td>
						<c:out value="${produit.puPro}" />
						</td>
						<td>
						<c:out value="${produit.nomPro}" />
						</td>
						<td>
						<c:out value="${produit.famPro}" />
						</td>
						
					
						
						  <%-- <td><a href="edit?id=<c:out value="${course.idCourse}" />">Edit</a> </td> --%>
						   <td><a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a></td>
						 <td>  <a href="ListeProduits?action=delete&id=<c:out value="${produit.numPro}" />">Delete</a></td>
						
						
                      
                            <!-- <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                            <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a> -->
                           <%--  <td><a href="edit?id=<%=s.getNBonCommande()%>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="delete?id=<%=s.getNBonCommande()%>">Delete</a></td>
                            <td> <a href="#editEmployeeModal" id="button1" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Ajouter Nouveau</span></a></td> --%>
           
                    </tr>
                   
				</c:forEach>
                  		
					
                </tbody>
            </table>
            
            
           	<div class="clearfix">
                <ul class="pagination">
                    <li class="page-item "><a href="ListeFamilles">Previous</a></li>
                 <%--    <% int i=0;
                    for(Bcmd s:std){%>
                    <li class="page-item"><a href="#" class="page-link"><%=i+1 %></a></li>
                    <%
                    i++;
                    }%>	 --%>
                   
                    <li class="page-item"><a href="ListeCommandes" class="page-link">Next</a></li>
                </ul>
            </div>
            
        </div>
    </div>
    
    
    
    
    
	<!-- Edit Modal HTML -->
	<div id="addEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<form name="addproduit" action="/testcozastore/ListeProduits" method="POST"  enctype="multipart/form-data">
					<div class="modal-header">						
						<h4 class="modal-title">Ajouter produit</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<div class="form-group">
						<input type="hidden" name="action" value="addproduit">
						
						
							
							<input type="hidden" name="numPro" class="form-control" >
						</div>
						<div class="form-group">
							<label>Prix par Unité</label>
							<input type="text" name="puPro" class="form-control" >
						</div>
						<div class="form-group">
							<label>Nom Produit</label>
							<input type="text" name="nomPro" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Famille Produit</label>
							
							<select name="famPro" class="form-select" aria-label="Default select example">
 
 
 
                                         <c:forEach var="row" items="${famille.rows}" varStatus="loop">
                                      <option value="<c:out value="${row.nomfam}" />"><c:out value="${row.nomfam}" /></option>
                                     </c:forEach> 
  
                                          </select>
							
					<!-- 		<input type="text" name="famPro" class="form-control" required>
 -->						
					
						<!-- Pour importer un fichier Excel -->		
						<div class="form-group">
						<input type="file" name="file" />
                       </div>	
						
					</div>
							
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
						<input type="submit" class="btn btn-info" value="Save" href="=<%request.getContextPath();%>/delete">
					</div>
				</form>
				
			</div>
		</div>
	</div>
	
	
	

	
	
	<!-- Edit Modal HTML -->
	<div id="editEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="/testcozastore/ListeProduits"  method="POST" enctype="multipart/form-data">
					<div class="modal-header">						
						<h4 class="modal-title">Modifier produit</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<div class="form-group">
						
						 <input type="hidden" name="action" value="Update">
						
						
						
							<input type="hidden" id="numPro" name="numPro" class="form-control" >
						</div>
						<div class="form-group">
							<label>Prix par Unité</label>
							<input type="text" id="puPro" name="puPro"class="form-control" >
						</div>
						<div class="form-group">
							<label>Nom Produit</label>
							<input type="text" id="nomPro" name="nomPro" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Famille Produit</label>
						
							<select name="famPro" class="form-select" aria-label="Default select example">
 
                                      
 
                                          <c:forEach var="row" items="${famille.rows}" varStatus="loop">
                                      <option value="<c:out value="${row.nomfam}" />"><c:out value="${row.nomfam}" /></option>c
                                     </c:forEach>
  
                                          </select>
							
					<!-- 		<input type="text" name="famPro" class="form-control" required>
 -->						
					
						<!-- Pour importer un fichier Excel -->		
						<div class="form-group">
						<input type="file" name="file" />
                       </div>	
						
					</div>
									
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
						<input type="submit" class="btn btn-info" value="Save" href="=<%request.getContextPath();%>/delete">
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	
	

	
	
</body>


<script type="text/javascript">
$(document).ready(function(){
	
	
	
	
	$('#thetable').find('tr').click( function(){
		
		
		
		var td = this.cells[0];  // the first <td>
		var numPro=($('td', this).eq(1).text().replace(/\s/g, ''));
		var puPro=($('td', this).eq(2).text().replace(/\s/g, ''));
		var nomPro=($('td', this).eq(3).text().replace(/\s/g, ''));
		var famPro=($('td', this).eq(4).text().replace(/\s/g, ''));

		
		 $("#numPro").val(numPro);
		 $("#puPro").val(puPro);
		 $("#nomPro").val(nomPro); 
		 $("#famPro").val(famPro); 
		});
	
	
	$('[data-toggle="tooltip"]').tooltip();
	
	
	var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function(){
		if(this.checked){
			checkbox.each(function(){opier 
				this.checked = true;                        
			});
		} else{
			checkbox.each(function(){
				this.checked = false;                        
			});
		} 
	});
	checkbox.click(function(){
		if(!this.checked){
			$("#selectAll").prop("checked", false);
		}
	});
});

</script>

<style>
  body {
        color: #566787;
		background: #f5f5f5;
		font-family: 'Varela Round', sans-serif;
		font-size: 13px;
	}
	.table-wrapper {
        background: #fff;
        padding: 20px 25px;
        margin: 30px 0;
		border-radius: 3px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
	.table-title {        
		padding-bottom: 15px;
		background: #435d7d;
		color: #fff;
		padding: 16px 30px;
		margin: -20px -25px 10px;
		border-radius: 3px 3px 0 0;
    }
    .table-title h2 {
		margin: 5px 0 0;
		font-size: 24px;
	}
	.table-title .btn-group {
		float: right;
	}
	.table-title .btn {
		color: #fff;
		float: right;
		font-size: 13px;
		border: none;
		min-width: 50px;
		border-radius: 2px;
		border: none;
		outline: none !important;
		margin-left: 10px;
	}
	.table-title .btn i {
		float: left;
		font-size: 21px;
		margin-right: 5px;
	}
	.table-title .btn span {
		float: left;
		margin-top: 2px;
	}
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
		padding: 12px 15px;
		vertical-align: middle;
    }
	table.table tr th:first-child {
		width: 60px;
	}
	table.table tr th:last-child {
		width: 100px;
	}
    table.table-striped tbody tr:nth-of-type(odd) {
    	background-color: #fcfcfc;
	}
	table.table-striped.table-hover tbody tr:hover {
		background: #f5f5f5;
	}
    table.table th i {
        font-size: 13px;
        margin: 0 5px;
        cursor: pointer;
    }	
    table.table td:last-child i {
		opacity: 0.9;
		font-size: 22px;
        margin: 0 5px;
    }
	table.table td a {
		font-weight: bold;
		color: #566787;
		display: inline-block;
		text-decoration: none;
		outline: none !important;
	}
	table.table td a:hover {
		color: #2196F3;
	}
	table.table td a.edit {
        color: #FFC107;
    }
    table.table td a.delete {
        color: #F44336;
    }
    table.table td i {
        font-size: 19px;
    }
	table.table .avatar {
		border-radius: 50%;
		vertical-align: middle;
		margin-right: 10px;
	}
    .pagination {
        float: right;
        margin: 0 0 5px;
    }
    .pagination li a {
        border: none;
        font-size: 13px;
        min-width: 30px;
        min-height: 30px;
        color: #999;
        margin: 0 2px;
        line-height: 30px;
        border-radius: 2px !important;
        text-align: center;
        padding: 0 6px;
    }
    .pagination li a:hover {
        color: #666;
    }	
    .pagination li.active a, .pagination li.active a.page-link {
        background: #03A9F4;
    }
    .pagination li.active a:hover {        
        background: #0397d6;
    }
	.pagination li.disabled i {
        color: #ccc;
    }
    .pagination li i {
        font-size: 16px;
        padding-top: 6px
    }
    .hint-text {
        float: left;
        margin-top: 10px;
        font-size: 13px;
    }    
	/* Custom checkbox */
	.custom-checkbox {
		position: relative;
	}
	.custom-checkbox input[type="checkbox"] {    
		opacity: 0;
		position: absolute;
		margin: 5px 0 0 3px;
		z-index: 9;
	}
	.custom-checkbox label:before{
		width: 18px;
		height: 18px;
	}
	.custom-checkbox label:before {
		content: '';
		margin-right: 10px;
		display: inline-block;
		vertical-align: text-top;
		background: white;
		border: 1px solid #bbb;
		border-radius: 2px;
		box-sizing: border-box;
		z-index: 2;
	}
	.custom-checkbox input[type="checkbox"]:checked + label:after {
		content: '';
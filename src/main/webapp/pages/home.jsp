<%@page import="com.practice.model.Note"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">


<title>Notes</title>
</head>
<body>

	<div class="container">
		<div class="row mt-5">
			<!-- 1st Column / Menu Column -->
			<div class="col-md-2">
				<div class="list-group">
					<button type="button"
						class="list-group-item list-group-item-action active">Options</button>
					<a href="<c:url value = '/home'></c:url>"
						class="list-group-item list-group-item-action">Add Note</a> <a
						href="<c:url value = '/viewlist'></c:url>"
						class="list-group-item list-group-item-action">Notes List</a>
				</div>
			</div>


			<%
				if (request.getAttribute("page").equals("home")) {
			%>

			<!-- 1st Column / List or add Column -->
			<div class="col mx-auto">
				<h2 class="text-center">ADD NOTE</h2>
				<br />
				<form:form action="saveNotes" method="post" modelAttribute="note">
					<div class="form-group">
						<form:input path="title" cssClass="form-control"
							placeholder="Enter Title of your note" />
					</div>
 
					<div class="form-group">
						<form:textarea path="content" cssClass="form-control"
							placeholder="Briefly Enter details of note"
							cssStyle="height:200px" />
					</div>

					<div class="container text-center">
						<button type="submit" class="btn btn-primary">Add Note</button>
					</div>

				</form:form>
			</div>
			<%
				}
			%>

			<%
				if (request.getAttribute("page").equals("viewlist")) {
					List<Note> result = (List<Note>) request.getAttribute("notes");
			%>
			<div class="col mx-auto">
				<h2 class="text-center">NOTES LIST</h2>

				<%
					for (Note n : result) {
				%>

				<div class="card">
					<div class="card-header"><%= n.getTitle()%></div>
					<div class="card-body">
						<blockquote class="blockquote mb-0">
							<p><%= n.getContent()%></p>
						</blockquote>
					</div>
				</div>
				<br/>

				<%
					}
				%>

			</div>
			<%
				}
			%>


		</div>
	</div>

</body>
</html>
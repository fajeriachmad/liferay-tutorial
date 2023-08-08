<%@include file="../init.jsp"%>
<%
	long guestbookId = Long.valueOf((Long) renderRequest.getAttribute("guestbookId"));
%>

<!-- Route Config Start -->
<aui:button-row cssClass="guestbook-buttons">
	<portlet:renderURL var="addEntryURL">
		<portlet:param name="mvcPath"
			value="/guestbookwebportlet/edit_entry.jsp" />
		<portlet:param name="guestbookId"
			value="<%=String.valueOf(guestbookId)%>" />
	</portlet:renderURL>
	<aui:button onClick="<%=addEntryURL.toString()%>" value="Add Entry"></aui:button>
</aui:button-row>
<!-- Route Config End -->

<!-- Content Start -->
<table class="table table-striped table-hover table-bordered">
	<thead class="table-dark">
		<tr>
			<th class="w-40">Name</th>
			<th class="w-40">Message</th>
			<th class="">Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${entryList}" var="e">

			<!-- Update Param Config -->
			<portlet:renderURL var="addEntryURL">
				<portlet:param name="mvcPath"
					value="/guestbookwebportlet/edit_entry.jsp" />
				<portlet:param name="entryId" value="${e.entryId}" />
			</portlet:renderURL>

			<!-- Delete Param Config -->
			<portlet:actionURL name="deleteEntry" var="deleteEntryActionURL">
				<portlet:param name="entryId" value="${e.entryId}" />
			</portlet:actionURL>

			<tr>
				<td>${e.name}</td>
				<td>${e.message}</td>
				<td>
					<a href="<%= addEntryURL %>" class="btn btn-warning">Edit</a>
					<a href="<%= deleteEntryActionURL %>" class="btn btn-danger">Delete</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<!-- Content End -->

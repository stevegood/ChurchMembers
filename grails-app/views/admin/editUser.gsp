<%@ page import="org.stevegood.user.User" %>
<%@ page import="org.stevegood.user.Role" %>

<html>
	<head>
		<title>Admin - Edit User - ${user}</title>
		<meta name="layout" content="main" />
	</head>
	<body>
		
		<div id="content">
			<g:form action="saveUser">
				<g:hiddenField name="id" value="${user?.id}" />
				<g:hiddenField name="version" value="${user?.version}" />
				
				<div class="post">
					<h2>Edit User</h2>
					<ul>
						<li class="value ${hasErrors(bean: user, field: 'username', 'errors')}">
							<label for="username"><g:message code="user.username.label" default="Username" /></label>
							<g:textField name="username" value="${user?.username}" />
						</li>
					</ul>
				</div>
				<g:if test="${ isCurrentUser }">
					<g:render template="/user/changePasswordFields" />
				</g:if>
				<div class="post">
					<h2>Roles</h2>
					<ul>
						<g:if test="${ !isCurrentUser }">
							<g:each in="${roleList}" var="role">
								<li>
									<g:checkBox name="selectedRole" value="${ role.authority }" checked="${ user.getAuthorities().contains(role) }" />
									<label class="inline" for="${ role.authority }">${role}</label>
								</li>
							</g:each>
						</g:if>
						<g:else>
							<g:each in="${ user.getAuthorities().sort{ it.label } }" var="role">
								<li>${role.label}</li>
							</g:each>
						</g:else>
					</ul>
				</div>
				<div class="post">
					<h2>Access</h2>
					<ul>
						<li>
							<g:if test="${ !isCurrentUser }">
								<g:checkBox name="enabled" value="${true}" checked="${ user.enabled }" />
								<label class="inline">Enabled</label>
							</g:if>
							<g:else>
								${ user.enabled ? "Enabled" : "Disabled" }
							</g:else>
						</li>
					</ul>
					<div class="buttons">
						<span class="button">
							<g:submitButton name="update" value="Save User" class="save" />
						</span>
					</div>
				</div>
			</g:form>
			<g:if test="${ member }">
				<div class="post">
					<h2>Linked Member Details</h2>
					<g:render template="/member/details" />
				</div>
			</g:if>
		</div>
		
		<div id="sidebar">
			<g:render template="/admin/adminMenu" />
			<ul>
				<li>
					<h2>Linked Member</h2>
					<ul>
						<li>
							<g:if test="${ member }">
								<g:link action="unlinkMember" params="[userid:user.id]">Unlink Member Info</g:link>
							</g:if>
							<g:else>
								<g:form action="linkMember">
									<g:hiddenField name="userid" value="${ user.id }" />
									<g:render template="/user/linkMemberFormFields" />
								</g:form>
							</g:else>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		
	</body>
</html>
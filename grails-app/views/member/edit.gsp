

<%@ page import="org.stevegood.member.Member" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'member.label', default: 'Member')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${memberInstance}">
            <div class="errors">
                <g:renderErrors bean="${memberInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${memberInstance?.id}" />
                <g:hiddenField name="version" value="${memberInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="firstName"><g:message code="member.firstName.label" default="First Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: memberInstance, field: 'firstName', 'errors')}">
                                    <g:textField name="firstName" value="${memberInstance?.firstName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastName"><g:message code="member.lastName.label" default="Last Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: memberInstance, field: 'lastName', 'errors')}">
                                    <g:textField name="lastName" value="${memberInstance?.lastName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="email"><g:message code="member.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: memberInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${memberInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="gender"><g:message code="member.gender.label" default="Gender" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: memberInstance, field: 'gender', 'errors')}">
                                    <g:select name="gender" from="${org.stevegood.member.Gender?.values()}" keys="${org.stevegood.member.Gender?.values()*.name()}" value="${memberInstance?.gender?.name()}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="addresses"><g:message code="member.addresses.label" default="Addresses" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: memberInstance, field: 'addresses', 'errors')}">
                                    <g:select name="addresses" from="${org.stevegood.Address.list()}" multiple="yes" optionKey="id" size="5" value="${memberInstance?.addresses*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dob"><g:message code="member.dob.label" default="Dob" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: memberInstance, field: 'dob', 'errors')}">
                                    <g:datePicker name="dob" precision="day" value="${memberInstance?.dob}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="phones"><g:message code="member.phones.label" default="Phones" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: memberInstance, field: 'phones', 'errors')}">
                                    <g:select name="phones" from="${org.stevegood.Phone.list()}" multiple="yes" optionKey="id" size="5" value="${memberInstance?.phones*.id}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SUPER_USER">
						<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
					</sec:ifAnyGranted>
                </div>
            </g:form>
        </div>
    </body>
</html>

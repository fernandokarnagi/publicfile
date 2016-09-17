Here are the list of Change Requests.<br/>

<#assign DDLRecordLocalService = serviceLocator.findService("com.liferay.portlet.dynamicdatalists.service.DDLRecordLocalService")>

<#assign groupService = serviceLocator.findService("com.liferay.portal.service.GroupService")>

<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutLocalService")>

<#assign records = DDLRecordLocalService.getRecords(reserved_record_set_id)>

<table width="100%" class="responstable">
    <thead>
    <tr>
        <th>Change Request #</th>
        <th>Requester</th>
        <th>Date</th>
        <th>Email ID</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
<#if records?has_content>
    <#list records as cur_record>
        <tr>
            <td align="center">${cur_record.getFieldValue("Change_Request_ID", locale)}</td>
            <td align="center">${cur_record.getFieldValue("Requester_Name", locale)}</td>
            <td align="center"><#assign Date5421_DateObj = cur_record.getFieldValue("Date5421", locale)>

	<#if (Date5421_DateObj?has_content)>
		${dateUtil.getDate(Date5421_DateObj, "dd MMM yyyy", locale)}
	</#if></td>
            <td align="center">${cur_record.getFieldValue("Email_ID", locale)}</td>
            <td>
            <#assign portletActionURL = portletURLFactory.create(request,"169_INSTANCE_GX5yZperCZlx",themeDisplay.getPlid(), "RENDER_PHASE")>
            ${portletActionURL.setParameter("recordId", "${cur_record.getRecordId()}")}
        ${portletActionURL.setParameter("struts_action", "/dynamic_data_list_display/view_record")}
        ${portletActionURL.setParameter("redirect", "${themeDisplay.getPortalURL()}${themeDisplay.getURLCurrent()}")}

        
        <a href="${portletActionURL}">View</a>
</td>
        </tr>
    </#list>
</#if>
</tbody>
</table>

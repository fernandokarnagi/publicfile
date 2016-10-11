<style type="text/css">

.paging-nav {
  text-align: right;
  padding-top: 2px;
}

.paging-nav a {
  margin: auto 1px;
  text-decoration: none;
  display: inline-block;
  padding: 1px 7px;
  background: #91b9e6;
  color: white;
  border-radius: 3px;
}

.paging-nav .selected-page {
  background: #187ed5;
  font-weight: bold;
}

.paging-nav,
#tableData {
  width: 100%;
  margin: 0 auto;
}
</style>

Here are the list of Change Requests.<br/>

<#assign DDLRecordLocalService = serviceLocator.findService("com.liferay.portlet.dynamicdatalists.service.DDLRecordLocalService")>

<#assign groupService = serviceLocator.findService("com.liferay.portal.service.GroupService")>

<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.service.LayoutLocalService")>

<#assign records = DDLRecordLocalService.getRecords(reserved_record_set_id)>

<table id="tableData" class="table table-bordered table-striped">
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


<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> 
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://mizuho.ctcdemo.com.sg/paging.js"></script> 
<script type="text/javascript">
            $(document).ready(function() {
                $('#tableData').paging({limit:5});
            });
        </script>

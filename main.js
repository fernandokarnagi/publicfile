AUI().ready(
	'liferay-hudcrumbs', 'liferay-navigation-interaction', 'liferay-sign-in-modal',
	function(A) {
		var navigation = A.one('#navigation');

		if (navigation) {
			navigation.plug(Liferay.NavigationInteraction);
		}

		var siteBreadcrumbs = A.one('#breadcrumbs');

		if (siteBreadcrumbs) {
			siteBreadcrumbs.plug(A.Hudcrumbs);
		}

		var signIn = A.one('li.sign-in a');

		if (signIn && signIn.getData('redirect') !== 'true') {
			signIn.plug(Liferay.SignInModal);
		}
	}
);

function onclickSearch() {
	var url = '/search?p_p_id=3&p_p_lifecycle=0&p_p_state=maximized&p_p_mode=view&p_p_col_id=column-1&p_p_col_count=1&_3_struts_action=%2Fsearch%2Fsearch&_3_redirect=%2Fsearch&_3_keywords='+document.getElementById('search').value+'&_3_groupId=0';
	location.href=url;
}
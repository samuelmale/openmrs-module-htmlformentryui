<%
    ui.decorateWith("appui", "standardEmrPage")

    def breadcrumbMiddle = breadcrumbOverride ?: """
        [ { label: "${ ui.escapeJs(ui.format(patient.familyName)) }, ${ ui.escapeJs(ui.format(patient.givenName)) }" , link: '${returnUrl}'} ]
    """
%>

<script type="text/javascript">
    var breadcrumbs = _.flatten([
        { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
        ${ breadcrumbMiddle },
        { label: "${ ui.escapeJs(ui.format(htmlForm.form)) }" }
    ]);

    jq(function() {
        jq('.cancel').click(htmlForm.cancel);
    });
</script>

${ ui.includeFragment("coreapps", "patientHeader", [ patient: patient ]) }

${ ui.includeFragment("htmlformentryui", "htmlform/enterHtmlForm", [
        patient: patient,
        htmlForm: htmlForm,
        visit: visit,
        returnUrl: returnUrl
]) }
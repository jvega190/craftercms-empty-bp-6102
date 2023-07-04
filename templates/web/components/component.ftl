<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div>
    <div style="border: 1px solid; padding: 5px; margin-bottom: 5px;">
        <@crafter.h3 $field="title_s">${contentModel.title_s!"not-set"}</@crafter.h3>
        <@crafter.p $field="body_html">${contentModel.body_html!"not-set"}</@crafter.p>
    </div>
</@crafter.div>
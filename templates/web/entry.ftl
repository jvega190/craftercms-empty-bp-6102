<#import "/templates/system/common/crafter.ftl" as crafter />

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>${model.title_t}</title>
		<style>
			html, body {
				color: #333;
				height: 100%;
				background: #f3f3f3;
				font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
			}
			main {
				max-width: 800px;
				padding: 40px;
				background: rgba(255,255,255,0.6);
				border-radius: 20px;
				margin: 100px auto;
			}
		</style>
		<@crafter.head/>
	</head>
	<body>
		<@crafter.body_top/>
		<main>
			<@crafter.h1 $field="title_t">${model.title_t}</@crafter.h1>
			<@crafter.div $field="body_html">${model.body_html}</@crafter.div>

			<br /><br />
			<h2>List of files:</h2>
			<@crafter.ul $field="files_o">
			<#list contentModel.files_o.item as file>
				<#assign index = file?index />
            	<@crafter.li $field="files_o" $index=index>
					${file.key}
				</@crafter.li>
            </#list>
			</@crafter.ul>

			<br /><br />
			<h2>List of scripts:</h2>
			<@crafter.ul $field="scripts_o">
				<#list contentModel.scripts_o.item as script>
					<#assign index = script?index />
					<@crafter.li $field="scripts_o" $index=index>
						${script.key}
					</@crafter.li>
				</#list>
			</@crafter.ul>

			<br /><br />
			<h2>Components:</h2>
			<@crafter.renderComponentCollection $field="components_o" />

			<br /><br />
			<h2>Simple repeating group:</h2>
			<@crafter.renderRepeatGroup
				$field="repGroupSimple_o"
				$containerTag="ul"
				$itemTag="li";
				item, index
			>
				<@crafter.p $field="repGroupSimple_o.title_s" $index=index>${item.title_s}</@crafter.p>
			</@crafter.renderRepeatGroup>

			<br /><br />
			<h2>Components repeating group:</h2>
			<@crafter.renderRepeatGroup
				$field="repGroupComponents_o"
				$containerTag="ul"
				$itemTag="li";
				item, index
			>
				<@crafter.renderComponentCollection
					$field="repGroupComponents_o.component_o"
					$collection=item.component_o!
					$indexCarryover=index
				/>
			</@crafter.renderRepeatGroup>
		</main>
		<@crafter.body_bottom/>
	</body>
</html>

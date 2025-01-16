<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:html="http://www.w3.org/1999/xhtml"
	xmlns:xo="http://panax.io/xover"
	xmlns:state="http://panax.io/state"
	xmlns:searchParams="http://panax.io/site/searchParams"
	xmlns:selected="http://panax.io/state/selected"
	xmlns:wizard="http://widgets.panax.io/wizard"
	xmlns:fixed="http://panax.io/state/fixed"
	xmlns:container="http://panax.io/containers"
>

	<xsl:import href="headers.xslt"/>

	<xsl:key name="field" match="model/freights/row/grower_in_load/row/@*[namespace-uri()='']" use="1"/>
	
	<xsl:param name="title">Growers in Load</xsl:param>



	<xsl:template match="/*">
		<!--<xsl:param name="active" select="1"/>-->
		<div class="card" >
			<div class="card-body">
				<h5 class="card-title fw-semibold">
					<xsl:value-of select="$title" disable-output-escaping="yes"/>
					<!--<xsl:apply-templates mode="step.panel.legend" select="."/>-->
				</h5>
				<div class="card-body">
					<form>
						<h3>dsdds</h3>
					</form>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template mode="form_content" match="key('field','1')">
		<div>
			<!--<xsl:apply-templates mode="field" select="current()"/>-->
			<!--<xsl:apply-templates mode="field" select="current()"/>-->

		</div>
	</xsl:template>


</xsl:stylesheet>
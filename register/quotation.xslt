<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xo="http://panax.io/xover"
xmlns:menu="http://xover.dev/widgets/menu"
xmlns:site="http://panax.io/site"
xmlns="http://www.w3.org/1999/xhtml"
xmlns:state="http://panax.io/state"
xmlns:navbar="http://widgets.panaxbi.com/navbar"
xmlns:widget="http://panax.io/widget" 
>

	<xsl:import href="headers_registrarviajes.xslt"/>

	<xsl:template match="/">
		<div class="card-body">
			<h5 class="card-title fw-semibold"> Freight quotation</h5>
			<div class="card-body">
				<form>
					<xsl:apply-templates mode="widget_form" select="."/>
				</form>
			</div>
		</div>
	</xsl:template>


	<xsl:template mode="widget_form" match="*|@*">
		<div class="row">
			<div class="col-sm-12 col-lg-12">
				<div class="mb-3">
					<label class="form-label">Currency</label>
					<xsl:apply-templates mode="widget_input_text" select="."/>
				</div>
				<div class="mb-3">
					<label class="form-label">Base Freight</label>
					<xsl:apply-templates mode="widget_input_text" select="."/>
				</div>
				<div class="mb-3">
					<label class="form-label">Pick-Up</label>
					<xsl:apply-templates mode="widget_input_text" select="."/>
				</div>
				<div class="mb-3">
					<label class="form-label">Unload</label>
					<xsl:apply-templates mode="widget_input_text" select="."/>
				</div>
				<div class="mb-3">
					<label class="form-label">Total quote</label>
					<xsl:apply-templates mode="widget_input_text" select="."/>
				</div>
				<div class="mb-3">
					<label class="form-label">IVA</label>
					<xsl:apply-templates mode="widget_input_text" select="."/>
				</div>
			</div>
		</div>
	</xsl:template>







</xsl:stylesheet>
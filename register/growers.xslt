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
			<h5 class="card-title fw-semibold">Growers in Load</h5>
			<div class="card-body">
				<form>
					<xsl:apply-templates mode="widget_form" select="."/>
				</form>
			</div>
		</div>
	</xsl:template>



	<xsl:template mode="widget_form" match="*|@*">
		<div class="row">
			<div class="col-xl-12">
				<div class="d-sm-flex justify-content-end">
					<div class="d-flex mb-3">
						<a class="btn btn-primary" onclick="myFunction()">Add Growers</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row border-bottom mt-3 mb-2">
			<div class="col-sm-4">
				<div class="mb-3">
					<label class="form-label">Vendor code</label>
					<xsl:apply-templates mode="widget_select" select="vendor"/>
				</div>
				<div class="mb-3">
					<label class="form-label">Product Type Code</label>
					<xsl:apply-templates mode="widget_select" select="product_type"/>
				</div>

			</div>
			<div class="col-sm-4">
				<div class="mb-3">
					<label class="form-label">Vendor name</label>
					<xsl:apply-templates mode="widget_input_text" select="."/>
				</div>
				<div class="mb-3">
					<label class="form-label">Product Type</label>
					<xsl:apply-templates mode="widget_input_text" select="."/>

				</div>
			</div>
			<div class="col-sm-4">
				<div class="mb-3">
					<label class="form-label">Pallets</label>
					<xsl:apply-templates mode="widget_input_text" select="."/>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12 d-flex justify-content-end">
				<div class="col-md-4 col-width mt-3">
					<div class="mb-3">
						<label class="form-label">Total Pallets </label>
						<xsl:apply-templates mode="widget_input_text" select="."/>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>






</xsl:stylesheet>
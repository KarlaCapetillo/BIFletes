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
				<h5 class="card-title fw-semibold"> Freight Information</h5>
				<div class="card-body">
					<form>
						<xsl:apply-templates mode="widget_form" select="."/>
					</form>
				</div>
			</div>		
	</xsl:template>

	

	<xsl:template mode="widget_form" match="*|@*">
		<div class="col-sm-12 col-lg-12">
			<div class="mb-3">
				<label class="form-label">Vendor code</label>			
				<xsl:apply-templates mode="widget_select" select="vendor"/>
			</div>			
		</div>
		<div class="col-sm-12 col-lg-12">
			<div class="mb-3">
				<label class="form-label">Vendor name</label>
				<xsl:apply-templates mode="widget_input_text" select="."/>
			</div>
		</div>
		<div class="col-sm-12 col-lg-12">
			<div class="mb-3">
				<label class="form-label">Trailer</label>
				<xsl:apply-templates mode="widget_input_text" select="."/>
			</div>
		</div>
		<div class="col-sm-12 col-lg-12">
			<div class="mb-3">
				<label class="form-label">Border code</label>
				<xsl:apply-templates mode="widget_input_text" select="."/>
			</div>
		</div>
		<div class="col-sm-12 col-lg-12">
			<div class="mb-3">
				<label class="form-label">Border name</label>
				<xsl:apply-templates mode="widget_input_text" select="."/>
			</div>
		</div>
		<div class="col-sm-12 col-lg-12">
			<div class="mb-3">
				<label class="form-label">Starting Point</label>
				<xsl:apply-templates mode="widget_input_text" select="."/>
			</div>
		</div>
		<div class="col-sm-12 col-lg-12">
			<div class="mb-3">
				<label class="form-label">Ending Point</label>
				<xsl:apply-templates mode="widget_input_text" select="."/>
			</div>
		</div>
		<div class="col-sm-12 col-lg-12">
			<div class="mb-3">
				<label class="form-label">Associated Freight</label>
				<textarea class="form-control" rows="3"></textarea>
			</div>
		</div>
	</xsl:template>


</xsl:stylesheet>
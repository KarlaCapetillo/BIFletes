<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xo="http://panax.io/xover"
xmlns:menu="http://xover.dev/widgets/menu"
xmlns:site="http://panax.io/site"
xmlns="http://www.w3.org/1999/xhtml"
xmlns:state="http://panax.io/state"
xmlns:navbar="http://widgets.panaxbi.com/navbar"
xmlns:widget="http://panax.io/widget" 
				xmlns:globalization="http://xover.dev/globalization"
>	
	
	<xsl:import href="headers_registrarviajes.xslt"/>
	
	
	<xsl:key name="headerTextLabel" match="model/freight_type" use="1"/>
	<xsl:key name="headerTextLabel" match="model/freight_date" use="2"/>
	<xsl:key name="headerTextLabel" match="model/special_credit" use="3"/>
	<xsl:key name="headerTextLabel" match="model/vendor" use="4"/>
	<xsl:key name="headerTextLabel" match="model/vendor_name" use="5"/>
	<xsl:key name="headerTextLabel" match="model/trailer" use="6"/>
	<xsl:key name="headerTextLabel" match="model/border" use="7"/>
	<xsl:key name="headerTextLabel" match="model/border_name" use="8"/>
	<xsl:key name="headerTextLabel" match="model/start_point" use="9"/>
	<xsl:key name="headerTextLabel" match="model/end_point" use="10"/>
	<xsl:key name="headerTextLabel" match="model/associated" use="11"/>
	
	<xsl:key name="state:selected" match="model/freight_type/row[@id=../@state:selected]/@desc" use="generate-id()"/>

	<xsl:template match="/">
		<form>
			Freight information
			<xsl:apply-templates mode="widget_form" select="."/>
		</form>		
	</xsl:template>

	<xsl:template mode="widget_input_date" match="*">
		<input class="form-control" name="freight_date" type="date" pattern="yyyy-mm-dd" xo-slot="state:freight_date" value=""/>
	</xsl:template>

	<xsl:template mode="widget_input_text" match="*">
		<input class="form-control" name="{name()}" type="text" xo-slot="state:freight_date" value=""/>
	</xsl:template>
	
	<xsl:template mode="widget_select" match="*">
		<select name="{name()}" class="form-select" xo-scope="{@xo:id}" xo-slot="state:selected">
			<option value="">Selecciona una opción</option>
			<xsl:for-each select="row/@desc">
				<xsl:variable name="value" select="../@id"/>
				<xsl:variable name="desc" select="translate(.,'*','')"/>
				<xsl:variable name="state:selected" select="key('state:selected',generate-id())"/>
				<option value="{$value}">
					<xsl:if test="$state:selected">
						<xsl:attribute name="selected"/>
					</xsl:if>
					<xsl:value-of select="$desc"/>
				</option>
			</xsl:for-each>
		</select>
	</xsl:template>
			
	<xsl:template mode="widget_form" match="*|@*">
		<h4 class="mb-3">Registrar viajes</h4>
		<div class="col-sm-12 col-lg-12">
			<div class="mb-3">
				<label class="form-label">
					<xsl:apply-templates mode="headerText" select="key('headerTextLabel','1')"/>
				</label>
					<xsl:value-of select="."/>
				<xsl:apply-templates mode="widget_select" select="freight_type"/>
			</div>
			<div class="mb-3">
				<label class="form-label">
					<xsl:apply-templates mode="headerText" select="key('headerTextLabel','2')"/>
				</label>
				<xsl:apply-templates mode="widget_input_date" select="."/>
			</div>
			<div class="mb-3">
				<label class="form-label">
					<xsl:apply-templates mode="headerText" select="key('headerTextLabel','3')"/>
				</label>
				<xsl:apply-templates mode="widget_input_date" select="."/>
			</div>
		</div>
	
			<hr class="my-4"></hr>
	
		<h4 class="mb-3">Freight Information</h4>
		<div class="col-sm-12 col-lg-12">
			<div class="mb-3">
				<label class="form-label">
					<xsl:apply-templates mode="headerText" select="key('headerTextLabel','4')"/>
				</label>
				<xsl:apply-templates mode="widget_select" select="vendor"/>
			</div>
			<div class="mb-3">
				<label class="form-label">
					<xsl:apply-templates mode="headerText" select="key('headerTextLabel','5')"/>
				</label>
				<xsl:apply-templates mode="widget_input_text" select="."/>
			</div>
			<div class="mb-3">
				<label class="form-label">
					<xsl:apply-templates mode="headerText" select="key('headerTextLabel','6')"/>
				</label>
				<xsl:apply-templates mode="widget_input_text" select="."/>
			</div>
			<div class="mb-3">
				<label class="form-label">
					<xsl:apply-templates mode="headerText" select="key('headerTextLabel','7')"/>
				</label>
				<xsl:apply-templates mode="widget_select" select="border"/>
			</div>
			<div class="mb-3">
				<label class="form-label">
					<xsl:apply-templates mode="headerText" select="key('headerTextLabel','8')"/>
				</label>
				<xsl:apply-templates mode="widget_input_text" select="."/>
			</div>
			<div class="mb-3">
				<label class="form-label">
					<xsl:apply-templates mode="headerText" select="key('headerTextLabel','9')"/>
				</label>
				<xsl:apply-templates mode="widget_input_text" select="."/>
			</div>
			<div class="mb-3">
				<label class="form-label">
					<xsl:apply-templates mode="headerText" select="key('headerTextLabel','10')"/>
				</label>
				<xsl:apply-templates mode="widget_input_text" select="."/>
			</div>
			<div class="mb-3">
				<label class="form-label">
					<xsl:apply-templates mode="headerText" select="key('headerTextLabel','11')"/>
				</label>
				<xsl:apply-templates mode="widget_input_text" select="."/>
			</div>
		</div>
	</xsl:template>

	
	
	
	

	<!--<xsl:template match="model/vendor" mode="widget">
		<div class="col-sm-12 col-lg-12">
			<div class="mb-3">
				<label class="form-label">
					Vendor code
				</label>
				<xsl:apply-templates mode="widget_select" select="."/>
			</div>
			<div class="mb-3">
				<label class="form-label">
					Vendor name
				</label>
				<xsl:apply-templates mode="widget_input_date" select="."/>
			</div>
			<div class="mb-3">
				<label class="form-label">
					Trailer
				</label>
				<xsl:apply-templates mode="widget_input_text" select="."/>
			</div>
			<div class="mb-3">
				<label class="form-label">
					Border code
				</label>
				<xsl:apply-templates mode="widget_select" select="../border"/>
			</div>
			<div class="mb-3">
				<label class="form-label">
					Starting Point
				</label>
				<xsl:apply-templates mode="widget_select" select="../start_point"/>
			</div>
			<div class="mb-3">
				<label class="form-label">
					Ending Point
				</label>
				<xsl:apply-templates mode="widget_select" select="../end_point"/>
			</div>
			<div class="mb-3">
				<label class="form-label">
					Associated Freight
				</label>
				<xsl:apply-templates mode="widget_input_text" select="."/>
			</div>
		</div>
	
		<button class="btn btn-success" onclick="xo.server.applyPermissions(scope.ownerDocument).then(()=>xover.stores.active.fetch())">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-floppy" viewBox="0 0 16 16">
								<path d="M11 2H9v3h2z"/>
								<path d="M1.5 0h11.586a1.5 1.5 0 0 1 1.06.44l1.415 1.414A1.5 1.5 0 0 1 16 2.914V14.5a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 14.5v-13A1.5 1.5 0 0 1 1.5 0M1 1.5v13a.5.5 0 0 0 .5.5H2v-4.5A1.5 1.5 0 0 1 3.5 9h9a1.5 1.5 0 0 1 1.5 1.5V15h.5a.5.5 0 0 0 .5-.5V2.914a.5.5 0 0 0-.146-.353l-1.415-1.415A.5.5 0 0 0 13.086 1H13v4.5A1.5 1.5 0 0 1 11.5 7h-7A1.5 1.5 0 0 1 3 5.5V1H1.5a.5.5 0 0 0-.5.5m3 4a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 .5-.5V1H4zM3 15h10v-4.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5z"/>
							</svg>
							Guardar cambios
		</button>
	</xsl:template>-->
	



</xsl:stylesheet>
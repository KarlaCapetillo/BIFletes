<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xo="http://panax.io/xover"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:globalization="http://xover.dev/globalization"
  exclude-result-prefixes="xo xsl globalization"
  xmlns:state="http://panax.io/state"
>


	<xsl:key name="state:selected" match="model/freight_type/row[@id=../@state:selected]/@desc" use="generate-id()"/>

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


	<xsl:template mode="headerText" match="key('headerTextLabel','1')">
		<xsl:text>Freight Type</xsl:text>
	</xsl:template>

	<xsl:template mode="headerText" match="key('headerTextLabel','2')">
		<xsl:text>Freight Date</xsl:text>
	</xsl:template>
	
	<xsl:template mode="headerText" match="key('headerTextLabel','3')">
		<xsl:text>Special Credit Terms</xsl:text>
	</xsl:template>

	<xsl:template mode="headerText" match="key('headerTextLabel','4')">
		<xsl:text>Vendor code</xsl:text>
	</xsl:template>

	<xsl:template mode="headerText" match="key('headerTextLabel','5')">
		<xsl:text>Vendor name</xsl:text>
	</xsl:template>

	<xsl:template mode="headerText" match="key('headerTextLabel','6')">
		<xsl:text>Trailer</xsl:text>
	</xsl:template>

	<xsl:template mode="headerText" match="key('headerTextLabel','7')">
		<xsl:text>Border Code</xsl:text>
	</xsl:template>

	<xsl:template mode="headerText" match="key('headerTextLabel','8')">
		<xsl:text>Border Name</xsl:text>
	</xsl:template>

	<xsl:template mode="headerText" match="key('headerTextLabel','9')">
		<xsl:text>Starting Point</xsl:text>
	</xsl:template>

	<xsl:template mode="headerText" match="key('headerTextLabel','10')">
		<xsl:text>Ending Point</xsl:text>
	</xsl:template>

	<xsl:template mode="headerText" match="key('headerTextLabel','11')">
		<xsl:text>Associated Freight</xsl:text>
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


</xsl:stylesheet>
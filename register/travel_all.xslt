<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xo="http://panax.io/xover"
xmlns:menu="http://xover.dev/widgets/menu"
xmlns:site="http://panax.io/site"
xmlns="http://www.w3.org/1999/xhtml"
xmlns:state="http://panax.io/state"
xmlns:navbar="http://widgets.panaxbi.com/navbar"
xmlns:widget="http://panax.io/widget" 
xmlns:datagrid="http://widgets.panaxbi.com/datagrid"
>

	<xsl:import href="headers.xslt"/>

	<xsl:key name="field" match="model/freights/row/@*[namespace-uri()=''][not(name()='id_freight')][not(name()='freight_type')][not(name()='freight_date')][not(name()='freight_code')][not(name()='special_credit_terms')][not(name()='currency')][not(name()='base_freight')][not(name()='pickup')][not(name()='unload')][not(name()='total_quote')][not(name()='iva')]" use="1"/>
	<xsl:key name="field" match="model/freights/row/*/*/@*[namespace-uri()='']" use="2"/>

	<xsl:key name="hidden" match="model/freights/row/@id" use="generate-id()"/>
	<xsl:key name="readonly" match="model/freights/row/@id" use="generate-id()"/>

	<xsl:key name="control" match="model/*[row][count(row)&gt;=6]" use="'select'"/>
	<xsl:key name="control" match="model/*[row][count(row)&lt;6]" use="'radio'"/>

	<xsl:key name="type" use="'money'" match="@base_freight"/>

	<xsl:key name="dim" match="/*/*" use="name()"/>

	<xsl:param name="title">Todos los viajes</xsl:param>



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
						<xsl:apply-templates mode="form_content" select="key('field','1')"/>
					</form>
				</div>
			</div>
		</div>
	</xsl:template>


	<!--<xsl:template match="*|@*" mode="form_panel">
		<xsl:param name="step-number">1</xsl:param>
		<div>
			<xsl:apply-templates mode="form_content" select=".">
				<xsl:with-param name="step-number" select="$step-number"/>
			</xsl:apply-templates>
		</div>
	</xsl:template>-->



	<xsl:template mode="form_content" match="key('field','1')">
		<xsl:param name="step-number" select="0"/>
		<xsl:param name="items" select="key('field',$step-number)[not(key('hidden', generate-id()))]"/>
		<div>
			<!--<xsl:apply-templates mode="field" select="current()"/>-->
			<xsl:apply-templates mode="field" select="current()[not(key('hidden', $step-number)[name()=name(current())])]">
				<xsl:with-param name="step-number" select="$step-number"/>
			</xsl:apply-templates>

		</div>
	</xsl:template>

	<xsl:template mode="form_content"  match="*" priority="-1">
		<form>
			<p>No hay nada que mostrar.</p>
		</form>
	</xsl:template>

	<!--<xsl:template match="*|@*" mode="step-title-legend" priority="-10"/>

	<xsl:template match="*|@*" mode="step.panel.legend" priority="-10">
		<xsl:param name="step-number" select="count(preceding-sibling::*|self::*)"/>
		<xsl:apply-templates mode="step-title-legend" select=".">
			<xsl:with-param name="step-number" select="$step-number"/>
		</xsl:apply-templates>
	</xsl:template>-->



	<xsl:template mode="field" match="@*">
		<xsl:param name="step-number"></xsl:param>
		<xsl:variable name="headerText">
			<xsl:apply-templates mode="headerText" select="."></xsl:apply-templates>
		</xsl:variable>
		<div class="row mb-3" xo-slot="{name()}">
			<label for="{@name}" class="col-sm-2 col-form-label text-capitalize">
				<xsl:value-of select="$headerText"/>
			</label>
			<div class="col-sm-10">
				<xsl:apply-templates mode="input" select=".">
					<xsl:with-param name="step-number" select="$step-number"/>
					<xsl:with-param name="headerText" select="$headerText"/>
				</xsl:apply-templates>
			</div>
		</div>
	</xsl:template>

	<xsl:template mode="input" match="@*[key('dim',name())]">
		<xsl:param name="context" select="."/>
		<xsl:apply-templates mode="input" select="key('dim',name())">
			<xsl:with-param name="context" select="."/>
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template mode="input" match="@*">
		<input id="input_{@xo:id}" name="{name()}" class="form-control" type="text" placeholder="">
			<xsl:attribute name="type">
				<xsl:apply-templates mode="control_type" select="."/>
			</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:apply-templates select="."/>
			</xsl:attribute>
		</input>
	</xsl:template>

	<xsl:template mode="input" match="*[key('dim',name())]/row">
		<xsl:param name="context" select="."/>
		<xsl:variable name="value" select="self::*/@id|current()[not(self::*)]"/>
		<xsl:variable name="desc" select="self::*/@desc|current()[not(self::*)]"/>
		<option value="{$value}">
			<xsl:if test="$value=$context">
				<xsl:attribute name="selected"/>
			</xsl:if>
			<xsl:apply-templates select="$desc"/>
		</option>
	</xsl:template>


	<xsl:template mode="input" match="key('control','select')">
		<xsl:param name="context" select="."/>
	
		<select class="form-select" xo-scope="{$context/../@xo:id}" xo-slot="{name($context)}" onchange="scope.set(this.value)">
			<option></option>
			<xsl:apply-templates mode="input" select="row">
				<xsl:with-param name="context" select="$context"/>
			</xsl:apply-templates>
		</select>
	</xsl:template>




	<xsl:template mode="value" match="*[@id]">
		<xsl:value-of select="@id"/>
	</xsl:template>

	<xsl:template mode="control-radio" match="*">
		<xsl:param name="context" select="."/>
		<xsl:variable name="value">
			<xsl:apply-templates mode="value" select="current()"/>
		</xsl:variable>
		<input type="radio" class="btn-check" name="{$context/../@xo:id}_{name($context)}" id="{$context/../@xo:id}_{name($context)}_{position()}" xo-scope="{$context/../@xo:id}" xo-slot="{name($context)}" onclick="scope.set(this.value)" autocomplete="off" value="{$value}">
			<xsl:if test="$value=$context">
				<xsl:attribute name="onclick">scope.set('')</xsl:attribute>
				<xsl:attribute name="checked"/>
			</xsl:if>
		</input>
		<label class="btn btn-outline-primary" for="{$context/../@xo:id}_{name($context)}_{position()}" xo-scope="{$context/../@xo:id}" xo-slot="{name($context)}">
			<xsl:apply-templates select="@desc"/>
		</label>
	</xsl:template>


	<xsl:template mode="input" match="key('control','radio')">
		<xsl:param name="context" select="."/>

		<div class="btn-group" role="group" xo-scope="{$context/../@xo:id}" xo-slot="{name($context)}">
			<xsl:apply-templates mode="control-radio" select="row">
				<xsl:with-param name="context" select="$context"/>
			</xsl:apply-templates>
		</div>
		<xsl:if test="row[@id=$context]/@txt">
			<br/>
			<em>
				<xsl:value-of select="row[@id=$context]/@txt"/>
			</em>
		</xsl:if>
	</xsl:template>


	<xsl:template mode="control_type" match="@*[contains(name(),'_date')]" priority="1">date</xsl:template>


	<xsl:template name="format">
		<xsl:param name="value">0</xsl:param>
		<xsl:param name="mask">$#,##0.00;-$#,##0.00</xsl:param>
		<xsl:param name="value_for_invalid"></xsl:param>
		<xsl:choose>
			<xsl:when test="number($value)=$value">
				<xsl:value-of select="format-number($value,$mask)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$value_for_invalid"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template match="key('type','money')" priority="0">
		<xsl:call-template name="format">
			<xsl:with-param name="value" select="."/>
		</xsl:call-template>
	</xsl:template>

	<!--<xsl:template match="/">
		<div class="card-body">
			<h5 class="card-title fw-semibold"> Todos los viajes</h5>
			<div class="card-body">
				<div class="card-body p-4">
					<div class="row align-items-center">
						<div class="col-12 col-lg-6 mb-3 mb-lg-0">
							<div class="align-items-center">
								<div class="col-auto">
									<label class="form-label">
										Filtrar por
									</label>
									<select class="form-select">
										<option selected=""> Freight Code</option>
										<option value="1">Fecha</option>
										<option value="2">Freight Company</option>
										<option value="3">Grower Name</option>
										<option value="3">Border</option>
									</select>
								</div>

							</div>
						</div>
						<div class="col-12 col-lg-6">
							<div class="gx-3">
								<div class="col col-lg-auto ms-auto mt-4">
									<div class="input-group bg-body">
										<input type="text" class="form-control" />
                                                       
                                                    </div>
								</div>


							</div>
						</div>
					</div>
				</div>
				<div class="table-responsive">
					<xsl:apply-templates mode="datagrid:row" select="."/>
				</div>
			</div>
		</div>		
	</xsl:template>


	<xsl:template mode="datagrid:row" match="*">
		<table class="table table-striped" style="">
			<tr class="table-light">
				<th scope="row">
					<xsl:apply-templates mode="cell" select="matched_freights/@*"/>
				</th>

			</tr>
			<tbody>
				<xsl:apply-templates mode="datagrid:tbody" select="matched_freights/row">
				</xsl:apply-templates>
			</tbody>
		</table>
	</xsl:template>


	<xsl:template mode="datagrid:tbody" match="matched_freights/row">
		<tr style="color: #fff;">
			<th scope="row">
				<xsl:value-of select="position()"/>
			</th>
			<xsl:apply-templates mode="cell" select="@*"/>
		</tr>
	</xsl:template>

	<xsl:template mode="cell" match="@*">
		<td class="fw-bold">
			<xsl:value-of select="."/>
		</td>
	</xsl:template>-->









</xsl:stylesheet>
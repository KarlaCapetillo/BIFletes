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


	<xsl:template match="/">
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
	</xsl:template>









</xsl:stylesheet>
{x2;if:!$userhash}{x2;include:header}<body>{x2;include:nav}<div class="container-fluid">	<div class="row-fluid">		<div class="main">			<div class="col-xs-2 leftmenu">				{x2;include:menu}			</div>			<div id="datacontent">{x2;endif}				<div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">					<div class="col-xs-12">						<ol class="breadcrumb">							<li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a></li>							<li class="active">优惠券管理</li>						</ol>					</div>				</div>				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">					<h4 class="title" style="padding:10px;">						优惠券列表						<span class="dropdown pull-right">							<a data-toggle="dropdown" class="btn btn-primary" href="#">操作 <strong class="caret"></strong></a>							<ul class="dropdown-menu">								<li><a href="index.php?bank-master-coupon-batadd">添加优惠券</a></li>								<li><a href="index.php?bank-master-coupon-outcoupon">导出优惠券</a></li>							</ul>						</span>					</h4>					<form action="index.php?bank-master-coupon" method="post">						<fieldset>							<table class="table table-hover table-bordered">								<thead>									<tr class="info">										<th>券码</th>										<th>兑换积分</th>										<th>生成时间</th>										<th>过期时间</th>										<th>状态</th>									</tr>								</thead>								<tbody>									{x2;tree:$coupons['data'],coupon,cid}									<tr>										<td>{x2;v:coupon['couponsn']}</td>										<td>{x2;v:coupon['couponvalue']}</td>										<td>{x2;date:v:coupon['couponaddtime'],'Y-m-d'}</td>										<td>{x2;date:v:coupon['couponendtime'],'Y-m-d'}</td>										<td>								        	{x2;if:v:coupon['couponstatus']}已使用{x2;else}未使用{x2;endif}								        </td>									</tr>									{x2;endtree}								</tbody>							</table>							<div class="form-group">					            <div class="controls">						            <label class="radio-inline">						            	<a class="btn btn-primary confirm" href="index.php?bank-master-coupon-clearouttime" msg="此操作不可回复，确认清理吗？">清理过期优惠券</a>						            </label>						        </div>					        </div>							<ul class="pagination pull-right">								{x2;$coupons['pages']}							</ul>						</fieldset>					</form>				</div>			</div>{x2;if:!$userhash}		</div>	</div></div>{x2;include:footer}</body></html>{x2;endif}
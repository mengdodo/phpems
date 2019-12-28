{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="main">
			<div class="col-xs-2 leftmenu">
                {x2;include:menu}
			</div>
			<div id="datacontent">
				<div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
					<div class="col-xs-12">
						<ol class="breadcrumb">
							<li><a href="index.php?core-master">全局</a></li>
							<li><a href="index.php?core-master-apps">模块管理</a></li>
							<li class="active">模块设置</li>
						</ol>
					</div>
				</div>
				<div class="box itembox" style="padding-top:10px;margin-bottom:0px;">
					<h5 class="title">{x2;if:$app['appname']}{x2;$app['appname']}{x2;else}{x2;$appid}{x2;endif}</h5>
					<form action="index.php?core-master-apps-config" method="post" class="form-horizontal" style="padding-top:10px;margin-bottom:0px;">
						<div class="form-group">
							<label for="appname" class="col-sm-2 control-label">模块名称：</label>
							<div class="col-sm-6">
								<input id="appname" class="form-control" name="args[appname]" type="text" value="{x2;$app['appname']}" needle="needle" msg="您必须输入模块名称" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">模块状态：</label>
							<div class="col-sm-10">
								<label class="radio-inline">
									<input name="args[appstatus]" type="radio" value="1" {x2;if:$app['appstatus']}checked{x2;endif}/>开启
								</label>
								<label class="radio-inline">
									<input name="args[appstatus]" type="radio" value="0" {x2;if:!$app['appstatus']}checked{x2;endif}/>禁用
								</label>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">模块缩略图：</label>
							<div class="col-sm-10">
								<script type="text/template" id="pe-template-basicthumb">
						    		<div class="qq-uploader-selector" style="width:27%" qq-drop-area-text="可将图片拖拽至此处上传" style="clear:both;">
						            	<div class="qq-upload-button-selector" style="clear:both;">
						                	<ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
								                <li class="text-center">
								                    <div class="thumbnail">
														<img class="qq-thumbnail-selector" alt="点击上传新图片">
														<input type="hidden" class="qq-edit-filename-selector" name="args[appthumb]" tabindex="0">
													</div>
								                </li>
								            </ul>
								            <ul class="qq-upload-list-selector list-unstyled" aria-live="polite" aria-relevant="additions removals" style="clear:both;">
									            <li class="text-center">
									                <div class="thumbnail">
														<img class="qq-thumbnail-selector" src="{x2;if:$app['appthumb']}{x2;$app['appthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}" alt="点击上传新图片">
														<input type="hidden" class="qq-edit-filename-selector" name="args[appthumb]" tabindex="0" value="{x2;if:$app['appthumb']}{x2;$app['appthumb']}{x2;else}app/core/styles/images/noimage.gif{x2;endif}">
						                			</div>
									            </li>
									        </ul>
						                </div>
						            </div>
						        </script>
						        <div class="fineuploader" attr-type="thumb" attr-template="pe-template-basicthumb"></div>
							</div>
						</div>
						<!--
						<div class="form-group">
							<label for="seo_title" class="col-sm-2 control-label">SEO Title：</label>
							<div class="col-sm-9">
								<input id="seo_title" class="form-control" name="args[appsetting][seo][title]" type="text" value="{x2;$app['appsetting']['seo']['title']}"/>
							</div>
						</div>
						<div class="form-group">
							<label for="seo_keywords" class="col-sm-2 control-label">SEO Keywords：</label>
							<div class="col-sm-9">
								<input id="seo_keywords" class="form-control" name="args[appsetting][seo][keywords]" type="text" value="{x2;$app['appsetting']['seo']['keywords']}"/>
							</div>
						</div>
						<div class="form-group">
							<label for="seo_description" class="col-sm-2 control-label">SEO Description：</label>
							<div class="col-sm-9">
								<textarea id="seo_description" class="form-control" name="args[appsetting][seo][description]" class="input-xxlarge">{x2;$app['appsetting']['seo']['description']}</textarea>
							</div>
						</div>
						-->
						<div class="form-group">
							<label for="seo_description" class="col-sm-2 control-label"></label>
							<div class="col-sm-9">
								<button class="btn btn-primary" type="submit">提交</button>
								<input type="hidden" name="page" value="{x2;$page}"/>
								<input type="hidden" name="appconfig" value="1"/>
								<input type="hidden" name="appid" value="{x2;$appid}"/>
                                {x2;if:is_array($search)}
								{x2;tree:$search,arg,aid}
								<input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
								{x2;endtree}
                                {x2;endif}
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
{x2;include:footer}
</body>
</html>

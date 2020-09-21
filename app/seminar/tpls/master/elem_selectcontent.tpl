{x2;if:!$userhash}
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
{x2;endif}
                <div class="box itembox" style="margin-bottom:0px;border-bottom:1px solid #CCCCCC;">
                    <div class="col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a></li>
                            <li><a href="index.php?{x2;$_app}-master-seminar&page={x2;$page}">专题管理</a></li>
                            <li><a href="index.php?{x2;$_app}-master-seminar-layout&seminarid={x2;$elem['selseminar']}&page={x2;$page}">通栏设置</a></li>
                            <li><a href="index.php?{x2;$_app}-master-seminar-elem&slayoutid={x2;$elem['sellayout']}&page={x2;$page}">组件设置</a></li>
                            <li class="active">列表数据</li>
                        </ol>
                    </div>
                </div>
                <div class="box itembox" style="padding-top:10px;margin-bottom:0px;overflow:visible">
                    <h4 class="title" style="padding:10px;">
                        {x2;$elem['seltitle']}
                        <span class="pull-right">
                            <a class="btn btn-primary" href="index.php?seminar-master-seminar-contents&selid={x2;$elem['selid']}">内容列表</a>
                        </span>
                    </h4>
                    <form action="index.php?seminar-master-seminar-addcontent&selid={x2;$elem['selid']}" method="post" class="form-inline">
                        <table class="table">
                            <tr>
                                <td style="border-top: 0px;">
                                    内容ID：
                                </td>
                                <td style="border-top: 0px;">
                                    <input name="search[contentid]" class="form-control" size="15" type="text" class="number" value="{x2;$search['contentid']}"/>
                                </td>
                                <td style="border-top: 0px;">
                                    录入时间：
                                </td>
                                <td style="border-top: 0px;">
                                    <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" type="text" name="search[stime]" size="10" id="stime" value="{x2;$search['stime']}"/> - <input class="form-control datetimepicker" data-date="{x2;date:TIME,'Y-m-d'}" data-date-format="yyyy-mm-dd" size="10" type="text" name="search[etime]" id="etime" value="{x2;$search['etime']}"/>
                                </td>
                                <td style="border-top: 0px;">
                                    关键字：
                                </td>
                                <td style="border-top: 0px;">
                                    <input class="form-control" name="search[keyword]" size="15" type="text" value="{x2;$search['keyword']}"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    录入人：
                                </td>
                                <td>
                                    <input class="form-control" name="search[username]" size="15" type="text" value="{x2;$search['username']}"/>
                                </td>
                                <td>
                                    内容模型：
                                </td>
                                <td>
                                    <select name="search[contentmoduleid]" class="form-control">
                                        <option value="0">不限</option>
                                        {x2;tree:$modules,module,mid}
                                        <option value="{x2;v:module['moduleid']}"{x2;if:$search['contentmoduleid'] == v:module['moduleid']} selected{x2;endif}>{x2;v:module['modulename']}</option>
                                        {x2;endtree}
                                    </select>
                                </td>
                                <td>
                                    <button class="btn btn-primary" type="submit">提交</button>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    分类：
                                </td>
                                <td colspan="5">
                                    <select msg="您必须选择一个分类" class="autocombox form-control" name="search[contentcatid]" refUrl="index.php?content-master-category-ajax-getchildcategory&catid={value}">
                                        <option value="">选择一级分类</option>
                                        {x2;tree:$parentcat,cat,cid}
                                        <option value="{x2;v:cat['catid']}">{x2;v:cat['catname']}</option>
                                        {x2;endtree}
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <div class="input">
                            <input type="hidden" value="1" name="search[argsmodel]" />
                        </div>
                    </form>
                    <form action="index.php?seminar-master-seminar-addcontent&selid={x2;$elem['selid']}" method="post">
                        <fieldset>
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr class="info">
                                    <th width="36"><input type="checkbox" class="checkall" target="delids"/></th>
                                    <th width="40">ID</th>
                                    <th width="90">缩略图</th>
                                    <th>标题</th>
                                    <th width="80">分类</th>
                                    <th width="80">发布时间</th>
                                    <th width="80">发布人</th>
                                    <th width="80">修改时间</th>
                                    <th width="80">修改人</th>
                                </tr>
                                </thead>
                                <tbody>
                                {x2;tree:$contents['data'],content,cid}
                                <tr>
                                    <td><input type="checkbox" name="delids[{x2;v:content['contentid']}]" value="1"></td>
                                    <td>{x2;v:content['contentid']}</td>
                                    <td class="picture"><img src="{x2;if:v:content['contentthumb']}{x2;v:content['contentthumb']}{x2;else}app/core/styles/images/noupload.gif{x2;endif}" alt="" style="width:48px;"/></td>
                                    <td>
                                        {x2;v:content['contenttitle']}
                                    </td>
                                    <td>
                                        <a href="index.php?content-master-contents&catid={x2;v:content['contentcatid']}" target="">{x2;$categories[v:content['contentcatid']]['catname']}</a>
                                    </td>
                                    <td>
                                        {x2;date:v:content['contentinputtime'],'y-m-d'}
                                    </td>
                                    <td>
                                        {x2;v:content['contentusername']}
                                    </td>
                                    <td>
                                        {x2;date:v:content['contentmodifytime'],'y-m-d'}
                                    </td>
                                    <td>
                                        {x2;v:content['contentmodifier']}
                                    </td>
                                </tr>
                                {x2;endtree}
                                </tbody>
                            </table>
                            <div class="control-group">
                                <div class="controls">
                                    <button class="btn btn-primary" type="submit">加入</button>
                                    <input type="hidden" value="1" name="submit" />
                                </div>
                            </div>
                            <ul class="pagination pull-right">
                                {x2;$contents['pages']}
                            </ul>
                        </fieldset>
                    </form>
                </div>
            </div>
{x2;if:!$userhash}
        </div>
    </div>
</div>
{x2;include:footer}
</body>
</html>
{x2;endif}

<ul class="list-group">
    <li class="list-group-item {x2;if:$method == 'index'} active{x2;endif}">
        {x2;if:$method == 'index'}首页
        {x2;else}
        <a href="index.php?core-master">首页</a>
        {x2;endif}
    </li>
    <li class="list-group-item {x2;if:$method == 'apps'}active{x2;endif}">
        {x2;if:$method == 'apps'}模块管理
        {x2;else}
        <a href="index.php?core-master-apps">模块管理</a>
        {x2;endif}
    </li>
</ul>

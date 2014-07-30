﻿<div style="margin:30px;">


<h1>代码高亮演示</h1>
<h2>获得编辑器实例</h2>
<div style="width:200px">
    <pre class="brush:js;toolbar:false;">
        UE.getEditor('myEditor');
    </pre>
</div>

<!--style给定宽度可以影响编辑器的最终宽度-->
<script type="text/plain" id="myEditor">
    <h3>实例化编辑器</h3>
     <pre class="brush:js;toolbar:false;">
         UE.getEditor('myEditor');
</pre>
</script>
<script type="text/javascript">
    //为了在编辑器之外能展示高亮代码
    //SyntaxHighlighter.highlight();

    _run(function () {
        wojilu.editor.bind("myEditor").show();

    });
</script>

</div>
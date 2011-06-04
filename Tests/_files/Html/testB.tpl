<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
                      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head profile="http://purl.org/NET/erdf/profile">
 <title>PHP: Type Hinting - Manual</title>
 <style type="text/css" media="all">
  @import url("/styles/site.css");
  @import url("/styles/mirror.css");

 </style>
 <!--[if IE]><![if gte IE 6]><![endif]-->
  <style type="text/css" media="print">
   @import url("/styles/print.css");
  </style>
 <!--[if IE]><![endif]><![endif]-->
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

 <link rel="shortcut icon" href="/favicon.ico" />
 <link rel="contents" href="index.php" />
 <link rel="index" href="language.oop5.php" />
 <link rel="prev" href="language.oop5.object-comparison.php" />
 <link rel="next" href="language.oop5.late-static-bindings.php" />
 <link rel="schema.dc" href="http://purl.org/dc/elements/1.1/" />
 <link rel="schema.rdfs" href="http://www.w3.org/2000/01/rdf-schema#" />
 <link rev="canonical" rel="self alternate shorter shorturl shortlink" href="http://php.net/oop5.typehinting" />
 <link rel="license" href="http://creativecommons.org/licenses/by/3.0/" about="#content" />

 <link rel="canonical" href="http://php.net/manual/en/language.oop5.typehinting.php" />
 <script type="text/javascript" src="/userprefs.js"></script>
 <base href="http://de.php.net/manual/en/language.oop5.typehinting.php" />
 <meta http-equiv="Content-language" value="en" />
			<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
			<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var toggleImage = function(elem) {
		if ($(elem).hasClass("shown")) {
			$(elem).removeClass("shown").addClass("hidden");
			$("img", elem).attr("src", "/images/notes-add.gif");
		}
		else {
			$(elem).removeClass("hidden").addClass("shown");
			$("img", elem).attr("src", "/images/notes-reject.gif");
		}
	};

	$(".refsect1 h3.title").each(function() {
        url = "http://bugs.php.net/report.php?bug_type=Documentation+problem&amp;manpage=" + $(this).parent().parent().attr("id") + "%23" + $(this).text();
		$(this).parent().prepend("<div class='reportbug'><a href='" + url + "'>Report a bug</a></div>");
		$(this).prepend("<a class='toggler shown' href='#'><img src='/images/notes-reject.gif' /></a> ");
	});
	$("#usernotes .head").each(function() {
		$(this).prepend("<a class='toggler shown' href='#'><img src='/images/notes-reject.gif' /></a> ");
	});
	$(".refsect1 h3.title .toggler").click(function() {
		$(this).parent().siblings().slideToggle("slow");
		toggleImage(this);
		return false;
	});
	$("#usernotes .head .toggler").click(function() {
		$(this).parent().next().slideToggle("slow");
		toggleImage(this);
		return false;
	});
});
</script>

</head>
<body>

<div id="headnav">
 <a href="/" rel="home"><img src="/images/php.gif"
 alt="PHP" width="120" height="67" id="phplogo" /></a>
 <div id="headmenu">
  <a href="/downloads.php">downloads</a> |
  <a href="/docs.php">documentation</a> |
  <a href="/FAQ.php">faq</a> |
  <a href="/support.php">getting help</a> |
  <a href="/mailing-lists.php">mailing lists</a> |
  <a href="/license">licenses</a> |
  <a href="http://wiki.php.net/">wiki</a> |
  <a href="http://bugs.php.net/">reporting bugs</a> |
  <a href="/sites.php">php.net sites</a> |
  <a href="/links.php">links</a> |
  <a href="/conferences/">conferences</a> |
  <a href="/my.php">my php.net</a>

 </div>
</div>

<div id="headsearch">
 <form method="post" action="/search.php" id="topsearch">
  <p>
   <span title="Keyboard shortcut: Alt+S (Win), Ctrl+S (Apple)">
    <span class="shortkey">s</span>earch for
   </span>
   <input type="text" name="pattern" value="" size="30" accesskey="s" />

   <span>in the</span>
   <select name="show">
    <option value="all"      >all php.net sites</option>
    <option value="local"    >this mirror only</option>
    <option value="quickref" selected="selected">function list</option>
    <option value="manual"   >online documentation</option>

    <option value="bugdb"    >bug database</option>
    <option value="news_archive">Site News Archive</option>
    <option value="changelogs">All Changelogs</option>
    <option value="pear"     >just pear.php.net</option>
    <option value="pecl"     >just pecl.php.net</option>
    <option value="talks"    >just talks.php.net</option>

    <option value="maillist" >general mailing list</option>
    <option value="devlist"  >developer mailing list</option>
    <option value="phpdoc"   >documentation mailing list</option>
   </select>
   <input type="image"
          src="/images/small_submit_white.gif"
          class="submit" alt="search" />
   <input type="hidden" name="lang" value="en" />
  </p>

 </form>
</div>

<div id="layout_2">
 <div id="leftbar">
<!--UdmComment-->
<ul class="toc">
 <li class="header home"><a href="index.php">PHP Manual</a></li>
 <li class="header up"><a href="langref.php">Language Reference</a></li>
 <li class="header up"><a href="language.oop5.php">Classes and Objects</a></li>

 <li><a href="oop5.intro.php">Introduction</a></li>
 <li><a href="language.oop5.basic.php">The Basics</a></li>
 <li><a href="language.oop5.properties.php">Properties</a></li>
 <li><a href="language.oop5.constants.php">Class Constants</a></li>
 <li><a href="language.oop5.autoload.php">Autoloading Classes</a></li>
 <li><a href="language.oop5.decon.php">Constructors and Destructors</a></li>

 <li><a href="language.oop5.visibility.php">Visibility</a></li>
 <li><a href="language.oop5.inheritance.php">Object Inheritance</a></li>
 <li><a href="language.oop5.paamayim-nekudotayim.php">Scope Resolution Operator (::)</a></li>
 <li><a href="language.oop5.static.php">Static Keyword</a></li>
 <li><a href="language.oop5.abstract.php">Class Abstraction</a></li>
 <li><a href="language.oop5.interfaces.php">Object Interfaces</a></li>

 <li><a href="language.oop5.overloading.php">Overloading</a></li>
 <li><a href="language.oop5.iterations.php">Object Iteration</a></li>
 <li><a href="language.oop5.patterns.php">Patterns</a></li>
 <li><a href="language.oop5.magic.php">Magic Methods</a></li>
 <li><a href="language.oop5.final.php">Final Keyword</a></li>
 <li><a href="language.oop5.cloning.php">Object Cloning</a></li>

 <li><a href="language.oop5.object-comparison.php">Comparing Objects</a></li>
 <li class="active"><a href="language.oop5.typehinting.php">Type Hinting</a></li>
 <li><a href="language.oop5.late-static-bindings.php">Late Static Bindings</a></li>
 <li><a href="language.oop5.references.php">Objects and references</a></li>
 <li><a href="language.oop5.serialization.php">Object Serialization</a></li>
 <li><a href="language.oop5.changelog.php">OOP Changelog</a></li>

</ul><!--/UdmComment-->

 </div>
 <div id="content" class="manual/en">
<!--UdmComment-->
<div class="manualnavbar manualnavbar_top">
 <span class="next">
  <a href="language.oop5.late-static-bindings.php">Late Static Bindings<img src="/images/caret-r.gif" alt="&gt;" width="11" height="7" /></a>
 </span>
 <span class="prev">

  <a href="language.oop5.object-comparison.php"><img src="/images/caret-l.gif" alt="&lt;" width="11" height="7" />Comparing Objects</a>
 </span>
 <hr />
 <span class="lastupdated">Last updated: Fri, 22 Apr 2011</span>
 <div class="langchooser">
  <form action="/manual/change.php" method="get">
   <p>view this page in </p><fieldset><select name="page">

    <option value="pt_BR/language.oop5.typehinting.php">Brazilian Portuguese</option>
    <option value="zh/language.oop5.typehinting.php">Chinese (Simplified)</option>
    <option value="fr/language.oop5.typehinting.php">French</option>
    <option value="de/language.oop5.typehinting.php">German</option>
    <option value="ja/language.oop5.typehinting.php">Japanese</option>
    <option value="pl/language.oop5.typehinting.php">Polish</option>

    <option value="ro/language.oop5.typehinting.php">Romanian</option>
    <option value="fa/language.oop5.typehinting.php">Persian</option>
    <option value="es/language.oop5.typehinting.php">Spanish</option>
    <option value="tr/language.oop5.typehinting.php">Turkish</option>
    <option value="help-translate.php">Other</option>
   </select>

   <input type="image" src="/images/small_submit.gif" id="changeLangImage" alt="Change language" />
  </fieldset></form>
 </div>
</div>
<!--/UdmComment-->

<div id="language.oop5.typehinting" class="sect1">
  <h2 class="title">Type Hinting</h2>
  <p class="para">
   PHP 5 introduces Type Hinting. Functions are now able to force parameters
   to be objects (by specifying the name of the class in the function
   prototype) or arrays (since PHP 5.1). However, if <span class="type"><a href="language.types.null.php" class="type NULL">NULL</a></span> is used
   as the default parameter value, it will be allowed as an argument for any
   later call.
  </p>


  <div class="example" id="example-201">
   <p><b>Example #1 Type Hinting examples</b></p>
    <div class="example-contents">
<div class="phpcode"><code><span style="color: #000000">
<span style="color: #0000BB">&lt;?php<br /></span><span style="color: #FF8000">//&nbsp;An&nbsp;example&nbsp;class<br /></span><span style="color: #007700">class&nbsp;</span><span style="color: #0000BB">MyClass<br /></span><span style="color: #007700">{<br />&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color: #FF8000">/**<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;A&nbsp;test&nbsp;function<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;First&nbsp;parameter&nbsp;must&nbsp;be&nbsp;an&nbsp;object&nbsp;of&nbsp;type&nbsp;OtherClass<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/<br />&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color: #007700">public&nbsp;function&nbsp;</span><span style="color: #0000BB">test</span><span style="color: #007700">(</span><span style="color: #0000BB">OtherClass&nbsp;$otherclass</span><span style="color: #007700">)&nbsp;{<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;</span><span style="color: #0000BB">$otherclass</span><span style="color: #007700">-&gt;</span><span style="color: #0000BB">var</span><span style="color: #007700">;<br />&nbsp;&nbsp;&nbsp;&nbsp;}<br /><br /><br />&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color: #FF8000">/**<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;Another&nbsp;test&nbsp;function<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*&nbsp;First&nbsp;parameter&nbsp;must&nbsp;be&nbsp;an&nbsp;array<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*/<br />&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color: #007700">public&nbsp;function&nbsp;</span><span style="color: #0000BB">test_array</span><span style="color: #007700">(array&nbsp;</span><span style="color: #0000BB">$input_array</span><span style="color: #007700">)&nbsp;{<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style="color: #0000BB">print_r</span><span style="color: #007700">(</span><span style="color: #0000BB">$input_array</span><span style="color: #007700">);<br />&nbsp;&nbsp;&nbsp;&nbsp;}<br />}<br /><br /></span><span style="color: #FF8000">//&nbsp;Another&nbsp;example&nbsp;class<br /></span><span style="color: #007700">class&nbsp;</span><span style="color: #0000BB">OtherClass&nbsp;</span><span style="color: #007700">{<br />&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;</span><span style="color: #0000BB">$var&nbsp;</span><span style="color: #007700">=&nbsp;</span><span style="color: #DD0000">'Hello&nbsp;World'</span><span style="color: #007700">;<br />}<br /></span><span style="color: #0000BB">?&gt;</span>

</span>
</code></div>
   </div>

   <div class="example-contents"><p>
    Failing to satisfy the type hint results in a catchable fatal error.
   </p></div>
    <div class="example-contents">
<div class="phpcode"><code><span style="color: #000000">
<span style="color: #0000BB">&lt;?php<br /></span><span style="color: #FF8000">//&nbsp;An&nbsp;instance&nbsp;of&nbsp;each&nbsp;class<br /></span><span style="color: #0000BB">$myclass&nbsp;</span><span style="color: #007700">=&nbsp;new&nbsp;</span><span style="color: #0000BB">MyClass</span><span style="color: #007700">;<br /></span><span style="color: #0000BB">$otherclass&nbsp;</span><span style="color: #007700">=&nbsp;new&nbsp;</span><span style="color: #0000BB">OtherClass</span><span style="color: #007700">;<br /><br /></span><span style="color: #FF8000">//&nbsp;Fatal&nbsp;Error:&nbsp;Argument&nbsp;1&nbsp;must&nbsp;be&nbsp;an&nbsp;object&nbsp;of&nbsp;class&nbsp;OtherClass<br /></span><span style="color: #0000BB">$myclass</span><span style="color: #007700">-&gt;</span><span style="color: #0000BB">test</span><span style="color: #007700">(</span><span style="color: #DD0000">'hello'</span><span style="color: #007700">);<br /><br /></span><span style="color: #FF8000">//&nbsp;Fatal&nbsp;Error:&nbsp;Argument&nbsp;1&nbsp;must&nbsp;be&nbsp;an&nbsp;instance&nbsp;of&nbsp;OtherClass<br /></span><span style="color: #0000BB">$foo&nbsp;</span><span style="color: #007700">=&nbsp;new&nbsp;</span><span style="color: #0000BB">stdClass</span><span style="color: #007700">;<br /></span><span style="color: #0000BB">$myclass</span><span style="color: #007700">-&gt;</span><span style="color: #0000BB">test</span><span style="color: #007700">(</span><span style="color: #0000BB">$foo</span><span style="color: #007700">);<br /><br /></span><span style="color: #FF8000">//&nbsp;Fatal&nbsp;Error:&nbsp;Argument&nbsp;1&nbsp;must&nbsp;not&nbsp;be&nbsp;null<br /></span><span style="color: #0000BB">$myclass</span><span style="color: #007700">-&gt;</span><span style="color: #0000BB">test</span><span style="color: #007700">(</span><span style="color: #0000BB">null</span><span style="color: #007700">);<br /><br /></span><span style="color: #FF8000">//&nbsp;Works:&nbsp;Prints&nbsp;Hello&nbsp;World<br /></span><span style="color: #0000BB">$myclass</span><span style="color: #007700">-&gt;</span><span style="color: #0000BB">test</span><span style="color: #007700">(</span><span style="color: #0000BB">$otherclass</span><span style="color: #007700">);<br /><br /></span><span style="color: #FF8000">//&nbsp;Fatal&nbsp;Error:&nbsp;Argument&nbsp;1&nbsp;must&nbsp;be&nbsp;an&nbsp;array<br /></span><span style="color: #0000BB">$myclass</span><span style="color: #007700">-&gt;</span><span style="color: #0000BB">test_array</span><span style="color: #007700">(</span><span style="color: #DD0000">'a&nbsp;string'</span><span style="color: #007700">);<br /><br /></span><span style="color: #FF8000">//&nbsp;Works:&nbsp;Prints&nbsp;the&nbsp;array<br /></span><span style="color: #0000BB">$myclass</span><span style="color: #007700">-&gt;</span><span style="color: #0000BB">test_array</span><span style="color: #007700">(array(</span><span style="color: #DD0000">'a'</span><span style="color: #007700">,&nbsp;</span><span style="color: #DD0000">'b'</span><span style="color: #007700">,&nbsp;</span><span style="color: #DD0000">'c'</span><span style="color: #007700">));<br /></span><span style="color: #0000BB">?&gt;</span>

</span>
</code></div>
   </div>

   <div class="example-contents"><p>
    Type hinting also works with functions:
   </p></div>
    <div class="example-contents">
<div class="phpcode"><code><span style="color: #000000">
<span style="color: #0000BB">&lt;?php<br /></span><span style="color: #FF8000">//&nbsp;An&nbsp;example&nbsp;class<br /></span><span style="color: #007700">class&nbsp;</span><span style="color: #0000BB">MyClass&nbsp;</span><span style="color: #007700">{<br />&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;</span><span style="color: #0000BB">$var&nbsp;</span><span style="color: #007700">=&nbsp;</span><span style="color: #DD0000">'Hello&nbsp;World'</span><span style="color: #007700">;<br />}<br /><br /></span><span style="color: #FF8000">/**<br />&nbsp;*&nbsp;A&nbsp;test&nbsp;function<br />&nbsp;*<br />&nbsp;*&nbsp;First&nbsp;parameter&nbsp;must&nbsp;be&nbsp;an&nbsp;object&nbsp;of&nbsp;type&nbsp;MyClass<br />&nbsp;*/<br /></span><span style="color: #007700">function&nbsp;</span><span style="color: #0000BB">MyFunction&nbsp;</span><span style="color: #007700">(</span><span style="color: #0000BB">MyClass&nbsp;$foo</span><span style="color: #007700">)&nbsp;{<br />&nbsp;&nbsp;&nbsp;&nbsp;echo&nbsp;</span><span style="color: #0000BB">$foo</span><span style="color: #007700">-&gt;</span><span style="color: #0000BB">var</span><span style="color: #007700">;<br />}<br /><br /></span><span style="color: #FF8000">//&nbsp;Works<br /></span><span style="color: #0000BB">$myclass&nbsp;</span><span style="color: #007700">=&nbsp;new&nbsp;</span><span style="color: #0000BB">MyClass</span><span style="color: #007700">;<br /></span><span style="color: #0000BB">MyFunction</span><span style="color: #007700">(</span><span style="color: #0000BB">$myclass</span><span style="color: #007700">);<br /></span><span style="color: #0000BB">?&gt;</span>

</span>
</code></div>
   </div>

   <div class="example-contents"><p>
    Type hinting allowing NULL value:
   </p></div>
    <div class="example-contents">
<div class="phpcode"><code><span style="color: #000000">
<span style="color: #0000BB">&lt;?php<br /><br /></span><span style="color: #FF8000">/*&nbsp;Accepting&nbsp;NULL&nbsp;value&nbsp;*/<br /></span><span style="color: #007700">function&nbsp;</span><span style="color: #0000BB">test</span><span style="color: #007700">(</span><span style="color: #0000BB">stdClass&nbsp;$obj&nbsp;</span><span style="color: #007700">=&nbsp;</span><span style="color: #0000BB">NULL</span><span style="color: #007700">)&nbsp;{<br /><br />}<br /><br /></span><span style="color: #0000BB">test</span><span style="color: #007700">(</span><span style="color: #0000BB">NULL</span><span style="color: #007700">);<br /></span><span style="color: #0000BB">test</span><span style="color: #007700">(new&nbsp;</span><span style="color: #0000BB">stdClass</span><span style="color: #007700">);<br /><br /></span><span style="color: #0000BB">?&gt;</span>

</span>
</code></div>
   </div>

  </div>
  <p class="para">
   Type Hints can only be of the <span class="type"><a href="language.types.object.php" class="type object">object</a></span> and <span class="type"><a href="language.types.array.php" class="type array">array</a></span>
   (since PHP 5.1) type. Traditional type hinting with <span class="type"><a href="language.types.integer.php" class="type int">int</a></span> and
   <span class="type"><a href="language.types.string.php" class="type string">string</a></span> isn&#039;t supported.
  </p>

 </div><br /><br /><!--UdmComment-->
<div class="manualnavbar manualnavbar_bottom">
 <span class="next">
  <a href="language.oop5.late-static-bindings.php">Late Static Bindings<img src="/images/caret-r.gif" alt="&gt;" width="11" height="7" /></a>
 </span>
 <span class="prev">
  <a href="language.oop5.object-comparison.php"><img src="/images/caret-l.gif" alt="&lt;" width="11" height="7" />Comparing Objects</a>
 </span>

 <hr />
 <span class="lastupdated">Last updated: Fri, 22 Apr 2011</span>
 <div class="langchooser">
  &nbsp;
 </div>
</div>
<!--/UdmComment-->


<div id="usernotes">
 <div class="head">

  <span class="action"><a href="/manual/add-note.php?sect=language.oop5.typehinting&amp;redirect=http://de.php.net/manual/en/language.oop5.typehinting.php"><img src="/images/notes-add.gif" alt="add a note" width="13" height="13" class="middle" /></a> <small><a href="/manual/add-note.php?sect=language.oop5.typehinting&amp;redirect=http://de.php.net/manual/en/language.oop5.typehinting.php">add a note</a></small></span>
  <small>User Contributed Notes</small>
  <strong>Type Hinting</strong>
 </div><div id="allnotes">
 <a name="103463"></a>
 <div class="note">
  <strong class='user'>Anonymous</strong>

  <a href="#103463" class="date">14-Apr-2011 02:43</a>
  <div class="text">
<div class="phpcode"><code><span class="html">
Please note, there is a strong typing in PHP.
<br />

<br />
You have to import one PHP library to your existing projects, and create some classes, in which the scalar values will be automatically wrapped by an autoboxing mechanism known from Java, like so:
<br />

<br />
<span class="default">&lt;?php
<br />
</span><span class="keyword">class </span><span class="default">String </span><span class="keyword">extends </span><span class="default">AutoBoxedObject

<br />
</span><span class="keyword">{
<br />
&nbsp;&nbsp;&nbsp; public </span><span class="default">$value</span><span class="keyword">;
<br />
&nbsp;
<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">__construct</span><span class="keyword">(</span><span class="default">$value</span><span class="keyword">) {
<br />

&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">value </span><span class="keyword">= </span><span class="default">$value</span><span class="keyword">;
<br />
&nbsp;&nbsp;&nbsp; }
<br />
&nbsp;
<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">__toString</span><span class="keyword">() {

<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="string">"</span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">value</span><span class="string">"</span><span class="keyword">;
<br />
&nbsp;&nbsp;&nbsp; }
<br />
&nbsp;
<br />

&nbsp;&nbsp;&nbsp; public function </span><span class="default">toUpperCase</span><span class="keyword">() {
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">strtoupper</span><span class="keyword">(</span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">value</span><span class="keyword">);
<br />
&nbsp;&nbsp;&nbsp; }

<br />
}
<br />
&nbsp;
<br />
function &amp; </span><span class="default">string</span><span class="keyword">(</span><span class="default">$value </span><span class="keyword">= </span><span class="default">null</span><span class="keyword">) {
<br />
&nbsp;&nbsp;&nbsp; </span><span class="default">$x </span><span class="keyword">= &amp; </span><span class="default">VariablesManager</span><span class="keyword">::</span><span class="default">getNewPointer</span><span class="keyword">(new </span><span class="default">String</span><span class="keyword">(</span><span class="default">$value</span><span class="keyword">));

<br />
&nbsp;&nbsp;&nbsp; return </span><span class="default">$x</span><span class="keyword">;
<br />
}
<br />
</span><span class="default">?&gt;
<br />
</span>
<br />
From now on you can declare the type of data in your variables, and validate their values in a class constructor.
<br />

<br />

See this example:
<br />

<br />
<span class="default">&lt;?php
<br />
$y </span><span class="keyword">= &amp; </span><span class="default">string</span><span class="keyword">(</span><span class="string">"aaa"</span><span class="keyword">);
<br />
</span><span class="comment">// lets check, that $y is an object
<br />
</span><span class="default">var_dump</span><span class="keyword">(</span><span class="default">$y</span><span class="keyword">);

<br />
&nbsp;
<br />
</span><span class="comment">// now we are overwritting $y variable with a scalar value of "zzz"
<br />
</span><span class="default">$y </span><span class="keyword">= </span><span class="string">"zzz"</span><span class="keyword">;
<br />
</span><span class="comment">// var_dump() shows us, that "zzz" is still an object, not the scalar type as in regular PHP
<br />
</span><span class="default">var_dump</span><span class="keyword">(</span><span class="default">$y</span><span class="keyword">);
<br />

</span><span class="comment">// the line below should raise a fatal error, because "zzz" was a scalar type (string), but it will be ok, because $y is still an object (thanks to autoboxing)
<br />
</span><span class="default">var_dump</span><span class="keyword">(</span><span class="default">$y</span><span class="keyword">-&gt;</span><span class="default">toUpperCase</span><span class="keyword">());
<br />
</span><span class="default">?&gt;
<br />
</span>Now, the output is:
<br />

<br />
object(String)#1 (2) {

<br />
&nbsp; ["value"]=&gt;
<br />
&nbsp; string(3) "aaa"
<br />
&nbsp; ["ref":protected]=&gt;
<br />
&nbsp; int(1)
<br />
}
<br />

object(String)#2 (2) {
<br />
&nbsp; ["value"]=&gt;
<br />
&nbsp; string(3) "zzz"
<br />
&nbsp; ["ref":protected]=&gt;
<br />
&nbsp; int(1)
<br />
}

<br />
string(3) "ZZZ"
<br />

<br />
As you can see, PHP can be as good as Java or C#:)
<br />

<br />
To enforce strong data types you just have to do it in the wrapper class, like so:
<br />
<span class="default">&lt;?php
<br />
</span><span class="keyword">class </span><span class="default">Integer </span><span class="keyword">extends </span><span class="default">AutoBoxedObject

<br />
</span><span class="keyword">{
<br />
&nbsp;&nbsp;&nbsp; public </span><span class="default">$value</span><span class="keyword">;
<br />
&nbsp;
<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">__construct</span><span class="keyword">(</span><span class="default">$value</span><span class="keyword">) {
<br />

&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; if(!</span><span class="default">is_int</span><span class="keyword">(</span><span class="default">$value</span><span class="keyword">)) { throw new </span><span class="default">Exception</span><span class="keyword">(</span><span class="string">"Invalid data type"</span><span class="keyword">); }
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">value </span><span class="keyword">= </span><span class="default">$value</span><span class="keyword">;

<br />
&nbsp;&nbsp;&nbsp; }
<br />
&nbsp;
<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">getValue</span><span class="keyword">() {
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">value</span><span class="keyword">;

<br />
&nbsp;&nbsp;&nbsp; }
<br />

<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">__toString</span><span class="keyword">() {
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return (string)</span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">value</span><span class="keyword">;

<br />
&nbsp;&nbsp;&nbsp; }
<br />
}
<br />
</span><span class="default">?&gt;
<br />
</span>
<br />
To download the library, just google for 'strong data typing autoboxing' . There is an article describing how to use it, and a download link to the appropriate PHP library.</span>
</code></div>
  </div>
 </div>

 <a name="102378"></a>
 <div class="note">
  <strong class='user'>macobex dot exe at gmail dot com</strong>
  <a href="#102378" class="date">11-Feb-2011 02:48</a>
  <div class="text">
<div class="phpcode"><code><span class="html">
I agree [that] using object/wrapper is faster than using the is_* functions.
<br />

<br />

But I think we must also consider the fact that when we pass an argument to a function, most likely we will use it's value. So I've done a little test to see which approach is faster.
<br />

<br />
Primitive Approach:
<br />
<span class="default">&lt;?php
<br />

<br />
</span><span class="keyword">function </span><span class="default">testPrimitive</span><span class="keyword">(</span><span class="default">$str</span><span class="keyword">) {
<br />
&nbsp;&nbsp; if ( </span><span class="default">is_string</span><span class="keyword">(</span><span class="default">$str</span><span class="keyword">) )

<br />
&nbsp;&nbsp; &nbsp;&nbsp; </span><span class="default">$x </span><span class="keyword">= </span><span class="default">$str </span><span class="keyword">. </span><span class="string">' world'</span><span class="keyword">;&nbsp;&nbsp; </span><span class="comment">// using the argument's value
<br />
&nbsp;&nbsp; </span><span class="keyword">else
<br />
&nbsp;&nbsp; &nbsp;&nbsp; </span><span class="default">trigger_error</span><span class="keyword">(</span><span class="string">'Argument passed must be of type string.'</span><span class="keyword">);

<br />
&nbsp;&nbsp; }
<br />

<br />
</span><span class="default">?&gt;
<br />
</span>
<br />
Wrapper Approach:
<br />

<br />
<span class="default">&lt;?php
<br />

<br />
&nbsp;&nbsp; </span><span class="keyword">function </span><span class="default">testWrapper</span><span class="keyword">(</span><span class="default">StringWrapper $str</span><span class="keyword">) {
<br />
&nbsp;&nbsp; &nbsp;&nbsp; </span><span class="default">$x </span><span class="keyword">= </span><span class="default">$str</span><span class="keyword">-&gt;</span><span class="default">getValue</span><span class="keyword">() . </span><span class="string">' world'</span><span class="keyword">;&nbsp; </span><span class="comment">// using the argument's value

<br />
&nbsp;&nbsp; </span><span class="keyword">}
<br />

<br />
</span><span class="default">?&gt;
<br />
</span>
<br />
Test: 10,000 iterations
<br />
Results:
<br />
&nbsp;&nbsp; primitive average: 0.026113033294678

<br />
&nbsp;&nbsp; wrapper average: 0.063039064407349
<br />

<br />
&nbsp;&nbsp; primitive is faster than wrapper approach by 41.42357368431%
<br />

<br />
Using the is_* function is faster than using wrapper class, given the fact that we just not want to check the type of the argument, but we also want to use the value of the argument.</span>
</code></div>
  </div>
 </div>

 <a name="100550"></a>
 <div class="note">
  <strong class='user'>alejosimon at gmail dot com</strong>
  <a href="#100550" class="date">22-Oct-2010 06:55</a>
  <div class="text">
<div class="phpcode"><code><span class="html">
For PHP 5.3 version and namespaces support.<br />
<br />
<span class="default">&lt;?php<br />

<br />
</span><span class="keyword">function </span><span class="default">phpErrorHandler</span><span class="keyword">( </span><span class="default">$code</span><span class="keyword">, </span><span class="default">$message</span><span class="keyword">, </span><span class="default">$file</span><span class="keyword">, </span><span class="default">$line </span><span class="keyword">) {<br />
<br />
&nbsp;&nbsp;&nbsp; if ( </span><span class="default">error_reporting</span><span class="keyword">() &amp; </span><span class="default">$code </span><span class="keyword">) {<br />

<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; if ( </span><span class="default">$code </span><span class="keyword">== </span><span class="default">E_RECOVERABLE_ERROR </span><span class="keyword">) { </span><span class="comment">// Scalar Type-Hinting patch.<br />
<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$regexp </span><span class="keyword">= </span><span class="string">'/^Argument (\d)+ passed to (.+) must be an instance of (?&lt;hint&gt;.+), (?&lt;given&gt;.+) given/i' </span><span class="keyword">;<br />

<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; if ( </span><span class="default">preg_match</span><span class="keyword">( </span><span class="default">$regexp</span><span class="keyword">, </span><span class="default">$message</span><span class="keyword">, </span><span class="default">$match </span><span class="keyword">) ) {<br />
<br />

&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$given </span><span class="keyword">= </span><span class="default">$match</span><span class="keyword">[ </span><span class="string">'given' </span><span class="keyword">] ;<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$hint&nbsp; </span><span class="keyword">= </span><span class="default">end</span><span class="keyword">( </span><span class="default">explode</span><span class="keyword">( </span><span class="string">'\\'</span><span class="keyword">, </span><span class="default">$match</span><span class="keyword">[ </span><span class="string">'hint' </span><span class="keyword">] ) ) ; </span><span class="comment">// namespaces support.<br />

<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span><span class="keyword">if ( </span><span class="default">$hint </span><span class="keyword">== </span><span class="default">$given </span><span class="keyword">) return </span><span class="default">true </span><span class="keyword">;<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; }<br />

&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; }<br />
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">false </span><span class="keyword">;<br />
&nbsp;&nbsp;&nbsp; }<br />
}<br />

<br />
</span><span class="default">set_error_handler</span><span class="keyword">( </span><span class="string">'phpErrorHandler' </span><span class="keyword">) ;<br />
<br />
</span><span class="comment">/************************************/<br />
<br />
</span><span class="keyword">function </span><span class="default">typeHintTest</span><span class="keyword">( </span><span class="default">integer $arg1 </span><span class="keyword">) {<br />
<br />

&nbsp;&nbsp;&nbsp; </span><span class="default">print_r</span><span class="keyword">( </span><span class="default">$arg1 </span><span class="keyword">) ;<br />
}<br />
<br />
</span><span class="default">typeHintTest</span><span class="keyword">( </span><span class="default">true </span><span class="keyword">) ; </span><span class="comment">// Error throw because not integer type.<br />
<br />
</span><span class="default">?&gt;</span>

</span>
</code></div>
  </div>
 </div>
 <a name="100543"></a>
 <div class="note">
  <strong class='user'>gdecad at NOSPAM dot example dot com</strong>
  <a href="#100543" class="date">22-Oct-2010 01:02</a>
  <div class="text">

<div class="phpcode"><code><span class="html">
I have made a little bench between three method of type hinting for native type (string, integer, ...).<br />
<br />
First method : by test type in function like :<br />
<span class="default">&lt;?php<br />
</span><span class="keyword">function </span><span class="default">testTest</span><span class="keyword">(</span><span class="default">$arg</span><span class="keyword">) {<br />
&nbsp;&nbsp;&nbsp; if (!</span><span class="default">is_string</span><span class="keyword">(</span><span class="default">$arg</span><span class="keyword">)) {<br />

&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">trigger_error</span><span class="keyword">(</span><span class="string">'Argument $arg passed to test must be an instance of string, other given'</span><span class="keyword">);<br />
&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; return </span><span class="default">$arg</span><span class="keyword">;<br />
}<br />

</span><span class="default">?&gt;<br />
</span><br />
Second method : by object representing native type :<br />
<span class="default">&lt;?php<br />
</span><span class="keyword">function </span><span class="default">testObject</span><span class="keyword">(</span><span class="default">StringObj $arg</span><span class="keyword">) {<br />
&nbsp;&nbsp;&nbsp; return </span><span class="default">$arg</span><span class="keyword">;<br />

}<br />
</span><span class="default">?&gt;<br />
</span><br />
Third method : by class TypeHint proposed by Daniel :<br />
<span class="default">&lt;?php<br />
</span><span class="keyword">function </span><span class="default">testHint</span><span class="keyword">(</span><span class="default">string $arg</span><span class="keyword">) {<br />
&nbsp;&nbsp;&nbsp; return </span><span class="default">$arg</span><span class="keyword">;<br />

}<br />
</span><span class="default">?&gt;<br />
</span><br />
the results are here :<br />
bench for 100000 iterations,&nbsp; in seconds<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; avg&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; min&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; max&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; total<br />

test&nbsp; &nbsp; 5.3275489807129E-6&nbsp; &nbsp; 2.8610229492188E-6&nbsp; &nbsp; 0.0033020973205566&nbsp; &nbsp; 0.53275895118713<br />
object&nbsp; &nbsp; 4.9089097976685E-6&nbsp; &nbsp; 3.814697265625E-6&nbsp; &nbsp; 0.0025870800018311&nbsp; &nbsp; 0.49089503288269<br />

hint&nbsp; &nbsp; 3.2338891029358E-5&nbsp; &nbsp; 2.9802322387695E-5&nbsp; &nbsp; 0.0025920867919922&nbsp; &nbsp; 3.2338931560516<br />
<br />
As you can see, the method by object is the best<br />

now you know...</span>
</code></div>
  </div>
 </div>
 <a name="95999"></a>
 <div class="note">
  <strong class='user'>bogdan dot wrobel at gmail dot com</strong>
  <a href="#95999" class="date">02-Feb-2010 08:10</a>

  <div class="text">
<div class="phpcode"><code><span class="html">
Regarding "simple" type hints, you may use SPL: <a href="http://pl.php.net/manual/en/book.spl-types.php" rel="nofollow" target="_blank">http://pl.php.net/manual/en/book.spl-types.php</a></span>
</code></div>
  </div>
 </div>
 <a name="93534"></a>
 <div class="note">
  <strong class='user'>reinier dot kip at gmail dot com</strong>

  <a href="#93534" class="date">15-Sep-2009 08:22</a>
  <div class="text">
<div class="phpcode"><code><span class="html">
Please note that when using the type hinting class together with namespaces, you're asking for trouble:<br />
<br />
<span class="default">&lt;?php<br />
</span><span class="keyword">namespace </span><span class="default">a </span><span class="keyword">{<br />
&nbsp;&nbsp;&nbsp; interface </span><span class="default">A </span><span class="keyword">{<br />

&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; public function </span><span class="default">execute</span><span class="keyword">(</span><span class="default">string $sth</span><span class="keyword">);<br />
&nbsp;&nbsp;&nbsp; }<br />
}<br />
<br />
namespace </span><span class="default">a</span><span class="keyword">\</span><span class="default">b </span><span class="keyword">{<br />

&nbsp;&nbsp;&nbsp; class </span><span class="default">B </span><span class="keyword">implements </span><span class="default">a</span><span class="keyword">\</span><span class="default">A </span><span class="keyword">{<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; public function </span><span class="default">execute</span><span class="keyword">(</span><span class="default">string $sth</span><span class="keyword">){} </span><span class="comment">// Wrong<br />

&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="keyword">public function </span><span class="default">execute</span><span class="keyword">(</span><span class="default">a</span><span class="keyword">\</span><span class="default">string $sth</span><span class="keyword">){} </span><span class="comment">// Correct<br />
&nbsp;&nbsp;&nbsp; </span><span class="keyword">}<br />
} </span><span class="comment">// Causes a fatal error on this line. 'string' is considered an object from the namespace 'a'<br />

</span><span class="default">?&gt;</span>
</span>
</code></div>
  </div>
 </div>
 <a name="93405"></a>
 <div class="note">
  <strong class='user'>dpariyskiy at netatwork dot com</strong>
  <a href="#93405" class="date">08-Sep-2009 03:36</a>

  <div class="text">
<div class="phpcode"><code><span class="html">
Daniel, thank you for the type hinting class. Very useful.<br />
For anyone having a problem where php isn't setting Daniel's error handler, as was the case for me, try changing initializeHandler function to the following:<br />
<br />
<span class="default">&lt;?php<br />
</span><span class="keyword">public static function </span><span class="default">initializeHandler</span><span class="keyword">() <br />
{<br />
&nbsp;&nbsp;&nbsp; <br />

&nbsp;&nbsp;&nbsp; </span><span class="default">set_error_handler</span><span class="keyword">(array(</span><span class="string">'Typehint'</span><span class="keyword">,</span><span class="string">'handleTypehint'</span><span class="keyword">)); <br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; return </span><span class="default">TRUE</span><span class="keyword">; <br />
}<br />

</span><span class="default">?&gt;<br />
</span><br />
Hope this helps,<br />
--Dmitriy</span>
</code></div>
  </div>
 </div>
 <a name="88015"></a>
 <div class="note">
  <strong class='user'>bantam at banime dot com</strong>

  <a href="#88015" class="date">06-Jan-2009 10:53</a>
  <div class="text">
<div class="phpcode"><code><span class="html">
Daniel's typehint implementation was just what I was looking for but performance in production wasn't going to cut it. Calling a backtrace every time hurts performance. For my implementation I didn't use it, after all, PHP tells us what the data type is in the error message, I don't feel I need to evaluate the argument where I am using typehinting. Here is the cut down version I use in my error handling class:
<br />

<br />
<span class="default">&lt;?php
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="keyword">public static function </span><span class="default">typehint</span><span class="keyword">(</span><span class="default">$level</span><span class="keyword">, </span><span class="default">$message</span><span class="keyword">)

<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; {
<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; if(</span><span class="default">$level </span><span class="keyword">== </span><span class="default">E_RECOVERABLE_ERROR</span><span class="keyword">)
<br />

&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; {
<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; if(</span><span class="default">preg_match</span><span class="keyword">(</span><span class="string">'/^Argument (\d)+ passed to (?:(\w+)::)?(\w+)\(\) must be an instance of (\w+), (\w+) given/'</span><span class="keyword">, </span><span class="default">$message</span><span class="keyword">, </span><span class="default">$match</span><span class="keyword">))

<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; {
<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; if(</span><span class="default">$match</span><span class="keyword">[</span><span class="default">4</span><span class="keyword">] == </span><span class="default">$match</span><span class="keyword">[</span><span class="default">5</span><span class="keyword">])

<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">true</span><span class="keyword">;
<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; }

<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; }
<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">false</span><span class="keyword">;

<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; }
<br />
</span><span class="default">?&gt;
<br />
</span>
<br />
Hope this can be of use to somebody.</span>
</code></div>
  </div>
 </div>

 <a name="87731"></a>
 <div class="note">
  <strong class='user'>r dot wilczek at web-appz dot de</strong>
  <a href="#87731" class="date">18-Dec-2008 03:41</a>
  <div class="text">
<div class="phpcode"><code><span class="html">
It has already been mentioned here that you can use 'self' as a typehint (in methods of classes and interfaces, not in functions of course), which is useful in interfaces and abstract method declarations to force the implementor to accept an instance of it's own type:<br />
<span class="default">&lt;?php<br />

</span><span class="keyword">interface </span><span class="default">Foo <br />
</span><span class="keyword">{<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">baz</span><span class="keyword">(</span><span class="default">self $object</span><span class="keyword">);<br />
}<br />
<br />
class </span><span class="default">Bar </span><span class="keyword">implements </span><span class="default">Foo<br />

</span><span class="keyword">{<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">baz</span><span class="keyword">(</span><span class="default">self $object</span><span class="keyword">)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="comment">// <br />

&nbsp;&nbsp;&nbsp; </span><span class="keyword">}<br />
}<br />
</span><span class="default">?&gt;<br />
</span><br />
What has not been mentioned by now is that you can use 'parent' as a typehint too. Example with an interface:<br />
<span class="default">&lt;?php<br />
</span><span class="keyword">interface </span><span class="default">Foo <br />
</span><span class="keyword">{<br />

&nbsp;&nbsp;&nbsp; public function </span><span class="default">baz</span><span class="keyword">(</span><span class="default">parent $object</span><span class="keyword">); <br />
}<br />
<br />
class </span><span class="default">Baz </span><span class="keyword">{}<br />
class </span><span class="default">Bar </span><span class="keyword">extends </span><span class="default">Baz </span><span class="keyword">implements </span><span class="default">Foo<br />

</span><span class="keyword">{<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">baz</span><span class="keyword">(</span><span class="default">parent $object</span><span class="keyword">)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="comment">// <br />

&nbsp;&nbsp;&nbsp; </span><span class="keyword">}<br />
}<br />
</span><span class="default">?&gt;<br />
</span>Bar::baz() will now accept any instance of Baz.<br />
If Bar is not a heir of any class (no 'extends') PHP will raise a fatal error:<br />
'Cannot access parent:: when current class scope has no parent'.</span>
</code></div>
  </div>
 </div>

 <a name="86592"></a>
 <div class="note">
  <strong class='user'>wickedmuso at gmail dot com</strong>
  <a href="#86592" class="date">25-Oct-2008 03:26</a>
  <div class="text">
<div class="phpcode"><code><span class="html">
One useful thing with Type Hinting that I could not find in the documentation (but tested) is that you can also use an Interface in the hint (versus a Class).&nbsp; This is a very useful tool if you are trying to code to Interfaces rather than Classes (which is common in Test Driven Development and Dependency Injection paradigms).&nbsp; It means your external class can present itself into the method as long as it implements the nominated Interface (obviously).</span>

</code></div>
  </div>
 </div>
 <a name="86216"></a>
 <div class="note">
  <strong class='user'>info at thewebsiteguy dot com dot au</strong>
  <a href="#86216" class="date">08-Oct-2008 01:30</a>
  <div class="text">

<div class="phpcode"><code><span class="html">
I find it rather frustrating that PHP has internal data types but doesn't allow optional hinting for it.&nbsp; I REALLY needed it for something, so I found a way around it.
<br />

<br />
<span class="default">&lt;?php
<br />
</span><span class="keyword">abstract class </span><span class="default">DataType
<br />
</span><span class="keyword">{
<br />
&nbsp;&nbsp;&nbsp; protected </span><span class="default">$length</span><span class="keyword">;

<br />
&nbsp;&nbsp;&nbsp; protected </span><span class="default">$precision</span><span class="keyword">;
<br />
&nbsp;&nbsp;&nbsp; protected </span><span class="default">$number</span><span class="keyword">;
<br />
&nbsp;&nbsp;&nbsp;
<br />
&nbsp; public function </span><span class="default">__construct</span><span class="keyword">()

<br />
&nbsp; {
<br />
&nbsp;&nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">number </span><span class="keyword">= </span><span class="default">false</span><span class="keyword">;
<br />
&nbsp;&nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">precision </span><span class="keyword">= </span><span class="default">null</span><span class="keyword">;

<br />
&nbsp; }
<br />
&nbsp;&nbsp;&nbsp;
<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">GetLength</span><span class="keyword">()
<br />
&nbsp;&nbsp;&nbsp; {
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">length</span><span class="keyword">;

<br />
&nbsp;&nbsp;&nbsp; }
<br />
&nbsp;&nbsp;&nbsp;
<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">IsNumber</span><span class="keyword">()
<br />
&nbsp;&nbsp;&nbsp; {
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">number</span><span class="keyword">;

<br />
&nbsp;&nbsp;&nbsp; }
<br />

<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">GetPrecision</span><span class="keyword">()
<br />
&nbsp;&nbsp;&nbsp; {
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">precision</span><span class="keyword">;

<br />
&nbsp;&nbsp;&nbsp; }
<br />
}
<br />

<br />
class </span><span class="default">Integer </span><span class="keyword">extends </span><span class="default">DataType
<br />
</span><span class="keyword">{
<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">__construct</span><span class="keyword">(</span><span class="default">$length </span><span class="keyword">= </span><span class="default">12</span><span class="keyword">)

<br />
&nbsp;&nbsp;&nbsp; {
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">parent</span><span class="keyword">::</span><span class="default">__construct</span><span class="keyword">();
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">number </span><span class="keyword">= </span><span class="default">true</span><span class="keyword">;

<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">length </span><span class="keyword">= </span><span class="default">$length</span><span class="keyword">;
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">precision </span><span class="keyword">= </span><span class="default">0</span><span class="keyword">;

<br />
&nbsp;&nbsp;&nbsp; }
<br />
}
<br />

<br />
class </span><span class="default">Float </span><span class="keyword">extends </span><span class="default">DataType
<br />
</span><span class="keyword">{
<br />
&nbsp; public function </span><span class="default">__construct</span><span class="keyword">(</span><span class="default">$length </span><span class="keyword">= </span><span class="default">12</span><span class="keyword">, </span><span class="default">$precision </span><span class="keyword">= </span><span class="default">2</span><span class="keyword">)

<br />
&nbsp; {
<br />
&nbsp;&nbsp;&nbsp; </span><span class="default">parent</span><span class="keyword">::</span><span class="default">__construct</span><span class="keyword">();
<br />
&nbsp;&nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">number </span><span class="keyword">= </span><span class="default">true</span><span class="keyword">;

<br />
&nbsp;&nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">length </span><span class="keyword">= </span><span class="default">$length</span><span class="keyword">;
<br />
&nbsp;&nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">precision </span><span class="keyword">= </span><span class="default">$precision</span><span class="keyword">;
<br />

&nbsp; }
<br />
}
<br />

<br />
class </span><span class="default">String </span><span class="keyword">extends </span><span class="default">DataType
<br />
</span><span class="keyword">{
<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">__construct</span><span class="keyword">(</span><span class="default">$length </span><span class="keyword">= </span><span class="default">255</span><span class="keyword">)

<br />
&nbsp;&nbsp;&nbsp; {
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">parent</span><span class="keyword">::</span><span class="default">__constructor</span><span class="keyword">();
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">length </span><span class="keyword">= </span><span class="default">$length</span><span class="keyword">;

<br />
&nbsp;&nbsp;&nbsp; }
<br />
}
<br />
</span><span class="comment">//etc etc through the types...
<br />
</span><span class="default">?&gt;
<br />
</span>
<br />
then later I can do this...
<br />

<br />

<span class="default">&lt;?php
<br />
</span><span class="keyword">final class </span><span class="default">Field
<br />
</span><span class="keyword">{
<br />
&nbsp;&nbsp;&nbsp; public </span><span class="default">$Name</span><span class="keyword">;
<br />
&nbsp;&nbsp;&nbsp; public </span><span class="default">$Mandatory</span><span class="keyword">;
<br />

&nbsp;&nbsp;&nbsp; public </span><span class="default">$Hidden</span><span class="keyword">;
<br />
&nbsp;&nbsp;&nbsp; public </span><span class="default">$ListField</span><span class="keyword">;
<br />
&nbsp;&nbsp;&nbsp; public </span><span class="default">$Value</span><span class="keyword">;
<br />
&nbsp;&nbsp;&nbsp; public </span><span class="default">$ForeignClass</span><span class="keyword">;

<br />
&nbsp;&nbsp;&nbsp; public </span><span class="default">$ReadOnly</span><span class="keyword">;
<br />
&nbsp;&nbsp;&nbsp; public </span><span class="default">$DataType</span><span class="keyword">;
<br />
&nbsp;&nbsp;&nbsp;
<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">__construct</span><span class="keyword">(</span><span class="default">$name</span><span class="keyword">, </span><span class="default">DataType $dataType</span><span class="keyword">, </span><span class="default">$mandatory </span><span class="keyword">= </span><span class="default">false</span><span class="keyword">, </span><span class="default">$listField </span><span class="keyword">= </span><span class="default">true</span><span class="keyword">, </span><span class="default">$value </span><span class="keyword">= </span><span class="default">null</span><span class="keyword">, </span><span class="default">$readOnly </span><span class="keyword">= </span><span class="default">false</span><span class="keyword">, </span><span class="default">BaseCBO $foreignClass </span><span class="keyword">= </span><span class="default">null</span><span class="keyword">)

<br />
&nbsp;&nbsp;&nbsp; {
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">Name </span><span class="keyword">= </span><span class="default">$name</span><span class="keyword">;
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">DataType </span><span class="keyword">= </span><span class="default">$dataType</span><span class="keyword">;

<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">Mandatory </span><span class="keyword">= </span><span class="default">$mandatory</span><span class="keyword">;
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">ListField </span><span class="keyword">= </span><span class="default">$listField</span><span class="keyword">;

<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">Value </span><span class="keyword">= </span><span class="default">$value</span><span class="keyword">;
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">ReadOnly </span><span class="keyword">= </span><span class="default">$readOnly</span><span class="keyword">;

<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">ForeignClass </span><span class="keyword">= </span><span class="default">$foreignClass</span><span class="keyword">;
<br />
&nbsp;&nbsp;&nbsp; }
<br />
}
<br />

<br />
</span><span class="comment">// ....
<br />

<br />
</span><span class="keyword">class </span><span class="default">DoSomeStuff
<br />
</span><span class="keyword">{
<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">DoGenericThings</span><span class="keyword">(</span><span class="default">Field $field</span><span class="keyword">)
<br />

&nbsp;&nbsp;&nbsp; {
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; if (</span><span class="default">$field</span><span class="keyword">-&gt;</span><span class="default">DataType </span><span class="keyword">instanceof </span><span class="default">Integer</span><span class="keyword">)
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; {

<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span><span class="comment">// do things for an integer field...
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="keyword">}
<br />
&nbsp;&nbsp;&nbsp; }
<br />
}

<br />
</span><span class="default">?&gt;</span>
</span>
</code></div>
  </div>
 </div>
 <a name="86074"></a>
 <div class="note">
  <strong class='user'>wbcarts at juno dot com</strong>
  <a href="#86074" class="date">02-Oct-2008 01:20</a>

  <div class="text">
<div class="phpcode"><code><span class="html">
TYPE-HINTING and VISIBILITY<br />
<br />
Type-hinting is just one more small piece of PHP that protects our objects when visibility cannot.<br />
<br />
<span class="default">&lt;?php<br />
<br />
</span><span class="keyword">class </span><span class="default">Point </span><span class="keyword">{<br />
&nbsp; public </span><span class="default">$x</span><span class="keyword">, </span><span class="default">$y</span><span class="keyword">;<br />

<br />
&nbsp; public function </span><span class="default">__construct</span><span class="keyword">(</span><span class="default">$xVal </span><span class="keyword">= </span><span class="default">0</span><span class="keyword">, </span><span class="default">$yVal </span><span class="keyword">= </span><span class="default">0</span><span class="keyword">) {<br />
&nbsp;&nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">x </span><span class="keyword">= </span><span class="default">$xVal</span><span class="keyword">;<br />

&nbsp;&nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">y </span><span class="keyword">= </span><span class="default">$yVal</span><span class="keyword">;<br />
&nbsp; }<br />
}<br />
<br />
class </span><span class="default">Polyline </span><span class="keyword">{<br />

&nbsp; protected </span><span class="default">$points </span><span class="keyword">= array();<br />
<br />
&nbsp; public function </span><span class="default">addPoint</span><span class="keyword">(</span><span class="default">Point $p</span><span class="keyword">) {&nbsp; </span><span class="comment">// the line we're interested in...<br />
&nbsp;&nbsp;&nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">points</span><span class="keyword">[] = </span><span class="default">$p</span><span class="keyword">;<br />

&nbsp; }<br />
}<br />
<br />
</span><span class="default">$point1 </span><span class="keyword">= new </span><span class="default">Point</span><span class="keyword">(</span><span class="default">15</span><span class="keyword">, </span><span class="default">12</span><span class="keyword">);<br />
</span><span class="default">$polyline </span><span class="keyword">= new </span><span class="default">Polyline</span><span class="keyword">();<br />

</span><span class="default">$polyline</span><span class="keyword">-&gt;</span><span class="default">addPoint</span><span class="keyword">(</span><span class="default">$point1</span><span class="keyword">);<br />
</span><span class="default">$polyline</span><span class="keyword">-&gt;</span><span class="default">addPoint</span><span class="keyword">(new </span><span class="default">Point</span><span class="keyword">(</span><span class="default">55</span><span class="keyword">, </span><span class="default">22</span><span class="keyword">));<br />

</span><span class="default">$polyline</span><span class="keyword">-&gt;</span><span class="default">addPoint</span><span class="keyword">(new </span><span class="default">Point</span><span class="keyword">(</span><span class="default">33</span><span class="keyword">, </span><span class="default">31</span><span class="keyword">));<br />
<br />
</span><span class="default">$polyline</span><span class="keyword">-&gt;</span><span class="default">addPoint</span><span class="keyword">(new </span><span class="default">stdClass</span><span class="keyword">());&nbsp; &nbsp; </span><span class="comment">// PHP will throw an error for us!&nbsp; <br />

<br />
</span><span class="default">?&gt;<br />
</span><br />
Since our Polyline::addPoint() function has to be public, any outside code can try to pass anything. But, when type-hinting is declared, PHP throws an error when phoney data tries to sneak by.</span>
</code></div>
  </div>
 </div>
 <a name="85613"></a>
 <div class="note">
  <strong class='user'>DanielLWood [at] Gmail [dot] Com</strong>

  <a href="#85613" class="date">09-Sep-2008 12:59</a>
  <div class="text">
<div class="phpcode"><code><span class="html">
To follow up on my original post dealing with the type hinting class I provided:<br />
<br />
Kalkamar is absolutely correct, it is slow and is a hack.&nbsp; Everyone who uses it and wants to see this type of syntax native needs to post on the 'php internals' development thread in support.<br />
<br />
Thanks,<br />
<br />

Dan</span>
</code></div>
  </div>
 </div>
 <a name="85527"></a>
 <div class="note">
  <strong class='user'>kalkamar at web dot de</strong>
  <a href="#85527" class="date">04-Sep-2008 09:24</a>

  <div class="text">
<div class="phpcode"><code><span class="html">
I really like the Daniel`s Typehinting-Class, but you please not that it may be relevant for the performance if you use Typehinting for scalar values very often.<br />
<br />
Here is my performance-test:<br />
<br />
<span class="default">&lt;?php<br />
<br />
</span><span class="keyword">function </span><span class="default">notypehinting</span><span class="keyword">(</span><span class="default">$x</span><span class="keyword">)<br />

{<br />
&nbsp;&nbsp;&nbsp; </span><span class="default">is_string</span><span class="keyword">(</span><span class="default">$x</span><span class="keyword">);&nbsp;&nbsp; </span><span class="comment">//checking the type manually instead<br />
</span><span class="keyword">}<br />
<br />
function </span><span class="default">typehinting</span><span class="keyword">(</span><span class="default">string $x</span><span class="keyword">)<br />

{<br />
}<br />
<br />
</span><span class="default">$test</span><span class="keyword">=new </span><span class="default">timer</span><span class="keyword">;<br />
for(</span><span class="default">$i</span><span class="keyword">=</span><span class="default">0</span><span class="keyword">;</span><span class="default">$i</span><span class="keyword">&lt;</span><span class="default">10000</span><span class="keyword">;</span><span class="default">$i</span><span class="keyword">++)<br />

{<br />
try{<br />
&nbsp;&nbsp;&nbsp; </span><span class="default">notypehinting</span><span class="keyword">(</span><span class="string">'test'</span><span class="keyword">);<br />
}<br />
catch(</span><span class="default">Exception $e</span><span class="keyword">){}<br />
}<br />

echo </span><span class="default">$test</span><span class="keyword">.</span><span class="string">'&lt;br&gt;'</span><span class="keyword">;<br />
<br />
</span><span class="default">$test2</span><span class="keyword">=new </span><span class="default">timer</span><span class="keyword">;<br />
for(</span><span class="default">$i</span><span class="keyword">=</span><span class="default">0</span><span class="keyword">;</span><span class="default">$i</span><span class="keyword">&lt;</span><span class="default">10000</span><span class="keyword">;</span><span class="default">$i</span><span class="keyword">++)<br />

{<br />
try{<br />
&nbsp;&nbsp;&nbsp; </span><span class="default">typehinting</span><span class="keyword">(</span><span class="string">'test'</span><span class="keyword">);<br />
}<br />
catch(</span><span class="default">Exception $e</span><span class="keyword">){}<br />
}<br />

echo </span><span class="default">$test2</span><span class="keyword">.</span><span class="string">'&lt;br&gt;'</span><span class="keyword">;<br />
</span><span class="default">?&gt;<br />
</span><br />
Output:<br />
<br />
0.0088460445404053<br />
0.21634602546692<br />

<br />
Result:<br />
typehinting() ist more than 20 times slower than notypehinting()<br />
<br />
You see: typehinting for scalar types (like suggested by Daniel) is not the best thing for the performance if you use it very often.</span>
</code></div>
  </div>
 </div>
 <a name="84526"></a>
 <div class="note">

  <strong class='user'>comments at ignorethis netweblogic com</strong>
  <a href="#84526" class="date">17-Jul-2008 02:39</a>
  <div class="text">
<div class="phpcode"><code><span class="html">
Note that you cannot add a type hint and give a default value, apart from arrays. You will get an internal server error, or fatal error.<br />
<br />
e.g. <br />
<br />
<span class="default">&lt;?php<br />

<br />
</span><span class="comment">//Wont work<br />
</span><span class="keyword">function </span><span class="default">test</span><span class="keyword">(</span><span class="default">ObjName $obj </span><span class="keyword">= </span><span class="string">''</span><span class="keyword">){<br />
&nbsp;&nbsp; </span><span class="comment">//.....<br />
</span><span class="keyword">}<br />
<br />

</span><span class="comment">//Will work<br />
</span><span class="keyword">function </span><span class="default">test</span><span class="keyword">(Array </span><span class="default">$obj </span><span class="keyword">= array()){<br />
&nbsp;&nbsp; </span><span class="comment">//.....<br />
</span><span class="keyword">}<br />
<br />
</span><span class="default">?&gt;<br />
</span><br />

Even if you have Daniel's implementation of type hinting, a string typehint will still not work if you give it an empty string default too.</span>
</code></div>
  </div>
 </div>
 <a name="84436"></a>
 <div class="note">
  <strong class='user'>marcus at ignorethis netweblogic dot com</strong>
  <a href="#84436" class="date">14-Jul-2008 01:18</a>

  <div class="text">
<div class="phpcode"><code><span class="html">
Love the typehint object Daniel. Great effort!
<br />

<br />
However, it still throws catchable fatal errors, which is not what I want, so I added one line to handleTypehint() so it throws an Exception.
<br />

<br />
<span class="default">&lt;?php
<br />
</span><span class="keyword">public static function </span><span class="default">handleTypehint</span><span class="keyword">(</span><span class="default">$ErrLevel</span><span class="keyword">, </span><span class="default">$ErrMessage</span><span class="keyword">) {

<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; if (</span><span class="default">$ErrLevel </span><span class="keyword">== </span><span class="default">E_RECOVERABLE_ERROR</span><span class="keyword">) {
<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; if (</span><span class="default">preg_match </span><span class="keyword">( </span><span class="default">TYPEHINT_PCRE</span><span class="keyword">, </span><span class="default">$ErrMessage</span><span class="keyword">, </span><span class="default">$ErrMatches </span><span class="keyword">)) {

<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; list ( </span><span class="default">$ErrMatch</span><span class="keyword">, </span><span class="default">$ThArgIndex</span><span class="keyword">, </span><span class="default">$ThClass</span><span class="keyword">, </span><span class="default">$ThFunction</span><span class="keyword">, </span><span class="default">$ThHint</span><span class="keyword">, </span><span class="default">$ThType </span><span class="keyword">) = </span><span class="default">$ErrMatches</span><span class="keyword">;

<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; if (isset ( </span><span class="default">self</span><span class="keyword">::</span><span class="default">$Typehints </span><span class="keyword">[</span><span class="default">$ThHint</span><span class="keyword">] )) {
<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$ThBacktrace </span><span class="keyword">= </span><span class="default">debug_backtrace </span><span class="keyword">();

<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$ThArgValue </span><span class="keyword">= </span><span class="default">NULL</span><span class="keyword">;
<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; if (</span><span class="default">self</span><span class="keyword">::</span><span class="default">getTypehintedArgument </span><span class="keyword">( </span><span class="default">$ThBacktrace</span><span class="keyword">, </span><span class="default">$ThFunction</span><span class="keyword">, </span><span class="default">$ThArgIndex</span><span class="keyword">, </span><span class="default">$ThArgValue </span><span class="keyword">)) {

<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; if (</span><span class="default">call_user_func </span><span class="keyword">( </span><span class="default">self</span><span class="keyword">::</span><span class="default">$Typehints </span><span class="keyword">[</span><span class="default">$ThHint</span><span class="keyword">], </span><span class="default">$ThArgValue </span><span class="keyword">)) {

<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">TRUE</span><span class="keyword">;

<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; }
<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; }

<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; }
<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; throw new </span><span class="default">Exception</span><span class="keyword">(</span><span class="default">$ErrMessage</span><span class="keyword">);

<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; }
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; }
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">FALSE</span><span class="keyword">;

<br />
&nbsp;&nbsp;&nbsp; }
<br />
</span><span class="default">?&gt;</span>
</span>
</code></div>
  </div>
 </div>
 <a name="84384"></a>
 <div class="note">
  <strong class='user'>madness</strong>

  <a href="#84384" class="date">11-Jul-2008 10:09</a>
  <div class="text">
<div class="phpcode"><code><span class="html">
I must admit that Daniel's implementation is quite awesome (after all we'd be omonyms if I was english, omen nomen ;-) ), for everyone that already has a function/class to handle errors, this is a quick method to integrate the TypeHint class:<br />
<br />
<span class="default">&lt;?php<br />
&nbsp;&nbsp;&nbsp; </span><span class="keyword">public static function </span><span class="default">handleError</span><span class="keyword">(</span><span class="default">$errno</span><span class="keyword">, </span><span class="default">$errstr</span><span class="keyword">, </span><span class="default">$errfile</span><span class="keyword">, </span><span class="default">$errline</span><span class="keyword">){<br />

<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="comment">// Implements just-in-time classes for broad type hinting<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="keyword">if (</span><span class="default">TypeHint</span><span class="keyword">::</span><span class="default">handleTypehint</span><span class="keyword">(</span><span class="default">$errno</span><span class="keyword">, </span><span class="default">$errstr</span><span class="keyword">)){<br />

&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">true</span><span class="keyword">;<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; }<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <br />

&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="comment">// do your usual stuff here<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; /*<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; * ...<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; */<br />

&nbsp;&nbsp;&nbsp; </span><span class="keyword">}<br />
</span><span class="default">?&gt;<br />
</span><br />
The initializeHandler method and the Typehint::initializeHandler(); call are rendered useless in this case. Enjoy.</span>
</code></div>
  </div>
 </div>
 <a name="83442"></a>
 <div class="note">

  <strong class='user'>Daniel dot L dot Wood at Gmail dot Com</strong>
  <a href="#83442" class="date">26-May-2008 06:00</a>
  <div class="text">
<div class="phpcode"><code><span class="html">
People often ask about scalar/basic typehints.&nbsp; Here is a drop in class that I use in my MVC framework that will enable typehints through the use of a custom error handler.<br />
<br />
Note: You should include this code above all other code in your include headers and if you are the using set_error_handler() function you should be aware that this uses it as well.&nbsp; You may need to chain your set_error_handlers()<br />

<br />
Why?<br />
1) Because people are sick of using the is_* functions to validate parameters.<br />
2) Reduction of redundant coding for defensive coders.<br />
3) Functions/Methods are self defining/documenting as to required input.<br />
<br />
Also..<br />
Follow the discussion for typehints in PHP 6.0 on the PHP Internals boards.<br />
<br />
<span class="default">&lt;?php<br />

<br />
define</span><span class="keyword">(</span><span class="string">'TYPEHINT_PCRE'&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span><span class="keyword">,</span><span class="string">'/^Argument (\d)+ passed to (?:(\w+)::)?(\w+)\(\) must be an instance of (\w+), (\w+) given/'</span><span class="keyword">);<br />
<br />
class </span><span class="default">Typehint<br />

</span><span class="keyword">{<br />
<br />
&nbsp;&nbsp;&nbsp; private static </span><span class="default">$Typehints </span><span class="keyword">= array(<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="string">'boolean'&nbsp;&nbsp; </span><span class="keyword">=&gt; </span><span class="string">'is_bool'</span><span class="keyword">,<br />

&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="string">'integer'&nbsp;&nbsp; </span><span class="keyword">=&gt; </span><span class="string">'is_int'</span><span class="keyword">,<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="string">'float'&nbsp; &nbsp;&nbsp; </span><span class="keyword">=&gt; </span><span class="string">'is_float'</span><span class="keyword">,<br />

&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="string">'string'&nbsp; &nbsp; </span><span class="keyword">=&gt; </span><span class="string">'is_string'</span><span class="keyword">,<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="string">'resrouce'&nbsp; </span><span class="keyword">=&gt; </span><span class="string">'is_resource'<br />

&nbsp;&nbsp;&nbsp; </span><span class="keyword">);<br />
<br />
&nbsp;&nbsp;&nbsp; private function </span><span class="default">__Constrct</span><span class="keyword">() {}<br />
<br />
&nbsp;&nbsp;&nbsp; public static function </span><span class="default">initializeHandler</span><span class="keyword">()<br />
&nbsp;&nbsp;&nbsp; {<br />

<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">set_error_handler</span><span class="keyword">(</span><span class="string">'Typehint::handleTypehint'</span><span class="keyword">);<br />
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">TRUE</span><span class="keyword">;<br />

&nbsp;&nbsp;&nbsp; }<br />
<br />
&nbsp;&nbsp;&nbsp; private static function </span><span class="default">getTypehintedArgument</span><span class="keyword">(</span><span class="default">$ThBackTrace</span><span class="keyword">, </span><span class="default">$ThFunction</span><span class="keyword">, </span><span class="default">$ThArgIndex</span><span class="keyword">, &amp;</span><span class="default">$ThArgValue</span><span class="keyword">)<br />

&nbsp;&nbsp;&nbsp; {<br />
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; foreach (</span><span class="default">$ThBackTrace </span><span class="keyword">as </span><span class="default">$ThTrace</span><span class="keyword">)<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; {<br />

<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span><span class="comment">// Match the function; Note we could do more defensive error checking.<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span><span class="keyword">if (isset(</span><span class="default">$ThTrace</span><span class="keyword">[</span><span class="string">'function'</span><span class="keyword">]) &amp;&amp; </span><span class="default">$ThTrace</span><span class="keyword">[</span><span class="string">'function'</span><span class="keyword">] == </span><span class="default">$ThFunction</span><span class="keyword">)<br />

&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; {<br />
<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$ThArgValue </span><span class="keyword">= </span><span class="default">$ThTrace</span><span class="keyword">[</span><span class="string">'args'</span><span class="keyword">][</span><span class="default">$ThArgIndex </span><span class="keyword">- </span><span class="default">1</span><span class="keyword">];<br />

<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">TRUE</span><span class="keyword">;<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; }<br />

&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; }<br />
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">FALSE</span><span class="keyword">;<br />
&nbsp;&nbsp;&nbsp; }<br />
<br />

&nbsp;&nbsp;&nbsp; public static function </span><span class="default">handleTypehint</span><span class="keyword">(</span><span class="default">$ErrLevel</span><span class="keyword">, </span><span class="default">$ErrMessage</span><span class="keyword">)<br />
&nbsp;&nbsp;&nbsp; {<br />
<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; if (</span><span class="default">$ErrLevel </span><span class="keyword">== </span><span class="default">E_RECOVERABLE_ERROR</span><span class="keyword">)<br />

&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; {<br />
<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; if (</span><span class="default">preg_match</span><span class="keyword">(</span><span class="default">TYPEHINT_PCRE</span><span class="keyword">, </span><span class="default">$ErrMessage</span><span class="keyword">, </span><span class="default">$ErrMatches</span><span class="keyword">))<br />

&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; {<br />
<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; list(</span><span class="default">$ErrMatch</span><span class="keyword">, </span><span class="default">$ThArgIndex</span><span class="keyword">, </span><span class="default">$ThClass</span><span class="keyword">, </span><span class="default">$ThFunction</span><span class="keyword">, </span><span class="default">$ThHint</span><span class="keyword">, </span><span class="default">$ThType</span><span class="keyword">) = </span><span class="default">$ErrMatches</span><span class="keyword">;<br />

<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; if (isset(</span><span class="default">self</span><span class="keyword">::</span><span class="default">$Typehints</span><span class="keyword">[</span><span class="default">$ThHint</span><span class="keyword">]))<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; {<br />

<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$ThBacktrace </span><span class="keyword">= </span><span class="default">debug_backtrace</span><span class="keyword">();<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">$ThArgValue&nbsp; </span><span class="keyword">= </span><span class="default">NULL</span><span class="keyword">;<br />

<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; if (</span><span class="default">self</span><span class="keyword">::</span><span class="default">getTypehintedArgument</span><span class="keyword">(</span><span class="default">$ThBacktrace</span><span class="keyword">, </span><span class="default">$ThFunction</span><span class="keyword">, </span><span class="default">$ThArgIndex</span><span class="keyword">, </span><span class="default">$ThArgValue</span><span class="keyword">))<br />

&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; {<br />
<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; if (</span><span class="default">call_user_func</span><span class="keyword">(</span><span class="default">self</span><span class="keyword">::</span><span class="default">$Typehints</span><span class="keyword">[</span><span class="default">$ThHint</span><span class="keyword">], </span><span class="default">$ThArgValue</span><span class="keyword">))<br />

&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; {<br />
<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">TRUE</span><span class="keyword">;<br />

&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; }<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; }<br />

&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; }<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; }<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; }<br />

<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">FALSE</span><span class="keyword">;<br />
&nbsp;&nbsp;&nbsp; }<br />
}<br />
<br />
</span><span class="default">Typehint</span><span class="keyword">::</span><span class="default">initializeHandler</span><span class="keyword">();<br />

<br />
</span><span class="default">?&gt;<br />
</span><br />
An are some examples of the class in use:<br />
<br />
<span class="default">&lt;?php<br />
<br />
</span><span class="keyword">function </span><span class="default">teststring</span><span class="keyword">(</span><span class="default">string $string</span><span class="keyword">) { echo </span><span class="default">$string</span><span class="keyword">; }<br />

function </span><span class="default">testinteger</span><span class="keyword">(</span><span class="default">integer $integer</span><span class="keyword">) { echo </span><span class="default">$integer</span><span class="keyword">; }<br />
function </span><span class="default">testfloat</span><span class="keyword">(</span><span class="default">float $float</span><span class="keyword">) { echo </span><span class="default">$float</span><span class="keyword">; }<br />
<br />

</span><span class="comment">// This will work for class methods as well.<br />
<br />
</span><span class="default">?&gt;<br />
</span><br />
You get the picture..</span>
</code></div>
  </div>
 </div>
 <a name="80087"></a>
 <div class="note">

  <strong class='user'>Darby</strong>
  <a href="#80087" class="date">28-Dec-2007 03:50</a>
  <div class="text">
<div class="phpcode"><code><span class="html">
Correction to previous note:<br />
<br />
"Failing to satisfy the type hint results in a catchable fatal error."<br />
<br />
This only seems to be the case for PHP &gt;= 5.2.0.</span>

</code></div>
  </div>
 </div>
 <a name="79014"></a>
 <div class="note">
  <strong class='user'>jesdisciple @t gmail -dot- com</strong>
  <a href="#79014" class="date">07-Nov-2007 03:50</a>
  <div class="text">

<div class="phpcode"><code><span class="html">
The manual's sample code says:<br />
<span class="default">&lt;?php<br />
</span><span class="comment">//...<br />
// Fatal Error: Argument 1 must not be null<br />
</span><span class="default">$myclass</span><span class="keyword">-&gt;</span><span class="default">test</span><span class="keyword">(</span><span class="default">null</span><span class="keyword">);<br />
</span><span class="comment">//...<br />

</span><span class="default">?&gt;<br />
</span><br />
And this is true, unless a default value of NULL is given; in fact, this is the only way to give a default value for object arguments (as a default value must be a constant expression):<br />
<span class="default">&lt;?php<br />
$mine </span><span class="keyword">= new </span><span class="default">MyClass</span><span class="keyword">();<br />
</span><span class="default">$mine</span><span class="keyword">-&gt;</span><span class="default">test</span><span class="keyword">(</span><span class="default">NULL</span><span class="keyword">);<br />

class </span><span class="default">MyClass</span><span class="keyword">{<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">__construct</span><span class="keyword">(</span><span class="default">OtherClass $arg </span><span class="keyword">= </span><span class="default">NULL</span><span class="keyword">){<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; if(</span><span class="default">is_null</span><span class="keyword">(</span><span class="default">$arg</span><span class="keyword">)){<br />

&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; </span><span class="comment">//Apply default value here.<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="keyword">}<br />
&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">test</span><span class="keyword">(array </span><span class="default">$arr </span><span class="keyword">= </span><span class="default">NULL</span><span class="keyword">){<br />

&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span><span class="default">print_r</span><span class="keyword">(</span><span class="default">$arr</span><span class="keyword">);<br />
&nbsp;&nbsp;&nbsp; }<br />
}<br />
class </span><span class="default">OtherClass</span><span class="keyword">{<br />

&nbsp;&nbsp;&nbsp; <br />
}<br />
</span><span class="default">?&gt;</span>
</span>
</code></div>
  </div>
 </div>
 <a name="78533"></a>
 <div class="note">
  <strong class='user'>Jazz</strong>

  <a href="#78533" class="date">16-Oct-2007 04:20</a>
  <div class="text">
<div class="phpcode"><code><span class="html">
To Nikivich and Edorian:<br />
<br />
There are many times when you would use an equals() method other than to find out if the two objects are the same object. Think of all the primitive wrapper classes in Java, for example -- if you create two new Integer()'s with identical values, equals() returns true, even though they are two different objects. There would be no reason to allow someone to perform an equals() between an Integer and, say, a GregorianCalendar -- it just doesn't make sense. In Java you would attempt this and probably get a ClassCastException, but in PHP no such facility exists, so the best way to prevent this would be through type hinting.<br />
<br />
The point Nicholas was making is that you can't specify a stricter type hint on an inherited method, and despite your arguments, that would be a truly useful thing to be able to do.<br />
<br />
(True overloading would be a better way, IMHO, but *shrug*)</span>

</code></div>
  </div>
 </div>
 <a name="73538"></a>
 <div class="note">
  <strong class='user'>ldebuyst-&gt;brutele.be</strong>
  <a href="#73538" class="date">28-Feb-2007 02:52</a>
  <div class="text">

<div class="phpcode"><code><span class="html">
In reply to Nikivich and Edorian:<br />
<br />
Although it isn't quite clear from his post, I believe that the point nicholas is trying to make is that, if you typehint an abstract function, you MUST use that same typehint for all classes extending the abstract class.<br />
<br />
As his example shows, if you typehint (Object $object), then&nbsp; you must use the exact same typehint in the extending class. Using the typehint (Table $table) or (Chair $chair) will give fatal errors, even if Table and Chair are subclasses of Object.<br />
<br />
In other words, type hinting allows for descendants, as caliban at darklock dot com has shown, except when you're subclassing.<br />
<br />
See <a href="http://bugs.php.net/bug.php?id=36601" rel="nofollow" target="_blank">http://bugs.php.net/bug.php?id=36601</a> for a bit more info. Flagged as wontfix, though, so something to keep in mind.</span>

</code></div>
  </div>
 </div>
 <a name="73447"></a>
 <div class="note">
  <strong class='user'>Nikivich</strong>
  <a href="#73447" class="date">23-Feb-2007 03:28</a>
  <div class="text">

<div class="phpcode"><code><span class="html">
In reply to Nicolas<br />
<br />
I don't think you exactly understand the inheritance principles<br />
If you want to do the equals thing in a decent OO way, you would do something like this:<br />
<br />
class Object {<br />
&nbsp;&nbsp; &nbsp;&nbsp; public equals(Object &amp;o) {<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; return this == &amp;o; //perform default equals check, one could arguably say that === is the correct default, but doesnt matter for the example<br />

&nbsp;&nbsp; &nbsp;&nbsp; }<br />
}<br />
<br />
class Chair extends Object {<br />
}<br />
class Table extends Object {<br />
}<br />
<br />
$chair = new Chair();<br />

$table = new Table();<br />
$chair-&gt;equals($table); //will print false (zero)<br />
<br />
This is actually a correct implementation of an equals method. Since you want to take a chair for example and just call equals() on it WITH ANY OBJECT, you should only hint Object, not an implementation, since the whole point of the equals method is to find out whether it is actually the same object :-) I want to be able to pass a table (which implements Object too, so is perfectly allowed as a parameter to equals).<br />
<br />
Hope this clears it up a bit for you... :-)</span>
</code></div>
  </div>
 </div>
 <a name="73058"></a>

 <div class="note">
  <strong class='user'>Edorian</strong>
  <a href="#73058" class="date">07-Feb-2007 06:12</a>
  <div class="text">
<div class="phpcode"><code><span class="html">
In response to nicholas at nicholaswilliams dot info:<br />
<br />
Of course this doesn't work. Not in Php nor in Java.<br />
<br />

You can't put a Chair into Table just because there both implementing "Object"<br />
<br />
It wouldn't make any sense to say "i'm expecting an argument that implements the same object that i'm implementing" with type hinting.<br />
<br />
You say: "I'm expection an Object of that Class or a Object of a Subclass of that Class " like you do in every OO languange.</span>
</code></div>
  </div>
 </div>
 <a name="71141"></a>
 <div class="note">

  <strong class='user'>nicholas at nicholaswilliams dot info</strong>
  <a href="#71141" class="date">13-Nov-2006 08:53</a>
  <div class="text">
<div class="phpcode"><code><span class="html">
Please note that the following will not work:<br />
<br />
<span class="default">&lt;?php<br />
<br />
</span><span class="keyword">abstract class </span><span class="default">Object<br />

</span><span class="keyword">{<br />
&nbsp;&nbsp;&nbsp; public abstract function </span><span class="default">toString</span><span class="keyword">( );<br />
&nbsp;&nbsp;&nbsp; public abstract function </span><span class="default">equals</span><span class="keyword">( </span><span class="default">Object </span><span class="keyword">&amp;</span><span class="default">$o </span><span class="keyword">);<br />
}<br />

<br />
class </span><span class="default">Chair </span><span class="keyword">extends </span><span class="default">Object<br />
</span><span class="keyword">{<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">toString</span><span class="keyword">( )<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="string">'This is a chair.'</span><span class="keyword">;<br />

&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">equals</span><span class="keyword">( </span><span class="default">Chair </span><span class="keyword">&amp;</span><span class="default">$o </span><span class="keyword">)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">TRUE</span><span class="keyword">;<br />

&nbsp;&nbsp;&nbsp; }<br />
}<br />
<br />
class </span><span class="default">Table </span><span class="keyword">extends </span><span class="default">Object<br />
</span><span class="keyword">{<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">toString</span><span class="keyword">( )<br />

&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="string">'This is a table.'</span><span class="keyword">;<br />
&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">equals</span><span class="keyword">( </span><span class="default">Table </span><span class="keyword">&amp;</span><span class="default">$o </span><span class="keyword">)<br />

&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">TRUE</span><span class="keyword">;<br />
&nbsp;&nbsp;&nbsp; }<br />
}<br />
<br />
</span><span class="default">$chair </span><span class="keyword">= new </span><span class="default">Chair</span><span class="keyword">();<br />

</span><span class="default">$table </span><span class="keyword">= new </span><span class="default">Table</span><span class="keyword">();<br />
<br />
echo </span><span class="default">$chair</span><span class="keyword">-&gt;</span><span class="default">equals</span><span class="keyword">( </span><span class="default">$table </span><span class="keyword">);<br />
<br />
</span><span class="default">?&gt;<br />

</span><br />
The expected output is "Fatal error: Argument 1 passed to Chair::equals() must be an instance of Chair, called in [filename] on line 38 and defined in [filename] on line 16" but instead you get "Fatal error: Declaration of Chair::equals() must be compatible with that of Object::equals() in [filename] on line 20".<br />
<br />
This is unlike other OO languages (secifically Java) which not only allow but expect this type of code. It is in the nature of abstraction. However, you can get similar results using the following code instead:<br />
<br />
<span class="default">&lt;?php<br />
<br />
</span><span class="keyword">abstract class </span><span class="default">Object<br />
</span><span class="keyword">{<br />
&nbsp;&nbsp;&nbsp; public abstract function </span><span class="default">toString</span><span class="keyword">( );<br />

&nbsp;&nbsp;&nbsp; public abstract function </span><span class="default">equals</span><span class="keyword">( </span><span class="default">self </span><span class="keyword">&amp;</span><span class="default">$o </span><span class="keyword">);<br />
}<br />
<br />
class </span><span class="default">Chair </span><span class="keyword">extends </span><span class="default">Object<br />
</span><span class="keyword">{<br />

&nbsp;&nbsp;&nbsp; public function </span><span class="default">toString</span><span class="keyword">( )<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="string">'This is a chair.'</span><span class="keyword">;<br />
&nbsp;&nbsp;&nbsp; }<br />

&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">equals</span><span class="keyword">( </span><span class="default">self </span><span class="keyword">&amp;</span><span class="default">$o </span><span class="keyword">)<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">TRUE</span><span class="keyword">;<br />

&nbsp;&nbsp;&nbsp; }<br />
}<br />
<br />
class </span><span class="default">Table </span><span class="keyword">extends </span><span class="default">Object<br />
</span><span class="keyword">{<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">toString</span><span class="keyword">( )<br />

&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="string">'This is a table.'</span><span class="keyword">;<br />
&nbsp;&nbsp;&nbsp; }<br />
&nbsp;&nbsp;&nbsp; <br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">equals</span><span class="keyword">( </span><span class="default">self </span><span class="keyword">&amp;</span><span class="default">$o </span><span class="keyword">)<br />

&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">TRUE</span><span class="keyword">;<br />
&nbsp;&nbsp;&nbsp; }<br />
}<br />
<br />
</span><span class="default">$chair </span><span class="keyword">= new </span><span class="default">Chair</span><span class="keyword">();<br />

</span><span class="default">$table </span><span class="keyword">= new </span><span class="default">Table</span><span class="keyword">();<br />
<br />
echo </span><span class="default">$chair</span><span class="keyword">-&gt;</span><span class="default">equals</span><span class="keyword">( </span><span class="default">$table </span><span class="keyword">);<br />
<br />
</span><span class="default">?&gt;<br />

</span><br />
This code gives the expected result "Fatal error: Argument 1 passed to Chair::equals() must be an instance of Chair, called in [filename] on line 38 and defined in [filename] on line 16". This is the proper behavior but isn't the most intuitive approach for those of us used to OO programming.<br />
<br />
Hope this helps someone :-).<br />
<br />
Nicholas</span>
</code></div>
  </div>
 </div>
 <a name="69369"></a>
 <div class="note">

  <a href="#69369" class="date">02-Sep-2006 03:59</a>
  <div class="text">
<div class="phpcode"><code><span class="html">
The type hinting system can also be used for interfaces.&nbsp; Example:<br />
<br />
<span class="default">&lt;?php<br />
</span><span class="keyword">interface </span><span class="default">fooface<br />
</span><span class="keyword">{<br />

&nbsp;&nbsp;&nbsp; public function </span><span class="default">foo </span><span class="keyword">();<br />
}<br />
<br />
class </span><span class="default">fooclass </span><span class="keyword">implements </span><span class="default">fooface<br />
</span><span class="keyword">{<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">foo </span><span class="keyword">()<br />

&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; echo (</span><span class="string">'foo&lt;br&gt;'</span><span class="keyword">);<br />
&nbsp;&nbsp;&nbsp; }<br />
}<br />

class </span><span class="default">barclass </span><span class="keyword">implements </span><span class="default">fooface<br />
</span><span class="keyword">{<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">foo </span><span class="keyword">()<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; echo (</span><span class="string">'bar&lt;br&gt;'</span><span class="keyword">);<br />

&nbsp;&nbsp;&nbsp; }<br />
}<br />
class </span><span class="default">bazclass </span><span class="keyword">implements </span><span class="default">fooface<br />
</span><span class="keyword">{<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">foo </span><span class="keyword">()<br />

&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; echo (</span><span class="string">'baz&lt;br&gt;'</span><span class="keyword">);<br />
&nbsp;&nbsp;&nbsp; }<br />
}<br />

<br />
class </span><span class="default">quuxclass<br />
</span><span class="keyword">{<br />
&nbsp;&nbsp;&nbsp; public function </span><span class="default">foo </span><span class="keyword">()<br />
&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; echo (</span><span class="string">'quux&lt;br&gt;'</span><span class="keyword">);<br />

&nbsp;&nbsp;&nbsp; }<br />
}<br />
<br />
function </span><span class="default">callfoo </span><span class="keyword">(</span><span class="default">fooface $myClass</span><span class="keyword">)<br />
{<br />
&nbsp;&nbsp;&nbsp; </span><span class="default">$myClass </span><span class="keyword">-&gt; </span><span class="default">foo </span><span class="keyword">();<br />

}<br />
<br />
</span><span class="default">$myfoo </span><span class="keyword">= new </span><span class="default">fooclass</span><span class="keyword">;<br />
</span><span class="default">$mybar </span><span class="keyword">= new </span><span class="default">barclass</span><span class="keyword">;<br />
</span><span class="default">$mybaz </span><span class="keyword">= new </span><span class="default">bazclass</span><span class="keyword">;<br />

</span><span class="default">$myquux </span><span class="keyword">= new </span><span class="default">quuxclass</span><span class="keyword">;<br />
<br />
</span><span class="default">callfoo </span><span class="keyword">(</span><span class="default">$myfoo</span><span class="keyword">);<br />
</span><span class="default">callfoo </span><span class="keyword">(</span><span class="default">$mybar</span><span class="keyword">);<br />
</span><span class="default">callfoo </span><span class="keyword">(</span><span class="default">$mybaz</span><span class="keyword">);<br />

</span><span class="default">callfoo </span><span class="keyword">(</span><span class="default">$myquux</span><span class="keyword">); </span><span class="comment">// Fails because the quuxclass doesn't implement the fooface interface<br />
</span><span class="default">?&gt;<br />
</span><br />
Using this syntax you can allow a function to work with different classes as long as they all implement the same interfaces.&nbsp; An example might be an online shop that implements a plugin system for payment.&nbsp; If the creator of the script provides a payment module interface then functions can check if it has been implemented in a given payment class.&nbsp; This means that the details of the class are unimportant, so it doesn't matter if it interfaces with PayPal, HSBC, ProTX or any other payment system you care to name, but if it doesn't properly provide all the functionality a payment module requires a fatal error is generated.&nbsp; <br />

<br />
Unfortunately, it doesn't seem possible to use type hinting with new.&nbsp; In java you could do a "fooface myfoo = new fooclass" which would fail if you tried it with quuxclass instead, but as far as I can tell you can't do a similar test on create with PHP.</span>
</code></div>
  </div>
 </div>
 <a name="54501"></a>
 <div class="note">
  <strong class='user'>mlovett at morpace dot com</strong>

  <a href="#54501" class="date">06-Jul-2005 10:54</a>
  <div class="text">
<div class="phpcode"><code><span class="html">
Type hinting works with interfaces too. In other words, you can specify the name of an interface for a function parameter, and the object passed in must implement that interface, or else type hinting throws an exception.</span>
</code></div>
  </div>
 </div>
 <a name="50276"></a>
 <div class="note">

  <strong class='user'>caliban at darklock dot com</strong>
  <a href="#50276" class="date">23-Feb-2005 03:34</a>
  <div class="text">
<div class="phpcode"><code><span class="html">
In case you're worried, type hinting does allow descendants. Extending the documentation example:<br />
<br />
<span class="default">&lt;?php<br />
&nbsp;&nbsp; </span><span class="comment">// Example class<br />

&nbsp;&nbsp; </span><span class="keyword">class </span><span class="default">MyClass<br />
&nbsp;&nbsp; </span><span class="keyword">{<br />
&nbsp;&nbsp; &nbsp;&nbsp; public function </span><span class="default">test</span><span class="keyword">(</span><span class="default">OtherClass $otherclass</span><span class="keyword">) <br />
&nbsp;&nbsp; &nbsp;&nbsp; {<br />

&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; if(</span><span class="default">is_callable</span><span class="keyword">(array(</span><span class="default">$otherclass</span><span class="keyword">,</span><span class="default">$otherclass</span><span class="keyword">-&gt;</span><span class="default">var</span><span class="keyword">)))<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; {<br />

&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span><span class="default">$otherclass</span><span class="keyword">-&gt;{</span><span class="default">$otherclass</span><span class="keyword">-&gt;</span><span class="default">var</span><span class="keyword">}();<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; }<br />

&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; else<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; {<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; echo </span><span class="default">$otherclass</span><span class="keyword">-&gt;</span><span class="default">var</span><span class="keyword">;<br />

&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; }<br />
&nbsp;&nbsp; &nbsp;&nbsp; }<br />
&nbsp;&nbsp; }<br />
<br />
&nbsp;&nbsp; </span><span class="comment">// Another example class<br />

&nbsp;&nbsp; </span><span class="keyword">class </span><span class="default">OtherClass <br />
&nbsp;&nbsp; </span><span class="keyword">{<br />
&nbsp;&nbsp; &nbsp;&nbsp; public </span><span class="default">$var </span><span class="keyword">= </span><span class="string">'Hello World'</span><span class="keyword">;<br />
&nbsp;&nbsp; }<br />

<br />
&nbsp;&nbsp; </span><span class="comment">// Yet another example class<br />
&nbsp;&nbsp; </span><span class="keyword">class </span><span class="default">DerivedClass </span><span class="keyword">extends </span><span class="default">OtherClass <br />
&nbsp;&nbsp; </span><span class="keyword">{<br />
&nbsp;&nbsp; &nbsp;&nbsp; function </span><span class="default">__construct</span><span class="keyword">() <br />

&nbsp;&nbsp; &nbsp;&nbsp; { <br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">var</span><span class="keyword">=</span><span class="string">"Planet"</span><span class="keyword">; <br />
&nbsp;&nbsp; &nbsp;&nbsp; }<br />

<br />
&nbsp;&nbsp; &nbsp;&nbsp; public function </span><span class="default">Planet</span><span class="keyword">()<br />
&nbsp;&nbsp; &nbsp;&nbsp; {<br />
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; echo </span><span class="string">"Hello "</span><span class="keyword">.</span><span class="default">$this</span><span class="keyword">-&gt;</span><span class="default">var</span><span class="keyword">;<br />

&nbsp;&nbsp; &nbsp;&nbsp; }<br />
&nbsp;&nbsp; }<br />
<br />
&nbsp;&nbsp; </span><span class="default">$myclass </span><span class="keyword">= new </span><span class="default">MyClass</span><span class="keyword">;<br />
&nbsp;&nbsp; </span><span class="default">$otherclass </span><span class="keyword">= new </span><span class="default">OtherClass</span><span class="keyword">;<br />

&nbsp;&nbsp; </span><span class="default">$derivedclass </span><span class="keyword">= new </span><span class="default">DerivedClass</span><span class="keyword">;<br />
<br />
&nbsp;&nbsp; </span><span class="comment">// Works - prints "Hello World"<br />
&nbsp;&nbsp; </span><span class="default">$myclass</span><span class="keyword">-&gt;</span><span class="default">test</span><span class="keyword">(</span><span class="default">$otherclass</span><span class="keyword">);<br />

<br />
&nbsp;&nbsp; </span><span class="comment">// Works - calls DerivedClass::Planet()<br />
&nbsp;&nbsp; //&nbsp; &nbsp; which prints "Hello Planet"<br />
&nbsp;&nbsp; </span><span class="default">$myclass</span><span class="keyword">-&gt;</span><span class="default">test</span><span class="keyword">(</span><span class="default">$derivedclass</span><span class="keyword">);<br />

</span><span class="default">?&gt;</span>
</span>
</code></div>
  </div>
 </div></div>

 <div class="foot"><a href="/manual/add-note.php?sect=language.oop5.typehinting&amp;redirect=http://de.php.net/manual/en/language.oop5.typehinting.php"><img src="/images/notes-add.gif" alt="add a note" width="13" height="13" class="middle" /></a> <small><a href="/manual/add-note.php?sect=language.oop5.typehinting&amp;redirect=http://de.php.net/manual/en/language.oop5.typehinting.php">add a note</a></small></div>
</div><br />
 </div>
 <div class="cleaner">&nbsp;</div>

</div>

<div id="footnav">
   <a href="/source.php?url=/manual/en/language.oop5.typehinting.php">show source</a> |
 <a href="/credits.php">credits</a> |
 <a href="/sitemap.php">sitemap</a> |
 <a href="/contact.php">contact</a> |
 <a href="/contact.php#ads">advertising</a> |
 <a href="/mirrors.php">mirror sites</a>

</div>

<div id="pagefooter">
 <div id="copyright">
  <a href="/copyright.php">Copyright &copy; 2001-2011 The PHP Group</a><br />
  All rights reserved.
 </div>

 <div id="thismirror">
  <a href="/mirror.php">This mirror</a> generously provided by:
  <a href="http://www.globe.de/">@GLOBE GmbH</a><br />

  Last updated: Mon Apr 25 18:32:56 2011 UTC
 </div>
</div>
<!--[if IE 6]>
<script type="text/javascript">
    /*Load jQuery if not already loaded*/ if(typeof jQuery == 'undefined'){ document.write("<script type=\"text/javascript\"   src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js\"></"+"script>"); var __noconflict = true; }
    var IE6UPDATE_OPTIONS = {
        icons_path: "/ie6update/images/"
    }
</script>
<script type="text/javascript" src="/ie6update/ie6update.js"></script>
<![endif]-->
</body>
</html>
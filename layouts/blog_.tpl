<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.langauage_code }}" lang="{{ page.language_code }}">

<head>
{% include "SiteHeader" %}
{{ blog.rss_link }}
</head>

<body>
	
	<div id="wrap"{% if site.search.enabled %} style="padding-top: 86px;"{% endif %}>
    {% include "Search" %}
   
   <div id="leftside">
       {% include "Langmenu" %}
       <div id="header" class="clearfix">
           {% editable site.header %}
       </div> <!-- //header -->
       {% include "Mainmenu" %}
       {% include "Mobilemenu" %}
   </div>
   
   
   
   <div id="container">
     
     <div id="content">
        {% if tags %}
            <div class="tagged-list-header">
                <div class="header-tag-icon"></div>
                {% if tags == empty %}
                    {{ "no_posts_tagged" | lc }}
                {% else %}
                    {{ "posts_tagged" | lc }} '{{ tags | sort:"name" | map:"name" | join:"', '"}}'.
                {% endif %}
            </div>
        {% endif %}
     
       {% addbutton class="add-article" %}
       
              {% for article in articles %}
                <div class="blog clearfix">
                  <h1><a href="{{ article.url }}">{{ article.title }}</a></h1>
                  {{ article.created_at | format_date:"long" }} - <span class="highlight">{{ article.author.name }}</span><br /><br />        
                  {{ article.excerpt }} <a href="{{ article.url }}">{{ "read_more" |lc }}</a>
                  <div class="blog-info">
                    <div>{{"comments_for_count"|lc}}: <a href="{{ article.url }}#comments">{{article.comments_count}}</a></div>
                  </div> <!-- //blog-info -->     
         </div>
            {% endfor %}
       
     </div> <!-- //content -->
     
     <div id="footer" class="clearfix">
       
       {% content name="footer" xpage="true" %}
       <div id="edicy">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>
     </div> <!-- //footer -->
     
   </div> <!-- //container -->
   
   <div class="clearer"></div>
  </div> <!-- //wrap -->
  {% include "JS" %}
</body>
</html>
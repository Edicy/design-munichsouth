<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.language_code }}" lang="{{ page.language_code }}">

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
       
       <div class="blog clearfix" class="content-hyphenate">
         <h1>{% editable article.title plain="true" %}</h1>
                {{ article.created_at | format_date:"long" }} - <span class="highlight">{{ article.author.name }}</span><br /><br />
            
         <div class="excerpt" data-search-indexing-allowed="true">{% editable article.excerpt %}</div>
               <div style="padding-top: 10px;">
                   <div data-search-indexing-allowed="true">{% editable article.body %}</div>
                   <div class="clearer"></div>
               
                   {% if editmode %}
                    <div class="cfx article-tags">
                        <div class="article-tag-icon"></div>
                        {% editable article.tags %}
                    </div>
                  {% else %}
                    {% unless article.tags == empty %}
                        <div class="cfx article-tags">
                            <div class="article-tag-icon"></div>
                            {% for tag in article.tags %}
                                <a href="{{ article.page.url }}/tagged/{{ tag.path }}">{{ tag.name }}</a>{% unless forloop.last %}, {% endunless %}
                            {% endfor %}
                        </div>
                    {% endunless %}
                  {% endif %}
                  <div class="clearer"></div>
              </div>
          
          <div class="blog-info">
                   
            <div><a name="comments"></a>{{"comments_for_count"|lc}}: <span class="highlight edy-site-blog-comments-count">{{article.comments_count}}</span></div>
                    
                  </div> <!-- //blog-info -->   
          
       </div> <!-- //blog -->
       
       
       <div class="comments">
         {% if article.comments_count != 0 %}<h1>{{"comments"|lc}}:</h1>{% endif %}
         
           {% for comment in article.comments %}
              
              


               <div class="comment edy-site-blog-comment">
           <div class="comment-number">
             {{ forloop.index }}
           </div> <!-- //comment-number -->
           <div class="comment-content">
             {{ comment.body_html }}
             <div style="padding-top: 7px"><span class="highlight">{{ comment.author }}</span> {{ comment.created_at | format_date:"long" }} {% removebutton %}</div>
           </div> <!-- //comment-content -->
         </div> <!-- //comment--> 
            {% endfor %}

         
         
         
         
         
         <div class="comment-form">

           {% commentform %}
{% unless comment.valid? %}<ul>
{% for error in comment.errors %}
<li>{{ error | lc }}</li>
{% endfor %}
</ul>{% endunless %}
<h1>{{"add_a_comment"|lc}}:</h1>
             <table>
               <tr>
                 <td>{{"name"|lc}}:</td>
                 <td style="padding-left: 10px; text-align: right;"><input type="text" name="comment[author]" class="textbox" value="{{comment.author}}" /></td>
               </tr>
               <tr>
                 <td>{{"email"|lc}}:</td>
                 <td style="padding-left: 10px; text-align: right;"><input type="text" name="comment[author_email]" class="textbox" value="{{comment.author_email}}" /></td>
               </tr>

               <tr>
                 <td>{{"comment"|lc}}:</td>
                 <td style="padding-left: 10px; text-align: right;"><textarea cols="20"  name="comment[body]" class="textbox" rows="5">{{comment.body}}</textarea></td>
               </tr>
               <tr>
                 <td colspan="2" style="text-align: right"><input type="submit" class="submit" value="{{"submit"|lc}}" /></td>
                      </tr>
             </table>
           {% endcommentform %}
         </div> <!-- //comment-form -->
         
       </div> <!-- //comments-->

       
     </div> <!-- //content -->
     
     <div id="footer" class="clearfix content-hyphenate">
       
       {% content name="footer" xpage="true" %}
       <div id="edicy">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>
     </div> <!-- //footer -->
     

   </div> <!-- //container -->
   
   <div class="clearer"></div>
  </div> <!-- //wrap -->
  {% include "JS" %}
</body>
</html>
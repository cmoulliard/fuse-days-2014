# Generate the Slideshow

hyla generate -c slideshow/conference-redhat.yaml


# Generate the Hands on lab

hyla generate -c hands-on-lab/content.yaml

# Create the PDF file

hyla generate -c hands-on-lab/pdf.yaml
open hands-on-lab/pdf/result.pdf

* There is an issue using hyla when we generate the PDF document as the document size is not correct. This problem can be resolved by using directly the tool wkhtml2pdf 0.12.0

    ````
    cd /Users/chmoulli/Downloads/wkhtmltox-0.12.1-b8ea0f4/bin
    ./wkhtmltopdf /Users/chmoulli/MyProjects/conferences/fuse-days-2014/hands-on-lab/generated/hands-on-lab.html   /Users/chmoulli/MyProjects/conferences/fuse-days-2014/hands-on-lab/pdf/hands-on-lab.pdf
    ````    

* As during pdf creation the cover text overlaps the logo of the header, a <div> tag must be added after the first section like that
    
    ````
    <section id="strong_jboss_fuse_technology_overview_strong" data-background="images/redhat-mw-logo-background.png">
    <div style="position:absolute; top:250px; left:50px; right:50px;">
    <h2>
    <strong>JBoss Fuse Technology Overview</strong>
    </h2>
    <div class="paragraph newline"><p>Red Hat JBoss Fuse Integration Partner Day</p></div>
    <div class="paragraph newline"><p>Charles Moulliard (@cmoulliard)<br>
    Principal Solution Architect / Apache Committer - Global Partner Enablement</p></div>
    <div class="paragraph newline"><p>13th of May - 2014</p></div>
    </div>
    </section>
    ````  

* The <div> should also be used for displaying the cover page during slides presentation with RevealJS

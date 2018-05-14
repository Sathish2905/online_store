<%@ taglib prefix="s" uri="/struts-tags"%>
<s:action name="header" executeResult="true">
</s:action>
<!-- Page heading starts -->

<div class="page-head">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>Contact Us</h2>
                <h4>something goes here</h4>
            </div>
        </div>
    </div>
</div>

<!-- Page Heading ends -->

<!-- Page content starts -->

<div class="content contact-two">
    <div class="container">
        <div class="row"> 

            <div class="col-md-6">
                <!-- Contact form -->
                <h4 class="title">Contact Form</h4>
                <div class="form">
                    <!-- Contact form (not working)-->
                    <form class="form-horizontal">
                        <!-- Name -->
                        <div class="form-group">
                            <label class="control-label col-md-3" for="name1">Name</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" id="name1">
                            </div>
                        </div>
                        <!-- Email -->
                        <div class="form-group">
                            <label class="control-label col-md-3" for="email1">Email</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" id="email1">
                            </div>
                        </div>
                        <!-- Website -->
                        <div class="form-group">
                            <label class="control-label col-md-3" for="website">Website</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" id="website">
                            </div>
                        </div>
                        <!-- Comment -->
                        <div class="form-group">
                            <label class="control-label col-md-3" for="comment">Comment</label>
                            <div class="col-md-6">
                                <textarea class="form-control" id="comment" rows="3"></textarea>
                            </div>
                        </div>
                        <!-- Buttons -->
                        <div class="form-group">
                            <!-- Buttons -->
                            <div class="col-md-6 col-md-offset-3">
                                <button type="submit" class="btn btn-default">Submit</button>
                                <button type="reset" class="btn btn-default">Reset</button>
                            </div>
                        </div>
                    </form>
                </div>
                <hr />        
                <div class="center">
                    <!-- Social media icons -->
                    <strong>Get in touch:</strong>
                    <div class="social">
                        <a href="#"><i class="icon-facebook facebook"></i></a>
                        <a href="#"><i class="icon-twitter twitter"></i></a>
                        <a href="#"><i class="icon-linkedin linkedin"></i></a>
                        <a href="#"><i class="icon-google-plus google-plus"></i></a>
                        <a href="#"><i class="icon-pinterest pinterest"></i></a>
                    </div>
                </div>

            </div>
            <div class="col-md-6">
                <h4 class="title">Google Map</h4>
                <!-- Google maps -->
                <div class="gmap">
                    <!-- Google Maps. Replace the below iframe with your Google Maps embed code -->
                    <iframe height="200" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.co.in/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Google+India+Bangalore,+Bennigana+Halli,+Bangalore,+Karnataka&amp;aq=0&amp;oq=google+&amp;sll=9.930582,78.12303&amp;sspn=0.192085,0.308647&amp;ie=UTF8&amp;hq=Google&amp;hnear=Bennigana+Halli,+Bangalore,+Bengaluru+Urban,+Karnataka&amp;t=m&amp;ll=12.993518,77.660294&amp;spn=0.012545,0.036006&amp;z=15&amp;output=embed"></iframe>
                </div>

                <hr />
                <!-- Address section -->
                <h4 class="title">Address</h4>
                <div class="address">
                    <address>
                        <!-- Company name -->
                        <strong>Responsive Web, Inc.</strong><br>
                        <!-- Address -->
                        795 Folsom Ave, Suite 600<br>
                        San Francisco, CA 94107<br>
                        <!-- Phone number -->
                        <abbr title="Phone">P:</abbr> (123) 456-7890.
                    </address>

                    <address>
                        <!-- Name -->
                        <strong>Full Name</strong><br>
                        <!-- Email -->
                        <a href="mailto:#">first.last@gmail.com</a>
                    </address> 
                </div>
            </div>

        </div>
    </div>
</div>

<!-- Page content ends -->
<%@include file="/template/footer.jsp" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:action name="header" executeResult="true">
</s:action>
<!-- Page heading starts -->

<div class="page-head">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>Support</h2>
                <h4>something goes here</h4>
            </div>
        </div>
    </div>
</div>

<!-- Page Heading ends -->

<!-- Support starts -->

<div class="support container">
    <div class="row">
        <div class="col-md-12">
            <!-- Support -->

            <div class="row">
                <div class="col-md-8">
                    <div class="support-page well">
                        <h5>Type to Filter:</h5>
                        <!-- Below line creates form -->
                        <div id="form"></div>
                        <hr />
                        <div class="clearfix"></div>
                        <!-- Lists -->
                        <ul id="slist">
                            <!-- List #1 -->
                            <li>
                                <!-- Title -->
                                <a href="#">Sed eu leo orci condimentum grvid metus</a>
                                <!-- Para -->
                                <p>Fusce imperdiet, risus eget viverra faucibus, diam mi vestibulum libero, ut vestibulum tellus magna nec enim. Nunc dapibus varius interdum. Phasellus at lorem ut lectus fermentum convallis. Sed diam nisi, pulvinar vitae molestie hendrerit, venenatis eget mauris. Integer porta erat ac eros porta ultrices. Proin porttitor eros a ante molestie gravida commodo dui adipiscing.</p>
                            </li>
                            <!-- List #2 and so on.... -->
                            <li>
                                <a href="#">Fusce imperdiet risus eget viverr</a>
                                <p>Fusce imperdiet, risus eget viverra faucibus, diam mi vestibulum libero, ut vestibulum tellus magna nec enim. Nunc dapibus varius interdum. Phasellus at lorem ut lectus fermentum convallis. Sed diam nisi, pulvinar vitae molestie hendrerit, venenatis eget mauris. Integer porta erat ac eros porta ultrices. Proin porttitor eros a ante molestie gravida commodo dui adipiscing.</p>
                            </li>
                            <li>
                                <a href="#">Dimmi vestibulum libero ut vestibulum</a>
                                <p>Fusce imperdiet, risus eget viverra faucibus, diam mi vestibulum libero, ut vestibulum tellus magna nec enim. Nunc dapibus varius interdum. Phasellus at lorem ut lectus fermentum convallis. Sed diam nisi, pulvinar vitae molestie hendrerit, venenatis eget mauris. Integer porta erat ac eros porta ultrices. Proin porttitor eros a ante molestie gravida commodo dui adipiscing.</p>
                            </li>
                            <li>
                                <a href="#">Aeros a ante molestie gravida commodo</a>
                                <p>Fusce imperdiet, risus eget viverra faucibus, diam mi vestibulum libero, ut vestibulum tellus magna nec enim. Nunc dapibus varius interdum. Phasellus at lorem ut lectus fermentum convallis. Sed diam nisi, pulvinar vitae molestie hendrerit, venenatis eget mauris. Integer porta erat ac eros porta ultrices. Proin porttitor eros a ante molestie gravida commodo dui adipiscing.</p>
                            </li>
                            <li>
                                <a href="#">Integer porta erat ac eros porta</a>
                                <p>Fusce imperdiet, risus eget viverra faucibus, diam mi vestibulum libero, ut vestibulum tellus magna nec enim. Nunc dapibus varius interdum. Phasellus at lorem ut lectus fermentum convallis. Sed diam nisi, pulvinar vitae molestie hendrerit, venenatis eget mauris. Integer porta erat ac eros porta ultrices. Proin porttitor eros a ante molestie gravida commodo dui adipiscing.</p>
                            </li>
                            <li>
                                <a href="#">Molestie gravida commodo dui adipiscing</a>
                                <p>Fusce imperdiet, risus eget viverra faucibus, diam mi vestibulum libero, ut vestibulum tellus magna nec enim. Nunc dapibus varius interdum. Phasellus at lorem ut lectus fermentum convallis. Sed diam nisi, pulvinar vitae molestie hendrerit, venenatis eget mauris. Integer porta erat ac eros porta ultrices. Proin porttitor eros a ante molestie gravida commodo dui adipiscing.</p>
                            </li>                                    
                        </ul>
                    </div>
                </div>
                <div class="col-md-4">
                    <!-- Contact box -->
                    <div class="scontact well">
                        <!-- Title -->
                        <h4>Contact</h4>
                        <!-- Phone, email and address with font awesome icon -->
                        <p>Praesent at tellus porttitor nisl porttitor sagittis. Mauris in massa ligula, a tempor nulla.</p>
                        <p><i class="icon-phone"></i> Phone<strong>:</strong> 123-456-7890</p>
                        <p><i class="icon-envelope-alt"></i> Email<strong>:</strong> something@gmail.com</p>
                        <p><i class="icon-home"></i> Address<strong>:</strong> 12, Srtington Street, NY, USA </p>
                        <!-- Button -->
                        <div class="button"><a href="contact.html">Contact Us</a> <a href="faq.html">Check out FAQ</a></div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<%@include file="/template/footer.jsp" %>
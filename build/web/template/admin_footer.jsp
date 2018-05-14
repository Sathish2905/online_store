<%@ taglib prefix="s" uri="/struts-tags"%>
<!-- Footer starts -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <!-- Copyright info -->
                <p class="copy">Copyright &copy; 2014 | <s:a action="store" namespace="/">Front store</s:a> </p>
                </div>
            </div>
        </div>
    </footer> 	
    <!-- Footer ends -->
    <!-- JS -->
    <script src="${pageContext.request.contextPath}/admin/js/jquery.js"></script> <!-- jQuery -->
<script src="${pageContext.request.contextPath}/admin/js/bootstrap.js"></script> <!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/admin/js/jquery-ui-1.9.2.custom.min.js"></script> <!-- jQuery UI -->
<!-- jQuery Notification ends -->
<script src="${pageContext.request.contextPath}/admin/js/bootstrap-switch.min.js"></script> <!-- Bootstrap Toggle -->
<script src="${pageContext.request.contextPath}/admin/js/custom.js"></script> <!-- Custom codes -->
<script src="${pageContext.request.contextPath}/admin/js/bootbox.min.js"></script> <!-- Bootbox -->
<!-- Script for this page -->
<script type="text/javascript">
    $(function() {
        $("#save_userImage").on("change", function()
        {
            var files = !!this.files ? this.files : [];
            if (!files.length || !window.FileReader)
                return; // no file selected, or no FileReader support

            if (/^image/.test(files[0].type)) { // only image file
                var reader = new FileReader(); // instance of the FileReader
                reader.readAsDataURL(files[0]); // read the local file

                reader.onloadend = function() { // set image data as background of div
                    $("#imagePreview").css("background-image", "url(" + this.result + ")");
                }
            }
        });
    });
</script>
</body>
</html>
// :CATEGORY:Sculpt
// :NAME:SL_Sculpt_to_PHP_script
// :AUTHOR:Falados Kapuskas 
// :CREATED:2012-09-18 15:38:34.433
// :EDITED:2013-09-18 15:39:04
// :ID:790
// :NUM:1097
// :REV:1.0
// :WORLD:Second Life
// :DESCRIPTION:
//  http_request.inc.php
// :CODE:
<?php

/*
* Access the HTTP Request
*/
class http_request {

        /** additional HTTP headers not prefixed with HTTP_ in $_SERVER superglobal */
        var $add_headers = array('CONTENT_TYPE', 'CONTENT_LENGTH');

        /**
        * Construtor
        * Retrieve HTTP Body
        * @param Array Additional Headers to retrieve
        */
        function http_request($add_headers = false) {
        
                $this->retrieve_headers($add_headers);
                $this->body = @file_get_contents('php://input');
        }
        
        /**
        * Retrieve the HTTP request headers from the $_SERVER superglobal
        * @param Array Additional Headers to retrieve
        */
        function retrieve_headers($add_headers = false) {
                
                if ($add_headers) {
                        $this->add_headers = array_merge($this->add_headers, $add_headers);
                }
        
                if (isset($_SERVER['HTTP_METHOD'])) {
                        $this->method = $_SERVER['HTTP_METHOD'];
                        unset($_SERVER['HTTP_METHOD']);
                } else {
                        $this->method = isset($_SERVER['REQUEST_METHOD']) ? $_SERVER['REQUEST_METHOD'] : false;
                }
                $this->protocol = isset($_SERVER['SERVER_PROTOCOL']) ? $_SERVER['SERVER_PROTOCOL'] : false;
                $this->request_method = isset($_SERVER['REQUEST_METHOD']) ? $_SERVER['REQUEST_METHOD'] : false;
                
                $this->headers = array();
                foreach($_SERVER as $i=>$val) {
                        if (strpos($i, 'HTTP_') === 0 || in_array($i, $this->add_headers)) {
                                $name = str_replace(array('HTTP_', '_'), array('', '-'), $i);
                                $this->headers[$name] = $val;
                        }
                }
        }
        
        /** 
        * Retrieve HTTP Method
        */
        function method() {
                return $this->method;
        }
        
        /** 
        * Retrieve HTTP Body
        */
        function body() {
                return $this->body;
        }
        
        /** 
        * Retrieve an HTTP Header
        * @param string Case-Insensitive HTTP Header Name (eg: "User-Agent")
        */
        function header($name) {
                $name = strtoupper($name);
                return isset($this->headers[$name]) ? $this->headers[$name] : false;
        }
        
        /**
        * Retrieve all HTTP Headers 
        * @return array HTTP Headers
        */
        function headers() {
                return $this->headers;
        }
        
        /**
        * Return Raw HTTP Request (note: This is incomplete)
        * @param bool ReBuild the Raw HTTP Request
        */
        function raw($refresh = false) {
        
                if (isset($this->raw) && !$refresh) {
                        return $this->raw; // return cached
                }
        
                $headers = $this->headers();
                $this->raw = "{$this->method}\r\n";
                
                foreach($headers as $i=>$header) {
                        $this->raw .= "$i: $header\r\n";
                }
                
                $this->raw .= "\r\n{$http_request->body}";
                
                return $this->raw;
        }

}
?>

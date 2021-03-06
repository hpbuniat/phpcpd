<?php
/**
 * phpcpd
 *
 * Copyright (c) 2009-2011, Sebastian Bergmann <sb@sebastian-bergmann.de>.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in
 *     the documentation and/or other materials provided with the
 *     distribution.
 *
 *   * Neither the name of Sebastian Bergmann nor the names of his
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * @package   phpcpd
 * @author    Sebastian Bergmann <sb@sebastian-bergmann.de>
 * @copyright 2009-2011 Sebastian Bergmann <sb@sebastian-bergmann.de>
 * @license   http://www.opensource.org/licenses/bsd-license.php  BSD License
 * @since     File available since Release 1.1.0
 */

require_once 'File/Iterator/Autoload.php';
require_once 'PHP/Timer/Autoload.php';
require_once 'ezc/Base/base.php';

function phpcpd_autoload($class) {
    static $classes = NULL;
    static $path = NULL;

    if ($classes === NULL) {
        $classes = array(
          'phpcpd_clone' => '/Clone.php',
          'phpcpd_clonemap' => '/CloneMap.php',
          'phpcpd_detector' => '/Detector.php',
          'phpcpd_detector_strategy' => '/Detector/Strategy.php',
          'phpcpd_detector_tokenizer' => '/Detector/Tokenizer.php',
          'phpcpd_detector_strategy_default' => '/Detector/Strategy/Default.php',
          'phpcpd_detector_strategy_savememory' => '/Detector/Strategy/SaveMemory.php',
          'phpcpd_detector_tokenizer_php' => '/Detector/Tokenizer/PHP.php',
          'phpcpd_detector_tokenizer_html' => '/Detector/Tokenizer/Html.php',
          'phpcpd_detector_tokenizer_css' => '/Detector/Tokenizer/CSS.php',
          'phpcpd_detector_tokenizer_js' => '/Detector/Tokenizer/JS.php',
          'phpcpd_detector_tokenizer_abstracttokenizer' => '/Detector/Tokenizer/AbstractTokenizer.php',
          'phpcpd_log_xml' => '/Log/XML.php',
          'phpcpd_log_xml_pmd' => '/Log/XML/PMD.php',
          'phpcpd_textui_command' => '/TextUI/Command.php',
          'phpcpd_textui_resultprinter' => '/TextUI/ResultPrinter.php'
        );

        $path = dirname(__FILE__);
    }

    $cn = strtolower($class);

    if (isset($classes[$cn])) {
        require $path . $classes[$cn];
    }
    else {
        $sClass = str_replace('_', DIRECTORY_SEPARATOR, $class);
        @include_once $sClass . '.php';
    }
}

spl_autoload_register('phpcpd_autoload');
spl_autoload_register(array('ezcBase', 'autoload'));

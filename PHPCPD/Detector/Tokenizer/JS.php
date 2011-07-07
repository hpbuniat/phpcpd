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
 * * Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in
 * the documentation and/or other materials provided with the
 * distribution.
 *
 * * Neither the name of Sebastian Bergmann nor the names of his
 * contributors may be used to endorse or promote products derived
 * from this software without specific prior written permission.
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
 * @since     File available since Release ...
 */

/**
 * PHPCPD code analyser for Javascript
 *
 * @author    Hans-Peter Buniat <hpbuniat@googlemail.com>
 * @author    Sebastian Bergmann <sb@sebastian-bergmann.de>
 * @copyright 2009-2011 Sebastian Bergmann <sb@sebastian-bergmann.de>
 * @license   http://www.opensource.org/licenses/bsd-license.php  BSD License
 * @version   Release: @package_version@
 * @link      http://github.com/sebastianbergmann/phpcpd/tree
 * @since     Class available since Release ...
 */
class PHPCPD_Detector_Tokenizer_JS extends PHPCPD_Detector_Tokenizer_AbstractTokenizer {

    /**
     * @var integer[] List of tokens to ignore
     */
    protected $tokensIgnoreList = array(
        T_INLINE_HTML => TRUE,
        T_COMMENT => TRUE,
        T_DOC_COMMENT => TRUE,
        T_WHITESPACE => TRUE
    );

    /**
     *
     */
    public function __construct() {
        class_exists('PHP_CodeSniffer_Tokens');
        if (defined('PHP_CODESNIFFER_VERBOSITY') === false) {
            define('PHP_CODESNIFFER_VERBOSITY', 0);
        }
    }

    /**
     * (non-PHPdoc)
     * @see PHPCPD_Detector_Tokenizer_AbstractTokenizer::cpd()
     */
    public function cpd(PHPCPD_Detector_Strategy $strategy, $file) {
        $buffer = file_get_contents($file);

        // As the CodeSniffer-Tokenizer is replacing literal newlines, we're saving them
        $buffer = str_replace('\\n', 'T_EOL_STRING', $buffer);

        $this->_iLines = substr_count($buffer, "\n");
        $aTokens = $currentTokenPositions = array();
        $currentSignature = '';

        $oTokenizer = new PHP_CodeSniffer_Tokenizers_JS();
        $aTokens = $oTokenizer->tokenizeString($buffer);

        $tokenNr = 0;
        $line = 1;

        unset($buffer, $oTokenizer);
        foreach ($aTokens as $token) {
            if (isset($this->tokensIgnoreList[$token['code']]) !== true) {
                $currentTokenPositions[$tokenNr++] = $line;
                $sContent = str_replace('T_EOL_STRING', '\n', $token['content']);
                $currentSignature .= chr($token['code'] & 255) . pack('N*', crc32($sContent));
            }

            $line += substr_count($token['content'], '\n');
        }

        unset($aTokens);
        $strategy->tokenFactor($this->_fTokenFactor, $this->_iMinLines)->processFile($file, $currentTokenPositions, $currentSignature);
        return $this;
    }
}
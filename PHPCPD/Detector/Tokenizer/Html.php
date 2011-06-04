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
 * PHPCPD code analyser for Html
 *
 * @author    Hans-Peter Buniat <hpbuniat@googlemail.com>
 * @author    Sebastian Bergmann <sb@sebastian-bergmann.de>
 * @copyright 2009-2011 Sebastian Bergmann <sb@sebastian-bergmann.de>
 * @license   http://www.opensource.org/licenses/bsd-license.php  BSD License
 * @version   Release: @package_version@
 * @link      http://github.com/sebastianbergmann/phpcpd/tree
 * @since     Class available since Release ...
 */
class PHPCPD_Detector_Tokenizer_Html extends PHPCPD_Detector_Tokenizer_AbstractTokenizer {

    /**
     * The Tokens
     *
     * @var array
     */
    protected $_aTokens = array();

    /**
     * The Token-Factor
     *
     * @var float
     */
    protected $_iTokenFactor = 0.1;

    /**
     * @var integer[] List of tokens to ignore
     */
    protected $tokensIgnoreList = array(
        TIDY_NODETYPE_COMMENT => true
    );

    /**
     * (non-PHPdoc)
     * @see PHPCPD_Detector_Tokenizer_AbstractTokenizer::cpd()
     */
    public function cpd(PHPCPD_Detector_Strategy $strategy, $file) {
        $buffer = file_get_contents($file);
        $this->_iLines = substr_count($buffer, PHP_EOL);
        $this->_aTokens = array();

        $currentTokenPositions = array();
        $currentSignature = '';

        $tidy_config = array(
            'clean' => true,
            'drop-proprietary-attributes' => true,
            'output-xhtml' => true,
            'hide-comments' => true,
            'show-body-only' => true,
            'word-2000' => true,
            'wrap' => '0'
        );

        $oTidy = new tidy($file, $tidy_config);
        $oNode = $oTidy->root();
        $this->_tokenHelper($oNode);

        unset($oTidy, $oNode);
        $tokenNr = 0;

        unset($buffer);

        foreach ($this->_aTokens as $token) {
            if (! isset($this->tokensIgnoreList[$token[0]])) {
                $currentTokenPositions[$tokenNr++] = $token[2];
                $currentSignature .= chr($token[0] & 255) . pack('N*', crc32($token[1]));
            }
        }

        $strategy->tokenFactor($this->_iTokenFactor)->processFile($file, $currentTokenPositions, $currentSignature);
        return $this;
    }

    /**
     * Helper to create the token-array
     *
     * @param  tidyNode $oNode
     *
     * @return void
     */
    protected function _tokenHelper($oNode) {
        if ($oNode->hasChildren()) {
            $this->_aTokens[] = array(
                $oNode->type,
                $oNode->value,
                $oNode->line
            );
            foreach ($oNode->child as $child) {
                $this->_tokenHelper($child);
            }
        }
    }
}
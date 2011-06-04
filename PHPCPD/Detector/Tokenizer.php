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
 * Tokenizer Handler to support multiple tokenizers
 *
 * @author    Hans-Peter Buniat <hpbuniat@googlemail.com>
 * @author    Sebastian Bergmann <sb@sebastian-bergmann.de>
 * @copyright 2009-2011 Sebastian Bergmann <sb@sebastian-bergmann.de>
 * @license   http://www.opensource.org/licenses/bsd-license.php  BSD License
 * @version   Release: @package_version@
 * @link      http://github.com/sebastianbergmann/phpcpd/tree
 * @since     Class available since Release ...
 */
class PHPCPD_Detector_Tokenizer {


    /**
     * Detector instances
     *
     * @var array <PHPCPD_Detector_Abstract>
     */
    protected $_aDetectors = array();

    /**
     * Detector-Map
     *
     * @var array
     */
    protected $_aMap = array(
        'tpl' => 'Html',
        'phtml' => 'Html',
    );

    /**
     * Run the detection
     *
     * @param  PHPCPD_Detector_Strategy $strategy
     * @param  string $file
     *
     * @return PHPCPD_Detector_Tokenizer
     */
    public function process(PHPCPD_Detector_Strategy $strategy, $oMap, $file) {
        $oDetector = $this->_suffixMapper($file);
        $oDetector->cpd($strategy, $file);
        $oMap->setNumLines($oMap->getNumLines() + $oDetector->getLines());

        return $this;
    }

    /**
     * Get the corresponding detector for each suffix
     *
     * @param  string  $sFile
     *
     * @return PHPCPD_Detector_Abstract
     */
    protected function _suffixMapper($sFile = null) {
        $aFile = explode('.', $sFile);
        $sSuffix = end($aFile);
        if (isset($this->_aDetectors[$sSuffix]) === true) {
            return $this->_aDetectors[$sSuffix];
        }

        $sDetector = 'PHPCPD_Detector_Tokenizer_PHP';
        if (isset($this->_aMap[$sSuffix]) === true) {
            $sDetector = 'PHPCPD_Detector_Tokenizer_' . $this->_aMap[$sSuffix];
        }

        $this->_aDetectors[$sSuffix] = new $sDetector();
        return $this->_aDetectors[$sSuffix];
    }
}
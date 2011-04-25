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
 * @since     File available since Release 1.0.0
 */

require_once 'PHPCPD/Clone.php';
require_once 'PHPCPD/CloneMap.php';

/**
 * PHPCPD code analyser.
 *
 * @author    Johann-Peter Hartmann <johann-peter.hartmann@mayflower.de>
 * @author    Sebastian Bergmann <sb@sebastian-bergmann.de>
 * @copyright 2009-2011 Sebastian Bergmann <sb@sebastian-bergmann.de>
 * @license   http://www.opensource.org/licenses/bsd-license.php  BSD License
 * @version   Release: @package_version@
 * @link      http://github.com/sebastianbergmann/phpcpd/tree
 * @since     Class available since Release 1.0.0
 */
abstract class PHPCPD_Detector_Abstract {

    /**
     * @var array
     */
    protected $_aHashes = array();

    /**
     * Number of Lines
     *
     * @var int
     */
    protected $_iLines = 0;

    /**
     * @var int
     */
    protected $_iMinLines = null;

    /**
     * @var int
     */
    protected $_iMinTokens = null;

    /**
     * @var PHPCPD_CloneMap
     */
    protected $_oMap = null;

    /**
     * The Token-Factor
     *
     * @var float
     */
    protected $_iTokenFactor = 1.0;

    /**
     * Init
     *
     * @param  PHPCPD_CloneMap $oMap
     * @param  integer $this->_iMinLines  Minimum number of identical lines
     * @param  integer $minTokens Minimum number of identical tokens
     *
     * @return PHPCPD_Detector_Abstract
     */
    public function __construct($oMap, $minLines, $minTokens) {
        $this->_oMap = $oMap;
        $this->_iMinLines = $minLines;
        $this->_iMinTokens = (int) ($minTokens * $this->_iTokenFactor);
    }

    /**
     * Copy & Paste Detection (CPD).
     *
     * @param  string  $file      File to process
     *
     * @return PHPCPD_Detector_Abstract
     */
    abstract public function cpd($file);

    /**
     * Detect duplicated code
     *
     * @param  string $file
     * @param  array $currentTokenPositions
     * @param  string $currentSignature
     *
     * @return PHPCPD_Detector_Abstract
     */
    protected function _detect($file, $currentTokenPositions, $currentSignature) {
        $count = count($currentTokenPositions);
        $tokenNr = $firstLine = 0;
        $found = FALSE;

        if ($count > 0) {
            do {
                $line = $currentTokenPositions[$tokenNr];
                $hash = md5(substr($currentSignature, $tokenNr * 5, $this->_iMinTokens * 5));
                if (isset($this->_aHashes[$hash])) {
                    $found = TRUE;

                    if ($firstLine === 0) {
                        $firstLine = $line;
                        $firstHash = $hash;
                        $firstToken = $tokenNr;
                    }
                }
                else {
                    if ($found) {
                        $fileA = $this->_aHashes[$firstHash][0];
                        $firstLineA = $this->_aHashes[$firstHash][1];

                        if ($line + 1 - $firstLine > $this->_iMinLines && ($fileA != $file || $firstLineA != $firstLine)) {
                            $this->_oMap->addClone(new PHPCPD_Clone($fileA, $firstLineA, $file, $firstLine, $line + 1 - $firstLine, $tokenNr + 1 - $firstToken));
                        }

                        $found = FALSE;
                        $firstLine = 0;
                    }

                    $this->_aHashes[$hash] = array(
                        $file,
                        $line
                    );
                }

                $tokenNr++;
            }
            while ($tokenNr <= $count - $this->_iMinTokens + 1);
        }

        if ($found) {
            $fileA = $this->_aHashes[$firstHash][0];
            $firstLineA = $this->_aHashes[$firstHash][1];

            if ($line + 1 - $firstLine > $this->_iMinLines && ($fileA != $file || $firstLineA != $firstLine)) {
                $this->_oMap->addClone(new PHPCPD_Clone($fileA, $firstLineA, $file, $firstLine, $line + 1 - $firstLine, $tokenNr + 1 - $firstToken));
            }
        }

        return $this;
    }

    /**
     * Get the Number of Lines
     *
     * @return int
     */
    public function getLines() {
        return $this->_iLines;
    }
}
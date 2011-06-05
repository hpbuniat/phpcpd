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
 * @since     File available since Release 1.4.0
 */

/**
 * Abstract base class for strategies to detect code clones.
 *
 * @author    Sebastian Bergmann <sb@sebastian-bergmann.de>
 * @copyright 2009-2011 Sebastian Bergmann <sb@sebastian-bergmann.de>
 * @license   http://www.opensource.org/licenses/bsd-license.php  BSD License
 * @version   Release: @package_version@
 * @link      http://github.com/sebastianbergmann/phpcpd/tree
 * @since     Class available since Release 1.4.0
 */
abstract class PHPCPD_Detector_Strategy
{
    /**
     * Token-Hashes
     *
     * @var array
     */
    protected $_aHashes = array();

    /**
     * Detected clones
     *
     * @var PHPCPD_CloneMap
     */
    protected $_oMap = null;

    /**
     * Minimum Line-Numbers to detect Clone
     *
     * @var int
     */
    protected $_iMinLines = null;

    /**
     * Initial min-lines value
     *
     * @var int
     */
    protected $_iMinLinesInit = null;

    /**
     * Minimum Tokens to detect Clone
     *
     * @var int
     */
    protected $_iMinTokens = null;

    /**
     * Initial min-token value
     *
     * @var int
     */
    protected $_iMinTokensInit = null;

    /**
     * Common init
     *
     * @param  PHPCPD_CloneMap $oMap
     * @param  int $minLines
     * @param  int $minTokens
     *
     * @return PHPCPD_Detector_Strategy
     */
    public function init(PHPCPD_CloneMap $oMap, $minLines, $minTokens) {
        $this->_aHashes = array();
        $this->_oMap = $oMap;
        $this->_iMinLines = (int) $minLines;
        $this->_iMinLinesInit = $this->_iMinLines;
        $this->_iMinTokens = (int) $minTokens;
        $this->_iMinTokensInit = $this->_iMinTokens;

        return $this;
    }

    /**
     * Set the tokenFactor
     *
     * @param  float $fFactor
     * @param  int $iMinLines
     *
     * @return PHPCPD_Detector_Strategy
     */
    public function tokenFactor($fFactor = 1.00, $iMinLines = null) {
        $this->_iMinTokens = (int) ($this->_iMinTokensInit * $fFactor);
        $this->_iMinLines = (is_null($iMinLines)) ? $this->_iMinLinesInit : $iMinLines;

        return $this;
    }

    /**
     * Copy & Paste Detection (CPD).
     *
     * @param  string $file
     * @param  array $currentTokenPositions
     * @param  string $currentSignature
     *
     * @return PHPCPD_Detector_Strategy
     */
    abstract public function processFile($file, $currentTokenPositions, $currentSignature);
}

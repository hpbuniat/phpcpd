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
 */

if (!defined('TEST_FILES_PATH')) {
    define(
      'TEST_FILES_PATH',
      dirname(__FILE__) . DIRECTORY_SEPARATOR . '_files' . DIRECTORY_SEPARATOR
    );
}

/**
 * Tests for the PHPCPD-Html code analyser.
 *
 * @author    Hans-Peter Buniat <hpbuniat@googlemail.com>
 * @author    Sebastian Bergmann <sb@sebastian-bergmann.de>
 * @copyright 2009-2011 Sebastian Bergmann <sb@sebastian-bergmann.de>
 * @license   http://www.opensource.org/licenses/bsd-license.php  BSD License
 * @version   Release: @package_version@
 * @link      http://github.com/sebastianbergmann/phpcpd/tree
 * @since     Class available since Release 1.0.0
 */
class PHPCPD_DetectorCssTest extends PHPUnit_Framework_TestCase
{
    /**
     * Provider for testDetectingSimpleClonesWorks
     */
    public function strategyProvider()
    {
        return array(
          array('PHPCPD_Detector_Strategy_Default')
        );
    }

    /**
     * @covers       PHPCPD_Detector::copyPasteDetection
     * @covers       PHPCPD_Clone::getLines
     * @dataProvider strategyProvider
     */
    public function testDetectingSimpleClonesWorks($strategy)
    {
        $detector = new PHPCPD_Detector(new $strategy);
        $clones = $detector->copyPasteDetection(
          array(
              TEST_FILES_PATH . 'CSS' . DIRECTORY_SEPARATOR . 'testA.css',
              TEST_FILES_PATH . 'CSS' . DIRECTORY_SEPARATOR . 'testB.css'
          )
        );

        $clones = $clones->getClones();
        $this->assertEquals(2, count($clones));

        $this->assertEquals(TEST_FILES_PATH . 'CSS' . DIRECTORY_SEPARATOR . 'testA.css', $clones[0]->aFile);
        $this->assertEquals(63, $clones[0]->aStartLine);
        $this->assertEquals(TEST_FILES_PATH . 'CSS' . DIRECTORY_SEPARATOR . 'testA.css', $clones[0]->bFile);
        $this->assertEquals(70, $clones[0]->bStartLine);
        $this->assertEquals(6, $clones[0]->size);
        $this->assertEquals(26, $clones[0]->tokens);

        $this->assertEquals(TEST_FILES_PATH . 'CSS' . DIRECTORY_SEPARATOR . 'testA.css', $clones[1]->aFile);
        $this->assertEquals(95, $clones[1]->aStartLine);
        $this->assertEquals(TEST_FILES_PATH . 'CSS' . DIRECTORY_SEPARATOR . 'testB.css', $clones[1]->bFile);
        $this->assertEquals(9, $clones[1]->bStartLine);
        $this->assertEquals(13, $clones[1]->size);
        $this->assertEquals(53, $clones[1]->tokens);

        $this->assertEquals('#navi_top .zweite_zeile {
float: left;
margin:0;
padding:.3em .2em;
white-space:nowrap;
border-bottom: 1px solid #EBE9EA;
', $clones[0]->getLines());
    }
}

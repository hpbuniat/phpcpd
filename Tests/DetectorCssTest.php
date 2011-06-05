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
 * Tests for the PHPCPD-Css code analyser.
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
        $this->assertEquals(5, count($clones));

        $this->assertEquals(TEST_FILES_PATH . 'CSS' . DIRECTORY_SEPARATOR . 'testA.css', $clones[0]->aFile);
        $this->assertEquals(31, $clones[0]->aStartLine);
        $this->assertEquals(TEST_FILES_PATH . 'CSS' . DIRECTORY_SEPARATOR . 'testA.css', $clones[0]->bFile);
        $this->assertEquals(64, $clones[0]->bStartLine);
        $this->assertEquals(2, $clones[0]->size);
        $this->assertEquals(2, $clones[0]->tokens);

        $this->assertEquals(TEST_FILES_PATH . 'CSS' . DIRECTORY_SEPARATOR . 'testA.css', $clones[4]->aFile);
        $this->assertEquals(90, $clones[4]->aStartLine);
        $this->assertEquals(TEST_FILES_PATH . 'CSS' . DIRECTORY_SEPARATOR . 'testB.css', $clones[4]->bFile);
        $this->assertEquals(4, $clones[4]->bStartLine);
        $this->assertEquals(18, $clones[4]->size);
        $this->assertEquals(51, $clones[4]->tokens);

        $this->assertEquals('background: #fff url("/icons/ho/background_navi_top.gif") repeat-x 0 0;
border-bottom: 1px solid #EBE9EA;
border-top: 1px solid #f6f6f6;
', $clones[3]->getLines());
    }
}

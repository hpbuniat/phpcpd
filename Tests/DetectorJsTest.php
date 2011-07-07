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
 */

if (!defined('TEST_FILES_PATH')) {
    define('TEST_FILES_PATH', dirname(__FILE__) . DIRECTORY_SEPARATOR . '_files' . DIRECTORY_SEPARATOR);
}

/**
 * Tests for the PHPCPD-JS code analyser.
 *
 * @author    Hans-Peter Buniat <hpbuniat@googlemail.com>
 * @author    Sebastian Bergmann <sb@sebastian-bergmann.de>
 * @copyright 2009-2011 Sebastian Bergmann <sb@sebastian-bergmann.de>
 * @license   http://www.opensource.org/licenses/bsd-license.php  BSD License
 * @version   Release: @package_version@
 * @link      http://github.com/sebastianbergmann/phpcpd/tree
 * @since     Class available since Release 1.0.0
 */
class PHPCPD_DetectorJsTest extends PHPUnit_Framework_TestCase {

    /**
     * Provider for testDetectingSimpleClonesWorks
     */
    public function strategyProvider() {
        return array(
            array(
                'PHPCPD_Detector_Strategy_Default'
            )
        );
    }

    /**
     * @covers       PHPCPD_Detector::copyPasteDetection
     * @covers       PHPCPD_Clone::getLines
     * @dataProvider strategyProvider
     */
    public function testDetectingSimpleClonesWorks($strategy) {
        $detector = new PHPCPD_Detector(new $strategy());
        $clones = $detector->copyPasteDetection(array(
            TEST_FILES_PATH . 'JS' . DIRECTORY_SEPARATOR . 'testA.js',
            TEST_FILES_PATH . 'JS' . DIRECTORY_SEPARATOR . 'testB.js'
        ));

        $clones = $clones->getClones();
        $this->assertEquals(3, count($clones));

        $this->assertEquals(TEST_FILES_PATH . 'JS' . DIRECTORY_SEPARATOR . 'testA.js', $clones[0]->aFile);
        $this->assertEquals(338, $clones[0]->aStartLine);
        $this->assertEquals(TEST_FILES_PATH . 'JS' . DIRECTORY_SEPARATOR . 'testB.js', $clones[0]->bFile);
        $this->assertEquals(22, $clones[0]->bStartLine);
        $this->assertEquals(39, $clones[0]->size);
        $this->assertEquals(176, $clones[0]->tokens);

        $this->assertEquals(TEST_FILES_PATH . 'JS' . DIRECTORY_SEPARATOR . 'testA.js', $clones[2]->aFile);
        $this->assertEquals(818, $clones[2]->aStartLine);
        $this->assertEquals(TEST_FILES_PATH . 'JS' . DIRECTORY_SEPARATOR . 'testB.js', $clones[2]->bFile);
        $this->assertEquals(132, $clones[2]->bStartLine);
        $this->assertEquals(14, $clones[2]->size);
        $this->assertEquals(80, $clones[2]->tokens);

        $this->assertEquals("    });

    each(
        ['find', 'children', 'parent', 'parents',
         'next', 'nextAll', 'prev', 'prevAll',
         'first', 'last', 'closest', 'siblings',
         'parentsUntil', 'nextUntil', 'prevUntil'],
        function(i, methodName) {

            var pureMethod = jQueryMethods[methodName];

            addCheck(methodName, 2, function(selector){

                if ( !internal && lint.enabledReports.noElementsFound &&  !runFunction(pureMethod, arguments, true, this).length ) {
", $clones[2]->getLines());
    }
}

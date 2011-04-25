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
 * @since     File available since Release 1.0.0
 */

if (!defined('TEST_FILES_PATH')) {
    define(
      'TEST_FILES_PATH',
      dirname(__FILE__) . DIRECTORY_SEPARATOR . '_files' . DIRECTORY_SEPARATOR
    );
}

require_once 'PHPCPD/Detector.php';

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
class PHPCPD_DetectorHtmlTest extends PHPUnit_Framework_TestCase
{
    protected $detector;

    /**
     * @covers PHPCPD_Detector::__construct
     */
    protected function setUp()
    {
        $this->detector = new PHPCPD_Detector();
    }

    /**
     * @covers PHPCPD_Detector::copyPasteDetection
     * @covers PHPCPD_Clone::getLines
     */
    public function testDetectingSimpleClonesWorks()
    {
        $clones = $this->detector->run(
          array(
              TEST_FILES_PATH . 'testA.tpl',
              TEST_FILES_PATH . 'testB.tpl'
          )
        );

        $clones = $clones->getClones();

        $this->assertEquals(6, count($clones));

        $this->assertEquals(TEST_FILES_PATH . 'testA.tpl', $clones[0]->aFile);
        $this->assertEquals(71, $clones[0]->aStartLine);
        $this->assertEquals(TEST_FILES_PATH . 'testB.tpl', $clones[0]->bFile);
        $this->assertEquals(71, $clones[0]->bStartLine);
        $this->assertEquals(39, $clones[0]->size);
        $this->assertEquals(30, $clones[0]->tokens);

        $this->assertEquals(TEST_FILES_PATH . 'testB.tpl', $clones[4]->aFile);
        $this->assertEquals(1697, $clones[4]->aStartLine);
        $this->assertEquals(TEST_FILES_PATH . 'testB.tpl', $clones[4]->bFile);
        $this->assertEquals(1750, $clones[4]->bStartLine);
        $this->assertEquals(12, $clones[4]->size);
        $this->assertEquals(15, $clones[4]->tokens);

        $this->assertEquals('&nbsp;&nbsp;&nbsp; public function </span><span class="default">equals</span><span class="keyword">( </span><span class="default">Table </span><span class="keyword">&amp;</span><span class="default">$o </span><span class="keyword">)<br />

&nbsp;&nbsp;&nbsp; {<br />
&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; return </span><span class="default">TRUE</span><span class="keyword">;<br />
&nbsp;&nbsp;&nbsp; }<br />
}<br />
<br />
</span><span class="default">$chair </span><span class="keyword">= new </span><span class="default">Chair</span><span class="keyword">();<br />

</span><span class="default">$table </span><span class="keyword">= new </span><span class="default">Table</span><span class="keyword">();<br />
<br />
echo </span><span class="default">$chair</span><span class="keyword">-&gt;</span><span class="default">equals</span><span class="keyword">( </span><span class="default">$table </span><span class="keyword">);<br />
', $clones[4]->getLines());
    }
}

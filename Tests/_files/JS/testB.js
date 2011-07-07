/**
 * jQuery Lint
 * ---
 * VERSION 1.1
 * ---
 * jQuery lint creates a thin blanket over jQuery that'll
 * report any potentially erroneous activity to the console.
 * ---
 * Idea from:
 *      http://markmail.org/message/wzkosk2s5jklpkv4
 *      http://groups.google.com/group/jquery-dev/browse_thread/thread/9a15cca62ceb2444
 * ---
 * @author James Padolsey
 * @contributors Paul Irish, Zoran Zaric, Hans-Peter Buniat
 * ---
 * Dual licensed under the MIT and GPL licenses.
 *    - http://www.opensource.org/licenses/mit-license.php
 *    - http://www.gnu.org/copyleft/gpl.html
 */

(function(){
    function isValidArgumentList(args, sig) {

        // Determine if argument list complies with
        // signature outlined in API.
        var matches = false,
            sigArg,
            argLength = args.length,
            nextIsOptional = false;

        if (version < sig.added) {
            // Too new
            return false;
        }

        if (!sig.arg) {
            return 0 === args.length;
        }

        if (!sig.arg[0] && (args.length > 1)) {
            return false;
        }

        for (
                var sigIndex = 0,
                    argIndex = 0,
                    fullLength = Math.max(argLength, sig.arg.length || 1);
                sigIndex < fullLength || argIndex < argLength;
                ++sigIndex
            ) {

            sigArg = sigIndex === 0 ? sig.arg[0] || sig.arg : sig.arg[sigIndex];
            if (!sigArg) {
                // Too many args
                return false;
            }

            matches = isValidType(sigArg.type, args[argIndex]);
            if (!matches) {
                if (sigArg.optional) {
                    if (args[argIndex] === undefined || args[argIndex] === null) {
                        ++argIndex;
                        matches = true;
                    }
                    continue;
                } else {
                    // Sig isn't optional
                    return false;
                }
            }

            if (sigArg.multiple) {
                // If it's multiple, then carry on with the same
                // signature, but check that there are remaining
                // arguments

                --sigIndex;
                if (argIndex + 1 >= argLength) {
                    break;
                }
            }

            ++argIndex;
        }

        return matches;

    }

    /////////////////////////
    // Some special checks //
    /////////////////////////
    addCheck('jQuery', 2, function(selector, context) {
        var locale = lint.langs[lint.lang];

        // It's a string, and NOT html - must be a selector
        if (!internal && typeof selector === 'string' && !/^[^<]*(<[\w\W]+>)[^>]*$/.test(selector)) {

            // Find invalid filters (e.g. :hover, :active etc.)
            // suggested by Paul Irish
            if (lint.enabledReports.invalidFilters) {
                var invalidFilters = [];

                selector.replace(/('|")(?:\\\1|[^\1])+?\1/g, '').replace(/:(\w+)/g, function(m, filter){
                    if (!/^(contains|not)$/.test(filter) && !((filter in _jQuery.expr[':']) || (filter in _jQuery.expr.setFilters))) {
                        invalidFilters.push(m);
                    }
                });

                if (invalidFilters.length) {
                    return locale.invalidFilters.replace(/%0/, selector).replace(/%1/, invalidFilters.join('\n'));
                }
            }

            // Find class only-selectors (poor IE6-8 performance)
            if (lint.enabledReports.slowSelector) {
                var slowSelectors = [];
                var selectors = selector.split(',');
                for (i in selectors) {
                    var tSelector = _jQuery.trim(selectors[i]);
                    if ((/(^|\w*?\s)\.\w/.test(tSelector) && (typeof context !== "object" || !context.length))
                        || /^(.+)#\w/.test(tSelector)) {
                        slowSelectors.push(tSelector);
                    }
                }

                if (slowSelectors.length) {
                    return locale.slowSelector.replace(/%0/, slowSelectors.join('\n'));
                }
            }
        }
    });

    each(
        ['find', 'children', 'parent', 'parents',
         'next', 'nextAll', 'prev', 'prevAll',
         'first', 'last', 'closest', 'siblings',
         'parentsUntil', 'nextUntil', 'prevUntil'],
        function(i, methodName) {

            var pureMethod = jQueryMethods[methodName];

            addCheck(methodName, 2, function(selector){

                if ( !internal && lint.enabledReports.noElementsFound &&  !runFunction(pureMethod, arguments, true, this).length ) {

                    if (types['function'](selector)) {
                        selector = '[FUNCTION]';
                    }

                     lint.console.warn(lint.langs[lint.lang].noElementsFound.replace(/%0/, selector));
                     logLocation();

                }

            });

        }
    );

})();

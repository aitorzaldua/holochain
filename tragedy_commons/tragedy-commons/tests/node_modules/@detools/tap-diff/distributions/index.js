"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _diff = require("diff");

var _chalk = _interopRequireDefault(require("chalk"));

var _duplexer = _interopRequireDefault(require("duplexer"));

var _figures = _interopRequireDefault(require("figures"));

var _through = _interopRequireDefault(require("through2"));

var _tapParser = _interopRequireDefault(require("tap-parser"));

var _prettyMs = _interopRequireDefault(require("pretty-ms"));

var _jsondiffpatch = _interopRequireDefault(require("jsondiffpatch"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var INDENT = '  ';
var FIG_TICK = _figures.default.tick;
var FIG_CROSS = _figures.default.cross;

var createReporter = function createReporter() {
  var output = (0, _through.default)();
  var p = new _tapParser.default();
  var stream = (0, _duplexer.default)(p, output);
  var startedAt = Date.now();

  var println = function println() {
    var input = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : '';
    var indentLevel = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 0;
    var indent = '';

    for (var i = 0; i < indentLevel; ++i) {
      indent += INDENT;
    }

    input.split('\n').forEach(function (line) {
      output.push("".concat(indent).concat(line));
      output.push('\n');
    });
  };

  var handleTest = function handleTest(name) {
    println();
    println(_chalk.default.blue(name), 1);
  };

  var handleAssertSuccess = function handleAssertSuccess(assert) {
    var name = assert.name;
    println("".concat(_chalk.default.green(FIG_TICK), "  ").concat(_chalk.default.dim(name)), 2);
  };

  var toString = function toString(arg) {
    return Object.prototype.toString.call(arg).slice(8, -1).toLowerCase();
  };

  var JSONize = function JSONize(str) {
    return str // wrap keys without quote with valid double quote
    .replace(/([\$\w]+)\s*:/g, function (_, $1) {
      return '"' + $1 + '":';
    }) // replacing single quote wrapped ones to double quote
    .replace(/'([^']+)'/g, function (_, $1) {
      return '"' + $1 + '"';
    });
  };

  var handleAssertFailure = function handleAssertFailure(assert) {
    var name = assert.name;

    var writeDiff = function writeDiff(_ref) {
      var value = _ref.value,
          added = _ref.added,
          removed = _ref.removed;
      var style = _chalk.default.white;
      if (added) style = _chalk.default.green.inverse;
      if (removed) style = _chalk.default.red.inverse; // only highlight values and not spaces before

      return value.replace(/(^\s*)(.*)/g, function (m, one, two) {
        return one + style(two);
      });
    };

    var _assert$diag = assert.diag,
        at = _assert$diag.at,
        actual = _assert$diag.actual,
        expected = _assert$diag.expected;
    var expected_type = toString(expected);

    if (expected_type !== 'array') {
      try {
        // the assert event only returns strings which is broken so this
        // handles converting strings into objects
        if (expected.indexOf('{') > -1) {
          actual = JSON.stringify(JSON.parse(JSONize(actual)), null, 2);
          expected = JSON.stringify(JSON.parse(JSONize(expected)), null, 2);
        }
      } catch (e) {
        try {
          actual = JSON.stringify(eval("(".concat(actual, ")")), null, 2);
          expected = JSON.stringify(eval("(".concat(expected, ")")), null, 2);
        } catch (e) {// do nothing because it wasn't a valid json object
        }
      }

      expected_type = toString(expected);
    }

    println("".concat(_chalk.default.red(FIG_CROSS), "  ").concat(_chalk.default.red(name), " at ").concat(_chalk.default.magenta(at)), 2);

    if (expected_type === 'object') {
      var delta = _jsondiffpatch.default.diff(actual[failed_test_number], expected[failed_test_number]);

      var _output = _jsondiffpatch.default.formatters.console.format(delta);

      println(_output, 4);
    } else if (expected_type === 'array') {
      var compared = (0, _diff.diffJson)(actual, expected).map(writeDiff).join('');
      println(compared, 4);
    } else if (expected === 'undefined' && actual === 'undefined') {
      ;
    } else if (expected_type === 'string') {
      var _compared = (0, _diff.diffWords)(actual, expected).map(writeDiff).join('');

      println(_compared, 4);
    } else {
      println(_chalk.default.red.inverse(actual) + _chalk.default.green.inverse(expected), 4);
    }
  };

  var handleComplete = function handleComplete(result) {
    var finishedAt = Date.now();
    println();
    println(_chalk.default.green("passed: ".concat(result.pass, "  ")) + _chalk.default.red("failed: ".concat(result.fail || 0, "  ")) + _chalk.default.white("of ".concat(result.count, " tests  ")) + _chalk.default.dim("(".concat((0, _prettyMs.default)(finishedAt - startedAt), ")")));
    println();

    if (result.ok) {
      println(_chalk.default.green("All of ".concat(result.count, " tests passed!")));
    } else {
      println(_chalk.default.red("".concat(result.fail || 0, " of ").concat(result.count, " tests failed.")));
      stream.isFailed = true;
    }

    println();
  };

  p.on('comment', function (comment) {
    var trimmed = comment.replace('# ', '').trim();
    if (/^tests\s+[0-9]+$/.test(trimmed)) return;
    if (/^pass\s+[0-9]+$/.test(trimmed)) return;
    if (/^fail\s+[0-9]+$/.test(trimmed)) return;
    if (/^ok$/.test(trimmed)) return;
    handleTest(trimmed);
  });
  p.on('assert', function (assert) {
    if (assert.ok) return handleAssertSuccess(assert);
    handleAssertFailure(assert);
  });
  p.on('complete', handleComplete);
  p.on('child', function (child) {
    ;
  });
  p.on('extra', function (extra) {
    println(_chalk.default.yellow("".concat(extra).replace(/\n$/, '')), 4);
  });
  return stream;
};

var _default = createReporter;
exports.default = _default;
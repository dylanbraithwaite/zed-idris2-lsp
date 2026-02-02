; Taken from https://github.com/kayhide/tree-sitter-idris
;
; MIT License

; Copyright (c) 2014 Max Brunsfeld
; Copyright (c) 2023 Maskhjarna, postsolar
; Copyright (c) 2024 Hideaki Kawai, kayhide

; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to deal
; in the Software without restriction, including without limitation the rights
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:

; The above copyright notice and this permission notice shall be included in all
; copies or substantial portions of the Software.

; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
; SOFTWARE.


; ------------------------------------------------------------------------------
; Literals and comments

[
  (integer)
] @constant.numeric.integer

(literal
  (number)) @constant.numeric.float

(char) @constant.character

[
  (string)
  (triple_quote_string)
] @string

(comment) @comment

; ------------------------------------------------------------------------------
; Punctuation

[
  "("
  ")"
  "{"
  "@{"
  "}"
  "["
  "[<"
  "]"
] @punctuation.bracket

(comma) @punctuation.delimiter

; ------------------------------------------------------------------------------
; Types

(signature
  (loname) @type)

(signature
  (caname) @constructor)

(caname) @constructor

; ------------------------------------------------------------------------------
; Keywords, operators, imports

[
  "if"
  "then"
  "else"
  "case"
  "of"
] @keyword.control.conditional

(module) @namespace

[
  "import"
  "module"
  "namespace"
  "parameters"
] @keyword.control.import

[
  (operator)
  (equal)
  (wildcard)
  "."
  "|"
  "=>"
  "⇒"
  "<="
  "⇐"
  "->"
  "→"
  "<-"
  "←"
  "\\"
  "`"
] @operator

(qualified_loname
  (caname) @namespace)

(qualified_caname
  (caname) @namespace)

(qualified_operator
  (caname) @namespace)

(import
  (caname) @namespace)

[
  (where)
  "let"
  "in"
  "rewrite"
  "interface"
  "implementation"
  "using"
  "data"
  "record"
  "as"
  "do"
  (forall)
  (fixity)
  (visibility)
  (totality)
  (quantity)
  (impossible)
  (with)
  (proof)
  "="
  ":="
] @keyword

(hole) @label

[
  (pragma_language)
  (pragma_default)
  (pragma_builtin)
  (pragma_name)
  (pragma_ambiguity_depth)
  (pragma_auto_implicit_depth)
  (pragma_logging)
  (pragma_prefix_record_projections)
  (pragma_transform)
  (pragma_unbound_implicits)
  (pragma_auto_lazy)
  (pragma_search_timeout)
  (pragma_nf_metavar_threshold)
  (pragma_cg)
  (pragma_allow_overloads)
  (pragma_deprecate)
  (pragma_inline)
  (pragma_noinline)
  (pragma_tcinline)
  (pragma_hide)
  (pragma_unhide)
  (pragma_unsafe)
  (pragma_spec)
  (pragma_foreign)
  (pragma_foreign_impl)
  (pragma_export )
  (pragma_nomangle )
  (pragma_hint )
  (pragma_defaulthint )
  (pragma_globalhint )
  (pragma_extern)
  (pragma_macro)
  (pragma_start)
  (pragma_rewrite)
  (pragma_pair)
  (pragma_integerLit)
  (pragma_stringLit)
  (pragma_charLit)
  (pragma_doubleLit)
  (pragma_TTImpLit)
  (pragma_declsLit)
  (pragma_nameLit)
  (pragma_runElab)
  (pragma_search)
  (pragma_World)
  (pragma_MkWorld)
  (pragma_syntactic)
] @label


; ------------------------------------------------------------------------------
; Functions and variables

(exp_name
  (loname) @function)

(exp_name
  (caname) @constructor)

(exp_record_access
  field: (_) @variable.other.member)

(signature
  name: [(loname) (caname)] @function)

(function
  (lhs
    (funvar
      subject: [(loname) (caname)] @function)))

(data
  name: (data_name) @type)

(interface_head
  name: (interface_name) @type)

(implementation_head
  (interface_name) @type)

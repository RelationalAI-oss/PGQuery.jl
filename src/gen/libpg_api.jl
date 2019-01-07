# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query//pg_query.h
# Automatically generated using Clang.jl wrap_c


function pg_query_normalize(input)
    ccall((:pg_query_normalize, libpg_query), PgQueryNormalizeResult, (Cstring,), input)
end

function pg_query_parse(input)
    ccall((:pg_query_parse, libpg_query), PgQueryParseResult, (Cstring,), input)
end

function pg_query_parse_plpgsql(input)
    ccall((:pg_query_parse_plpgsql, libpg_query), PgQueryPlpgsqlParseResult, (Cstring,), input)
end

function pg_query_fingerprint(input)
    ccall((:pg_query_fingerprint, libpg_query), PgQueryFingerprintResult, (Cstring,), input)
end

function pg_query_free_normalize_result(result)
    ccall((:pg_query_free_normalize_result, libpg_query), Cvoid, (PgQueryNormalizeResult,), result)
end

function pg_query_free_parse_result(result)
    ccall((:pg_query_free_parse_result, libpg_query), Cvoid, (PgQueryParseResult,), result)
end

function pg_query_free_plpgsql_parse_result(result)
    ccall((:pg_query_free_plpgsql_parse_result, libpg_query), Cvoid, (PgQueryPlpgsqlParseResult,), result)
end

function pg_query_free_fingerprint_result(result)
    ccall((:pg_query_free_fingerprint_result, libpg_query), Cvoid, (PgQueryFingerprintResult,), result)
end

function pg_query_init()
    ccall((:pg_query_init, libpg_query), Cvoid, ())
end
# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/pg_query_fingerprint.h
# Automatically generated using Clang.jl wrap_c


function pg_query_fingerprint_with_opts()
    ccall((:pg_query_fingerprint_with_opts, libpg_query), Cint, ())
end
# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/pg_query_internal.h
# Automatically generated using Clang.jl wrap_c


function pg_query_raw_parse(input)
    ccall((:pg_query_raw_parse, libpg_query), PgQueryInternalParsetreeAndError, (Cstring,), input)
end

function pg_query_free_error(error)
    ccall((:pg_query_free_error, libpg_query), Cvoid, (Ptr{Cint},), error)
end

function pg_query_enter_memory_context(ctx_name)
    ccall((:pg_query_enter_memory_context, libpg_query), Ptr{UInt8}, (Cstring,), ctx_name)
end

function pg_query_exit_memory_context(ctx)
    ccall((:pg_query_exit_memory_context, libpg_query), Cvoid, (Ptr{UInt8},), ctx)
end
# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/pg_query_json.h
# Automatically generated using Clang.jl wrap_c


function pg_query_nodes_to_json(obj)
    ccall((:pg_query_nodes_to_json, libpg_query), Cstring, (Ptr{Cvoid},), obj)
end
# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/pg_query_json_plpgsql.h
# Automatically generated using Clang.jl wrap_c


function plpgsqlToJSON(func)
    ccall((:plpgsqlToJSON, libpg_query), Cstring, (Ptr{Cint},), func)
end
# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/nodes/bitmapset.h
# Automatically generated using Clang.jl wrap_c


function bms_copy(a)
    ccall((:bms_copy, libpg_query), Ptr{Bitmapset}, (Ptr{Bitmapset},), a)
end

function bms_equal()
    ccall((:bms_equal, libpg_query), Cint, ())
end

function bms_make_singleton(x)
    ccall((:bms_make_singleton, libpg_query), Ptr{Bitmapset}, (Cint,), x)
end

function bms_free(a)
    ccall((:bms_free, libpg_query), Cvoid, (Ptr{Bitmapset},), a)
end

function bms_union(a, b)
    ccall((:bms_union, libpg_query), Ptr{Bitmapset}, (Ptr{Bitmapset}, Ptr{Bitmapset}), a, b)
end

function bms_intersect(a, b)
    ccall((:bms_intersect, libpg_query), Ptr{Bitmapset}, (Ptr{Bitmapset}, Ptr{Bitmapset}), a, b)
end

function bms_difference(a, b)
    ccall((:bms_difference, libpg_query), Ptr{Bitmapset}, (Ptr{Bitmapset}, Ptr{Bitmapset}), a, b)
end

function bms_is_subset()
    ccall((:bms_is_subset, libpg_query), Cint, ())
end

function bms_subset_compare(a, b)
    ccall((:bms_subset_compare, libpg_query), BMS_Comparison, (Ptr{Bitmapset}, Ptr{Bitmapset}), a, b)
end

function bms_is_member()
    ccall((:bms_is_member, libpg_query), Cint, ())
end

function bms_overlap()
    ccall((:bms_overlap, libpg_query), Cint, ())
end

function bms_overlap_list()
    ccall((:bms_overlap_list, libpg_query), Cint, ())
end

function bms_nonempty_difference()
    ccall((:bms_nonempty_difference, libpg_query), Cint, ())
end

function bms_singleton_member(a)
    ccall((:bms_singleton_member, libpg_query), Cint, (Ptr{Bitmapset},), a)
end

function bms_get_singleton_member()
    ccall((:bms_get_singleton_member, libpg_query), Cint, ())
end

function bms_num_members(a)
    ccall((:bms_num_members, libpg_query), Cint, (Ptr{Bitmapset},), a)
end

function bms_membership(a)
    ccall((:bms_membership, libpg_query), BMS_Membership, (Ptr{Bitmapset},), a)
end

function bms_is_empty()
    ccall((:bms_is_empty, libpg_query), Cint, ())
end

function bms_add_member(a, x)
    ccall((:bms_add_member, libpg_query), Ptr{Bitmapset}, (Ptr{Bitmapset}, Cint), a, x)
end

function bms_del_member(a, x)
    ccall((:bms_del_member, libpg_query), Ptr{Bitmapset}, (Ptr{Bitmapset}, Cint), a, x)
end

function bms_add_members(a, b)
    ccall((:bms_add_members, libpg_query), Ptr{Bitmapset}, (Ptr{Bitmapset}, Ptr{Bitmapset}), a, b)
end

function bms_int_members(a, b)
    ccall((:bms_int_members, libpg_query), Ptr{Bitmapset}, (Ptr{Bitmapset}, Ptr{Bitmapset}), a, b)
end

function bms_del_members(a, b)
    ccall((:bms_del_members, libpg_query), Ptr{Bitmapset}, (Ptr{Bitmapset}, Ptr{Bitmapset}), a, b)
end

function bms_join(a, b)
    ccall((:bms_join, libpg_query), Ptr{Bitmapset}, (Ptr{Bitmapset}, Ptr{Bitmapset}), a, b)
end

function bms_first_member(a)
    ccall((:bms_first_member, libpg_query), Cint, (Ptr{Bitmapset},), a)
end

function bms_next_member(a, prevbit)
    ccall((:bms_next_member, libpg_query), Cint, (Ptr{Bitmapset}, Cint), a, prevbit)
end

function bms_hash_value()
    ccall((:bms_hash_value, libpg_query), Cint, ())
end
# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/nodes/lockoptions.h
# Automatically generated using Clang.jl wrap_c

# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/nodes/makefuncs.h
# Automatically generated using Clang.jl wrap_c


function makeA_Expr(kind, name, lexpr, rexpr, location)
    ccall((:makeA_Expr, libpg_query), Ptr{A_Expr}, (A_Expr_Kind, Ptr{List}, Ptr{Node}, Ptr{Node}, Cint), kind, name, lexpr, rexpr, location)
end

function makeSimpleA_Expr(kind, name, lexpr, rexpr, location)
    ccall((:makeSimpleA_Expr, libpg_query), Ptr{A_Expr}, (A_Expr_Kind, Cstring, Ptr{Node}, Ptr{Node}, Cint), kind, name, lexpr, rexpr, location)
end

function makeVar(varno, varattno, vartype, vartypmod, varcollid, varlevelsup)
    ccall((:makeVar, libpg_query), Ptr{Var}, (Cint, Cint, Cint, Cint, Cint, Cint), varno, varattno, vartype, vartypmod, varcollid, varlevelsup)
end

function makeVarFromTargetEntry(varno, tle)
    ccall((:makeVarFromTargetEntry, libpg_query), Ptr{Var}, (Cint, Ptr{TargetEntry}), varno, tle)
end

function makeWholeRowVar(rte, varno, varlevelsup, allowScalar)
    ccall((:makeWholeRowVar, libpg_query), Ptr{Var}, (Ptr{RangeTblEntry}, Cint, Cint, Cint), rte, varno, varlevelsup, allowScalar)
end

function makeTargetEntry(expr, resno, resname, resjunk)
    ccall((:makeTargetEntry, libpg_query), Ptr{TargetEntry}, (Ptr{Expr}, Cint, Cstring, Cint), expr, resno, resname, resjunk)
end

function flatCopyTargetEntry(src_tle)
    ccall((:flatCopyTargetEntry, libpg_query), Ptr{TargetEntry}, (Ptr{TargetEntry},), src_tle)
end

function makeFromExpr(fromlist, quals)
    ccall((:makeFromExpr, libpg_query), Ptr{FromExpr}, (Ptr{List}, Ptr{Node}), fromlist, quals)
end

function makeConst(consttype, consttypmod, constcollid, constlen, constvalue, constisnull, constbyval)
    ccall((:makeConst, libpg_query), Ptr{Const}, (Cint, Cint, Cint, Cint, Cint, Cint, Cint), consttype, consttypmod, constcollid, constlen, constvalue, constisnull, constbyval)
end

function makeNullConst(consttype, consttypmod, constcollid)
    ccall((:makeNullConst, libpg_query), Ptr{Const}, (Cint, Cint, Cint), consttype, consttypmod, constcollid)
end

function makeBoolConst(value, isnull)
    ccall((:makeBoolConst, libpg_query), Ptr{Node}, (Cint, Cint), value, isnull)
end

function makeBoolExpr(boolop, args, location)
    ccall((:makeBoolExpr, libpg_query), Ptr{Expr}, (BoolExprType, Ptr{List}, Cint), boolop, args, location)
end

function makeAlias(aliasname, colnames)
    ccall((:makeAlias, libpg_query), Ptr{Alias}, (Cstring, Ptr{List}), aliasname, colnames)
end

function makeRelabelType(arg, rtype, rtypmod, rcollid, rformat)
    ccall((:makeRelabelType, libpg_query), Ptr{RelabelType}, (Ptr{Expr}, Cint, Cint, Cint, CoercionForm), arg, rtype, rtypmod, rcollid, rformat)
end

function makeRangeVar(schemaname, relname, location)
    ccall((:makeRangeVar, libpg_query), Ptr{RangeVar}, (Cstring, Cstring, Cint), schemaname, relname, location)
end

function makeTypeName(typnam)
    ccall((:makeTypeName, libpg_query), Ptr{TypeName}, (Cstring,), typnam)
end

function makeTypeNameFromNameList(names)
    ccall((:makeTypeNameFromNameList, libpg_query), Ptr{TypeName}, (Ptr{List},), names)
end

function makeTypeNameFromOid(typeOid, typmod)
    ccall((:makeTypeNameFromOid, libpg_query), Ptr{TypeName}, (Cint, Cint), typeOid, typmod)
end

function makeColumnDef(colname, typeOid, typmod, collOid)
    ccall((:makeColumnDef, libpg_query), Ptr{ColumnDef}, (Cstring, Cint, Cint, Cint), colname, typeOid, typmod, collOid)
end

function makeFuncExpr(funcid, rettype, args, funccollid, inputcollid, fformat)
    ccall((:makeFuncExpr, libpg_query), Ptr{FuncExpr}, (Cint, Cint, Ptr{List}, Cint, Cint, CoercionForm), funcid, rettype, args, funccollid, inputcollid, fformat)
end

function makeFuncCall(name, args, location)
    ccall((:makeFuncCall, libpg_query), Ptr{FuncCall}, (Ptr{List}, Ptr{List}, Cint), name, args, location)
end

function makeDefElem(name, arg, location)
    ccall((:makeDefElem, libpg_query), Ptr{DefElem}, (Cstring, Ptr{Node}, Cint), name, arg, location)
end

function makeDefElemExtended(nameSpace, name, arg, defaction, location)
    ccall((:makeDefElemExtended, libpg_query), Ptr{DefElem}, (Cstring, Cstring, Ptr{Node}, DefElemAction, Cint), nameSpace, name, arg, defaction, location)
end

function makeGroupingSet(kind, content, location)
    ccall((:makeGroupingSet, libpg_query), Ptr{GroupingSet}, (GroupingSetKind, Ptr{List}, Cint), kind, content, location)
end
# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/nodes/nodeFuncs.h
# Automatically generated using Clang.jl wrap_c


function exprType()
    ccall((:exprType, libpg_query), Cint, ())
end

function exprTypmod()
    ccall((:exprTypmod, libpg_query), Cint, ())
end

function exprIsLengthCoercion()
    ccall((:exprIsLengthCoercion, libpg_query), Cint, ())
end

function relabel_to_typmod(expr, typmod)
    ccall((:relabel_to_typmod, libpg_query), Ptr{Node}, (Ptr{Node}, Cint), expr, typmod)
end

function strip_implicit_coercions(node)
    ccall((:strip_implicit_coercions, libpg_query), Ptr{Node}, (Ptr{Node},), node)
end

function expression_returns_set()
    ccall((:expression_returns_set, libpg_query), Cint, ())
end

function exprCollation()
    ccall((:exprCollation, libpg_query), Cint, ())
end

function exprInputCollation()
    ccall((:exprInputCollation, libpg_query), Cint, ())
end

function exprSetCollation(expr, collation)
    ccall((:exprSetCollation, libpg_query), Cvoid, (Ptr{Node}, Cint), expr, collation)
end

function exprSetInputCollation(expr, inputcollation)
    ccall((:exprSetInputCollation, libpg_query), Cvoid, (Ptr{Node}, Cint), expr, inputcollation)
end

function exprLocation(expr)
    ccall((:exprLocation, libpg_query), Cint, (Ptr{Node},), expr)
end

function fix_opfuncids(node)
    ccall((:fix_opfuncids, libpg_query), Cvoid, (Ptr{Node},), node)
end

function set_opfuncid(opexpr)
    ccall((:set_opfuncid, libpg_query), Cvoid, (Ptr{OpExpr},), opexpr)
end

function set_sa_opfuncid(opexpr)
    ccall((:set_sa_opfuncid, libpg_query), Cvoid, (Ptr{ScalarArrayOpExpr},), opexpr)
end

function check_functions_in_node()
    ccall((:check_functions_in_node, libpg_query), Cint, ())
end

function expression_tree_walker()
    ccall((:expression_tree_walker, libpg_query), Cint, ())
end

function expression_tree_mutator(node, mutator, context)
    ccall((:expression_tree_mutator, libpg_query), Ptr{Node}, (Ptr{Node}, Ptr{Cvoid}, Ptr{Cvoid}), node, mutator, context)
end

function query_tree_walker()
    ccall((:query_tree_walker, libpg_query), Cint, ())
end

function query_tree_mutator(query, mutator, context, flags)
    ccall((:query_tree_mutator, libpg_query), Ptr{Query}, (Ptr{Query}, Ptr{Cvoid}, Ptr{Cvoid}, Cint), query, mutator, context, flags)
end

function range_table_walker()
    ccall((:range_table_walker, libpg_query), Cint, ())
end

function range_table_mutator(rtable, mutator, context, flags)
    ccall((:range_table_mutator, libpg_query), Ptr{List}, (Ptr{List}, Ptr{Cvoid}, Ptr{Cvoid}, Cint), rtable, mutator, context, flags)
end

function query_or_expression_tree_walker()
    ccall((:query_or_expression_tree_walker, libpg_query), Cint, ())
end

function query_or_expression_tree_mutator(node, mutator, context, flags)
    ccall((:query_or_expression_tree_mutator, libpg_query), Ptr{Node}, (Ptr{Node}, Ptr{Cvoid}, Ptr{Cvoid}, Cint), node, mutator, context, flags)
end

function raw_expression_tree_walker()
    ccall((:raw_expression_tree_walker, libpg_query), Cint, ())
end

function planstate_tree_walker()
    ccall((:planstate_tree_walker, libpg_query), Cint, ())
end
# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/nodes/nodes.h
# Automatically generated using Clang.jl wrap_c


function outNode(str, obj)
    ccall((:outNode, libpg_query), Cvoid, (Ptr{StringInfoData}, Ptr{Cvoid}), str, obj)
end

function outToken(str, s)
    ccall((:outToken, libpg_query), Cvoid, (Ptr{StringInfoData}, Cstring), str, s)
end

function outBitmapset(str, bms)
    ccall((:outBitmapset, libpg_query), Cvoid, (Ptr{StringInfoData}, Ptr{Bitmapset}), str, bms)
end

function outDatum(str, value, typlen, typbyval)
    ccall((:outDatum, libpg_query), Cvoid, (Ptr{StringInfoData}, Cint, Cint, Cint), str, value, typlen, typbyval)
end

function nodeToString(obj)
    ccall((:nodeToString, libpg_query), Cstring, (Ptr{Cvoid},), obj)
end

function bmsToString(bms)
    ccall((:bmsToString, libpg_query), Cstring, (Ptr{Bitmapset},), bms)
end

function stringToNode(str)
    ccall((:stringToNode, libpg_query), Ptr{Cvoid}, (Cstring,), str)
end

function readBitmapset()
    ccall((:readBitmapset, libpg_query), Ptr{Bitmapset}, ())
end

function readDatum()
    ccall((:readDatum, libpg_query), Cint, ())
end

function readBoolCols()
    ccall((:readBoolCols, libpg_query), Ptr{Cint}, ())
end

function readIntCols(numCols)
    ccall((:readIntCols, libpg_query), Ptr{Cint}, (Cint,), numCols)
end

function readOidCols()
    ccall((:readOidCols, libpg_query), Ptr{Cint}, ())
end

function readAttrNumberCols()
    ccall((:readAttrNumberCols, libpg_query), Ptr{Cint}, ())
end

function copyObjectImpl(obj)
    ccall((:copyObjectImpl, libpg_query), Ptr{Cvoid}, (Ptr{Cvoid},), obj)
end

function equal()
    ccall((:equal, libpg_query), Cint, ())
end
# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/nodes/params.h
# Automatically generated using Clang.jl wrap_c


function copyParamList(from)
    ccall((:copyParamList, libpg_query), ParamListInfo, (ParamListInfo,), from)
end

function EstimateParamListSpace()
    ccall((:EstimateParamListSpace, libpg_query), Cint, ())
end

function SerializeParamList(paramLI, start_address)
    ccall((:SerializeParamList, libpg_query), Cvoid, (ParamListInfo, Ptr{Cstring}), paramLI, start_address)
end

function RestoreParamList(start_address)
    ccall((:RestoreParamList, libpg_query), ParamListInfo, (Ptr{Cstring},), start_address)
end
# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/nodes/parsenodes.h
# Automatically generated using Clang.jl wrap_c

# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/nodes/pg_list.h
# Automatically generated using Clang.jl wrap_c


function list_head(l)
    ccall((:list_head, libpg_query), Ptr{ListCell}, (Ptr{List},), l)
end

function list_tail(l)
    ccall((:list_tail, libpg_query), Ptr{ListCell}, (Ptr{List},), l)
end

function list_length(l)
    ccall((:list_length, libpg_query), Cint, (Ptr{List},), l)
end

function lappend(list, datum)
    ccall((:lappend, libpg_query), Ptr{List}, (Ptr{List}, Ptr{Cvoid}), list, datum)
end

function lappend_int(list, datum)
    ccall((:lappend_int, libpg_query), Ptr{List}, (Ptr{List}, Cint), list, datum)
end

function lappend_oid(list, datum)
    ccall((:lappend_oid, libpg_query), Ptr{List}, (Ptr{List}, Cint), list, datum)
end

function lappend_cell(list, prev, datum)
    ccall((:lappend_cell, libpg_query), Ptr{ListCell}, (Ptr{List}, Ptr{ListCell}, Ptr{Cvoid}), list, prev, datum)
end

function lappend_cell_int(list, prev, datum)
    ccall((:lappend_cell_int, libpg_query), Ptr{ListCell}, (Ptr{List}, Ptr{ListCell}, Cint), list, prev, datum)
end

function lappend_cell_oid(list, prev, datum)
    ccall((:lappend_cell_oid, libpg_query), Ptr{ListCell}, (Ptr{List}, Ptr{ListCell}, Cint), list, prev, datum)
end

function lcons(datum, list)
    ccall((:lcons, libpg_query), Ptr{List}, (Ptr{Cvoid}, Ptr{List}), datum, list)
end

function lcons_int(datum, list)
    ccall((:lcons_int, libpg_query), Ptr{List}, (Cint, Ptr{List}), datum, list)
end

function lcons_oid(datum, list)
    ccall((:lcons_oid, libpg_query), Ptr{List}, (Cint, Ptr{List}), datum, list)
end

function list_concat(list1, list2)
    ccall((:list_concat, libpg_query), Ptr{List}, (Ptr{List}, Ptr{List}), list1, list2)
end

function list_truncate(list, new_size)
    ccall((:list_truncate, libpg_query), Ptr{List}, (Ptr{List}, Cint), list, new_size)
end

function list_nth_cell(list, n)
    ccall((:list_nth_cell, libpg_query), Ptr{ListCell}, (Ptr{List}, Cint), list, n)
end

function list_nth(list, n)
    ccall((:list_nth, libpg_query), Ptr{Cvoid}, (Ptr{List}, Cint), list, n)
end

function list_nth_int(list, n)
    ccall((:list_nth_int, libpg_query), Cint, (Ptr{List}, Cint), list, n)
end

function list_nth_oid()
    ccall((:list_nth_oid, libpg_query), Cint, ())
end

function list_member()
    ccall((:list_member, libpg_query), Cint, ())
end

function list_member_ptr()
    ccall((:list_member_ptr, libpg_query), Cint, ())
end

function list_member_int()
    ccall((:list_member_int, libpg_query), Cint, ())
end

function list_member_oid()
    ccall((:list_member_oid, libpg_query), Cint, ())
end

function list_delete(list, datum)
    ccall((:list_delete, libpg_query), Ptr{List}, (Ptr{List}, Ptr{Cvoid}), list, datum)
end

function list_delete_ptr(list, datum)
    ccall((:list_delete_ptr, libpg_query), Ptr{List}, (Ptr{List}, Ptr{Cvoid}), list, datum)
end

function list_delete_int(list, datum)
    ccall((:list_delete_int, libpg_query), Ptr{List}, (Ptr{List}, Cint), list, datum)
end

function list_delete_oid(list, datum)
    ccall((:list_delete_oid, libpg_query), Ptr{List}, (Ptr{List}, Cint), list, datum)
end

function list_delete_first(list)
    ccall((:list_delete_first, libpg_query), Ptr{List}, (Ptr{List},), list)
end

function list_delete_cell(list, cell, prev)
    ccall((:list_delete_cell, libpg_query), Ptr{List}, (Ptr{List}, Ptr{ListCell}, Ptr{ListCell}), list, cell, prev)
end

function list_union(list1, list2)
    ccall((:list_union, libpg_query), Ptr{List}, (Ptr{List}, Ptr{List}), list1, list2)
end

function list_union_ptr(list1, list2)
    ccall((:list_union_ptr, libpg_query), Ptr{List}, (Ptr{List}, Ptr{List}), list1, list2)
end

function list_union_int(list1, list2)
    ccall((:list_union_int, libpg_query), Ptr{List}, (Ptr{List}, Ptr{List}), list1, list2)
end

function list_union_oid(list1, list2)
    ccall((:list_union_oid, libpg_query), Ptr{List}, (Ptr{List}, Ptr{List}), list1, list2)
end

function list_intersection(list1, list2)
    ccall((:list_intersection, libpg_query), Ptr{List}, (Ptr{List}, Ptr{List}), list1, list2)
end

function list_intersection_int(list1, list2)
    ccall((:list_intersection_int, libpg_query), Ptr{List}, (Ptr{List}, Ptr{List}), list1, list2)
end

function list_difference(list1, list2)
    ccall((:list_difference, libpg_query), Ptr{List}, (Ptr{List}, Ptr{List}), list1, list2)
end

function list_difference_ptr(list1, list2)
    ccall((:list_difference_ptr, libpg_query), Ptr{List}, (Ptr{List}, Ptr{List}), list1, list2)
end

function list_difference_int(list1, list2)
    ccall((:list_difference_int, libpg_query), Ptr{List}, (Ptr{List}, Ptr{List}), list1, list2)
end

function list_difference_oid(list1, list2)
    ccall((:list_difference_oid, libpg_query), Ptr{List}, (Ptr{List}, Ptr{List}), list1, list2)
end

function list_append_unique(list, datum)
    ccall((:list_append_unique, libpg_query), Ptr{List}, (Ptr{List}, Ptr{Cvoid}), list, datum)
end

function list_append_unique_ptr(list, datum)
    ccall((:list_append_unique_ptr, libpg_query), Ptr{List}, (Ptr{List}, Ptr{Cvoid}), list, datum)
end

function list_append_unique_int(list, datum)
    ccall((:list_append_unique_int, libpg_query), Ptr{List}, (Ptr{List}, Cint), list, datum)
end

function list_append_unique_oid(list, datum)
    ccall((:list_append_unique_oid, libpg_query), Ptr{List}, (Ptr{List}, Cint), list, datum)
end

function list_concat_unique(list1, list2)
    ccall((:list_concat_unique, libpg_query), Ptr{List}, (Ptr{List}, Ptr{List}), list1, list2)
end

function list_concat_unique_ptr(list1, list2)
    ccall((:list_concat_unique_ptr, libpg_query), Ptr{List}, (Ptr{List}, Ptr{List}), list1, list2)
end

function list_concat_unique_int(list1, list2)
    ccall((:list_concat_unique_int, libpg_query), Ptr{List}, (Ptr{List}, Ptr{List}), list1, list2)
end

function list_concat_unique_oid(list1, list2)
    ccall((:list_concat_unique_oid, libpg_query), Ptr{List}, (Ptr{List}, Ptr{List}), list1, list2)
end

function list_free(list)
    ccall((:list_free, libpg_query), Cvoid, (Ptr{List},), list)
end

function list_free_deep(list)
    ccall((:list_free_deep, libpg_query), Cvoid, (Ptr{List},), list)
end

function list_copy(list)
    ccall((:list_copy, libpg_query), Ptr{List}, (Ptr{List},), list)
end

function list_copy_tail(list, nskip)
    ccall((:list_copy_tail, libpg_query), Ptr{List}, (Ptr{List}, Cint), list, nskip)
end
# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/nodes/plannodes.h
# Automatically generated using Clang.jl wrap_c

# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/nodes/primnodes.h
# Automatically generated using Clang.jl wrap_c

# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/nodes/print.h
# Automatically generated using Clang.jl wrap_c


function print(obj)
    ccall((:print, libpg_query), Cvoid, (Ptr{Cvoid},), obj)
end

function pprint(obj)
    ccall((:pprint, libpg_query), Cvoid, (Ptr{Cvoid},), obj)
end

function elog_node_display(lev, title, obj, pretty)
    ccall((:elog_node_display, libpg_query), Cvoid, (Cint, Cstring, Ptr{Cvoid}, Cint), lev, title, obj, pretty)
end

function format_node_dump(dump)
    ccall((:format_node_dump, libpg_query), Cstring, (Cstring,), dump)
end

function pretty_format_node_dump(dump)
    ccall((:pretty_format_node_dump, libpg_query), Cstring, (Cstring,), dump)
end

function print_rt(rtable)
    ccall((:print_rt, libpg_query), Cvoid, (Ptr{Cint},), rtable)
end

function print_expr(expr, rtable)
    ccall((:print_expr, libpg_query), Cvoid, (Ptr{Cint}, Ptr{Cint}), expr, rtable)
end

function print_pathkeys(pathkeys, rtable)
    ccall((:print_pathkeys, libpg_query), Cvoid, (Ptr{Cint}, Ptr{Cint}), pathkeys, rtable)
end

function print_tl(tlist, rtable)
    ccall((:print_tl, libpg_query), Cvoid, (Ptr{Cint}, Ptr{Cint}), tlist, rtable)
end

function print_slot(slot)
    ccall((:print_slot, libpg_query), Cvoid, (Ptr{Cint},), slot)
end
# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/nodes/relation.h
# Automatically generated using Clang.jl wrap_c

# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/nodes/tidbitmap.h
# Automatically generated using Clang.jl wrap_c


function tbm_create(maxbytes, dsa)
    ccall((:tbm_create, libpg_query), Ptr{TIDBitmap}, (Clong, Ptr{Cint}), maxbytes, dsa)
end

function tbm_free(tbm)
    ccall((:tbm_free, libpg_query), Cvoid, (Ptr{TIDBitmap},), tbm)
end

function tbm_free_shared_area(dsa, dp)
    ccall((:tbm_free_shared_area, libpg_query), Cvoid, (Ptr{Cint}, Cint), dsa, dp)
end

function tbm_add_tuples(tbm, tids, ntids, recheck)
    ccall((:tbm_add_tuples, libpg_query), Cvoid, (Ptr{TIDBitmap}, Cint, Cint, Cint), tbm, tids, ntids, recheck)
end

function tbm_add_page(tbm, pageno)
    ccall((:tbm_add_page, libpg_query), Cvoid, (Ptr{TIDBitmap}, Cint), tbm, pageno)
end

function tbm_union(a, b)
    ccall((:tbm_union, libpg_query), Cvoid, (Ptr{TIDBitmap}, Ptr{TIDBitmap}), a, b)
end

function tbm_intersect(a, b)
    ccall((:tbm_intersect, libpg_query), Cvoid, (Ptr{TIDBitmap}, Ptr{TIDBitmap}), a, b)
end

function tbm_is_empty()
    ccall((:tbm_is_empty, libpg_query), Cint, ())
end

function tbm_begin_iterate(tbm)
    ccall((:tbm_begin_iterate, libpg_query), Ptr{TBMIterator}, (Ptr{TIDBitmap},), tbm)
end

function tbm_prepare_shared_iterate()
    ccall((:tbm_prepare_shared_iterate, libpg_query), Cint, ())
end

function tbm_iterate(iterator)
    ccall((:tbm_iterate, libpg_query), Ptr{TBMIterateResult}, (Ptr{TBMIterator},), iterator)
end

function tbm_shared_iterate(iterator)
    ccall((:tbm_shared_iterate, libpg_query), Ptr{TBMIterateResult}, (Ptr{TBMSharedIterator},), iterator)
end

function tbm_end_iterate(iterator)
    ccall((:tbm_end_iterate, libpg_query), Cvoid, (Ptr{TBMIterator},), iterator)
end

function tbm_end_shared_iterate(iterator)
    ccall((:tbm_end_shared_iterate, libpg_query), Cvoid, (Ptr{TBMSharedIterator},), iterator)
end

function tbm_attach_shared_iterate(dsa, dp)
    ccall((:tbm_attach_shared_iterate, libpg_query), Ptr{TBMSharedIterator}, (Ptr{Cint}, Cint), dsa, dp)
end
# Julia wrapper for header: /Users/dashti/Dropbox/workspaces/RelationalAI/libpg_query/src/nodes/value.h
# Automatically generated using Clang.jl wrap_c


function makeInteger(i)
    ccall((:makeInteger, libpg_query), Ptr{Value}, (Clong,), i)
end

function makeFloat(numericStr)
    ccall((:makeFloat, libpg_query), Ptr{Value}, (Cstring,), numericStr)
end

function makeString(str)
    ccall((:makeString, libpg_query), Ptr{Value}, (Cstring,), str)
end

function makeBitString(str)
    ccall((:makeBitString, libpg_query), Ptr{Value}, (Cstring,), str)
end

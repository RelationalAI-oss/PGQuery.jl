# Julia wrapper for header: pg_query.h
# Automatically generated using Clang.jl


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
# Julia wrapper for header: sdir.h
# Automatically generated using Clang.jl

# Julia wrapper for header: postgres_ext.h
# Automatically generated using Clang.jl

# Julia wrapper for header: pg_query_fingerprint.h
# Automatically generated using Clang.jl


function pg_query_fingerprint_with_opts(input, printTokens)
    ccall((:pg_query_fingerprint_with_opts, libpg_query), PgQueryFingerprintResult, (Cstring, bool), input, printTokens)
end
# Julia wrapper for header: pg_query_internal.h
# Automatically generated using Clang.jl


function pg_query_raw_parse(input)
    ccall((:pg_query_raw_parse, libpg_query), PgQueryInternalParsetreeAndError, (Cstring,), input)
end

function pg_query_free_error(error)
    ccall((:pg_query_free_error, libpg_query), Cvoid, (Ptr{Cint},), error)
end

function pg_query_enter_memory_context(ctx_name)
    ccall((:pg_query_enter_memory_context, libpg_query), MemoryContext, (Cstring,), ctx_name)
end

function pg_query_exit_memory_context(ctx)
    ccall((:pg_query_exit_memory_context, libpg_query), Cvoid, (MemoryContext,), ctx)
end
# Julia wrapper for header: pg_query_json.h
# Automatically generated using Clang.jl


function pg_query_nodes_to_json(obj)
    ccall((:pg_query_nodes_to_json, libpg_query), Cstring, (Ptr{Cvoid},), obj)
end
# Julia wrapper for header: pg_query_json_plpgsql.h
# Automatically generated using Clang.jl


function plpgsqlToJSON(func)
    ccall((:plpgsqlToJSON, libpg_query), Cstring, (Ptr{PLpgSQL_function},), func)
end
# Julia wrapper for header: bitmapset.h
# Automatically generated using Clang.jl


function bms_copy(a)
    ccall((:bms_copy, libpg_query), Ptr{Bitmapset}, (Ptr{Bitmapset},), a)
end

function bms_equal(a, b)
    ccall((:bms_equal, libpg_query), bool, (Ptr{Bitmapset}, Ptr{Bitmapset}), a, b)
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

function bms_is_subset(a, b)
    ccall((:bms_is_subset, libpg_query), bool, (Ptr{Bitmapset}, Ptr{Bitmapset}), a, b)
end

function bms_subset_compare(a, b)
    ccall((:bms_subset_compare, libpg_query), BMS_Comparison, (Ptr{Bitmapset}, Ptr{Bitmapset}), a, b)
end

function bms_is_member(x, a)
    ccall((:bms_is_member, libpg_query), bool, (Cint, Ptr{Bitmapset}), x, a)
end

function bms_overlap(a, b)
    ccall((:bms_overlap, libpg_query), bool, (Ptr{Bitmapset}, Ptr{Bitmapset}), a, b)
end

function bms_overlap_list(a, b)
    ccall((:bms_overlap_list, libpg_query), bool, (Ptr{Bitmapset}, Ptr{List}), a, b)
end

function bms_nonempty_difference(a, b)
    ccall((:bms_nonempty_difference, libpg_query), bool, (Ptr{Bitmapset}, Ptr{Bitmapset}), a, b)
end

function bms_singleton_member(a)
    ccall((:bms_singleton_member, libpg_query), Cint, (Ptr{Bitmapset},), a)
end

function bms_get_singleton_member(a, member)
    ccall((:bms_get_singleton_member, libpg_query), bool, (Ptr{Bitmapset}, Ptr{Cint}), a, member)
end

function bms_num_members(a)
    ccall((:bms_num_members, libpg_query), Cint, (Ptr{Bitmapset},), a)
end

function bms_membership(a)
    ccall((:bms_membership, libpg_query), BMS_Membership, (Ptr{Bitmapset},), a)
end

function bms_is_empty(a)
    ccall((:bms_is_empty, libpg_query), bool, (Ptr{Bitmapset},), a)
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

function bms_hash_value(a)
    ccall((:bms_hash_value, libpg_query), uint32, (Ptr{Bitmapset},), a)
end
# Julia wrapper for header: extensible.h
# Automatically generated using Clang.jl


function RegisterExtensibleNodeMethods(method)
    ccall((:RegisterExtensibleNodeMethods, libpg_query), Cvoid, (Ptr{ExtensibleNodeMethods},), method)
end

function GetExtensibleNodeMethods(name, missing_ok)
    ccall((:GetExtensibleNodeMethods, libpg_query), Ptr{ExtensibleNodeMethods}, (Cstring, bool), name, missing_ok)
end

function RegisterCustomScanMethods(methods)
    ccall((:RegisterCustomScanMethods, libpg_query), Cvoid, (Ptr{CustomScanMethods},), methods)
end

function GetCustomScanMethods(CustomName, missing_ok)
    ccall((:GetCustomScanMethods, libpg_query), Ptr{CustomScanMethods}, (Cstring, bool), CustomName, missing_ok)
end
# Julia wrapper for header: lockoptions.h
# Automatically generated using Clang.jl

# Julia wrapper for header: makefuncs.h
# Automatically generated using Clang.jl


function makeA_Expr(kind, name, lexpr, rexpr, location)
    ccall((:makeA_Expr, libpg_query), Ptr{A_Expr}, (A_Expr_Kind, Ptr{List}, Ptr{Node}, Ptr{Node}, Cint), kind, name, lexpr, rexpr, location)
end

function makeSimpleA_Expr(kind, name, lexpr, rexpr, location)
    ccall((:makeSimpleA_Expr, libpg_query), Ptr{A_Expr}, (A_Expr_Kind, Cstring, Ptr{Node}, Ptr{Node}, Cint), kind, name, lexpr, rexpr, location)
end

function makeVar(varno, varattno, vartype, vartypmod, varcollid, varlevelsup)
    ccall((:makeVar, libpg_query), Ptr{Var}, (Index, AttrNumber, Oid, int32, Oid, Index), varno, varattno, vartype, vartypmod, varcollid, varlevelsup)
end

function makeVarFromTargetEntry(varno, tle)
    ccall((:makeVarFromTargetEntry, libpg_query), Ptr{Var}, (Index, Ptr{TargetEntry}), varno, tle)
end

function makeWholeRowVar(rte, varno, varlevelsup, allowScalar)
    ccall((:makeWholeRowVar, libpg_query), Ptr{Var}, (Ptr{RangeTblEntry}, Index, Index, bool), rte, varno, varlevelsup, allowScalar)
end

function makeTargetEntry(expr, resno, resname, resjunk)
    ccall((:makeTargetEntry, libpg_query), Ptr{TargetEntry}, (Ptr{Expr}, AttrNumber, Cstring, bool), expr, resno, resname, resjunk)
end

function flatCopyTargetEntry(src_tle)
    ccall((:flatCopyTargetEntry, libpg_query), Ptr{TargetEntry}, (Ptr{TargetEntry},), src_tle)
end

function makeFromExpr(fromlist, quals)
    ccall((:makeFromExpr, libpg_query), Ptr{FromExpr}, (Ptr{List}, Ptr{Node}), fromlist, quals)
end

function makeConst(consttype, consttypmod, constcollid, constlen, constvalue, constisnull, constbyval)
    ccall((:makeConst, libpg_query), Ptr{Const}, (Oid, int32, Oid, Cint, Cint, bool, bool), consttype, consttypmod, constcollid, constlen, constvalue, constisnull, constbyval)
end

function makeNullConst(consttype, consttypmod, constcollid)
    ccall((:makeNullConst, libpg_query), Ptr{Const}, (Oid, int32, Oid), consttype, consttypmod, constcollid)
end

function makeBoolConst(value, isnull)
    ccall((:makeBoolConst, libpg_query), Ptr{Node}, (bool, bool), value, isnull)
end

function makeBoolExpr(boolop, args, location)
    ccall((:makeBoolExpr, libpg_query), Ptr{Expr}, (BoolExprType, Ptr{List}, Cint), boolop, args, location)
end

function makeAlias(aliasname, colnames)
    ccall((:makeAlias, libpg_query), Ptr{Alias}, (Cstring, Ptr{List}), aliasname, colnames)
end

function makeRelabelType(arg, rtype, rtypmod, rcollid, rformat)
    ccall((:makeRelabelType, libpg_query), Ptr{RelabelType}, (Ptr{Expr}, Oid, int32, Oid, CoercionForm), arg, rtype, rtypmod, rcollid, rformat)
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
    ccall((:makeTypeNameFromOid, libpg_query), Ptr{TypeName}, (Oid, int32), typeOid, typmod)
end

function makeColumnDef(colname, typeOid, typmod, collOid)
    ccall((:makeColumnDef, libpg_query), Ptr{ColumnDef}, (Cstring, Oid, int32, Oid), colname, typeOid, typmod, collOid)
end

function makeFuncExpr(funcid, rettype, args, funccollid, inputcollid, fformat)
    ccall((:makeFuncExpr, libpg_query), Ptr{FuncExpr}, (Oid, Oid, Ptr{List}, Oid, Oid, CoercionForm), funcid, rettype, args, funccollid, inputcollid, fformat)
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
# Julia wrapper for header: memnodes.h
# Automatically generated using Clang.jl

# Julia wrapper for header: nodeFuncs.h
# Automatically generated using Clang.jl


function exprType(expr)
    ccall((:exprType, libpg_query), Oid, (Ptr{Node},), expr)
end

function exprTypmod(expr)
    ccall((:exprTypmod, libpg_query), int32, (Ptr{Node},), expr)
end

function exprIsLengthCoercion(expr, coercedTypmod)
    ccall((:exprIsLengthCoercion, libpg_query), bool, (Ptr{Node}, Ptr{int32}), expr, coercedTypmod)
end

function relabel_to_typmod(expr, typmod)
    ccall((:relabel_to_typmod, libpg_query), Ptr{Node}, (Ptr{Node}, int32), expr, typmod)
end

function strip_implicit_coercions(node)
    ccall((:strip_implicit_coercions, libpg_query), Ptr{Node}, (Ptr{Node},), node)
end

function expression_returns_set(clause)
    ccall((:expression_returns_set, libpg_query), bool, (Ptr{Node},), clause)
end

function exprCollation(expr)
    ccall((:exprCollation, libpg_query), Oid, (Ptr{Node},), expr)
end

function exprInputCollation(expr)
    ccall((:exprInputCollation, libpg_query), Oid, (Ptr{Node},), expr)
end

function exprSetCollation(expr, collation)
    ccall((:exprSetCollation, libpg_query), Cvoid, (Ptr{Node}, Oid), expr, collation)
end

function exprSetInputCollation(expr, inputcollation)
    ccall((:exprSetInputCollation, libpg_query), Cvoid, (Ptr{Node}, Oid), expr, inputcollation)
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

function check_functions_in_node(node, checker, context)
    ccall((:check_functions_in_node, libpg_query), bool, (Ptr{Node}, check_function_callback, Ptr{Cvoid}), node, checker, context)
end

function expression_tree_walker(node, walker, context)
    ccall((:expression_tree_walker, libpg_query), bool, (Ptr{Node}, Ptr{Cvoid}, Ptr{Cvoid}), node, walker, context)
end

function expression_tree_mutator(node, mutator, context)
    ccall((:expression_tree_mutator, libpg_query), Ptr{Node}, (Ptr{Node}, Ptr{Cvoid}, Ptr{Cvoid}), node, mutator, context)
end

function query_tree_walker(query, walker, context, flags)
    ccall((:query_tree_walker, libpg_query), bool, (Ptr{Query}, Ptr{Cvoid}, Ptr{Cvoid}, Cint), query, walker, context, flags)
end

function query_tree_mutator(query, mutator, context, flags)
    ccall((:query_tree_mutator, libpg_query), Ptr{Query}, (Ptr{Query}, Ptr{Cvoid}, Ptr{Cvoid}, Cint), query, mutator, context, flags)
end

function range_table_walker(rtable, walker, context, flags)
    ccall((:range_table_walker, libpg_query), bool, (Ptr{List}, Ptr{Cvoid}, Ptr{Cvoid}, Cint), rtable, walker, context, flags)
end

function range_table_mutator(rtable, mutator, context, flags)
    ccall((:range_table_mutator, libpg_query), Ptr{List}, (Ptr{List}, Ptr{Cvoid}, Ptr{Cvoid}, Cint), rtable, mutator, context, flags)
end

function query_or_expression_tree_walker(node, walker, context, flags)
    ccall((:query_or_expression_tree_walker, libpg_query), bool, (Ptr{Node}, Ptr{Cvoid}, Ptr{Cvoid}, Cint), node, walker, context, flags)
end

function query_or_expression_tree_mutator(node, mutator, context, flags)
    ccall((:query_or_expression_tree_mutator, libpg_query), Ptr{Node}, (Ptr{Node}, Ptr{Cvoid}, Ptr{Cvoid}, Cint), node, mutator, context, flags)
end

function raw_expression_tree_walker(node, walker, context)
    ccall((:raw_expression_tree_walker, libpg_query), bool, (Ptr{Node}, Ptr{Cvoid}, Ptr{Cvoid}), node, walker, context)
end

function planstate_tree_walker(planstate, walker, context)
    ccall((:planstate_tree_walker, libpg_query), bool, (Ptr{PlanState}, Ptr{Cvoid}, Ptr{Cvoid}), planstate, walker, context)
end
# Julia wrapper for header: nodes.h
# Automatically generated using Clang.jl


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
    ccall((:outDatum, libpg_query), Cvoid, (Ptr{StringInfoData}, Csize_t, Cint, bool), str, value, typlen, typbyval)
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

function readDatum(typbyval)
    ccall((:readDatum, libpg_query), Csize_t, (bool,), typbyval)
end

function readBoolCols(numCols)
    ccall((:readBoolCols, libpg_query), Ptr{bool}, (Cint,), numCols)
end

function readIntCols(numCols)
    ccall((:readIntCols, libpg_query), Ptr{Cint}, (Cint,), numCols)
end

function readOidCols(numCols)
    ccall((:readOidCols, libpg_query), Ptr{Oid}, (Cint,), numCols)
end

function readAttrNumberCols(numCols)
    ccall((:readAttrNumberCols, libpg_query), Ptr{int16}, (Cint,), numCols)
end

function copyObjectImpl(obj)
    ccall((:copyObjectImpl, libpg_query), Ptr{Cvoid}, (Ptr{Cvoid},), obj)
end

function equal(a, b)
    ccall((:equal, libpg_query), bool, (Ptr{Cvoid}, Ptr{Cvoid}), a, b)
end
# Julia wrapper for header: params.h
# Automatically generated using Clang.jl


function copyParamList(from)
    ccall((:copyParamList, libpg_query), ParamListInfo, (ParamListInfo,), from)
end

function EstimateParamListSpace(paramLI)
    ccall((:EstimateParamListSpace, libpg_query), Size, (ParamListInfo,), paramLI)
end

function SerializeParamList(paramLI, start_address)
    ccall((:SerializeParamList, libpg_query), Cvoid, (ParamListInfo, Ptr{Cstring}), paramLI, start_address)
end

function RestoreParamList(start_address)
    ccall((:RestoreParamList, libpg_query), ParamListInfo, (Ptr{Cstring},), start_address)
end
# Julia wrapper for header: parsenodes.h
# Automatically generated using Clang.jl

# Julia wrapper for header: pg_list.h
# Automatically generated using Clang.jl


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
    ccall((:lappend_oid, libpg_query), Ptr{List}, (Ptr{List}, Oid), list, datum)
end

function lappend_cell(list, prev, datum)
    ccall((:lappend_cell, libpg_query), Ptr{ListCell}, (Ptr{List}, Ptr{ListCell}, Ptr{Cvoid}), list, prev, datum)
end

function lappend_cell_int(list, prev, datum)
    ccall((:lappend_cell_int, libpg_query), Ptr{ListCell}, (Ptr{List}, Ptr{ListCell}, Cint), list, prev, datum)
end

function lappend_cell_oid(list, prev, datum)
    ccall((:lappend_cell_oid, libpg_query), Ptr{ListCell}, (Ptr{List}, Ptr{ListCell}, Oid), list, prev, datum)
end

function lcons(datum, list)
    ccall((:lcons, libpg_query), Ptr{List}, (Ptr{Cvoid}, Ptr{List}), datum, list)
end

function lcons_int(datum, list)
    ccall((:lcons_int, libpg_query), Ptr{List}, (Cint, Ptr{List}), datum, list)
end

function lcons_oid(datum, list)
    ccall((:lcons_oid, libpg_query), Ptr{List}, (Oid, Ptr{List}), datum, list)
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

function list_nth_oid(list, n)
    ccall((:list_nth_oid, libpg_query), Oid, (Ptr{List}, Cint), list, n)
end

function list_member(list, datum)
    ccall((:list_member, libpg_query), bool, (Ptr{List}, Ptr{Cvoid}), list, datum)
end

function list_member_ptr(list, datum)
    ccall((:list_member_ptr, libpg_query), bool, (Ptr{List}, Ptr{Cvoid}), list, datum)
end

function list_member_int(list, datum)
    ccall((:list_member_int, libpg_query), bool, (Ptr{List}, Cint), list, datum)
end

function list_member_oid(list, datum)
    ccall((:list_member_oid, libpg_query), bool, (Ptr{List}, Oid), list, datum)
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
    ccall((:list_delete_oid, libpg_query), Ptr{List}, (Ptr{List}, Oid), list, datum)
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
    ccall((:list_append_unique_oid, libpg_query), Ptr{List}, (Ptr{List}, Oid), list, datum)
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
# Julia wrapper for header: plannodes.h
# Automatically generated using Clang.jl

# Julia wrapper for header: primnodes.h
# Automatically generated using Clang.jl

# Julia wrapper for header: print.h
# Automatically generated using Clang.jl


function print(obj)
    ccall((:print, libpg_query), Cvoid, (Ptr{Cvoid},), obj)
end

function pprint(obj)
    ccall((:pprint, libpg_query), Cvoid, (Ptr{Cvoid},), obj)
end

function elog_node_display(lev, title, obj, pretty)
    ccall((:elog_node_display, libpg_query), Cvoid, (Cint, Cstring, Ptr{Cvoid}, bool), lev, title, obj, pretty)
end

function format_node_dump(dump)
    ccall((:format_node_dump, libpg_query), Cstring, (Cstring,), dump)
end

function pretty_format_node_dump(dump)
    ccall((:pretty_format_node_dump, libpg_query), Cstring, (Cstring,), dump)
end

function print_rt(rtable)
    ccall((:print_rt, libpg_query), Cvoid, (Ptr{List},), rtable)
end

function print_expr(expr, rtable)
    ccall((:print_expr, libpg_query), Cvoid, (Ptr{Node}, Ptr{List}), expr, rtable)
end

function print_pathkeys(pathkeys, rtable)
    ccall((:print_pathkeys, libpg_query), Cvoid, (Ptr{List}, Ptr{List}), pathkeys, rtable)
end

function print_tl(tlist, rtable)
    ccall((:print_tl, libpg_query), Cvoid, (Ptr{List}, Ptr{List}), tlist, rtable)
end

function print_slot(slot)
    ccall((:print_slot, libpg_query), Cvoid, (Ptr{TupleTableSlot},), slot)
end
# Julia wrapper for header: relation.h
# Automatically generated using Clang.jl


function is_dummy_rel(rel)
    ccall((:is_dummy_rel, libpg_query), bool, (Ptr{RelOptInfo},), rel)
end
# Julia wrapper for header: tidbitmap.h
# Automatically generated using Clang.jl


function tbm_create(maxbytes, dsa)
    ccall((:tbm_create, libpg_query), Ptr{TIDBitmap}, (Clong, Ptr{dsa_area}), maxbytes, dsa)
end

function tbm_free(tbm)
    ccall((:tbm_free, libpg_query), Cvoid, (Ptr{TIDBitmap},), tbm)
end

function tbm_free_shared_area(dsa, dp)
    ccall((:tbm_free_shared_area, libpg_query), Cvoid, (Ptr{dsa_area}, dsa_pointer), dsa, dp)
end

function tbm_add_tuples(tbm, tids, ntids, recheck)
    ccall((:tbm_add_tuples, libpg_query), Cvoid, (Ptr{TIDBitmap}, ItemPointer, Cint, bool), tbm, tids, ntids, recheck)
end

function tbm_add_page(tbm, pageno)
    ccall((:tbm_add_page, libpg_query), Cvoid, (Ptr{TIDBitmap}, BlockNumber), tbm, pageno)
end

function tbm_union(a, b)
    ccall((:tbm_union, libpg_query), Cvoid, (Ptr{TIDBitmap}, Ptr{TIDBitmap}), a, b)
end

function tbm_intersect(a, b)
    ccall((:tbm_intersect, libpg_query), Cvoid, (Ptr{TIDBitmap}, Ptr{TIDBitmap}), a, b)
end

function tbm_is_empty(tbm)
    ccall((:tbm_is_empty, libpg_query), bool, (Ptr{TIDBitmap},), tbm)
end

function tbm_begin_iterate(tbm)
    ccall((:tbm_begin_iterate, libpg_query), Ptr{TBMIterator}, (Ptr{TIDBitmap},), tbm)
end

function tbm_prepare_shared_iterate(tbm)
    ccall((:tbm_prepare_shared_iterate, libpg_query), dsa_pointer, (Ptr{TIDBitmap},), tbm)
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
    ccall((:tbm_attach_shared_iterate, libpg_query), Ptr{TBMSharedIterator}, (Ptr{dsa_area}, dsa_pointer), dsa, dp)
end
# Julia wrapper for header: value.h
# Automatically generated using Clang.jl


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

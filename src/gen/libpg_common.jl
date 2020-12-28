# Automatically generated using Clang.jl


const PG_VERSION = "10.15"
const PG_MAJORVERSION = "10"
const PG_VERSION_NUM = 100015

struct PgQueryError
    message::Cstring
    funcname::Cstring
    filename::Cstring
    lineno::Cint
    cursorpos::Cint
    context::Cstring
end

struct PgQueryParseResult
    parse_tree::Cstring
    stderr_buffer::Cstring
    error::Ptr{PgQueryError}
end

struct PgQueryPlpgsqlParseResult
    plpgsql_funcs::Cstring
    error::Ptr{PgQueryError}
end

struct PgQueryFingerprintResult
    hexdigest::Cstring
    stderr_buffer::Cstring
    error::Ptr{PgQueryError}
end

struct PgQueryNormalizeResult
    normalized_query::Cstring
    error::Ptr{PgQueryError}
end

const STDERR_BUFFER_LEN = 4096

@cenum NodeTag::UInt32 begin
    T_Invalid = 0
    T_IndexInfo = 1
    T_ExprContext = 2
    T_ProjectionInfo = 3
    T_JunkFilter = 4
    T_ResultRelInfo = 5
    T_EState = 6
    T_TupleTableSlot = 7
    T_Plan = 8
    T_Result = 9
    T_ProjectSet = 10
    T_ModifyTable = 11
    T_Append = 12
    T_MergeAppend = 13
    T_RecursiveUnion = 14
    T_BitmapAnd = 15
    T_BitmapOr = 16
    T_Scan = 17
    T_SeqScan = 18
    T_SampleScan = 19
    T_IndexScan = 20
    T_IndexOnlyScan = 21
    T_BitmapIndexScan = 22
    T_BitmapHeapScan = 23
    T_TidScan = 24
    T_SubqueryScan = 25
    T_FunctionScan = 26
    T_ValuesScan = 27
    T_TableFuncScan = 28
    T_CteScan = 29
    T_NamedTuplestoreScan = 30
    T_WorkTableScan = 31
    T_ForeignScan = 32
    T_CustomScan = 33
    T_Join = 34
    T_NestLoop = 35
    T_MergeJoin = 36
    T_HashJoin = 37
    T_Material = 38
    T_Sort = 39
    T_Group = 40
    T_Agg = 41
    T_WindowAgg = 42
    T_Unique = 43
    T_Gather = 44
    T_GatherMerge = 45
    T_Hash = 46
    T_SetOp = 47
    T_LockRows = 48
    T_Limit = 49
    T_NestLoopParam = 50
    T_PlanRowMark = 51
    T_PlanInvalItem = 52
    T_PlanState = 53
    T_ResultState = 54
    T_ProjectSetState = 55
    T_ModifyTableState = 56
    T_AppendState = 57
    T_MergeAppendState = 58
    T_RecursiveUnionState = 59
    T_BitmapAndState = 60
    T_BitmapOrState = 61
    T_ScanState = 62
    T_SeqScanState = 63
    T_SampleScanState = 64
    T_IndexScanState = 65
    T_IndexOnlyScanState = 66
    T_BitmapIndexScanState = 67
    T_BitmapHeapScanState = 68
    T_TidScanState = 69
    T_SubqueryScanState = 70
    T_FunctionScanState = 71
    T_TableFuncScanState = 72
    T_ValuesScanState = 73
    T_CteScanState = 74
    T_NamedTuplestoreScanState = 75
    T_WorkTableScanState = 76
    T_ForeignScanState = 77
    T_CustomScanState = 78
    T_JoinState = 79
    T_NestLoopState = 80
    T_MergeJoinState = 81
    T_HashJoinState = 82
    T_MaterialState = 83
    T_SortState = 84
    T_GroupState = 85
    T_AggState = 86
    T_WindowAggState = 87
    T_UniqueState = 88
    T_GatherState = 89
    T_GatherMergeState = 90
    T_HashState = 91
    T_SetOpState = 92
    T_LockRowsState = 93
    T_LimitState = 94
    T_Alias = 95
    T_RangeVar = 96
    T_TableFunc = 97
    T_Expr = 98
    T_Var = 99
    T_Const = 100
    T_Param = 101
    T_Aggref = 102
    T_GroupingFunc = 103
    T_WindowFunc = 104
    T_ArrayRef = 105
    T_FuncExpr = 106
    T_NamedArgExpr = 107
    T_OpExpr = 108
    T_DistinctExpr = 109
    T_NullIfExpr = 110
    T_ScalarArrayOpExpr = 111
    T_BoolExpr = 112
    T_SubLink = 113
    T_SubPlan = 114
    T_AlternativeSubPlan = 115
    T_FieldSelect = 116
    T_FieldStore = 117
    T_RelabelType = 118
    T_CoerceViaIO = 119
    T_ArrayCoerceExpr = 120
    T_ConvertRowtypeExpr = 121
    T_CollateExpr = 122
    T_CaseExpr = 123
    T_CaseWhen = 124
    T_CaseTestExpr = 125
    T_ArrayExpr = 126
    T_RowExpr = 127
    T_RowCompareExpr = 128
    T_CoalesceExpr = 129
    T_MinMaxExpr = 130
    T_SQLValueFunction = 131
    T_XmlExpr = 132
    T_NullTest = 133
    T_BooleanTest = 134
    T_CoerceToDomain = 135
    T_CoerceToDomainValue = 136
    T_SetToDefault = 137
    T_CurrentOfExpr = 138
    T_NextValueExpr = 139
    T_InferenceElem = 140
    T_TargetEntry = 141
    T_RangeTblRef = 142
    T_JoinExpr = 143
    T_FromExpr = 144
    T_OnConflictExpr = 145
    T_IntoClause = 146
    T_ExprState = 147
    T_AggrefExprState = 148
    T_WindowFuncExprState = 149
    T_SetExprState = 150
    T_SubPlanState = 151
    T_AlternativeSubPlanState = 152
    T_DomainConstraintState = 153
    T_PlannerInfo = 154
    T_PlannerGlobal = 155
    T_RelOptInfo = 156
    T_IndexOptInfo = 157
    T_ForeignKeyOptInfo = 158
    T_ParamPathInfo = 159
    T_Path = 160
    T_IndexPath = 161
    T_BitmapHeapPath = 162
    T_BitmapAndPath = 163
    T_BitmapOrPath = 164
    T_TidPath = 165
    T_SubqueryScanPath = 166
    T_ForeignPath = 167
    T_CustomPath = 168
    T_NestPath = 169
    T_MergePath = 170
    T_HashPath = 171
    T_AppendPath = 172
    T_MergeAppendPath = 173
    T_ResultPath = 174
    T_MaterialPath = 175
    T_UniquePath = 176
    T_GatherPath = 177
    T_GatherMergePath = 178
    T_ProjectionPath = 179
    T_ProjectSetPath = 180
    T_SortPath = 181
    T_GroupPath = 182
    T_UpperUniquePath = 183
    T_AggPath = 184
    T_GroupingSetsPath = 185
    T_MinMaxAggPath = 186
    T_WindowAggPath = 187
    T_SetOpPath = 188
    T_RecursiveUnionPath = 189
    T_LockRowsPath = 190
    T_ModifyTablePath = 191
    T_LimitPath = 192
    T_EquivalenceClass = 193
    T_EquivalenceMember = 194
    T_PathKey = 195
    T_PathTarget = 196
    T_RestrictInfo = 197
    T_PlaceHolderVar = 198
    T_SpecialJoinInfo = 199
    T_AppendRelInfo = 200
    T_PartitionedChildRelInfo = 201
    T_PlaceHolderInfo = 202
    T_MinMaxAggInfo = 203
    T_PlannerParamItem = 204
    T_RollupData = 205
    T_GroupingSetData = 206
    T_StatisticExtInfo = 207
    T_MemoryContext = 208
    T_AllocSetContext = 209
    T_SlabContext = 210
    T_Value = 211
    T_Integer = 212
    T_Float = 213
    T_String = 214
    T_BitString = 215
    T_Null = 216
    T_List = 217
    T_IntList = 218
    T_OidList = 219
    T_ExtensibleNode = 220
    T_RawStmt = 221
    T_Query = 222
    T_PlannedStmt = 223
    T_InsertStmt = 224
    T_DeleteStmt = 225
    T_UpdateStmt = 226
    T_SelectStmt = 227
    T_AlterTableStmt = 228
    T_AlterTableCmd = 229
    T_AlterDomainStmt = 230
    T_SetOperationStmt = 231
    T_GrantStmt = 232
    T_GrantRoleStmt = 233
    T_AlterDefaultPrivilegesStmt = 234
    T_ClosePortalStmt = 235
    T_ClusterStmt = 236
    T_CopyStmt = 237
    T_CreateStmt = 238
    T_DefineStmt = 239
    T_DropStmt = 240
    T_TruncateStmt = 241
    T_CommentStmt = 242
    T_FetchStmt = 243
    T_IndexStmt = 244
    T_CreateFunctionStmt = 245
    T_AlterFunctionStmt = 246
    T_DoStmt = 247
    T_RenameStmt = 248
    T_RuleStmt = 249
    T_NotifyStmt = 250
    T_ListenStmt = 251
    T_UnlistenStmt = 252
    T_TransactionStmt = 253
    T_ViewStmt = 254
    T_LoadStmt = 255
    T_CreateDomainStmt = 256
    T_CreatedbStmt = 257
    T_DropdbStmt = 258
    T_VacuumStmt = 259
    T_ExplainStmt = 260
    T_CreateTableAsStmt = 261
    T_CreateSeqStmt = 262
    T_AlterSeqStmt = 263
    T_VariableSetStmt = 264
    T_VariableShowStmt = 265
    T_DiscardStmt = 266
    T_CreateTrigStmt = 267
    T_CreatePLangStmt = 268
    T_CreateRoleStmt = 269
    T_AlterRoleStmt = 270
    T_DropRoleStmt = 271
    T_LockStmt = 272
    T_ConstraintsSetStmt = 273
    T_ReindexStmt = 274
    T_CheckPointStmt = 275
    T_CreateSchemaStmt = 276
    T_AlterDatabaseStmt = 277
    T_AlterDatabaseSetStmt = 278
    T_AlterRoleSetStmt = 279
    T_CreateConversionStmt = 280
    T_CreateCastStmt = 281
    T_CreateOpClassStmt = 282
    T_CreateOpFamilyStmt = 283
    T_AlterOpFamilyStmt = 284
    T_PrepareStmt = 285
    T_ExecuteStmt = 286
    T_DeallocateStmt = 287
    T_DeclareCursorStmt = 288
    T_CreateTableSpaceStmt = 289
    T_DropTableSpaceStmt = 290
    T_AlterObjectDependsStmt = 291
    T_AlterObjectSchemaStmt = 292
    T_AlterOwnerStmt = 293
    T_AlterOperatorStmt = 294
    T_DropOwnedStmt = 295
    T_ReassignOwnedStmt = 296
    T_CompositeTypeStmt = 297
    T_CreateEnumStmt = 298
    T_CreateRangeStmt = 299
    T_AlterEnumStmt = 300
    T_AlterTSDictionaryStmt = 301
    T_AlterTSConfigurationStmt = 302
    T_CreateFdwStmt = 303
    T_AlterFdwStmt = 304
    T_CreateForeignServerStmt = 305
    T_AlterForeignServerStmt = 306
    T_CreateUserMappingStmt = 307
    T_AlterUserMappingStmt = 308
    T_DropUserMappingStmt = 309
    T_AlterTableSpaceOptionsStmt = 310
    T_AlterTableMoveAllStmt = 311
    T_SecLabelStmt = 312
    T_CreateForeignTableStmt = 313
    T_ImportForeignSchemaStmt = 314
    T_CreateExtensionStmt = 315
    T_AlterExtensionStmt = 316
    T_AlterExtensionContentsStmt = 317
    T_CreateEventTrigStmt = 318
    T_AlterEventTrigStmt = 319
    T_RefreshMatViewStmt = 320
    T_ReplicaIdentityStmt = 321
    T_AlterSystemStmt = 322
    T_CreatePolicyStmt = 323
    T_AlterPolicyStmt = 324
    T_CreateTransformStmt = 325
    T_CreateAmStmt = 326
    T_CreatePublicationStmt = 327
    T_AlterPublicationStmt = 328
    T_CreateSubscriptionStmt = 329
    T_AlterSubscriptionStmt = 330
    T_DropSubscriptionStmt = 331
    T_CreateStatsStmt = 332
    T_AlterCollationStmt = 333
    T_A_Expr = 334
    T_ColumnRef = 335
    T_ParamRef = 336
    T_A_Const = 337
    T_FuncCall = 338
    T_A_Star = 339
    T_A_Indices = 340
    T_A_Indirection = 341
    T_A_ArrayExpr = 342
    T_ResTarget = 343
    T_MultiAssignRef = 344
    T_TypeCast = 345
    T_CollateClause = 346
    T_SortBy = 347
    T_WindowDef = 348
    T_RangeSubselect = 349
    T_RangeFunction = 350
    T_RangeTableSample = 351
    T_RangeTableFunc = 352
    T_RangeTableFuncCol = 353
    T_TypeName = 354
    T_ColumnDef = 355
    T_IndexElem = 356
    T_Constraint = 357
    T_DefElem = 358
    T_RangeTblEntry = 359
    T_RangeTblFunction = 360
    T_TableSampleClause = 361
    T_WithCheckOption = 362
    T_SortGroupClause = 363
    T_GroupingSet = 364
    T_WindowClause = 365
    T_ObjectWithArgs = 366
    T_AccessPriv = 367
    T_CreateOpClassItem = 368
    T_TableLikeClause = 369
    T_FunctionParameter = 370
    T_LockingClause = 371
    T_RowMarkClause = 372
    T_XmlSerialize = 373
    T_WithClause = 374
    T_InferClause = 375
    T_OnConflictClause = 376
    T_CommonTableExpr = 377
    T_RoleSpec = 378
    T_TriggerTransition = 379
    T_PartitionElem = 380
    T_PartitionSpec = 381
    T_PartitionBoundSpec = 382
    T_PartitionRangeDatum = 383
    T_PartitionCmd = 384
    T_IdentifySystemCmd = 385
    T_BaseBackupCmd = 386
    T_CreateReplicationSlotCmd = 387
    T_DropReplicationSlotCmd = 388
    T_StartReplicationCmd = 389
    T_TimeLineHistoryCmd = 390
    T_SQLCmd = 391
    T_TriggerData = 392
    T_EventTriggerData = 393
    T_ReturnSetInfo = 394
    T_WindowObjectData = 395
    T_TIDBitmap = 396
    T_InlineCodeBlock = 397
    T_FdwRoutine = 398
    T_IndexAmRoutine = 399
    T_TsmRoutine = 400
    T_ForeignKeyCacheInfo = 401
end


struct ANONYMOUS1_data
    ptr_value::Ptr{Cvoid}
end

struct ListCell
    data::ANONYMOUS1_data
    next::Ptr{ListCell}
end

struct List
    type::NodeTag
    length::Cint
    head::Ptr{ListCell}
    tail::Ptr{ListCell}
end

struct PgQueryInternalParsetreeAndError
    tree::Ptr{List}
    stderr_buffer::Cstring
    error::Ptr{Cint}
end

const BITS_PER_BITMAPWORD = 32
const bitmapword = Cint
const signedbitmapword = Cint

struct Bitmapset
    nwords::Cint
    words::bitmapword
end

@cenum BMS_Comparison::UInt32 begin
    BMS_EQUAL = 0
    BMS_SUBSET1 = 1
    BMS_SUBSET2 = 2
    BMS_DIFFERENT = 3
end

@cenum BMS_Membership::UInt32 begin
    BMS_EMPTY_SET = 0
    BMS_SINGLETON = 1
    BMS_MULTIPLE = 2
end


const EXTNODENAME_MAX_LEN = 64
const CUSTOMPATH_SUPPORT_BACKWARD_SCAN = 0x0001
const CUSTOMPATH_SUPPORT_MARK_RESTORE = 0x0002

struct ExtensibleNode
    type::NodeTag
    extnodename::Cstring
end

struct ExtensibleNodeMethods
    extnodename::Cstring
    node_size::Cint
    nodeCopy::Ptr{Cvoid}
    nodeEqual::Ptr{Cvoid}
    nodeOut::Ptr{Cvoid}
    nodeRead::Ptr{Cvoid}
end

struct CustomPathMethods
    CustomName::Cstring
    PlanCustomPath::Ptr{Cvoid}
end

struct CustomScanMethods
    CustomName::Cstring
    CreateCustomScanState::Ptr{Cvoid}
end

struct CustomExecMethods
    CustomName::Cstring
    BeginCustomScan::Ptr{Cvoid}
    ExecCustomScan::Ptr{Cvoid}
    EndCustomScan::Ptr{Cvoid}
    ReScanCustomScan::Ptr{Cvoid}
    MarkPosCustomScan::Ptr{Cvoid}
    RestrPosCustomScan::Ptr{Cvoid}
    Size::Cvoid
    InitializeDSMCustomScan::Ptr{Cvoid}
    ReInitializeDSMCustomScan::Ptr{Cvoid}
    InitializeWorkerCustomScan::Ptr{Cvoid}
    ShutdownCustomScan::Ptr{Cvoid}
    ExplainCustomScan::Ptr{Cvoid}
end

@cenum LockClauseStrength::UInt32 begin
    LCS_NONE = 0
    LCS_FORKEYSHARE = 1
    LCS_FORSHARE = 2
    LCS_FORNOKEYUPDATE = 3
    LCS_FORUPDATE = 4
end

@cenum LockWaitPolicy::UInt32 begin
    LockWaitBlock = 0
    LockWaitSkip = 1
    LockWaitError = 2
end


# Skipping MacroDefinition: MemoryContextIsValid ( context ) ( ( context ) != NULL && ( IsA ( ( context ) , AllocSetContext ) || IsA ( ( context ) , SlabContext ) ) )

struct MemoryContextCounters
    nblocks::Cint
    freechunks::Cint
    totalspace::Cint
    freespace::Cint
end

struct MemoryContextMethods
    alloc::Ptr{Cvoid}
    free_p::Ptr{Cvoid}
    realloc::Ptr{Cvoid}
    init::Ptr{Cvoid}
    reset::Ptr{Cvoid}
    delete_context::Ptr{Cvoid}
    Size::Cvoid
    bool::Cvoid
    stats::Ptr{Cvoid}
end

struct MemoryContextData
    type::NodeTag
    isReset::Cint
    allowInCritSection::Cint
    methods::Ptr{MemoryContextMethods}
    parent::Cint
    firstchild::Cint
    prevchild::Cint
    nextchild::Cint
    name::Cstring
    reset_cbs::Ptr{Cint}
end

const QTW_IGNORE_RT_SUBQUERIES = 0x01
const QTW_IGNORE_CTE_SUBQUERIES = 0x02
const QTW_IGNORE_RC_SUBQUERIES = 0x03
const QTW_IGNORE_JOINALIASES = 0x04
const QTW_IGNORE_RANGE_TABLE = 0x08
const QTW_EXAMINE_RTES = 0x10
const QTW_DONT_COPY_QUERY = 0x20
const QTW_EXAMINE_SORTGROUP = 0x80

# Skipping Typedef: CXType_FunctionProto bool

const PlanState = Cvoid

# Skipping MacroDefinition: nodeTag ( nodeptr ) ( ( ( const Node * ) ( nodeptr ) ) -> type )
# Skipping MacroDefinition: newNode ( size , tag ) \
#( { Node * _result ; AssertMacro ( ( size ) >= sizeof ( Node ) ) ; /* need the tag, at least */ _result = ( Node * ) palloc0fast ( size ) ; _result -> type = ( tag ) ; _result ; \
#} )
# Skipping MacroDefinition: makeNode ( _type_ ) ( ( _type_ * ) newNode ( sizeof ( _type_ ) , T_ ## _type_ ) )
# Skipping MacroDefinition: NodeSetTag ( nodeptr , t ) ( ( ( Node * ) ( nodeptr ) ) -> type = ( t ) )
# Skipping MacroDefinition: IsA ( nodeptr , _type_ ) ( nodeTag ( nodeptr ) == T_ ## _type_ )
# Skipping MacroDefinition: castNode ( _type_ , nodeptr ) ( ( _type_ * ) ( nodeptr ) )
# Skipping MacroDefinition: copyObject ( obj ) copyObjectImpl ( obj )
# Skipping MacroDefinition: IS_OUTER_JOIN ( jointype ) ( ( ( 1 << ( jointype ) ) & ( ( 1 << JOIN_LEFT ) | ( 1 << JOIN_FULL ) | ( 1 << JOIN_RIGHT ) | ( 1 << JOIN_ANTI ) ) ) != 0 )

const AGGSPLITOP_COMBINE = 0x01
const AGGSPLITOP_SKIPFINAL = 0x02
const AGGSPLITOP_SERIALIZE = 0x04
const AGGSPLITOP_DESERIALIZE = 0x08

# Skipping MacroDefinition: DO_AGGSPLIT_COMBINE ( as ) ( ( ( as ) & AGGSPLITOP_COMBINE ) != 0 )
# Skipping MacroDefinition: DO_AGGSPLIT_SKIPFINAL ( as ) ( ( ( as ) & AGGSPLITOP_SKIPFINAL ) != 0 )
# Skipping MacroDefinition: DO_AGGSPLIT_SERIALIZE ( as ) ( ( ( as ) & AGGSPLITOP_SERIALIZE ) != 0 )
# Skipping MacroDefinition: DO_AGGSPLIT_DESERIALIZE ( as ) ( ( ( as ) & AGGSPLITOP_DESERIALIZE ) != 0 )

struct Node
    type::NodeTag
end

const StringInfoData = Cvoid
const Selectivity = Cdouble
const Cost = Cdouble

@cenum CmdType::UInt32 begin
    CMD_UNKNOWN = 0
    CMD_SELECT = 1
    CMD_UPDATE = 2
    CMD_INSERT = 3
    CMD_DELETE = 4
    CMD_UTILITY = 5
    CMD_NOTHING = 6
end

@cenum JoinType::UInt32 begin
    JOIN_INNER = 0
    JOIN_LEFT = 1
    JOIN_FULL = 2
    JOIN_RIGHT = 3
    JOIN_SEMI = 4
    JOIN_ANTI = 5
    JOIN_UNIQUE_OUTER = 6
    JOIN_UNIQUE_INNER = 7
end

@cenum AggStrategy::UInt32 begin
    AGG_PLAIN = 0
    AGG_SORTED = 1
    AGG_HASHED = 2
    AGG_MIXED = 3
end

@cenum AggSplit::UInt32 begin
    AGGSPLIT_SIMPLE = 0
    AGGSPLIT_INITIAL_SERIAL = 6
    AGGSPLIT_FINAL_DESERIAL = 9
end

@cenum SetOpCmd::UInt32 begin
    SETOPCMD_INTERSECT = 0
    SETOPCMD_INTERSECT_ALL = 1
    SETOPCMD_EXCEPT = 2
    SETOPCMD_EXCEPT_ALL = 3
end

@cenum SetOpStrategy::UInt32 begin
    SETOP_SORTED = 0
    SETOP_HASHED = 1
end

@cenum OnConflictAction::UInt32 begin
    ONCONFLICT_NONE = 0
    ONCONFLICT_NOTHING = 1
    ONCONFLICT_UPDATE = 2
end


const PARAM_FLAG_CONST = 0x0001
const ParseState = Cvoid

struct ParamExternData
    value::Cint
    isnull::Cint
    pflags::Cint
    ptype::Cint
end

const ParamFetchHook = Ptr{Cvoid}
const ParserSetupHook = Ptr{Cvoid}

struct ParamListInfoData
    paramFetch::ParamFetchHook
    paramFetchArg::Ptr{Cvoid}
    parserSetup::ParserSetupHook
    parserSetupArg::Ptr{Cvoid}
    numParams::Cint
    paramMask::Ptr{Bitmapset}
    params::ParamExternData
end

const ParamListInfo = Ptr{ParamListInfoData}

struct ParamExecData
    execPlan::Ptr{Cvoid}
    value::Cint
    isnull::Cint
end

const ACL_INSERT = 1 << 0
const ACL_SELECT = 1 << 1
const ACL_UPDATE = 1 << 2
const ACL_DELETE = 1 << 3
const ACL_TRUNCATE = 1 << 4
const ACL_REFERENCES = 1 << 5
const ACL_TRIGGER = 1 << 6
const ACL_EXECUTE = 1 << 7
const ACL_USAGE = 1 << 8
const ACL_CREATE = 1 << 9
const ACL_CREATE_TEMP = 1 << 10
const ACL_CONNECT = 1 << 11
const N_ACL_RIGHTS = 12
const ACL_NO_RIGHTS = 0
const ACL_SELECT_FOR_UPDATE = ACL_UPDATE
const FRAMEOPTION_NONDEFAULT = 0x00000001
const FRAMEOPTION_RANGE = 0x00000002
const FRAMEOPTION_ROWS = 0x00000004
const FRAMEOPTION_BETWEEN = 0x00000008
const FRAMEOPTION_START_UNBOUNDED_PRECEDING = 0x00000010
const FRAMEOPTION_END_UNBOUNDED_PRECEDING = 0x00000020
const FRAMEOPTION_START_UNBOUNDED_FOLLOWING = 0x00000040
const FRAMEOPTION_END_UNBOUNDED_FOLLOWING = 0x00000080
const FRAMEOPTION_START_CURRENT_ROW = 0x00000100
const FRAMEOPTION_END_CURRENT_ROW = 0x00000200
const FRAMEOPTION_START_VALUE_PRECEDING = 0x00000400
const FRAMEOPTION_END_VALUE_PRECEDING = 0x00000800
const FRAMEOPTION_START_VALUE_FOLLOWING = 0x00001000
const FRAMEOPTION_END_VALUE_FOLLOWING = 0x00002000
const FRAMEOPTION_START_VALUE = FRAMEOPTION_START_VALUE_PRECEDING | FRAMEOPTION_START_VALUE_FOLLOWING
const FRAMEOPTION_END_VALUE = FRAMEOPTION_END_VALUE_PRECEDING | FRAMEOPTION_END_VALUE_FOLLOWING
const FRAMEOPTION_DEFAULTS = (FRAMEOPTION_RANGE | FRAMEOPTION_START_UNBOUNDED_PRECEDING) | FRAMEOPTION_END_CURRENT_ROW
const PARTITION_STRATEGY_LIST = 'l'
const PARTITION_STRATEGY_RANGE = 'r'

# Skipping MacroDefinition: GetCTETargetList ( cte ) ( AssertMacro ( IsA ( ( cte ) -> ctequery , Query ) ) , ( ( Query * ) ( cte ) -> ctequery ) -> commandType == CMD_SELECT ? ( ( Query * ) ( cte ) -> ctequery ) -> targetList : ( ( Query * ) ( cte ) -> ctequery ) -> returningList )

const FKCONSTR_ACTION_NOACTION = 'a'
const FKCONSTR_ACTION_RESTRICT = 'r'
const FKCONSTR_ACTION_CASCADE = 'c'
const FKCONSTR_ACTION_SETNULL = 'n'
const FKCONSTR_ACTION_SETDEFAULT = 'd'
const FKCONSTR_MATCH_FULL = 'f'
const FKCONSTR_MATCH_PARTIAL = 'p'
const FKCONSTR_MATCH_SIMPLE = 's'
const OPCLASS_ITEM_OPERATOR = 1
const OPCLASS_ITEM_FUNCTION = 2
const OPCLASS_ITEM_STORAGETYPE = 3
const CURSOR_OPT_BINARY = 0x0001
const CURSOR_OPT_SCROLL = 0x0002
const CURSOR_OPT_NO_SCROLL = 0x0004
const CURSOR_OPT_INSENSITIVE = 0x0008
const CURSOR_OPT_HOLD = 0x0010
const CURSOR_OPT_FAST_PLAN = 0x0020
const CURSOR_OPT_GENERIC_PLAN = 0x0040
const CURSOR_OPT_CUSTOM_PLAN = 0x0080
const CURSOR_OPT_PARALLEL_OK = 0x0100
const FETCH_ALL = LONG_MAX
const REINDEXOPT_VERBOSE = 1 << 0

@cenum OverridingKind::UInt32 begin
    OVERRIDING_NOT_SET = 0
    OVERRIDING_USER_VALUE = 1
    OVERRIDING_SYSTEM_VALUE = 2
end

@cenum QuerySource::UInt32 begin
    QSRC_ORIGINAL = 0
    QSRC_PARSER = 1
    QSRC_INSTEAD_RULE = 2
    QSRC_QUAL_INSTEAD_RULE = 3
    QSRC_NON_INSTEAD_RULE = 4
end

@cenum SortByDir::UInt32 begin
    SORTBY_DEFAULT = 0
    SORTBY_ASC = 1
    SORTBY_DESC = 2
    SORTBY_USING = 3
end

@cenum SortByNulls::UInt32 begin
    SORTBY_NULLS_DEFAULT = 0
    SORTBY_NULLS_FIRST = 1
    SORTBY_NULLS_LAST = 2
end


const AclMode = Cint

struct FromExpr
    type::NodeTag
    fromlist::Ptr{List}
    quals::Ptr{Node}
end

struct OnConflictExpr
    type::NodeTag
    action::OnConflictAction
    arbiterElems::Ptr{List}
    arbiterWhere::Ptr{Node}
    constraint::Cint
    onConflictSet::Ptr{List}
    onConflictWhere::Ptr{Node}
    exclRelIndex::Cint
    exclRelTlist::Ptr{List}
end

struct Query
    type::NodeTag
    commandType::CmdType
    querySource::QuerySource
    queryId::Cint
    canSetTag::Cint
    utilityStmt::Ptr{Node}
    resultRelation::Cint
    hasAggs::Cint
    hasWindowFuncs::Cint
    hasTargetSRFs::Cint
    hasSubLinks::Cint
    hasDistinctOn::Cint
    hasRecursive::Cint
    hasModifyingCTE::Cint
    hasForUpdate::Cint
    hasRowSecurity::Cint
    cteList::Ptr{List}
    rtable::Ptr{List}
    jointree::Ptr{FromExpr}
    targetList::Ptr{List}
    override::OverridingKind
    onConflict::Ptr{OnConflictExpr}
    returningList::Ptr{List}
    groupClause::Ptr{List}
    groupingSets::Ptr{List}
    havingQual::Ptr{Node}
    windowClause::Ptr{List}
    distinctClause::Ptr{List}
    sortClause::Ptr{List}
    limitOffset::Ptr{Node}
    limitCount::Ptr{Node}
    rowMarks::Ptr{List}
    setOperations::Ptr{Node}
    constraintDeps::Ptr{List}
    withCheckOptions::Ptr{List}
    stmt_location::Cint
    stmt_len::Cint
end

struct TypeName
    type::NodeTag
    names::Ptr{List}
    typeOid::Cint
    setof::Cint
    pct_type::Cint
    typmods::Ptr{List}
    typemod::Cint
    arrayBounds::Ptr{List}
    location::Cint
end

struct ColumnRef
    type::NodeTag
    fields::Ptr{List}
    location::Cint
end

struct ParamRef
    type::NodeTag
    number::Cint
    location::Cint
end

@cenum A_Expr_Kind::UInt32 begin
    AEXPR_OP = 0
    AEXPR_OP_ANY = 1
    AEXPR_OP_ALL = 2
    AEXPR_DISTINCT = 3
    AEXPR_NOT_DISTINCT = 4
    AEXPR_NULLIF = 5
    AEXPR_OF = 6
    AEXPR_IN = 7
    AEXPR_LIKE = 8
    AEXPR_ILIKE = 9
    AEXPR_SIMILAR = 10
    AEXPR_BETWEEN = 11
    AEXPR_NOT_BETWEEN = 12
    AEXPR_BETWEEN_SYM = 13
    AEXPR_NOT_BETWEEN_SYM = 14
    AEXPR_PAREN = 15
end


struct A_Expr
    type::NodeTag
    kind::A_Expr_Kind
    name::Ptr{List}
    lexpr::Ptr{Node}
    rexpr::Ptr{Node}
    location::Cint
end

struct Value
    type::NodeTag
    val::ValUnion
end

struct A_Const
    type::NodeTag
    val::Value
    location::Cint
end

struct TypeCast
    type::NodeTag
    arg::Ptr{Node}
    typeName::Ptr{TypeName}
    location::Cint
end

struct CollateClause
    type::NodeTag
    arg::Ptr{Node}
    collname::Ptr{List}
    location::Cint
end

@cenum RoleSpecType::UInt32 begin
    ROLESPEC_CSTRING = 0
    ROLESPEC_CURRENT_USER = 1
    ROLESPEC_SESSION_USER = 2
    ROLESPEC_PUBLIC = 3
end


struct RoleSpec
    type::NodeTag
    roletype::RoleSpecType
    rolename::Cstring
    location::Cint
end

struct WindowDef
    type::NodeTag
    name::Cstring
    refname::Cstring
    partitionClause::Ptr{List}
    orderClause::Ptr{List}
    frameOptions::Cint
    startOffset::Ptr{Node}
    endOffset::Ptr{Node}
    location::Cint
end

struct FuncCall
    type::NodeTag
    funcname::Ptr{List}
    args::Ptr{List}
    agg_order::Ptr{List}
    agg_filter::Ptr{Node}
    agg_within_group::Cint
    agg_star::Cint
    agg_distinct::Cint
    func_variadic::Cint
    over::Ptr{WindowDef}
    location::Cint
end

struct A_Star
    type::NodeTag
end

struct A_Indices
    type::NodeTag
    is_slice::Cint
    lidx::Ptr{Node}
    uidx::Ptr{Node}
end

struct A_Indirection
    type::NodeTag
    arg::Ptr{Node}
    indirection::Ptr{List}
end

struct A_ArrayExpr
    type::NodeTag
    elements::Ptr{List}
    location::Cint
end

struct ResTarget
    type::NodeTag
    name::Cstring
    indirection::Ptr{List}
    val::Ptr{Node}
    location::Cint
end

struct MultiAssignRef
    type::NodeTag
    source::Ptr{Node}
    colno::Cint
    ncolumns::Cint
end

struct SortBy
    type::NodeTag
    node::Ptr{Node}
    sortby_dir::SortByDir
    sortby_nulls::SortByNulls
    useOp::Ptr{List}
    location::Cint
end

struct Alias
    type::NodeTag
    aliasname::Cstring
    colnames::Ptr{List}
end

struct RangeSubselect
    type::NodeTag
    lateral::Cint
    subquery::Ptr{Node}
    alias::Ptr{Alias}
end

struct RangeFunction
    type::NodeTag
    lateral::Cint
    ordinality::Cint
    is_rowsfrom::Cint
    functions::Ptr{List}
    alias::Ptr{Alias}
    coldeflist::Ptr{List}
end

struct RangeTableFunc
    type::NodeTag
    lateral::Cint
    docexpr::Ptr{Node}
    rowexpr::Ptr{Node}
    namespaces::Ptr{List}
    columns::Ptr{List}
    alias::Ptr{Alias}
    location::Cint
end

struct RangeTableFuncCol
    type::NodeTag
    colname::Cstring
    typeName::Ptr{TypeName}
    for_ordinality::Cint
    is_not_null::Cint
    colexpr::Ptr{Node}
    coldefexpr::Ptr{Node}
    location::Cint
end

struct RangeTableSample
    type::NodeTag
    relation::Ptr{Node}
    method::Ptr{List}
    args::Ptr{List}
    repeatable::Ptr{Node}
    location::Cint
end

struct RangeVar
    type::NodeTag
    catalogname::Cstring
    schemaname::Cstring
    relname::Cstring
    inh::Cint
    relpersistence::UInt8
    alias::Ptr{Alias}
    location::Cint
end

struct ColumnDef
    type::NodeTag
    colname::Cstring
    typeName::Ptr{TypeName}
    inhcount::Cint
    is_local::Cint
    is_not_null::Cint
    is_from_type::Cint
    is_from_parent::Cint
    storage::UInt8
    raw_default::Ptr{Node}
    cooked_default::Ptr{Node}
    identity::UInt8
    identitySequence::Ptr{RangeVar}
    collClause::Ptr{CollateClause}
    collOid::Cint
    constraints::Ptr{List}
    fdwoptions::Ptr{List}
    location::Cint
end

struct TableLikeClause
    type::NodeTag
    relation::Ptr{RangeVar}
    options::Cint
end

@cenum TableLikeOption::UInt32 begin
    CREATE_TABLE_LIKE_DEFAULTS = 1
    CREATE_TABLE_LIKE_CONSTRAINTS = 2
    CREATE_TABLE_LIKE_IDENTITY = 4
    CREATE_TABLE_LIKE_INDEXES = 8
    CREATE_TABLE_LIKE_STORAGE = 16
    CREATE_TABLE_LIKE_COMMENTS = 32
    CREATE_TABLE_LIKE_STATISTICS = 64
    CREATE_TABLE_LIKE_ALL = 65
end


struct IndexElem
    type::NodeTag
    name::Cstring
    expr::Ptr{Node}
    indexcolname::Cstring
    collation::Ptr{List}
    opclass::Ptr{List}
    ordering::SortByDir
    nulls_ordering::SortByNulls
end

@cenum DefElemAction::UInt32 begin
    DEFELEM_UNSPEC = 0
    DEFELEM_SET = 1
    DEFELEM_ADD = 2
    DEFELEM_DROP = 3
end


struct DefElem
    type::NodeTag
    defnamespace::Cstring
    defname::Cstring
    arg::Ptr{Node}
    defaction::DefElemAction
    location::Cint
end

struct LockingClause
    type::NodeTag
    lockedRels::Ptr{List}
    strength::LockClauseStrength
    waitPolicy::LockWaitPolicy
end

@cenum XmlOptionType::UInt32 begin
    XMLOPTION_DOCUMENT = 0
    XMLOPTION_CONTENT = 1
end


struct XmlSerialize
    type::NodeTag
    xmloption::XmlOptionType
    expr::Ptr{Node}
    typeName::Ptr{TypeName}
    location::Cint
end

struct PartitionElem
    type::NodeTag
    name::Cstring
    expr::Ptr{Node}
    collation::Ptr{List}
    opclass::Ptr{List}
    location::Cint
end

struct PartitionSpec
    type::NodeTag
    strategy::Cstring
    partParams::Ptr{List}
    location::Cint
end

struct PartitionBoundSpec
    type::NodeTag
    strategy::UInt8
    listdatums::Ptr{List}
    lowerdatums::Ptr{List}
    upperdatums::Ptr{List}
    location::Cint
end

@cenum PartitionRangeDatumKind::Int32 begin
    PARTITION_RANGE_DATUM_MINVALUE = -1
    PARTITION_RANGE_DATUM_VALUE = 0
    PARTITION_RANGE_DATUM_MAXVALUE = 1
end


struct PartitionRangeDatum
    type::NodeTag
    kind::PartitionRangeDatumKind
    value::Ptr{Node}
    location::Cint
end

struct PartitionCmd
    type::NodeTag
    name::Ptr{RangeVar}
    bound::Ptr{PartitionBoundSpec}
end

@cenum RTEKind::UInt32 begin
    RTE_RELATION = 0
    RTE_SUBQUERY = 1
    RTE_JOIN = 2
    RTE_FUNCTION = 3
    RTE_TABLEFUNC = 4
    RTE_VALUES = 5
    RTE_CTE = 6
    RTE_NAMEDTUPLESTORE = 7
end


struct Expr
    type::NodeTag
end

struct TableSampleClause
    type::NodeTag
    tsmhandler::Cint
    args::Ptr{List}
    repeatable::Ptr{Expr}
end

struct TableFunc
    type::NodeTag
    ns_uris::Ptr{List}
    ns_names::Ptr{List}
    docexpr::Ptr{Node}
    rowexpr::Ptr{Node}
    colnames::Ptr{List}
    coltypes::Ptr{List}
    coltypmods::Ptr{List}
    colcollations::Ptr{List}
    colexprs::Ptr{List}
    coldefexprs::Ptr{List}
    notnulls::Ptr{Bitmapset}
    ordinalitycol::Cint
    location::Cint
end

struct RangeTblEntry
    type::NodeTag
    rtekind::RTEKind
    relid::Cint
    relkind::UInt8
    tablesample::Ptr{TableSampleClause}
    subquery::Ptr{Query}
    security_barrier::Cint
    jointype::JoinType
    joinaliasvars::Ptr{List}
    functions::Ptr{List}
    funcordinality::Cint
    tablefunc::Ptr{TableFunc}
    values_lists::Ptr{List}
    ctename::Cstring
    ctelevelsup::Cint
    self_reference::Cint
    coltypes::Ptr{List}
    coltypmods::Ptr{List}
    colcollations::Ptr{List}
    enrname::Cstring
    enrtuples::Cdouble
    alias::Ptr{Alias}
    eref::Ptr{Alias}
    lateral::Cint
    inh::Cint
    inFromCl::Cint
    requiredPerms::AclMode
    checkAsUser::Cint
    selectedCols::Ptr{Bitmapset}
    insertedCols::Ptr{Bitmapset}
    updatedCols::Ptr{Bitmapset}
    securityQuals::Ptr{List}
end

struct RangeTblFunction
    type::NodeTag
    funcexpr::Ptr{Node}
    funccolcount::Cint
    funccolnames::Ptr{List}
    funccoltypes::Ptr{List}
    funccoltypmods::Ptr{List}
    funccolcollations::Ptr{List}
    funcparams::Ptr{Bitmapset}
end

@cenum WCOKind::UInt32 begin
    WCO_VIEW_CHECK = 0
    WCO_RLS_INSERT_CHECK = 1
    WCO_RLS_UPDATE_CHECK = 2
    WCO_RLS_CONFLICT_CHECK = 3
end


struct WithCheckOption
    type::NodeTag
    kind::WCOKind
    relname::Cstring
    polname::Cstring
    qual::Ptr{Node}
    cascaded::Cint
end

struct SortGroupClause
    type::NodeTag
    tleSortGroupRef::Cint
    eqop::Cint
    sortop::Cint
    nulls_first::Cint
    hashable::Cint
end

@cenum GroupingSetKind::UInt32 begin
    GROUPING_SET_EMPTY = 0
    GROUPING_SET_SIMPLE = 1
    GROUPING_SET_ROLLUP = 2
    GROUPING_SET_CUBE = 3
    GROUPING_SET_SETS = 4
end


struct GroupingSet
    type::NodeTag
    kind::GroupingSetKind
    content::Ptr{List}
    location::Cint
end

struct WindowClause
    type::NodeTag
    name::Cstring
    refname::Cstring
    partitionClause::Ptr{List}
    orderClause::Ptr{List}
    frameOptions::Cint
    startOffset::Ptr{Node}
    endOffset::Ptr{Node}
    winref::Cint
    copiedOrder::Cint
end

struct RowMarkClause
    type::NodeTag
    rti::Cint
    strength::LockClauseStrength
    waitPolicy::LockWaitPolicy
    pushedDown::Cint
end

struct WithClause
    type::NodeTag
    ctes::Ptr{List}
    recursive::Cint
    location::Cint
end

struct InferClause
    type::NodeTag
    indexElems::Ptr{List}
    whereClause::Ptr{Node}
    conname::Cstring
    location::Cint
end

struct OnConflictClause
    type::NodeTag
    action::OnConflictAction
    infer::Ptr{InferClause}
    targetList::Ptr{List}
    whereClause::Ptr{Node}
    location::Cint
end

struct CommonTableExpr
    type::NodeTag
    ctename::Cstring
    aliascolnames::Ptr{List}
    ctequery::Ptr{Node}
    location::Cint
    cterecursive::Cint
    cterefcount::Cint
    ctecolnames::Ptr{List}
    ctecoltypes::Ptr{List}
    ctecoltypmods::Ptr{List}
    ctecolcollations::Ptr{List}
end

struct TriggerTransition
    type::NodeTag
    name::Cstring
    isNew::Cint
    isTable::Cint
end

struct RawStmt
    type::NodeTag
    stmt::Ptr{Node}
    stmt_location::Cint
    stmt_len::Cint
end

struct InsertStmt
    type::NodeTag
    relation::Ptr{RangeVar}
    cols::Ptr{List}
    selectStmt::Ptr{Node}
    onConflictClause::Ptr{OnConflictClause}
    returningList::Ptr{List}
    withClause::Ptr{WithClause}
    override::OverridingKind
end

struct DeleteStmt
    type::NodeTag
    relation::Ptr{RangeVar}
    usingClause::Ptr{List}
    whereClause::Ptr{Node}
    returningList::Ptr{List}
    withClause::Ptr{WithClause}
end

struct UpdateStmt
    type::NodeTag
    relation::Ptr{RangeVar}
    targetList::Ptr{List}
    whereClause::Ptr{Node}
    fromClause::Ptr{List}
    returningList::Ptr{List}
    withClause::Ptr{WithClause}
end

@cenum SetOperation::UInt32 begin
    SETOP_NONE = 0
    SETOP_UNION = 1
    SETOP_INTERSECT = 2
    SETOP_EXCEPT = 3
end

@cenum OnCommitAction::UInt32 begin
    ONCOMMIT_NOOP = 0
    ONCOMMIT_PRESERVE_ROWS = 1
    ONCOMMIT_DELETE_ROWS = 2
    ONCOMMIT_DROP = 3
end


struct IntoClause
    type::NodeTag
    rel::Ptr{RangeVar}
    colNames::Ptr{List}
    options::Ptr{List}
    onCommit::OnCommitAction
    tableSpaceName::Cstring
    viewQuery::Ptr{Node}
    skipData::Cint
end

struct SelectStmt
    type::NodeTag
    distinctClause::Ptr{List}
    intoClause::Ptr{IntoClause}
    targetList::Ptr{List}
    fromClause::Ptr{List}
    whereClause::Ptr{Node}
    groupClause::Ptr{List}
    havingClause::Ptr{Node}
    windowClause::Ptr{List}
    valuesLists::Ptr{List}
    sortClause::Ptr{List}
    limitOffset::Ptr{Node}
    limitCount::Ptr{Node}
    lockingClause::Ptr{List}
    withClause::Ptr{WithClause}
    op::SetOperation
    all::Cint
    larg::Ptr{SelectStmt}
    rarg::Ptr{SelectStmt}
end

struct SetOperationStmt
    type::NodeTag
    op::SetOperation
    all::Cint
    larg::Ptr{Node}
    rarg::Ptr{Node}
    colTypes::Ptr{List}
    colTypmods::Ptr{List}
    colCollations::Ptr{List}
    groupClauses::Ptr{List}
end

@cenum ObjectType::UInt32 begin
    OBJECT_ACCESS_METHOD = 0
    OBJECT_AGGREGATE = 1
    OBJECT_AMOP = 2
    OBJECT_AMPROC = 3
    OBJECT_ATTRIBUTE = 4
    OBJECT_CAST = 5
    OBJECT_COLUMN = 6
    OBJECT_COLLATION = 7
    OBJECT_CONVERSION = 8
    OBJECT_DATABASE = 9
    OBJECT_DEFAULT = 10
    OBJECT_DEFACL = 11
    OBJECT_DOMAIN = 12
    OBJECT_DOMCONSTRAINT = 13
    OBJECT_EVENT_TRIGGER = 14
    OBJECT_EXTENSION = 15
    OBJECT_FDW = 16
    OBJECT_FOREIGN_SERVER = 17
    OBJECT_FOREIGN_TABLE = 18
    OBJECT_FUNCTION = 19
    OBJECT_INDEX = 20
    OBJECT_LANGUAGE = 21
    OBJECT_LARGEOBJECT = 22
    OBJECT_MATVIEW = 23
    OBJECT_OPCLASS = 24
    OBJECT_OPERATOR = 25
    OBJECT_OPFAMILY = 26
    OBJECT_POLICY = 27
    OBJECT_PUBLICATION = 28
    OBJECT_PUBLICATION_REL = 29
    OBJECT_ROLE = 30
    OBJECT_RULE = 31
    OBJECT_SCHEMA = 32
    OBJECT_SEQUENCE = 33
    OBJECT_SUBSCRIPTION = 34
    OBJECT_STATISTIC_EXT = 35
    OBJECT_TABCONSTRAINT = 36
    OBJECT_TABLE = 37
    OBJECT_TABLESPACE = 38
    OBJECT_TRANSFORM = 39
    OBJECT_TRIGGER = 40
    OBJECT_TSCONFIGURATION = 41
    OBJECT_TSDICTIONARY = 42
    OBJECT_TSPARSER = 43
    OBJECT_TSTEMPLATE = 44
    OBJECT_TYPE = 45
    OBJECT_USER_MAPPING = 46
    OBJECT_VIEW = 47
end


struct CreateSchemaStmt
    type::NodeTag
    schemaname::Cstring
    authrole::Ptr{RoleSpec}
    schemaElts::Ptr{List}
    if_not_exists::Cint
end

@cenum DropBehavior::UInt32 begin
    DROP_RESTRICT = 0
    DROP_CASCADE = 1
end


struct AlterTableStmt
    type::NodeTag
    relation::Ptr{RangeVar}
    cmds::Ptr{List}
    relkind::ObjectType
    missing_ok::Cint
end

@cenum AlterTableType::UInt32 begin
    AT_AddColumn = 0
    AT_AddColumnRecurse = 1
    AT_AddColumnToView = 2
    AT_ColumnDefault = 3
    AT_DropNotNull = 4
    AT_SetNotNull = 5
    AT_SetStatistics = 6
    AT_SetOptions = 7
    AT_ResetOptions = 8
    AT_SetStorage = 9
    AT_DropColumn = 10
    AT_DropColumnRecurse = 11
    AT_AddIndex = 12
    AT_ReAddIndex = 13
    AT_AddConstraint = 14
    AT_AddConstraintRecurse = 15
    AT_ReAddConstraint = 16
    AT_AlterConstraint = 17
    AT_ValidateConstraint = 18
    AT_ValidateConstraintRecurse = 19
    AT_ProcessedConstraint = 20
    AT_AddIndexConstraint = 21
    AT_DropConstraint = 22
    AT_DropConstraintRecurse = 23
    AT_ReAddComment = 24
    AT_AlterColumnType = 25
    AT_AlterColumnGenericOptions = 26
    AT_ChangeOwner = 27
    AT_ClusterOn = 28
    AT_DropCluster = 29
    AT_SetLogged = 30
    AT_SetUnLogged = 31
    AT_AddOids = 32
    AT_AddOidsRecurse = 33
    AT_DropOids = 34
    AT_SetTableSpace = 35
    AT_SetRelOptions = 36
    AT_ResetRelOptions = 37
    AT_ReplaceRelOptions = 38
    AT_EnableTrig = 39
    AT_EnableAlwaysTrig = 40
    AT_EnableReplicaTrig = 41
    AT_DisableTrig = 42
    AT_EnableTrigAll = 43
    AT_DisableTrigAll = 44
    AT_EnableTrigUser = 45
    AT_DisableTrigUser = 46
    AT_EnableRule = 47
    AT_EnableAlwaysRule = 48
    AT_EnableReplicaRule = 49
    AT_DisableRule = 50
    AT_AddInherit = 51
    AT_DropInherit = 52
    AT_AddOf = 53
    AT_DropOf = 54
    AT_ReplicaIdentity = 55
    AT_EnableRowSecurity = 56
    AT_DisableRowSecurity = 57
    AT_ForceRowSecurity = 58
    AT_NoForceRowSecurity = 59
    AT_GenericOptions = 60
    AT_AttachPartition = 61
    AT_DetachPartition = 62
    AT_AddIdentity = 63
    AT_SetIdentity = 64
    AT_DropIdentity = 65
end


struct ReplicaIdentityStmt
    type::NodeTag
    identity_type::UInt8
    name::Cstring
end

struct AlterTableCmd
    type::NodeTag
    subtype::AlterTableType
    name::Cstring
    newowner::Ptr{RoleSpec}
    def::Ptr{Node}
    behavior::DropBehavior
    missing_ok::Cint
end

struct AlterCollationStmt
    type::NodeTag
    collname::Ptr{List}
end

struct AlterDomainStmt
    type::NodeTag
    subtype::UInt8
    typeName::Ptr{List}
    name::Cstring
    def::Ptr{Node}
    behavior::DropBehavior
    missing_ok::Cint
end

@cenum GrantTargetType::UInt32 begin
    ACL_TARGET_OBJECT = 0
    ACL_TARGET_ALL_IN_SCHEMA = 1
    ACL_TARGET_DEFAULTS = 2
end

@cenum GrantObjectType::UInt32 begin
    ACL_OBJECT_COLUMN = 0
    ACL_OBJECT_RELATION = 1
    ACL_OBJECT_SEQUENCE = 2
    ACL_OBJECT_DATABASE = 3
    ACL_OBJECT_DOMAIN = 4
    ACL_OBJECT_FDW = 5
    ACL_OBJECT_FOREIGN_SERVER = 6
    ACL_OBJECT_FUNCTION = 7
    ACL_OBJECT_LANGUAGE = 8
    ACL_OBJECT_LARGEOBJECT = 9
    ACL_OBJECT_NAMESPACE = 10
    ACL_OBJECT_TABLESPACE = 11
    ACL_OBJECT_TYPE = 12
end


struct GrantStmt
    type::NodeTag
    is_grant::Cint
    targtype::GrantTargetType
    objtype::GrantObjectType
    objects::Ptr{List}
    privileges::Ptr{List}
    grantees::Ptr{List}
    grant_option::Cint
    behavior::DropBehavior
end

struct ObjectWithArgs
    type::NodeTag
    objname::Ptr{List}
    objargs::Ptr{List}
    args_unspecified::Cint
end

struct AccessPriv
    type::NodeTag
    priv_name::Cstring
    cols::Ptr{List}
end

struct GrantRoleStmt
    type::NodeTag
    granted_roles::Ptr{List}
    grantee_roles::Ptr{List}
    is_grant::Cint
    admin_opt::Cint
    grantor::Ptr{RoleSpec}
    behavior::DropBehavior
end

struct AlterDefaultPrivilegesStmt
    type::NodeTag
    options::Ptr{List}
    action::Ptr{GrantStmt}
end

struct CopyStmt
    type::NodeTag
    relation::Ptr{RangeVar}
    query::Ptr{Node}
    attlist::Ptr{List}
    is_from::Cint
    is_program::Cint
    filename::Cstring
    options::Ptr{List}
end

@cenum VariableSetKind::UInt32 begin
    VAR_SET_VALUE = 0
    VAR_SET_DEFAULT = 1
    VAR_SET_CURRENT = 2
    VAR_SET_MULTI = 3
    VAR_RESET = 4
    VAR_RESET_ALL = 5
end


struct VariableSetStmt
    type::NodeTag
    kind::VariableSetKind
    name::Cstring
    args::Ptr{List}
    is_local::Cint
end

struct VariableShowStmt
    type::NodeTag
    name::Cstring
end

struct CreateStmt
    type::NodeTag
    relation::Ptr{RangeVar}
    tableElts::Ptr{List}
    inhRelations::Ptr{List}
    partbound::Ptr{PartitionBoundSpec}
    partspec::Ptr{PartitionSpec}
    ofTypename::Ptr{TypeName}
    constraints::Ptr{List}
    options::Ptr{List}
    oncommit::OnCommitAction
    tablespacename::Cstring
    if_not_exists::Cint
end

@cenum ConstrType::UInt32 begin
    CONSTR_NULL = 0
    CONSTR_NOTNULL = 1
    CONSTR_DEFAULT = 2
    CONSTR_IDENTITY = 3
    CONSTR_CHECK = 4
    CONSTR_PRIMARY = 5
    CONSTR_UNIQUE = 6
    CONSTR_EXCLUSION = 7
    CONSTR_FOREIGN = 8
    CONSTR_ATTR_DEFERRABLE = 9
    CONSTR_ATTR_NOT_DEFERRABLE = 10
    CONSTR_ATTR_DEFERRED = 11
    CONSTR_ATTR_IMMEDIATE = 12
end


struct Constraint
    type::NodeTag
    contype::ConstrType
    conname::Cstring
    deferrable::Cint
    initdeferred::Cint
    location::Cint
    is_no_inherit::Cint
    raw_expr::Ptr{Node}
    cooked_expr::Cstring
    generated_when::UInt8
    keys::Ptr{List}
    exclusions::Ptr{List}
    options::Ptr{List}
    indexname::Cstring
    indexspace::Cstring
    access_method::Cstring
    where_clause::Ptr{Node}
    pktable::Ptr{RangeVar}
    fk_attrs::Ptr{List}
    pk_attrs::Ptr{List}
    fk_matchtype::UInt8
    fk_upd_action::UInt8
    fk_del_action::UInt8
    old_conpfeqop::Ptr{List}
    old_pktable_oid::Cint
    skip_validation::Cint
    initially_valid::Cint
end

struct CreateTableSpaceStmt
    type::NodeTag
    tablespacename::Cstring
    owner::Ptr{RoleSpec}
    location::Cstring
    options::Ptr{List}
end

struct DropTableSpaceStmt
    type::NodeTag
    tablespacename::Cstring
    missing_ok::Cint
end

struct AlterTableSpaceOptionsStmt
    type::NodeTag
    tablespacename::Cstring
    options::Ptr{List}
    isReset::Cint
end

struct AlterTableMoveAllStmt
    type::NodeTag
    orig_tablespacename::Cstring
    objtype::ObjectType
    roles::Ptr{List}
    new_tablespacename::Cstring
    nowait::Cint
end

struct CreateExtensionStmt
    type::NodeTag
    extname::Cstring
    if_not_exists::Cint
    options::Ptr{List}
end

struct AlterExtensionStmt
    type::NodeTag
    extname::Cstring
    options::Ptr{List}
end

struct AlterExtensionContentsStmt
    type::NodeTag
    extname::Cstring
    action::Cint
    objtype::ObjectType
    object::Ptr{Node}
end

struct CreateFdwStmt
    type::NodeTag
    fdwname::Cstring
    func_options::Ptr{List}
    options::Ptr{List}
end

struct AlterFdwStmt
    type::NodeTag
    fdwname::Cstring
    func_options::Ptr{List}
    options::Ptr{List}
end

struct CreateForeignServerStmt
    type::NodeTag
    servername::Cstring
    servertype::Cstring
    version::Cstring
    fdwname::Cstring
    if_not_exists::Cint
    options::Ptr{List}
end

struct AlterForeignServerStmt
    type::NodeTag
    servername::Cstring
    version::Cstring
    options::Ptr{List}
    has_version::Cint
end

struct CreateForeignTableStmt
    base::CreateStmt
    servername::Cstring
    options::Ptr{List}
end

struct CreateUserMappingStmt
    type::NodeTag
    user::Ptr{RoleSpec}
    servername::Cstring
    if_not_exists::Cint
    options::Ptr{List}
end

struct AlterUserMappingStmt
    type::NodeTag
    user::Ptr{RoleSpec}
    servername::Cstring
    options::Ptr{List}
end

struct DropUserMappingStmt
    type::NodeTag
    user::Ptr{RoleSpec}
    servername::Cstring
    missing_ok::Cint
end

@cenum ImportForeignSchemaType::UInt32 begin
    FDW_IMPORT_SCHEMA_ALL = 0
    FDW_IMPORT_SCHEMA_LIMIT_TO = 1
    FDW_IMPORT_SCHEMA_EXCEPT = 2
end


struct ImportForeignSchemaStmt
    type::NodeTag
    server_name::Cstring
    remote_schema::Cstring
    local_schema::Cstring
    list_type::ImportForeignSchemaType
    table_list::Ptr{List}
    options::Ptr{List}
end

struct CreatePolicyStmt
    type::NodeTag
    policy_name::Cstring
    table::Ptr{RangeVar}
    cmd_name::Cstring
    permissive::Cint
    roles::Ptr{List}
    qual::Ptr{Node}
    with_check::Ptr{Node}
end

struct AlterPolicyStmt
    type::NodeTag
    policy_name::Cstring
    table::Ptr{RangeVar}
    roles::Ptr{List}
    qual::Ptr{Node}
    with_check::Ptr{Node}
end

struct CreateAmStmt
    type::NodeTag
    amname::Cstring
    handler_name::Ptr{List}
    amtype::UInt8
end

struct CreateTrigStmt
    type::NodeTag
    trigname::Cstring
    relation::Ptr{RangeVar}
    funcname::Ptr{List}
    args::Ptr{List}
    row::Cint
    timing::Cint
    events::Cint
    columns::Ptr{List}
    whenClause::Ptr{Node}
    isconstraint::Cint
    transitionRels::Ptr{List}
    deferrable::Cint
    initdeferred::Cint
    constrrel::Ptr{RangeVar}
end

struct CreateEventTrigStmt
    type::NodeTag
    trigname::Cstring
    eventname::Cstring
    whenclause::Ptr{List}
    funcname::Ptr{List}
end

struct AlterEventTrigStmt
    type::NodeTag
    trigname::Cstring
    tgenabled::UInt8
end

struct CreatePLangStmt
    type::NodeTag
    replace::Cint
    plname::Cstring
    plhandler::Ptr{List}
    plinline::Ptr{List}
    plvalidator::Ptr{List}
    pltrusted::Cint
end

@cenum RoleStmtType::UInt32 begin
    ROLESTMT_ROLE = 0
    ROLESTMT_USER = 1
    ROLESTMT_GROUP = 2
end


struct CreateRoleStmt
    type::NodeTag
    stmt_type::RoleStmtType
    role::Cstring
    options::Ptr{List}
end

struct AlterRoleStmt
    type::NodeTag
    role::Ptr{RoleSpec}
    options::Ptr{List}
    action::Cint
end

struct AlterRoleSetStmt
    type::NodeTag
    role::Ptr{RoleSpec}
    database::Cstring
    setstmt::Ptr{VariableSetStmt}
end

struct DropRoleStmt
    type::NodeTag
    roles::Ptr{List}
    missing_ok::Cint
end

struct CreateSeqStmt
    type::NodeTag
    sequence::Ptr{RangeVar}
    options::Ptr{List}
    ownerId::Cint
    for_identity::Cint
    if_not_exists::Cint
end

struct AlterSeqStmt
    type::NodeTag
    sequence::Ptr{RangeVar}
    options::Ptr{List}
    for_identity::Cint
    missing_ok::Cint
end

struct DefineStmt
    type::NodeTag
    kind::ObjectType
    oldstyle::Cint
    defnames::Ptr{List}
    args::Ptr{List}
    definition::Ptr{List}
    if_not_exists::Cint
end

struct CreateDomainStmt
    type::NodeTag
    domainname::Ptr{List}
    typeName::Ptr{TypeName}
    collClause::Ptr{CollateClause}
    constraints::Ptr{List}
end

struct CreateOpClassStmt
    type::NodeTag
    opclassname::Ptr{List}
    opfamilyname::Ptr{List}
    amname::Cstring
    datatype::Ptr{TypeName}
    items::Ptr{List}
    isDefault::Cint
end

struct CreateOpClassItem
    type::NodeTag
    itemtype::Cint
    name::Ptr{ObjectWithArgs}
    number::Cint
    order_family::Ptr{List}
    class_args::Ptr{List}
    storedtype::Ptr{TypeName}
end

struct CreateOpFamilyStmt
    type::NodeTag
    opfamilyname::Ptr{List}
    amname::Cstring
end

struct AlterOpFamilyStmt
    type::NodeTag
    opfamilyname::Ptr{List}
    amname::Cstring
    isDrop::Cint
    items::Ptr{List}
end

struct DropStmt
    type::NodeTag
    objects::Ptr{List}
    removeType::ObjectType
    behavior::DropBehavior
    missing_ok::Cint
    concurrent::Cint
end

struct TruncateStmt
    type::NodeTag
    relations::Ptr{List}
    restart_seqs::Cint
    behavior::DropBehavior
end

struct CommentStmt
    type::NodeTag
    objtype::ObjectType
    object::Ptr{Node}
    comment::Cstring
end

struct SecLabelStmt
    type::NodeTag
    objtype::ObjectType
    object::Ptr{Node}
    provider::Cstring
    label::Cstring
end

struct DeclareCursorStmt
    type::NodeTag
    portalname::Cstring
    options::Cint
    query::Ptr{Node}
end

struct ClosePortalStmt
    type::NodeTag
    portalname::Cstring
end

@cenum FetchDirection::UInt32 begin
    FETCH_FORWARD = 0
    FETCH_BACKWARD = 1
    FETCH_ABSOLUTE = 2
    FETCH_RELATIVE = 3
end


struct FetchStmt
    type::NodeTag
    direction::FetchDirection
    howMany::Clong
    portalname::Cstring
    ismove::Cint
end

struct IndexStmt
    type::NodeTag
    idxname::Cstring
    relation::Ptr{RangeVar}
    accessMethod::Cstring
    tableSpace::Cstring
    indexParams::Ptr{List}
    options::Ptr{List}
    whereClause::Ptr{Node}
    excludeOpNames::Ptr{List}
    idxcomment::Cstring
    indexOid::Cint
    oldNode::Cint
    unique::Cint
    primary::Cint
    isconstraint::Cint
    deferrable::Cint
    initdeferred::Cint
    transformed::Cint
    concurrent::Cint
    if_not_exists::Cint
end

struct CreateStatsStmt
    type::NodeTag
    defnames::Ptr{List}
    stat_types::Ptr{List}
    exprs::Ptr{List}
    relations::Ptr{List}
    if_not_exists::Cint
end

struct CreateFunctionStmt
    type::NodeTag
    replace::Cint
    funcname::Ptr{List}
    parameters::Ptr{List}
    returnType::Ptr{TypeName}
    options::Ptr{List}
    withClause::Ptr{List}
end

@cenum FunctionParameterMode::UInt32 begin
    FUNC_PARAM_IN = 105
    FUNC_PARAM_OUT = 111
    FUNC_PARAM_INOUT = 98
    FUNC_PARAM_VARIADIC = 118
    FUNC_PARAM_TABLE = 116
end


struct FunctionParameter
    type::NodeTag
    name::Cstring
    argType::Ptr{TypeName}
    mode::FunctionParameterMode
    defexpr::Ptr{Node}
end

struct AlterFunctionStmt
    type::NodeTag
    func::Ptr{ObjectWithArgs}
    actions::Ptr{List}
end

struct DoStmt
    type::NodeTag
    args::Ptr{List}
end

struct InlineCodeBlock
    type::NodeTag
    source_text::Cstring
    langOid::Cint
    langIsTrusted::Cint
end

struct RenameStmt
    type::NodeTag
    renameType::ObjectType
    relationType::ObjectType
    relation::Ptr{RangeVar}
    object::Ptr{Node}
    subname::Cstring
    newname::Cstring
    behavior::DropBehavior
    missing_ok::Cint
end

struct AlterObjectDependsStmt
    type::NodeTag
    objectType::ObjectType
    relation::Ptr{RangeVar}
    object::Ptr{Node}
    extname::Ptr{Value}
end

struct AlterObjectSchemaStmt
    type::NodeTag
    objectType::ObjectType
    relation::Ptr{RangeVar}
    object::Ptr{Node}
    newschema::Cstring
    missing_ok::Cint
end

struct AlterOwnerStmt
    type::NodeTag
    objectType::ObjectType
    relation::Ptr{RangeVar}
    object::Ptr{Node}
    newowner::Ptr{RoleSpec}
end

struct AlterOperatorStmt
    type::NodeTag
    opername::Ptr{ObjectWithArgs}
    options::Ptr{List}
end

struct RuleStmt
    type::NodeTag
    relation::Ptr{RangeVar}
    rulename::Cstring
    whereClause::Ptr{Node}
    event::CmdType
    instead::Cint
    actions::Ptr{List}
    replace::Cint
end

struct NotifyStmt
    type::NodeTag
    conditionname::Cstring
    payload::Cstring
end

struct ListenStmt
    type::NodeTag
    conditionname::Cstring
end

struct UnlistenStmt
    type::NodeTag
    conditionname::Cstring
end

@cenum TransactionStmtKind::UInt32 begin
    TRANS_STMT_BEGIN = 0
    TRANS_STMT_START = 1
    TRANS_STMT_COMMIT = 2
    TRANS_STMT_ROLLBACK = 3
    TRANS_STMT_SAVEPOINT = 4
    TRANS_STMT_RELEASE = 5
    TRANS_STMT_ROLLBACK_TO = 6
    TRANS_STMT_PREPARE = 7
    TRANS_STMT_COMMIT_PREPARED = 8
    TRANS_STMT_ROLLBACK_PREPARED = 9
end


struct TransactionStmt
    type::NodeTag
    kind::TransactionStmtKind
    options::Ptr{List}
    gid::Cstring
end

struct CompositeTypeStmt
    type::NodeTag
    typevar::Ptr{RangeVar}
    coldeflist::Ptr{List}
end

struct CreateEnumStmt
    type::NodeTag
    typeName::Ptr{List}
    vals::Ptr{List}
end

struct CreateRangeStmt
    type::NodeTag
    typeName::Ptr{List}
    params::Ptr{List}
end

struct AlterEnumStmt
    type::NodeTag
    typeName::Ptr{List}
    oldVal::Cstring
    newVal::Cstring
    newValNeighbor::Cstring
    newValIsAfter::Cint
    skipIfNewValExists::Cint
end

@cenum ViewCheckOption::UInt32 begin
    NO_CHECK_OPTION = 0
    LOCAL_CHECK_OPTION = 1
    CASCADED_CHECK_OPTION = 2
end


struct ViewStmt
    type::NodeTag
    view::Ptr{RangeVar}
    aliases::Ptr{List}
    query::Ptr{Node}
    replace::Cint
    options::Ptr{List}
    withCheckOption::ViewCheckOption
end

struct LoadStmt
    type::NodeTag
    filename::Cstring
end

struct CreatedbStmt
    type::NodeTag
    dbname::Cstring
    options::Ptr{List}
end

struct AlterDatabaseStmt
    type::NodeTag
    dbname::Cstring
    options::Ptr{List}
end

struct AlterDatabaseSetStmt
    type::NodeTag
    dbname::Cstring
    setstmt::Ptr{VariableSetStmt}
end

struct DropdbStmt
    type::NodeTag
    dbname::Cstring
    missing_ok::Cint
end

struct AlterSystemStmt
    type::NodeTag
    setstmt::Ptr{VariableSetStmt}
end

struct ClusterStmt
    type::NodeTag
    relation::Ptr{RangeVar}
    indexname::Cstring
    verbose::Cint
end

@cenum VacuumOption::UInt32 begin
    VACOPT_VACUUM = 1
    VACOPT_ANALYZE = 2
    VACOPT_VERBOSE = 4
    VACOPT_FREEZE = 8
    VACOPT_FULL = 16
    VACOPT_NOWAIT = 32
    VACOPT_SKIPTOAST = 64
    VACOPT_DISABLE_PAGE_SKIPPING = 128
end


struct VacuumStmt
    type::NodeTag
    options::Cint
    relation::Ptr{RangeVar}
    va_cols::Ptr{List}
end

struct ExplainStmt
    type::NodeTag
    query::Ptr{Node}
    options::Ptr{List}
end

struct CreateTableAsStmt
    type::NodeTag
    query::Ptr{Node}
    into::Ptr{IntoClause}
    relkind::ObjectType
    is_select_into::Cint
    if_not_exists::Cint
end

struct RefreshMatViewStmt
    type::NodeTag
    concurrent::Cint
    skipData::Cint
    relation::Ptr{RangeVar}
end

struct CheckPointStmt
    type::NodeTag
end

@cenum DiscardMode::UInt32 begin
    DISCARD_ALL = 0
    DISCARD_PLANS = 1
    DISCARD_SEQUENCES = 2
    DISCARD_TEMP = 3
end


struct DiscardStmt
    type::NodeTag
    target::DiscardMode
end

struct LockStmt
    type::NodeTag
    relations::Ptr{List}
    mode::Cint
    nowait::Cint
end

struct ConstraintsSetStmt
    type::NodeTag
    constraints::Ptr{List}
    deferred::Cint
end

@cenum ReindexObjectType::UInt32 begin
    REINDEX_OBJECT_INDEX = 0
    REINDEX_OBJECT_TABLE = 1
    REINDEX_OBJECT_SCHEMA = 2
    REINDEX_OBJECT_SYSTEM = 3
    REINDEX_OBJECT_DATABASE = 4
end


struct ReindexStmt
    type::NodeTag
    kind::ReindexObjectType
    relation::Ptr{RangeVar}
    name::Cstring
    options::Cint
end

struct CreateConversionStmt
    type::NodeTag
    conversion_name::Ptr{List}
    for_encoding_name::Cstring
    to_encoding_name::Cstring
    func_name::Ptr{List}
    def::Cint
end

@cenum CoercionContext::UInt32 begin
    COERCION_IMPLICIT = 0
    COERCION_ASSIGNMENT = 1
    COERCION_EXPLICIT = 2
end


struct CreateCastStmt
    type::NodeTag
    sourcetype::Ptr{TypeName}
    targettype::Ptr{TypeName}
    func::Ptr{ObjectWithArgs}
    context::CoercionContext
    inout::Cint
end

struct CreateTransformStmt
    type::NodeTag
    replace::Cint
    type_name::Ptr{TypeName}
    lang::Cstring
    fromsql::Ptr{ObjectWithArgs}
    tosql::Ptr{ObjectWithArgs}
end

struct PrepareStmt
    type::NodeTag
    name::Cstring
    argtypes::Ptr{List}
    query::Ptr{Node}
end

struct ExecuteStmt
    type::NodeTag
    name::Cstring
    params::Ptr{List}
end

struct DeallocateStmt
    type::NodeTag
    name::Cstring
end

struct DropOwnedStmt
    type::NodeTag
    roles::Ptr{List}
    behavior::DropBehavior
end

struct ReassignOwnedStmt
    type::NodeTag
    roles::Ptr{List}
    newrole::Ptr{RoleSpec}
end

struct AlterTSDictionaryStmt
    type::NodeTag
    dictname::Ptr{List}
    options::Ptr{List}
end

@cenum AlterTSConfigType::UInt32 begin
    ALTER_TSCONFIG_ADD_MAPPING = 0
    ALTER_TSCONFIG_ALTER_MAPPING_FOR_TOKEN = 1
    ALTER_TSCONFIG_REPLACE_DICT = 2
    ALTER_TSCONFIG_REPLACE_DICT_FOR_TOKEN = 3
    ALTER_TSCONFIG_DROP_MAPPING = 4
end


struct AlterTSConfigurationStmt
    type::NodeTag
    kind::AlterTSConfigType
    cfgname::Ptr{List}
    tokentype::Ptr{List}
    dicts::Ptr{List}
    override::Cint
    replace::Cint
    missing_ok::Cint
end

struct CreatePublicationStmt
    type::NodeTag
    pubname::Cstring
    options::Ptr{List}
    tables::Ptr{List}
    for_all_tables::Cint
end

struct AlterPublicationStmt
    type::NodeTag
    pubname::Cstring
    options::Ptr{List}
    tables::Ptr{List}
    for_all_tables::Cint
    tableAction::DefElemAction
end

struct CreateSubscriptionStmt
    type::NodeTag
    subname::Cstring
    conninfo::Cstring
    publication::Ptr{List}
    options::Ptr{List}
end

@cenum AlterSubscriptionType::UInt32 begin
    ALTER_SUBSCRIPTION_OPTIONS = 0
    ALTER_SUBSCRIPTION_CONNECTION = 1
    ALTER_SUBSCRIPTION_PUBLICATION = 2
    ALTER_SUBSCRIPTION_REFRESH = 3
    ALTER_SUBSCRIPTION_ENABLED = 4
end


struct AlterSubscriptionStmt
    type::NodeTag
    kind::AlterSubscriptionType
    subname::Cstring
    conninfo::Cstring
    publication::Ptr{List}
    options::Ptr{List}
end

struct DropSubscriptionStmt
    type::NodeTag
    subname::Cstring
    missing_ok::Cint
    behavior::DropBehavior
end

# Skipping MacroDefinition: NIL ( ( List * ) NULL )
# Skipping MacroDefinition: lnext ( lc ) ( ( lc ) -> next )
# Skipping MacroDefinition: lfirst ( lc ) ( ( lc ) -> data . ptr_value )
# Skipping MacroDefinition: lfirst_int ( lc ) ( ( lc ) -> data . int_value )
# Skipping MacroDefinition: lfirst_oid ( lc ) ( ( lc ) -> data . oid_value )
# Skipping MacroDefinition: lfirst_node ( type , lc ) castNode ( type , lfirst ( lc ) )
# Skipping MacroDefinition: linitial ( l ) lfirst ( list_head ( l ) )
# Skipping MacroDefinition: linitial_int ( l ) lfirst_int ( list_head ( l ) )
# Skipping MacroDefinition: linitial_oid ( l ) lfirst_oid ( list_head ( l ) )
# Skipping MacroDefinition: linitial_node ( type , l ) castNode ( type , linitial ( l ) )
# Skipping MacroDefinition: lsecond ( l ) lfirst ( lnext ( list_head ( l ) ) )
# Skipping MacroDefinition: lsecond_int ( l ) lfirst_int ( lnext ( list_head ( l ) ) )
# Skipping MacroDefinition: lsecond_oid ( l ) lfirst_oid ( lnext ( list_head ( l ) ) )
# Skipping MacroDefinition: lsecond_node ( type , l ) castNode ( type , lsecond ( l ) )
# Skipping MacroDefinition: lthird ( l ) lfirst ( lnext ( lnext ( list_head ( l ) ) ) )
# Skipping MacroDefinition: lthird_int ( l ) lfirst_int ( lnext ( lnext ( list_head ( l ) ) ) )
# Skipping MacroDefinition: lthird_oid ( l ) lfirst_oid ( lnext ( lnext ( list_head ( l ) ) ) )
# Skipping MacroDefinition: lthird_node ( type , l ) castNode ( type , lthird ( l ) )
# Skipping MacroDefinition: lfourth ( l ) lfirst ( lnext ( lnext ( lnext ( list_head ( l ) ) ) ) )
# Skipping MacroDefinition: lfourth_int ( l ) lfirst_int ( lnext ( lnext ( lnext ( list_head ( l ) ) ) ) )
# Skipping MacroDefinition: lfourth_oid ( l ) lfirst_oid ( lnext ( lnext ( lnext ( list_head ( l ) ) ) ) )
# Skipping MacroDefinition: lfourth_node ( type , l ) castNode ( type , lfourth ( l ) )
# Skipping MacroDefinition: llast ( l ) lfirst ( list_tail ( l ) )
# Skipping MacroDefinition: llast_int ( l ) lfirst_int ( list_tail ( l ) )
# Skipping MacroDefinition: llast_oid ( l ) lfirst_oid ( list_tail ( l ) )
# Skipping MacroDefinition: llast_node ( type , l ) castNode ( type , llast ( l ) )
# Skipping MacroDefinition: list_make1 ( x1 ) lcons ( x1 , NIL )
# Skipping MacroDefinition: list_make2 ( x1 , x2 ) lcons ( x1 , list_make1 ( x2 ) )
# Skipping MacroDefinition: list_make3 ( x1 , x2 , x3 ) lcons ( x1 , list_make2 ( x2 , x3 ) )
# Skipping MacroDefinition: list_make4 ( x1 , x2 , x3 , x4 ) lcons ( x1 , list_make3 ( x2 , x3 , x4 ) )
# Skipping MacroDefinition: list_make5 ( x1 , x2 , x3 , x4 , x5 ) lcons ( x1 , list_make4 ( x2 , x3 , x4 , x5 ) )
# Skipping MacroDefinition: list_make1_int ( x1 ) lcons_int ( x1 , NIL )
# Skipping MacroDefinition: list_make2_int ( x1 , x2 ) lcons_int ( x1 , list_make1_int ( x2 ) )
# Skipping MacroDefinition: list_make3_int ( x1 , x2 , x3 ) lcons_int ( x1 , list_make2_int ( x2 , x3 ) )
# Skipping MacroDefinition: list_make4_int ( x1 , x2 , x3 , x4 ) lcons_int ( x1 , list_make3_int ( x2 , x3 , x4 ) )
# Skipping MacroDefinition: list_make5_int ( x1 , x2 , x3 , x4 , x5 ) lcons_int ( x1 , list_make4_int ( x2 , x3 , x4 , x5 ) )
# Skipping MacroDefinition: list_make1_oid ( x1 ) lcons_oid ( x1 , NIL )
# Skipping MacroDefinition: list_make2_oid ( x1 , x2 ) lcons_oid ( x1 , list_make1_oid ( x2 ) )
# Skipping MacroDefinition: list_make3_oid ( x1 , x2 , x3 ) lcons_oid ( x1 , list_make2_oid ( x2 , x3 ) )
# Skipping MacroDefinition: list_make4_oid ( x1 , x2 , x3 , x4 ) lcons_oid ( x1 , list_make3_oid ( x2 , x3 , x4 ) )
# Skipping MacroDefinition: list_make5_oid ( x1 , x2 , x3 , x4 , x5 ) lcons_oid ( x1 , list_make4_oid ( x2 , x3 , x4 , x5 ) )
# Skipping MacroDefinition: foreach ( cell , l ) for ( ( cell ) = list_head ( l ) ; ( cell ) != NULL ; ( cell ) = lnext ( cell ) )
# Skipping MacroDefinition: for_each_cell ( cell , initcell ) for ( ( cell ) = ( initcell ) ; ( cell ) != NULL ; ( cell ) = lnext ( cell ) )
# Skipping MacroDefinition: forboth ( cell1 , list1 , cell2 , list2 ) for ( ( cell1 ) = list_head ( list1 ) , ( cell2 ) = list_head ( list2 ) ; ( cell1 ) != NULL && ( cell2 ) != NULL ; ( cell1 ) = lnext ( cell1 ) , ( cell2 ) = lnext ( cell2 ) )
# Skipping MacroDefinition: for_both_cell ( cell1 , initcell1 , cell2 , initcell2 ) for ( ( cell1 ) = ( initcell1 ) , ( cell2 ) = ( initcell2 ) ; ( cell1 ) != NULL && ( cell2 ) != NULL ; ( cell1 ) = lnext ( cell1 ) , ( cell2 ) = lnext ( cell2 ) )
# Skipping MacroDefinition: forthree ( cell1 , list1 , cell2 , list2 , cell3 , list3 ) for ( ( cell1 ) = list_head ( list1 ) , ( cell2 ) = list_head ( list2 ) , ( cell3 ) = list_head ( list3 ) ; ( cell1 ) != NULL && ( cell2 ) != NULL && ( cell3 ) != NULL ; ( cell1 ) = lnext ( cell1 ) , ( cell2 ) = lnext ( cell2 ) , ( cell3 ) = lnext ( cell3 ) )
# Skipping MacroDefinition: list_nth_node ( type , list , n ) castNode ( type , list_nth ( list , n ) )

struct ANONYMOUS2_data
    ptr_value::Ptr{Cvoid}
end

# Skipping MacroDefinition: exec_subplan_get_plan ( plannedstmt , subplan ) ( ( Plan * ) list_nth ( ( plannedstmt ) -> subplans , ( subplan ) -> plan_id - 1 ) )
# Skipping MacroDefinition: innerPlan ( node ) ( ( ( Plan * ) ( node ) ) -> righttree )
# Skipping MacroDefinition: outerPlan ( node ) ( ( ( Plan * ) ( node ) ) -> lefttree )
# Skipping MacroDefinition: RowMarkRequiresRowShareLock ( marktype ) ( ( marktype ) <= ROW_MARK_KEYSHARE )

struct Plan
    type::NodeTag
    startup_cost::Cost
    total_cost::Cost
    plan_rows::Cdouble
    plan_width::Cint
    parallel_aware::Cint
    parallel_safe::Cint
    plan_node_id::Cint
    targetlist::Ptr{List}
    qual::Ptr{List}
    lefttree::Ptr{Plan}
    righttree::Ptr{Plan}
    initPlan::Ptr{List}
    extParam::Ptr{Bitmapset}
    allParam::Ptr{Bitmapset}
end

struct PlannedStmt
    type::NodeTag
    commandType::CmdType
    queryId::Cint
    hasReturning::Cint
    hasModifyingCTE::Cint
    canSetTag::Cint
    transientPlan::Cint
    dependsOnRole::Cint
    parallelModeNeeded::Cint
    planTree::Ptr{Plan}
    rtable::Ptr{List}
    resultRelations::Ptr{List}
    nonleafResultRelations::Ptr{List}
    rootResultRelations::Ptr{List}
    subplans::Ptr{List}
    rewindPlanIDs::Ptr{Bitmapset}
    rowMarks::Ptr{List}
    relationOids::Ptr{List}
    invalItems::Ptr{List}
    nParamExec::Cint
    utilityStmt::Ptr{Node}
    stmt_location::Cint
    stmt_len::Cint
end

struct Result
    plan::Plan
    resconstantqual::Ptr{Node}
end

struct ProjectSet
    plan::Plan
end

struct ModifyTable
    plan::Plan
    operation::CmdType
    canSetTag::Cint
    nominalRelation::Cint
    partitioned_rels::Ptr{List}
    resultRelations::Ptr{List}
    resultRelIndex::Cint
    rootResultRelIndex::Cint
    plans::Ptr{List}
    withCheckOptionLists::Ptr{List}
    returningLists::Ptr{List}
    fdwPrivLists::Ptr{List}
    fdwDirectModifyPlans::Ptr{Bitmapset}
    rowMarks::Ptr{List}
    epqParam::Cint
    onConflictAction::OnConflictAction
    arbiterIndexes::Ptr{List}
    onConflictSet::Ptr{List}
    onConflictWhere::Ptr{Node}
    exclRelRTI::Cint
    exclRelTlist::Ptr{List}
end

struct Append
    plan::Plan
    partitioned_rels::Ptr{List}
    appendplans::Ptr{List}
end

struct MergeAppend
    plan::Plan
    partitioned_rels::Ptr{List}
    mergeplans::Ptr{List}
    numCols::Cint
    sortColIdx::Ptr{AttrNumber}
    sortOperators::Ptr{Cint}
    collations::Ptr{Cint}
    nullsFirst::Ptr{Cint}
end

struct RecursiveUnion
    plan::Plan
    wtParam::Cint
    numCols::Cint
    dupColIdx::Ptr{AttrNumber}
    dupOperators::Ptr{Cint}
    numGroups::Clong
end

struct BitmapAnd
    plan::Plan
    bitmapplans::Ptr{List}
end

struct BitmapOr
    plan::Plan
    isshared::Cint
    bitmapplans::Ptr{List}
end

struct Scan
    plan::Plan
    scanrelid::Cint
end

const SeqScan = Scan

struct SampleScan
    scan::Scan
    tablesample::Ptr{TableSampleClause}
end

@cenum ScanDirection::Int32 begin
    BackwardScanDirection = -1
    NoMovementScanDirection = 0
    ForwardScanDirection = 1
end


struct IndexScan
    scan::Scan
    indexid::Cint
    indexqual::Ptr{List}
    indexqualorig::Ptr{List}
    indexorderby::Ptr{List}
    indexorderbyorig::Ptr{List}
    indexorderbyops::Ptr{List}
    indexorderdir::ScanDirection
end

struct IndexOnlyScan
    scan::Scan
    indexid::Cint
    indexqual::Ptr{List}
    indexorderby::Ptr{List}
    indextlist::Ptr{List}
    indexorderdir::ScanDirection
end

struct BitmapIndexScan
    scan::Scan
    indexid::Cint
    isshared::Cint
    indexqual::Ptr{List}
    indexqualorig::Ptr{List}
end

struct BitmapHeapScan
    scan::Scan
    bitmapqualorig::Ptr{List}
end

struct TidScan
    scan::Scan
    tidquals::Ptr{List}
end

struct SubqueryScan
    scan::Scan
    subplan::Ptr{Plan}
end

struct FunctionScan
    scan::Scan
    functions::Ptr{List}
    funcordinality::Cint
end

struct ValuesScan
    scan::Scan
    values_lists::Ptr{List}
end

struct TableFuncScan
    scan::Scan
    tablefunc::Ptr{TableFunc}
end

struct CteScan
    scan::Scan
    ctePlanId::Cint
    cteParam::Cint
end

struct NamedTuplestoreScan
    scan::Scan
    enrname::Cstring
end

struct WorkTableScan
    scan::Scan
    wtParam::Cint
end

struct ForeignScan
    scan::Scan
    operation::CmdType
    fs_server::Cint
    fdw_exprs::Ptr{List}
    fdw_private::Ptr{List}
    fdw_scan_tlist::Ptr{List}
    fdw_recheck_quals::Ptr{List}
    fs_relids::Ptr{Bitmapset}
    fsSystemCol::Cint
end

struct CustomScan
    scan::Scan
    flags::Cint
    custom_plans::Ptr{List}
    custom_exprs::Ptr{List}
    custom_private::Ptr{List}
    custom_scan_tlist::Ptr{List}
    custom_relids::Ptr{Bitmapset}
    methods::Ptr{CustomScanMethods}
end

struct Join
    plan::Plan
    jointype::JoinType
    inner_unique::Cint
    joinqual::Ptr{List}
end

struct NestLoop
    join::Join
    nestParams::Ptr{List}
end

struct Var
    xpr::Expr
    varno::Cint
    varattno::AttrNumber
    vartype::Cint
    vartypmod::Cint
    varcollid::Cint
    varlevelsup::Cint
    varnoold::Cint
    varoattno::AttrNumber
    location::Cint
end

struct NestLoopParam
    type::NodeTag
    paramno::Cint
    paramval::Ptr{Var}
end

struct MergeJoin
    join::Join
    skip_mark_restore::Cint
    mergeclauses::Ptr{List}
    mergeFamilies::Ptr{Cint}
    mergeCollations::Ptr{Cint}
    mergeStrategies::Ptr{Cint}
    mergeNullsFirst::Ptr{Cint}
end

struct HashJoin
    join::Join
    hashclauses::Ptr{List}
end

struct Material
    plan::Plan
end

struct Sort
    plan::Plan
    numCols::Cint
    sortColIdx::Ptr{AttrNumber}
    sortOperators::Ptr{Cint}
    collations::Ptr{Cint}
    nullsFirst::Ptr{Cint}
end

struct Group
    plan::Plan
    numCols::Cint
    grpColIdx::Ptr{AttrNumber}
    grpOperators::Ptr{Cint}
end

struct Agg
    plan::Plan
    aggstrategy::AggStrategy
    aggsplit::AggSplit
    numCols::Cint
    grpColIdx::Ptr{AttrNumber}
    grpOperators::Ptr{Cint}
    numGroups::Clong
    aggParams::Ptr{Bitmapset}
    groupingSets::Ptr{List}
    chain::Ptr{List}
end

struct WindowAgg
    plan::Plan
    winref::Cint
    partNumCols::Cint
    partColIdx::Ptr{AttrNumber}
    partOperators::Ptr{Cint}
    ordNumCols::Cint
    ordColIdx::Ptr{AttrNumber}
    ordOperators::Ptr{Cint}
    frameOptions::Cint
    startOffset::Ptr{Node}
    endOffset::Ptr{Node}
end

struct Unique
    plan::Plan
    numCols::Cint
    uniqColIdx::Ptr{AttrNumber}
    uniqOperators::Ptr{Cint}
end

struct Gather
    plan::Plan
    num_workers::Cint
    rescan_param::Cint
    single_copy::Cint
    invisible::Cint
end

struct GatherMerge
    plan::Plan
    num_workers::Cint
    rescan_param::Cint
    numCols::Cint
    sortColIdx::Ptr{AttrNumber}
    sortOperators::Ptr{Cint}
    collations::Ptr{Cint}
    nullsFirst::Ptr{Cint}
end

struct Hash
    plan::Plan
    skewTable::Cint
    skewColumn::AttrNumber
    skewInherit::Cint
end

struct SetOp
    plan::Plan
    cmd::SetOpCmd
    strategy::SetOpStrategy
    numCols::Cint
    dupColIdx::Ptr{AttrNumber}
    dupOperators::Ptr{Cint}
    flagColIdx::AttrNumber
    firstFlag::Cint
    numGroups::Clong
end

struct LockRows
    plan::Plan
    rowMarks::Ptr{List}
    epqParam::Cint
end

struct Limit
    plan::Plan
    limitOffset::Ptr{Node}
    limitCount::Ptr{Node}
end

@cenum RowMarkType::UInt32 begin
    ROW_MARK_EXCLUSIVE = 0
    ROW_MARK_NOKEYEXCLUSIVE = 1
    ROW_MARK_SHARE = 2
    ROW_MARK_KEYSHARE = 3
    ROW_MARK_REFERENCE = 4
    ROW_MARK_COPY = 5
end


struct PlanRowMark
    type::NodeTag
    rti::Cint
    prti::Cint
    rowmarkId::Cint
    markType::RowMarkType
    allMarkTypes::Cint
    strength::LockClauseStrength
    waitPolicy::LockWaitPolicy
    isParent::Cint
end

struct PlanInvalItem
    type::NodeTag
    cacheId::Cint
    hashValue::Cint
end

const INNER_VAR = 65000
const OUTER_VAR = 65001
const INDEX_VAR = 65002

# Skipping MacroDefinition: IS_SPECIAL_VARNO ( varno ) ( ( varno ) >= INNER_VAR )

const PRS2_OLD_VARNO = 1
const PRS2_NEW_VARNO = 2

struct Const
    xpr::Expr
    consttype::Cint
    consttypmod::Cint
    constcollid::Cint
    constlen::Cint
    constvalue::Cint
    constisnull::Cint
    constbyval::Cint
    location::Cint
end

@cenum ParamKind::UInt32 begin
    PARAM_EXTERN = 0
    PARAM_EXEC = 1
    PARAM_SUBLINK = 2
    PARAM_MULTIEXPR = 3
end


struct Param
    xpr::Expr
    paramkind::ParamKind
    paramid::Cint
    paramtype::Cint
    paramtypmod::Cint
    paramcollid::Cint
    location::Cint
end

struct Aggref
    xpr::Expr
    aggfnoid::Cint
    aggtype::Cint
    aggcollid::Cint
    inputcollid::Cint
    aggtranstype::Cint
    aggargtypes::Ptr{List}
    aggdirectargs::Ptr{List}
    args::Ptr{List}
    aggorder::Ptr{List}
    aggdistinct::Ptr{List}
    aggfilter::Ptr{Expr}
    aggstar::Cint
    aggvariadic::Cint
    aggkind::UInt8
    agglevelsup::Cint
    aggsplit::AggSplit
    location::Cint
end

struct GroupingFunc
    xpr::Expr
    args::Ptr{List}
    refs::Ptr{List}
    cols::Ptr{List}
    agglevelsup::Cint
    location::Cint
end

struct WindowFunc
    xpr::Expr
    winfnoid::Cint
    wintype::Cint
    wincollid::Cint
    inputcollid::Cint
    args::Ptr{List}
    aggfilter::Ptr{Expr}
    winref::Cint
    winstar::Cint
    winagg::Cint
    location::Cint
end

struct ArrayRef
    xpr::Expr
    refarraytype::Cint
    refelemtype::Cint
    reftypmod::Cint
    refcollid::Cint
    refupperindexpr::Ptr{List}
    reflowerindexpr::Ptr{List}
    refexpr::Ptr{Expr}
    refassgnexpr::Ptr{Expr}
end

@cenum CoercionForm::UInt32 begin
    COERCE_EXPLICIT_CALL = 0
    COERCE_EXPLICIT_CAST = 1
    COERCE_IMPLICIT_CAST = 2
end


struct FuncExpr
    xpr::Expr
    funcid::Cint
    funcresulttype::Cint
    funcretset::Cint
    funcvariadic::Cint
    funcformat::CoercionForm
    funccollid::Cint
    inputcollid::Cint
    args::Ptr{List}
    location::Cint
end

struct NamedArgExpr
    xpr::Expr
    arg::Ptr{Expr}
    name::Cstring
    argnumber::Cint
    location::Cint
end

struct OpExpr
    xpr::Expr
    opno::Cint
    opfuncid::Cint
    opresulttype::Cint
    opretset::Cint
    opcollid::Cint
    inputcollid::Cint
    args::Ptr{List}
    location::Cint
end

const DistinctExpr = OpExpr
const NullIfExpr = OpExpr

struct ScalarArrayOpExpr
    xpr::Expr
    opno::Cint
    opfuncid::Cint
    useOr::Cint
    inputcollid::Cint
    args::Ptr{List}
    location::Cint
end

@cenum BoolExprType::UInt32 begin
    AND_EXPR = 0
    OR_EXPR = 1
    NOT_EXPR = 2
end


struct BoolExpr
    xpr::Expr
    boolop::BoolExprType
    args::Ptr{List}
    location::Cint
end

@cenum SubLinkType::UInt32 begin
    EXISTS_SUBLINK = 0
    ALL_SUBLINK = 1
    ANY_SUBLINK = 2
    ROWCOMPARE_SUBLINK = 3
    EXPR_SUBLINK = 4
    MULTIEXPR_SUBLINK = 5
    ARRAY_SUBLINK = 6
    CTE_SUBLINK = 7
end


struct SubLink
    xpr::Expr
    subLinkType::SubLinkType
    subLinkId::Cint
    testexpr::Ptr{Node}
    operName::Ptr{List}
    subselect::Ptr{Node}
    location::Cint
end

struct SubPlan
    xpr::Expr
    subLinkType::SubLinkType
    testexpr::Ptr{Node}
    paramIds::Ptr{List}
    plan_id::Cint
    plan_name::Cstring
    firstColType::Cint
    firstColTypmod::Cint
    firstColCollation::Cint
    useHashTable::Cint
    unknownEqFalse::Cint
    parallel_safe::Cint
    setParam::Ptr{List}
    parParam::Ptr{List}
    args::Ptr{List}
    startup_cost::Cost
    per_call_cost::Cost
end

struct AlternativeSubPlan
    xpr::Expr
    subplans::Ptr{List}
end

struct FieldSelect
    xpr::Expr
    arg::Ptr{Expr}
    fieldnum::AttrNumber
    resulttype::Cint
    resulttypmod::Cint
    resultcollid::Cint
end

struct FieldStore
    xpr::Expr
    arg::Ptr{Expr}
    newvals::Ptr{List}
    fieldnums::Ptr{List}
    resulttype::Cint
end

struct RelabelType
    xpr::Expr
    arg::Ptr{Expr}
    resulttype::Cint
    resulttypmod::Cint
    resultcollid::Cint
    relabelformat::CoercionForm
    location::Cint
end

struct CoerceViaIO
    xpr::Expr
    arg::Ptr{Expr}
    resulttype::Cint
    resultcollid::Cint
    coerceformat::CoercionForm
    location::Cint
end

struct ArrayCoerceExpr
    xpr::Expr
    arg::Ptr{Expr}
    elemfuncid::Cint
    resulttype::Cint
    resulttypmod::Cint
    resultcollid::Cint
    isExplicit::Cint
    coerceformat::CoercionForm
    location::Cint
end

struct ConvertRowtypeExpr
    xpr::Expr
    arg::Ptr{Expr}
    resulttype::Cint
    convertformat::CoercionForm
    location::Cint
end

struct CollateExpr
    xpr::Expr
    arg::Ptr{Expr}
    collOid::Cint
    location::Cint
end

struct CaseExpr
    xpr::Expr
    casetype::Cint
    casecollid::Cint
    arg::Ptr{Expr}
    args::Ptr{List}
    defresult::Ptr{Expr}
    location::Cint
end

struct CaseWhen
    xpr::Expr
    expr::Ptr{Expr}
    result::Ptr{Expr}
    location::Cint
end

struct CaseTestExpr
    xpr::Expr
    typeId::Cint
    typeMod::Cint
    collation::Cint
end

struct ArrayExpr
    xpr::Expr
    array_typeid::Cint
    array_collid::Cint
    element_typeid::Cint
    elements::Ptr{List}
    multidims::Cint
    location::Cint
end

struct RowExpr
    xpr::Expr
    args::Ptr{List}
    row_typeid::Cint
    row_format::CoercionForm
    colnames::Ptr{List}
    location::Cint
end

@cenum RowCompareType::UInt32 begin
    ROWCOMPARE_LT = 1
    ROWCOMPARE_LE = 2
    ROWCOMPARE_EQ = 3
    ROWCOMPARE_GE = 4
    ROWCOMPARE_GT = 5
    ROWCOMPARE_NE = 6
end


struct RowCompareExpr
    xpr::Expr
    rctype::RowCompareType
    opnos::Ptr{List}
    opfamilies::Ptr{List}
    inputcollids::Ptr{List}
    largs::Ptr{List}
    rargs::Ptr{List}
end

struct CoalesceExpr
    xpr::Expr
    coalescetype::Cint
    coalescecollid::Cint
    args::Ptr{List}
    location::Cint
end

@cenum MinMaxOp::UInt32 begin
    IS_GREATEST = 0
    IS_LEAST = 1
end


struct MinMaxExpr
    xpr::Expr
    minmaxtype::Cint
    minmaxcollid::Cint
    inputcollid::Cint
    op::MinMaxOp
    args::Ptr{List}
    location::Cint
end

@cenum SQLValueFunctionOp::UInt32 begin
    SVFOP_CURRENT_DATE = 0
    SVFOP_CURRENT_TIME = 1
    SVFOP_CURRENT_TIME_N = 2
    SVFOP_CURRENT_TIMESTAMP = 3
    SVFOP_CURRENT_TIMESTAMP_N = 4
    SVFOP_LOCALTIME = 5
    SVFOP_LOCALTIME_N = 6
    SVFOP_LOCALTIMESTAMP = 7
    SVFOP_LOCALTIMESTAMP_N = 8
    SVFOP_CURRENT_ROLE = 9
    SVFOP_CURRENT_USER = 10
    SVFOP_USER = 11
    SVFOP_SESSION_USER = 12
    SVFOP_CURRENT_CATALOG = 13
    SVFOP_CURRENT_SCHEMA = 14
end


struct SQLValueFunction
    xpr::Expr
    op::SQLValueFunctionOp
    type::Cint
    typmod::Cint
    location::Cint
end

@cenum XmlExprOp::UInt32 begin
    IS_XMLCONCAT = 0
    IS_XMLELEMENT = 1
    IS_XMLFOREST = 2
    IS_XMLPARSE = 3
    IS_XMLPI = 4
    IS_XMLROOT = 5
    IS_XMLSERIALIZE = 6
    IS_DOCUMENT = 7
end


struct XmlExpr
    xpr::Expr
    op::XmlExprOp
    name::Cstring
    named_args::Ptr{List}
    arg_names::Ptr{List}
    args::Ptr{List}
    xmloption::XmlOptionType
    type::Cint
    typmod::Cint
    location::Cint
end

@cenum NullTestType::UInt32 begin
    IS_NULL = 0
    IS_NOT_NULL = 1
end


struct NullTest
    xpr::Expr
    arg::Ptr{Expr}
    nulltesttype::NullTestType
    argisrow::Cint
    location::Cint
end

@cenum BoolTestType::UInt32 begin
    IS_TRUE = 0
    IS_NOT_TRUE = 1
    IS_FALSE = 2
    IS_NOT_FALSE = 3
    IS_UNKNOWN = 4
    IS_NOT_UNKNOWN = 5
end


struct BooleanTest
    xpr::Expr
    arg::Ptr{Expr}
    booltesttype::BoolTestType
    location::Cint
end

struct CoerceToDomain
    xpr::Expr
    arg::Ptr{Expr}
    resulttype::Cint
    resulttypmod::Cint
    resultcollid::Cint
    coercionformat::CoercionForm
    location::Cint
end

struct CoerceToDomainValue
    xpr::Expr
    typeId::Cint
    typeMod::Cint
    collation::Cint
    location::Cint
end

struct SetToDefault
    xpr::Expr
    typeId::Cint
    typeMod::Cint
    collation::Cint
    location::Cint
end

struct CurrentOfExpr
    xpr::Expr
    cvarno::Cint
    cursor_name::Cstring
    cursor_param::Cint
end

struct NextValueExpr
    xpr::Expr
    seqid::Cint
    typeId::Cint
end

struct InferenceElem
    xpr::Expr
    expr::Ptr{Node}
    infercollid::Cint
    inferopclass::Cint
end

struct TargetEntry
    xpr::Expr
    expr::Ptr{Expr}
    resno::AttrNumber
    resname::Cstring
    ressortgroupref::Cint
    resorigtbl::Cint
    resorigcol::AttrNumber
    resjunk::Cint
end

struct RangeTblRef
    type::NodeTag
    rtindex::Cint
end

struct JoinExpr
    type::NodeTag
    jointype::JoinType
    isNatural::Cint
    larg::Ptr{Node}
    rarg::Ptr{Node}
    usingClause::Ptr{List}
    quals::Ptr{Node}
    alias::Ptr{Alias}
    rtindex::Cint
end

# Skipping MacroDefinition: nodeDisplay ( x ) pprint ( x )
# Skipping MacroDefinition: planner_subplan_get_plan ( root , subplan ) ( ( Plan * ) list_nth ( ( root ) -> glob -> subplans , ( subplan ) -> plan_id - 1 ) )
# Skipping MacroDefinition: planner_rt_fetch ( rti , root ) ( ( root ) -> simple_rte_array ? ( root ) -> simple_rte_array [ rti ] : rt_fetch ( rti , ( root ) -> parse -> rtable ) )
# Skipping MacroDefinition: IS_SIMPLE_REL ( rel ) ( ( rel ) -> reloptkind == RELOPT_BASEREL || ( rel ) -> reloptkind == RELOPT_OTHER_MEMBER_REL )
# Skipping MacroDefinition: IS_JOIN_REL ( rel ) ( ( rel ) -> reloptkind == RELOPT_JOINREL )
# Skipping MacroDefinition: IS_UPPER_REL ( rel ) ( ( rel ) -> reloptkind == RELOPT_UPPER_REL )
# Skipping MacroDefinition: IS_OTHER_REL ( rel ) ( ( rel ) -> reloptkind == RELOPT_OTHER_MEMBER_REL )
# Skipping MacroDefinition: EC_MUST_BE_REDUNDANT ( eclass ) ( ( eclass ) -> ec_has_const && ! ( eclass ) -> ec_below_outer_join )
# Skipping MacroDefinition: get_pathtarget_sortgroupref ( target , colno ) ( ( target ) -> sortgrouprefs ? ( target ) -> sortgrouprefs [ colno ] : ( Index ) 0 )
# Skipping MacroDefinition: PATH_REQ_OUTER ( path ) ( ( path ) -> param_info ? ( path ) -> param_info -> ppi_req_outer : ( Relids ) NULL )
# Skipping MacroDefinition: IS_DUMMY_APPEND ( p ) ( IsA ( ( p ) , AppendPath ) && ( ( AppendPath * ) ( p ) ) -> subpaths == NIL )
# Skipping MacroDefinition: IS_DUMMY_REL ( r ) is_dummy_rel ( r )
# Skipping MacroDefinition: RINFO_IS_PUSHED_DOWN ( rinfo , joinrelids ) ( ( rinfo ) -> is_pushed_down || ! bms_is_subset ( ( rinfo ) -> required_relids , joinrelids ) )

const Relids = Ptr{Bitmapset}

@cenum CostSelector::UInt32 begin
    STARTUP_COST = 0
    TOTAL_COST = 1
end


struct QualCost
    startup::Cost
    per_tuple::Cost
end

struct AggClauseCosts
    numAggs::Cint
    numOrderedAggs::Cint
    hasNonPartial::Cint
    hasNonSerial::Cint
    transCost::QualCost
    finalCost::Cost
    transitionSpace::Cint
end

@cenum UpperRelationKind::UInt32 begin
    UPPERREL_SETOP = 0
    UPPERREL_GROUP_AGG = 1
    UPPERREL_WINDOW = 2
    UPPERREL_DISTINCT = 3
    UPPERREL_ORDERED = 4
    UPPERREL_FINAL = 5
end


struct PlannerGlobal
    type::NodeTag
    boundParams::ParamListInfo
    subplans::Ptr{List}
    subroots::Ptr{List}
    rewindPlanIDs::Ptr{Bitmapset}
    finalrtable::Ptr{List}
    finalrowmarks::Ptr{List}
    resultRelations::Ptr{List}
    nonleafResultRelations::Ptr{List}
    rootResultRelations::Ptr{List}
    relationOids::Ptr{List}
    invalItems::Ptr{List}
    nParamExec::Cint
    lastPHId::Cint
    lastRowMarkId::Cint
    lastPlanNodeId::Cint
    transientPlan::Cint
    dependsOnRole::Cint
    parallelModeOK::Cint
    parallelModeNeeded::Cint
    maxParallelHazard::UInt8
end

@cenum RelOptKind::UInt32 begin
    RELOPT_BASEREL = 0
    RELOPT_JOINREL = 1
    RELOPT_OTHER_MEMBER_REL = 2
    RELOPT_UPPER_REL = 3
    RELOPT_DEADREL = 4
end


struct PathTarget
    type::NodeTag
    exprs::Ptr{List}
    sortgrouprefs::Ptr{Cint}
    cost::QualCost
    width::Cint
end

struct ParamPathInfo
    type::NodeTag
    ppi_req_outer::Relids
    ppi_rows::Cdouble
    ppi_clauses::Ptr{List}
end

struct PathGeneric{REL_OPT_INFO}
    type::NodeTag
    pathtype::NodeTag
    parent::Ptr{REL_OPT_INFO}
    pathtarget::Ptr{PathTarget}
    param_info::Ptr{ParamPathInfo}
    parallel_aware::Cint
    parallel_safe::Cint
    parallel_workers::Cint
    rows::Cdouble
    startup_cost::Cost
    total_cost::Cost
    pathkeys::Ptr{List}
end

struct RelOptInfoGeneric{PLANNER_INFO}
    type::NodeTag
    reloptkind::RelOptKind
    relids::Relids
    rows::Cdouble
    consider_startup::Cint
    consider_param_startup::Cint
    consider_parallel::Cint
    reltarget::Ptr{PathTarget}
    pathlist::Ptr{List}
    ppilist::Ptr{List}
    partial_pathlist::Ptr{List}
    cheapest_startup_path::Ptr{PathGeneric{RelOptInfoGeneric{PLANNER_INFO}}}
    cheapest_total_path::Ptr{PathGeneric{RelOptInfoGeneric{PLANNER_INFO}}}
    cheapest_unique_path::Ptr{PathGeneric{RelOptInfoGeneric{PLANNER_INFO}}}
    cheapest_parameterized_paths::Ptr{List}
    direct_lateral_relids::Relids
    lateral_relids::Relids
    relid::Cint
    reltablespace::Cint
    rtekind::RTEKind
    min_attr::AttrNumber
    max_attr::AttrNumber
    attr_needed::Ptr{Relids}
    attr_widths::Ptr{Cint}
    lateral_vars::Ptr{List}
    lateral_referencers::Relids
    indexlist::Ptr{List}
    statlist::Ptr{List}
    pages::BlockNumber
    tuples::Cdouble
    allvisfrac::Cdouble
    subroot::Ptr{PLANNER_INFO}
    subplan_params::Ptr{List}
    rel_parallel_workers::Cint
    serverid::Cint
    userid::Cint
    useridiscurrent::Cint
    fdwroutine::Ptr{FdwRoutine}
    fdw_private::Ptr{Cvoid}
    unique_for_rels::Ptr{List}
    non_unique_for_rels::Ptr{List}
    baserestrictinfo::Ptr{List}
    baserestrictcost::QualCost
    baserestrict_min_security::Cint
    joininfo::Ptr{List}
    has_eclass_joins::Cint
    top_parent_relids::Relids
end

struct PlannerInfo
    type::NodeTag
    parse::Ptr{Query}
    glob::Ptr{PlannerGlobal}
    query_level::Cint
    parent_root::Ptr{PlannerInfo}
    plan_params::Ptr{List}
    outer_params::Ptr{Bitmapset}
    simple_rel_array::Ptr{Ptr{RelOptInfoGeneric{PlannerInfo}}}
    simple_rel_array_size::Cint
    simple_rte_array::Ptr{Ptr{RangeTblEntry}}
    all_baserels::Relids
    nullable_baserels::Relids
    join_rel_list::Ptr{List}
    join_rel_hash::Ptr{HTAB}
    join_rel_level::Ptr{Ptr{List}}
    join_cur_level::Cint
    init_plans::Ptr{List}
    cte_plan_ids::Ptr{List}
    multiexpr_params::Ptr{List}
    eq_classes::Ptr{List}
    canon_pathkeys::Ptr{List}
    left_join_clauses::Ptr{List}
    right_join_clauses::Ptr{List}
    full_join_clauses::Ptr{List}
    join_info_list::Ptr{List}
    append_rel_list::Ptr{List}
    pcinfo_list::Ptr{List}
    rowMarks::Ptr{List}
    placeholder_list::Ptr{List}
    fkey_list::Ptr{List}
    query_pathkeys::Ptr{List}
    group_pathkeys::Ptr{List}
    window_pathkeys::Ptr{List}
    distinct_pathkeys::Ptr{List}
    sort_pathkeys::Ptr{List}
    initial_rels::Ptr{List}
    upper_rels::NTuple{6, Ptr{List}}
    upper_targets::NTuple{6, Ptr{PathTarget}}
    processed_tlist::Ptr{List}
    grouping_map::Ptr{AttrNumber}
    minmax_aggs::Ptr{List}
    planner_cxt::Cint
    total_table_pages::Cdouble
    tuple_fraction::Cdouble
    limit_tuples::Cdouble
    qual_security_level::Cint
    hasInheritedTarget::Cint
    hasJoinRTEs::Cint
    hasLateralRTEs::Cint
    hasDeletedRTEs::Cint
    hasHavingQual::Cint
    hasPseudoConstantQuals::Cint
    hasRecursion::Cint
    wt_param_id::Cint
    non_recursive_path::Ptr{PathGeneric{RelOptInfoGeneric{PlannerInfo}}}
    curOuterRels::Relids
    curOuterParams::Ptr{List}
    join_search_private::Ptr{Cvoid}
end

const RelOptInfo = RelOptInfoGeneric{PlannerInfo}
const Path = PathGeneric{RelOptInfo}

struct IndexOptInfo
    type::NodeTag
    indexoid::Cint
    reltablespace::Cint
    rel::Ptr{RelOptInfo}
    pages::BlockNumber
    tuples::Cdouble
    tree_height::Cint
    ncolumns::Cint
    indexkeys::Ptr{Cint}
    indexcollations::Ptr{Cint}
    opfamily::Ptr{Cint}
    opcintype::Ptr{Cint}
    sortopfamily::Ptr{Cint}
    reverse_sort::Ptr{Cint}
    nulls_first::Ptr{Cint}
    canreturn::Ptr{Cint}
    relam::Cint
    indexprs::Ptr{List}
    indpred::Ptr{List}
    indextlist::Ptr{List}
    indrestrictinfo::Ptr{List}
    predOK::Cint
    unique::Cint
    immediate::Cint
    hypothetical::Cint
    amcanorderbyop::Cint
    amoptionalkey::Cint
    amsearcharray::Cint
    amsearchnulls::Cint
    amhasgettuple::Cint
    amhasgetbitmap::Cint
    amcanparallel::Cint
    amcostestimate::Ptr{Cvoid}
end

struct EquivalenceClass
    type::NodeTag
    ec_opfamilies::Ptr{List}
    ec_collation::Cint
    ec_members::Ptr{List}
    ec_sources::Ptr{List}
    ec_derives::Ptr{List}
    ec_relids::Relids
    ec_has_const::Cint
    ec_has_volatile::Cint
    ec_below_outer_join::Cint
    ec_broken::Cint
    ec_sortref::Cint
    ec_min_security::Cint
    ec_max_security::Cint
    ec_merged::Ptr{EquivalenceClass}
end

struct ForeignKeyOptInfo
    type::NodeTag
    con_relid::Cint
    ref_relid::Cint
    nkeys::Cint
    conkey::AttrNumber
    confkey::AttrNumber
    conpfeqop::Cint
    nmatched_ec::Cint
    nmatched_rcols::Cint
    nmatched_ri::Cint
    eclass::Ptr{EquivalenceClass}
    rinfos::Ptr{List}
end

struct StatisticExtInfo
    type::NodeTag
    statOid::Cint
    rel::Ptr{RelOptInfo}
    kind::UInt8
    keys::Ptr{Bitmapset}
end

struct EquivalenceMember
    type::NodeTag
    em_expr::Ptr{Expr}
    em_relids::Relids
    em_nullable_relids::Relids
    em_is_const::Cint
    em_is_child::Cint
    em_datatype::Cint
end

struct PathKey
    type::NodeTag
    pk_eclass::Ptr{EquivalenceClass}
    pk_opfamily::Cint
    pk_strategy::Cint
    pk_nulls_first::Cint
end

struct IndexPath
    path::Path
    indexinfo::Ptr{IndexOptInfo}
    indexclauses::Ptr{List}
    indexquals::Ptr{List}
    indexqualcols::Ptr{List}
    indexorderbys::Ptr{List}
    indexorderbycols::Ptr{List}
    indexscandir::ScanDirection
    indextotalcost::Cost
    indexselectivity::Selectivity
end

struct BitmapHeapPath
    path::Path
    bitmapqual::Ptr{Path}
end

struct BitmapAndPath
    path::Path
    bitmapquals::Ptr{List}
    bitmapselectivity::Selectivity
end

struct BitmapOrPath
    path::Path
    bitmapquals::Ptr{List}
    bitmapselectivity::Selectivity
end

struct TidPath
    path::Path
    tidquals::Ptr{List}
end

struct SubqueryScanPath
    path::Path
    subpath::Ptr{Path}
end

struct ForeignPath
    path::Path
    fdw_outerpath::Ptr{Path}
    fdw_private::Ptr{List}
end

struct CustomPath
    path::Path
    flags::Cint
    custom_paths::Ptr{List}
    custom_private::Ptr{List}
    methods::Ptr{CustomPathMethods}
end

struct AppendPath
    path::Path
    partitioned_rels::Ptr{List}
    subpaths::Ptr{List}
end

struct MergeAppendPath
    path::Path
    partitioned_rels::Ptr{List}
    subpaths::Ptr{List}
    limit_tuples::Cdouble
end

struct ResultPath
    path::Path
    quals::Ptr{List}
end

struct MaterialPath
    path::Path
    subpath::Ptr{Path}
end

@cenum UniquePathMethod::UInt32 begin
    UNIQUE_PATH_NOOP = 0
    UNIQUE_PATH_HASH = 1
    UNIQUE_PATH_SORT = 2
end


struct UniquePath
    path::Path
    subpath::Ptr{Path}
    umethod::UniquePathMethod
    in_operators::Ptr{List}
    uniq_exprs::Ptr{List}
end

struct GatherPath
    path::Path
    subpath::Ptr{Path}
    single_copy::Cint
    num_workers::Cint
end

struct GatherMergePath
    path::Path
    subpath::Ptr{Path}
    num_workers::Cint
end

struct JoinPath
    path::Path
    jointype::JoinType
    inner_unique::Cint
    outerjoinpath::Ptr{Path}
    innerjoinpath::Ptr{Path}
    joinrestrictinfo::Ptr{List}
end

const NestPath = JoinPath

struct MergePath
    jpath::JoinPath
    path_mergeclauses::Ptr{List}
    outersortkeys::Ptr{List}
    innersortkeys::Ptr{List}
    skip_mark_restore::Cint
    materialize_inner::Cint
end

struct HashPath
    jpath::JoinPath
    path_hashclauses::Ptr{List}
    num_batches::Cint
end

struct ProjectionPath
    path::Path
    subpath::Ptr{Path}
    dummypp::Cint
end

struct ProjectSetPath
    path::Path
    subpath::Ptr{Path}
end

struct SortPath
    path::Path
    subpath::Ptr{Path}
end

struct GroupPath
    path::Path
    subpath::Ptr{Path}
    groupClause::Ptr{List}
    qual::Ptr{List}
end

struct UpperUniquePath
    path::Path
    subpath::Ptr{Path}
    numkeys::Cint
end

struct AggPath
    path::Path
    subpath::Ptr{Path}
    aggstrategy::AggStrategy
    aggsplit::AggSplit
    numGroups::Cdouble
    groupClause::Ptr{List}
    qual::Ptr{List}
end

struct GroupingSetData
    type::NodeTag
    set::Ptr{List}
    numGroups::Cdouble
end

struct RollupData
    type::NodeTag
    groupClause::Ptr{List}
    gsets::Ptr{List}
    gsets_data::Ptr{List}
    numGroups::Cdouble
    hashable::Cint
    is_hashed::Cint
end

struct GroupingSetsPath
    path::Path
    subpath::Ptr{Path}
    aggstrategy::AggStrategy
    rollups::Ptr{List}
    qual::Ptr{List}
end

struct MinMaxAggPath
    path::Path
    mmaggregates::Ptr{List}
    quals::Ptr{List}
end

struct WindowAggPath
    path::Path
    subpath::Ptr{Path}
    winclause::Ptr{WindowClause}
    winpathkeys::Ptr{List}
end

struct SetOpPath
    path::Path
    subpath::Ptr{Path}
    cmd::SetOpCmd
    strategy::SetOpStrategy
    distinctList::Ptr{List}
    flagColIdx::AttrNumber
    firstFlag::Cint
    numGroups::Cdouble
end

struct RecursiveUnionPath
    path::Path
    leftpath::Ptr{Path}
    rightpath::Ptr{Path}
    distinctList::Ptr{List}
    wtParam::Cint
    numGroups::Cdouble
end

struct LockRowsPath
    path::Path
    subpath::Ptr{Path}
    rowMarks::Ptr{List}
    epqParam::Cint
end

struct ModifyTablePath
    path::Path
    operation::CmdType
    canSetTag::Cint
    nominalRelation::Cint
    partitioned_rels::Ptr{List}
    resultRelations::Ptr{List}
    subpaths::Ptr{List}
    subroots::Ptr{List}
    withCheckOptionLists::Ptr{List}
    returningLists::Ptr{List}
    rowMarks::Ptr{List}
    onconflict::Ptr{OnConflictExpr}
    epqParam::Cint
end

struct LimitPath
    path::Path
    subpath::Ptr{Path}
    limitOffset::Ptr{Node}
    limitCount::Ptr{Node}
end

struct RestrictInfo
    type::NodeTag
    clause::Ptr{Expr}
    is_pushed_down::Cint
    outerjoin_delayed::Cint
    can_join::Cint
    pseudoconstant::Cint
    leakproof::Cint
    security_level::Cint
    clause_relids::Relids
    required_relids::Relids
    outer_relids::Relids
    nullable_relids::Relids
    left_relids::Relids
    right_relids::Relids
    orclause::Ptr{Expr}
    parent_ec::Ptr{EquivalenceClass}
    eval_cost::QualCost
    norm_selec::Selectivity
    outer_selec::Selectivity
    mergeopfamilies::Ptr{List}
    left_ec::Ptr{EquivalenceClass}
    right_ec::Ptr{EquivalenceClass}
    left_em::Ptr{EquivalenceMember}
    right_em::Ptr{EquivalenceMember}
    scansel_cache::Ptr{List}
    outer_is_left::Cint
    hashjoinoperator::Cint
    left_bucketsize::Selectivity
    right_bucketsize::Selectivity
end

struct MergeScanSelCache
    opfamily::Cint
    collation::Cint
    strategy::Cint
    nulls_first::Cint
    leftstartsel::Selectivity
    leftendsel::Selectivity
    rightstartsel::Selectivity
    rightendsel::Selectivity
end

struct PlaceHolderVar
    xpr::Expr
    phexpr::Ptr{Expr}
    phrels::Relids
    phid::Cint
    phlevelsup::Cint
end

struct SpecialJoinInfo
    type::NodeTag
    min_lefthand::Relids
    min_righthand::Relids
    syn_lefthand::Relids
    syn_righthand::Relids
    jointype::JoinType
    lhs_strict::Cint
    delay_upper_joins::Cint
    semi_can_btree::Cint
    semi_can_hash::Cint
    semi_operators::Ptr{List}
    semi_rhs_exprs::Ptr{List}
end

struct AppendRelInfo
    type::NodeTag
    parent_relid::Cint
    child_relid::Cint
    parent_reltype::Cint
    child_reltype::Cint
    translated_vars::Ptr{List}
    parent_reloid::Cint
end

struct PartitionedChildRelInfo
    type::NodeTag
    parent_relid::Cint
    child_rels::Ptr{List}
end

struct PlaceHolderInfo
    type::NodeTag
    phid::Cint
    ph_var::Ptr{PlaceHolderVar}
    ph_eval_at::Relids
    ph_lateral::Relids
    ph_needed::Relids
    ph_width::Cint
end

struct MinMaxAggInfo
    type::NodeTag
    aggfnoid::Cint
    aggsortop::Cint
    target::Ptr{Expr}
    subroot::Ptr{PlannerInfo}
    path::Ptr{Path}
    pathcost::Cost
    param::Ptr{Param}
end

struct PlannerParamItem
    type::NodeTag
    item::Ptr{Node}
    paramId::Cint
end

struct SemiAntiJoinFactors
    outer_match_frac::Selectivity
    match_count::Selectivity
end

struct JoinPathExtraData
    restrictlist::Ptr{List}
    mergeclause_list::Ptr{List}
    inner_unique::Cint
    sjinfo::Ptr{SpecialJoinInfo}
    semifactors::SemiAntiJoinFactors
    param_source_rels::Relids
end

struct JoinCostWorkspace
    startup_cost::Cost
    total_cost::Cost
    run_cost::Cost
    inner_run_cost::Cost
    inner_rescan_run_cost::Cost
    outer_rows::Cdouble
    inner_rows::Cdouble
    outer_skip_rows::Cdouble
    inner_skip_rows::Cdouble
    numbuckets::Cint
    numbatches::Cint
end

const TIDBitmap = Cvoid
const TBMIterator = Cvoid
const TBMSharedIterator = Cvoid

struct TBMIterateResult
    blockno::BlockNumber
    ntuples::Cint
    recheck::Cint
    offsets::OffsetNumber
end

# Skipping MacroDefinition: intVal ( v ) ( ( ( Value * ) ( v ) ) -> val . ival )
# Skipping MacroDefinition: floatVal ( v ) atof ( ( ( Value * ) ( v ) ) -> val . str )
# Skipping MacroDefinition: strVal ( v ) ( ( ( Value * ) ( v ) ) -> val . str )
# Skipping MacroDefinition: ScanDirectionIsValid ( direction ) ( ( bool ) ( BackwardScanDirection <= ( direction ) && ( direction ) <= ForwardScanDirection ) )
# Skipping MacroDefinition: ScanDirectionIsBackward ( direction ) ( ( bool ) ( ( direction ) == BackwardScanDirection ) )
# Skipping MacroDefinition: ScanDirectionIsNoMovement ( direction ) ( ( bool ) ( ( direction ) == NoMovementScanDirection ) )
# Skipping MacroDefinition: ScanDirectionIsForward ( direction ) ( ( bool ) ( ( direction ) == ForwardScanDirection ) )

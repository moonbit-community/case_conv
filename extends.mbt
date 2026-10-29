///|
pub extend CaseStyle with @moonbitlang/core/debug.Debug::{to_repr}

///|
pub extend CaseStyle with Compare::{op_lt, op_le, op_ge, compare, op_gt}

///|
pub extend CaseStyle with Eq::{not_equal, equal}

///|
pub extend CaseStyle with Hash::{hash, hash_combine}

///|
pub extend CaseStyle with Show::{to_string, output}

///|
pub extend CaseStyle with ToJson::{to_json}

///|
pub extend Words with @moonbitlang/core/debug.Debug::{to_repr}

///|
pub extend Words with Compare::{op_lt, op_le, op_ge, compare, op_gt}

///|
pub extend Words with Eq::{not_equal, equal}

///|
pub extend Words with Hash::{hash, hash_combine}

///|
pub extend Words with Show::{to_string, output}

///|
pub extend Words with ToJson::{to_json}

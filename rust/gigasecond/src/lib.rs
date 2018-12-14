extern crate chrono;
use chrono::*;

pub fn after(start: DateTime<Utc>) -> DateTime<Utc> {
    return start + Duration::seconds(10i64.pow(9)) // 1_000_000_000
}
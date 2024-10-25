select
    account_manager,
    state
from {{ source('google_sheets', 'account_manager_region_mapping') }}

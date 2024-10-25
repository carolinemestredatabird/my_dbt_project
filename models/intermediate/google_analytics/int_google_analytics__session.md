{% docs int_google_analytics__session %}

This model aggregates GA4 events at the session level, creating a `unique_session_id` by combining `user_pseudo_id` and `ga_session_id`. It tracks key session details such as session start and end times, duration, pages viewed, and traffic source.

### Key Fields:
- **user_pseudo_id**: User identifier.
- **unique_session_id**: Primarey key : dombination of `user_pseudo_id` and `ga_session_id`.

{% enddocs %}
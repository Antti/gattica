module GatticaError
  # user errors
  class InvalidEmail < StandardError; end;
  class InvalidPassword < StandardError; end;
  # authentication errors
  class CouldNotAuthenticate < StandardError; end;
  # profile errors
  class InvalidProfileId < StandardError; end;
  # search errors
  class TooManyDimensions < StandardError; end;
  class TooManyMetrics < StandardError; end;
  class InvalidSort < StandardError; end;
  class InvalidFilter < StandardError; end;
  class MissingStartDate < StandardError; end;
  class MissingEndDate < StandardError; end;
  # errors from Analytics
  class AnalyticsError < StandardError; end;
end
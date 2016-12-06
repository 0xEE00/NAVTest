OBJECT Codeunit 50000 RegEx Tests
{
  OBJECT-PROPERTIES
  {
    Date=24/03/16;
    Time=14:12:01;
    Modified=Yes;
    Version List=;
  }
  PROPERTIES
  {
    OnRun=BEGIN

            //MESSAGE(FORMAT(RegExPos('ICONOS\PIESSPE','\w+\\(\w+)')));
            MESSAGE(FORMAT(RegExGroup('ICONOS\PIESSPE','\w+\\(\w+)',1)));
            MESSAGE(FORMAT(RegExGroup('ICONOSPIESSPE','\w+\\(\w+)',1)));
          END;

  }
  CODE
  {

    LOCAL PROCEDURE RegExPos@1100084000(String@1100084000 : Text;RegEx@1100084001 : Text) : Integer;
    VAR
      SystemTextRegEx@1100084002 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Text.RegularExpressions.Regex";
      SystemTextRegexMatch@1100084003 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Text.RegularExpressions.Match";
    BEGIN
      SystemTextRegexMatch := SystemTextRegEx.Match(String,RegEx);

      IF SystemTextRegexMatch.Success THEN
        EXIT(SystemTextRegexMatch.Index+1)
      ELSE
        EXIT(0);
    END;

    LOCAL PROCEDURE RegExGroup@1100084009(String@1100084000 : Text;RegEx@1100084001 : Text;GroupIndex@1100084006 : Integer) : Text;
    VAR
      SystemTextRegEx@1100084002 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Text.RegularExpressions.Regex";
      SystemTextRegexMatch@1100084003 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Text.RegularExpressions.Match";
      SystemTextRegexGroupCollection@1100084004 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Text.RegularExpressions.GroupCollection";
      SystemTextRegexGroup@1100084005 : DotNet "'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Text.RegularExpressions.Group";
    BEGIN
      SystemTextRegexMatch := SystemTextRegEx.Match(String,RegEx);

      IF SystemTextRegexMatch.Success THEN BEGIN
        SystemTextRegexGroupCollection := SystemTextRegexMatch.Groups;
        SystemTextRegexGroup := SystemTextRegexGroupCollection.Item(GroupIndex);
        EXIT(SystemTextRegexGroup.Value);
      END
      ELSE BEGIN
        EXIT(String);
      END;
    END;

    BEGIN
    END.
  }
}
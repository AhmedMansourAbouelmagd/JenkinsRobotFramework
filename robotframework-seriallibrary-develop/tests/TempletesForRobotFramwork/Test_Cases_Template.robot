#Resource  ->https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#test-templates


#2.2.7   Test templates
#Test templates convert normal keyword-driven test cases into data-driven tests. Whereas the body of a keyword-driven test case is constructed from keywords and their possible arguments, test cases with template contain only the arguments for the template keyword. Instead of repeating the same keyword multiple times per test and/or with all tests in a file, it is possible to use it only per test or just once per file.

#Template keywords can accept both normal positional and named arguments, as well as arguments embedded to the keyword name. Unlike with other settings, it is not possible to define a template using a variable.

#Basic usage
#How a keyword accepting normal positional arguments can be used as a template is illustrated by the following example test cases. These two tests are functionally fully identical.

#*** Test Cases **
#Normal test case
#    Example keyword    first argument    second argument

#Templated test case
#    [Template]    Example keyword
#    first argument    second argument
#As the example illustrates, it is possible to specify the template for an individual test case using the [Template] setting. An alternative approach is using the Test Template setting in the Setting section, in which case the template is applied for all test cases in that test case file. The [Template] setting overrides the possible template set in the Setting section, and an empty value for [Template] means that the test has no template even when Test Template is used. It is also possible to use value NONE to indicate that a test has no template.

#If a templated test case has multiple data rows in its body, the template is applied for all the rows one by one. This means that the same keyword is executed multiple times, once with data on each row. Templated tests are also special so that all the rounds are executed even if one or more of them fails. It is possible to use this kind of continue on failure mode with normal tests too, but with the templated tests the mode is on automatically.

#*** Settings ***
#Test Template    Example keyword

#*** Test Cases ***
#Templated test case
#    first round 1     first round 2
#    second round 1    second round 2
#    third round 1     third round 2
#Using keywords with default values or accepting variable number of arguments, as well as using named arguments and free named arguments, work with templates exactly like they work otherwise. Using variables in arguments is also supported normally.
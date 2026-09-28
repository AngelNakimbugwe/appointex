/// Copy from `.design-src/Biz_Onboarding.dc.html`, verbatim (plus additions
/// noted inline for the previously-undesigned Verify/Services steps).
library;

const String kBrandLine = 'Appointex for Business';
const String kHeading = 'Join Appointex';
const String kSubheading =
    'Free to join. You only pay when a booking happens.';
const List<String> kStepLabels = ['Details', 'Verify', 'Services'];
const String kNameFieldLabel = 'Business or provider name';
const String kNameFieldHint = 'e.g. Patricia Glam Studio';
const String kCategoryFieldLabel = 'Category';
const List<String> kCategoryOptions = [
  'Hair',
  'Makeup',
  'Nails',
  'Spa & massage',
  'Photography',
];
const String kCategoryFieldHelper =
    'Independent stylists and mobile providers welcome, no shop front required.';
const String kPhoneFieldLabel = 'Phone number';
const String kPhoneFieldHint = '+256 7…';
const String kVerificationFieldLabel = 'Identity verification';
const String kVerificationFieldHint = 'Upload national ID or passport';
const String kContinueLabel = 'Continue';
const String kGoogleCta = 'Continue with Google';

// Verify step (no artboard — new, matches Client_Register's OTP pattern).
const String kOtpTitle = 'Enter the 6-digit code';
const String kOtpHint = '123456';
const String kOtpResendPrompt = "Didn't get a code?";
const String kOtpResendLink = 'Resend';

// Services step (no artboard — new).
const String kFirstServiceHeading = 'Add your first service';
const String kServiceNameFieldLabel = 'Service name';
const String kServiceNameFieldHint = 'e.g. Gel manicure';
const String kServiceDurationFieldLabel = 'Duration (minutes)';
const String kServiceDurationFieldHint = 'e.g. 45';
const String kServicePriceFieldLabel = 'Price (UGX)';
const String kServicePriceFieldHint = 'e.g. 60000';

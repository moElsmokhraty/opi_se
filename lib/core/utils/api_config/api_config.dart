class APIConfig {
  static const String baseUrl = 'https://opi-se-test.onrender.com/';
  static const String login = 'login';
  static const String register = 'signUp';
  static const String changePassword = 'changePassword';
  static const String forgotPassword = 'forgetPassword';
  static const String verifyAccount = 'resendVerificationEmail';
  static const String uploadNationalId =
      'https://ocr-api-ysqv.onrender.com/extract_nationalId';
  static const String submitUserPrefers = 'submitUserPrefers';
  static const String getChat = 'getPartnerChat';
  static const String getMatchRequests = 'getMatchRequest';
  static const String acceptMatchRequest = 'acceptMatchRequest';
  static const String declineMatchRequest = 'declineMatchRequest';
  static const String getProfile = 'searchForSpecificPartner';
  static const String getNotes = 'getAllNotes';
  static const String addNote = 'addNote';
  static const String pinNote = 'pinNote';
  static const String deleteNote = 'deleteNote';
  static const String editNote = 'updateNote';
  static const String getTrash = 'getAllTrashNotes';
  static const String flushTrash = 'flushTrash';
  static const String deleteNoteFromTrash = 'deleteNoteFromTrash';
  static const String restoreNote = 'restoreNote';
  static const String getPartnerRecommendations = 'getPartnerRecommendation';
}

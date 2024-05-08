class APIConfig {
  static const String baseUrl = 'https://opi-se-test.onrender.com/';
  static const String login = 'user/login';
  static const String register = 'user/signUp';
  static const String changePassword = 'user/changePassword';
  static const String forgotPassword = 'user/forgetPassword';
  static const String verifyAccount = 'user/resendVerificationEmail';
  static const String uploadNationalId =
      'https://ocr-api-ysqv.onrender.com/extract_nationalId';
  static const String submitUserPrefers = 'recommendation/submitUserPrefers';
  static const String editUserPrefers = 'recommendation/editUserPrefers';
  static const String editProfile = 'user/editProfile';
  static const String getChat = 'chat/getPartnerChat';
  static const String getChatMedia = 'chat/getChatMedia';
  static const String getMatchRequests = 'match/getMatchRequest';
  static const String acceptMatchRequest = 'match/acceptMatchRequest';
  static const String declineMatchRequest = 'match/declineMatchRequest';
  static const String sendPartnerRequest = 'match/sendPartnerRequest';
  static const String getProfile = 'match/searchForSpecificPartner';
  static const String getNotes = 'note/getAllNotes';
  static const String addNote = 'note/addNote';
  static const String pinNote = 'note/pinNote';
  static const String deleteNote = 'note/deleteNote';
  static const String editNote = 'note/updateNote';
  static const String getTrash = 'trash/getAllTrashNotes';
  static const String flushTrash = 'trash/flushTrash';
  static const String deleteNoteFromTrash = 'trash/deleteNoteFromTrash';
  static const String restoreNote = 'note/restoreNote';
  static const String getPartnerRecommendations =
      'recommendation/getPartnerRecommendation';
  static const changeProfileImage = 'changeProfileImage';
  static const String addTask = 'task/addTask';
  static const String getAllTasks = 'task/getAllTasks';
  static const String getSpecificTasksType = 'task/getSpecificTasksType';
  static const String deleteTask = 'task/deleteTask';
  static const String deleteAllTasksType = 'task/deleteAllTasksType';
  static const String editTask = 'task/editTask';
  static const String uploadChatMedia = 'chat/uploadChatMedia';
  static const String getUserNotifications = 'user/getNotifications';
}

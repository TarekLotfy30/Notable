abstract class Failure {
  const Failure(this.errorMessage);
  final String errorMessage;
}

// Think of error handling like a customer service department in a store:

// Base Failure (Customer Complaint): This is just a record that something 
// went wrong with a message.


// ServerFailure (Online Shopping Complaint): A specific type of complaint 
// that happens when shopping online.


// DioErrorMapper (Customer Service Representative): This person's only job
// is to take technical problems and translate them  into understandable 
// messages for customers. They know all the types of technical issues 
// that can happen.


// ErrorMessages (Company Policy Handbook): Contains all standard responses 
// for different situations, so everyone gives consistent messages.

// When something goes wrong with an online request:

// The app encounters a problem (DioException)
// It hands this problem to the specialist (DioErrorMapper)
// The specialist consults the handbook (ErrorMessages)
// They create the right type of complaint form (ServerFailure)
// This form gets passed up to whoever needs to handle it


  // Future<Result<T>> _handleApiCall<T>(Future<Response<dynamic>> Function()
  // apiCall) async {
  //   try {
  //     final response = await apiCall();
  //     return Result.success(response.data as T);
  //   } on DioException catch (dioError) {
  //     return Result.failure(ServerFailure.fromDioError(dioError));
  //   } catch (e) {
  //     return Result.failure(ServerFailure('Unexpected error: ${e.toString()}'
  // ));
  //   }
  // }

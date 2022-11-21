import 'dart:convert';

import 'package:quiz_app/domain/exceptions/default.exception.dart';
import 'package:quiz_app/infracstructure/services/data/question.data.dart';
import 'package:quiz_app/infracstructure/services/questions/dto/get_questions.response.dart';
import 'package:http/http.dart' as http;

class QuestionsService {
  var ciencias =
      'https://script.googleusercontent.com/macros/echo?user_content_key=6vgH0KQF0y8DaTVME4qE-1-kqInCd9IODaqeGzyQZbvYsdejl7bJXDEOpDygOAu8Um0pwnzfjV6yebP6FHtYZjhgxiRuRPNom5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnPHhAIyNtut0jdqAytUnQem1ru6dt32eHtj1SeeMjmoeAg44UbP78IO8RDDCkE0h31Jzu3sMuDS7AciAoZ5lwdKReRHvKOLBEtz9Jw9Md8uu&lib=MPu2ZfuRQBopk6A6rW1ys4tmXoCfIqdc2';
  var historia =
      'https://script.googleusercontent.com/macros/echo?user_content_key=pHFVJDrf9Dhw9jin3dX2lzjuS6Np6D7nBsI8YOYHaYgMenURu3XhKxXg9o98WhA3_ZfYMRaqDn26pdELZsoSvTzhFwg3OEKzm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnOt2Y9GlRl4i6__un9MK6LAVIH_yX6CFAxo_tjCXsBRvifp2gndBpalUISSj6SvVYd5aopsrVfuPiDAVql1ugy12Q_wVdJA9lQ&lib=ME16mYkJZjf7Z33EnLcdUs6qvqV2VSo87';
  var geografia =
      'https://script.googleusercontent.com/macros/echo?user_content_key=DNAFewZV5uCv8F9ew35Xh08T2jXXw7kFMZIy-K5pwx1auQyc6DkCvK7E518yXc9AebTiah4h6gMA0OM14DNp1XSWSJzLQ89Sm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnIe8ODdENvK4exPdZOGxLuFBTBUhg0qkumDS4K4royXVkfpbl-J8O0YAutkNYDT3EdzcceutGpI_e1RHOjDH5z2eg_faERGp3g&lib=MfUFdktuCkiBspAldR6kV46qvqV2VSo87';
  var portugues =
      'https://script.googleusercontent.com/macros/echo?user_content_key=rIU1sXC51-rFZXh_3VM5iUVj-5ceyalZILjmsBXMio5Fg15-j2Nz-VN3f0azdnmzKsnT95gia0EnUW4qMjigls8qHDFZnqxCm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnFglI_g0z9OtWzCovLE33GAGM9v0Yc6CZgYKtNCL9AKLRlv2VlRKB5XFSODQUgImOrO7HSzcMv3hGhSOM3jzswIWQNRbBE4Tftz9Jw9Md8uu&lib=MKcMOqMcW5yPqZj8LfxhuBdmXoCfIqdc2';
  var matematica =
      'https://script.googleusercontent.com/macros/echo?user_content_key=2u1VAmmDUAUO0i3h899BHE4XnwMTe38O24ifPjh_B2Z0sN_s0Hs4j-M0BK1g58GccmXqyJ_6L0ZFEXb5Ukrc1WhoJQOczD-wm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnO87YqbcIjS7-H-L3qK3YS-CbnJzFrlsyqwBxVuL0D5RYEmj3kz8uyzrgzWrfVZinA2UphuqlACqbJmIm-__bfGklJewGRr49A&lib=MFHxDpw0jeH1WV18kbWrIG6qvqV2VSo87';
  var gerais =
      'https://script.googleusercontent.com/macros/echo?user_content_key=BoONb-4AGYL_yMvtT0sAxWhwEJfrLX9lWQLafpvGb0OG9CcHYBGEyTQgi2R-tFmsm2m62mlVqaP7XBi3bgolo7lSJymmIiirm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnJ1Q3nf3oAEP-F9767djU9xGfWons1A4zT8dvWpMo6NkQ35qyWbFuWOmAutmBWllP0ieZ0iLIjKZ9bHwEbBkNTmOINYYi_j5Iw&lib=MCzz3EeyGEN-kTk7Wl6485aqvqV2VSo87';

  Future<List<QuestionData>> getQuestionsCiencias({
    required String quiz,
  }) async {
    final response = quiz == 'Ciências'
        ? await http.get(Uri.parse(ciencias))
        : quiz == 'História'
            ? await http.get(Uri.parse(historia))
            : quiz == 'Geografia'
                ? await http.get(Uri.parse(geografia))
                : quiz == 'Português'
                    ? await http.get(Uri.parse(portugues))
                    : quiz == 'Matemática'
                        ? await http.get(Uri.parse(matematica))
                        : await http.get(Uri.parse(gerais));
    final data = GetQuestionsResponse.fromJson(json.decode(response.body));

    if (response.statusCode == 200) {
      return data.questions;
    } else {
      switch (response.statusCode) {
        default:
          throw DefaultException(message: 'Falha ao pegar perguntas');
      }
    }
  }
}

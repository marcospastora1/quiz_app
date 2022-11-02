import 'package:quiz_app/domain/core/abstractions/infractructure/response.model.dart';
import 'package:quiz_app/infracstructure/services/data/answer.data.dart';
import 'package:quiz_app/infracstructure/services/data/question.data.dart';
import 'package:quiz_app/infracstructure/services/questions/dto/get_questions.response.dart';

const getQuestionsMock = Response(
  statusCode: 200,
  payload: GetQuestionsResponse(
    questions: [
      QuestionData(
        question: 'Para que servem os antibióticos?',
        answers: [
          AnswerData(
            resposta: 'Para matar bactérias.',
            verdadeira: true,
          ),
          AnswerData(
            resposta: 'Para matar vírus.',
            verdadeira: false,
          ),
          AnswerData(
            resposta: 'Para aliviar dor no estômago.',
            verdadeira: false,
          ),
          AnswerData(
            resposta: 'Para aliviar dor de cabeça.',
            verdadeira: false,
          ),
        ],
      ),
      QuestionData(
        question: 'As vacinas são importantes para:',
        answers: [
          AnswerData(
            resposta: 'Prevenção das doenças',
            verdadeira: true,
          ),
          AnswerData(
            resposta: 'Tratar os sintomas das doenças',
            verdadeira: false,
          ),
          AnswerData(
            resposta: 'Para implantar chip do 5G',
            verdadeira: false,
          ),
          AnswerData(
            resposta: 'Para curar feridas',
            verdadeira: false,
          )
        ],
      ),
      QuestionData(
        question:
            'A gripe é uma doença causada por vírus e é transmitida através de:',
        answers: [
          AnswerData(
            resposta: 'Gotículas de saliva',
            verdadeira: true,
          ),
          AnswerData(
            resposta: 'Picada de insetos',
            verdadeira: false,
          ),
          AnswerData(
            resposta: 'Contato com sangue infectado',
            verdadeira: false,
          ),
          AnswerData(
            resposta: 'Pelo frio',
            verdadeira: false,
          )
        ],
      ),
      QuestionData(
        question:
            'Os microrganismos podem ser visualizados em que instrumento?',
        answers: [
          AnswerData(
            resposta: 'Microscópio',
            verdadeira: true,
          ),
          AnswerData(
            resposta: 'Lupa',
            verdadeira: false,
          ),
          AnswerData(
            resposta: 'Telescópio',
            verdadeira: false,
          ),
          AnswerData(
            resposta: 'Estetoscópio',
            verdadeira: false,
          )
        ],
      ),
      QuestionData(
        question: 'Todos os seres vivos são formados por:',
        answers: [
          AnswerData(
            resposta: 'Células',
            verdadeira: true,
          ),
          AnswerData(
            resposta: 'Membrana celular',
            verdadeira: false,
          ),
          AnswerData(
            resposta: 'Pele',
            verdadeira: false,
          ),
          AnswerData(
            resposta: 'Ossos',
            verdadeira: false,
          )
        ],
      ),
      /* QuestionData(
        question:
            'Doenças transmitidas por vírus, são contagiosas?',
        answers: [
          AnswerData(
            resposta: 'Sim',
            verdadeira: true,
          ),
          AnswerData(
            resposta: 'Não',
            verdadeira: false,
          )
        ],
      ), */
    ],
  ),
);

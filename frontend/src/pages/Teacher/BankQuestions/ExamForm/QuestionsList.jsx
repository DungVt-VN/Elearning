import React, { useState, useEffect } from "react";
import AutoAwesomeIcon from "@mui/icons-material/AutoAwesome";
import axios from "axios";
import { message } from "antd";

function QuestionsList({ chapters, questionList, setQuestionList }) {
  const [expandedChapter, setExpandedChapter] = useState(null);
  const [questionData, setQuestionData] = useState([]);
  const [selectedQuestionCount, setSelectedQuestionCount] = useState(0);

  useEffect(() => {
    const fetchQuestionListByChapterId = async (chapterId) => {
      const token = localStorage.getItem("token");
      try {
        const res = await axios.get(`http://localhost:8800/api/questions/chapters/${chapterId}`, {
          headers: {
            Authorization: `Bearer ${token}`, // Pass the token in the Authorization header
          },
        });
        setQuestionData(res.data);
      } catch (err) {
        console.log(err);
      }
    };

    if (expandedChapter !== null) {
      fetchQuestionListByChapterId(chapters[expandedChapter]?.ChapterId);
    }

    // Clean-up function
    return () => {
      setQuestionData([]); // Reset the questionData state to an initial value
    };
  }, [expandedChapter]);
  const toggleDropdown = (index) => {
    if (expandedChapter === index) {
      setExpandedChapter(null);
    } else {
      setExpandedChapter(index);
    }
  };

  const handleCheckboxChange = (event, question) => {
    const isChecked = event.target.checked;

    setQuestionList((prevQuestionList) => {
      const newQuestionList = [...prevQuestionList];
      const chapterQuestions = newQuestionList[expandedChapter] || [];

      if (isChecked) {
        newQuestionList[expandedChapter] = [
          ...chapterQuestions,
          question.QuestionId,
        ];
      } else {
        newQuestionList[expandedChapter] = chapterQuestions.filter(
          (q) => q !== question.QuestionId
        );
      }

      return newQuestionList;
    });
  };

  const handleSelectQuestions = () => {
    if (
      selectedQuestionCount > 0 &&
      selectedQuestionCount <= questionData.length
    ) {
      const shuffledQuestions = [...questionData].sort(
        () => 0.5 - Math.random()
      );
      const selectedQuestions = shuffledQuestions.slice(
        0,
        selectedQuestionCount
      );
      const selectedQuestionIds = selectedQuestions.map(
        (question) => question.QuestionId
      );
      const updatedQuestionList = [...questionList];
      updatedQuestionList[expandedChapter] = selectedQuestionIds;
      setQuestionList(updatedQuestionList);
    } else {
      message.warning(
        "Exceeded total number of questions in the chapterExceed the total number of questions in the chapter!"
      );
    }
  };

  return (
    <div className="py-3 w-full my-2">
      {chapters.map((chapter, index) => (
        <div className="relative" key={index}>
          <p
            id={`dropdownCheckboxButton-${index}`}
            className="w-[600px]  justify-between  my-2 text-gray-800 focus:ring-1 border border-blue-300 focus:outline-none focus:ring-blue-300 font-medium rounded-md text-sm px-2.5 py-2.5 text-center inline-flex items-center "
            onClick={() => {
              toggleDropdown(index);
            }}
          >
            {chapter?.ChapterTitle}
            <svg
              className="w-2.5 h-2.5 ms-3"
              aria-hidden="true"
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 10 6"
            >
              <path
                stroke="currentColor"
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth="2"
                d="m1 1 4 4 4-4"
              />
            </svg>
          </p>
          {expandedChapter === index && (
            <div
              className="top-full mb-3 left-0 z-10 w-[600px] bg-white divide-y divide-slate-300 px-3 rounded-lg shadow"
              aria-labelledby={`dropdownCheckboxButton-${index}`}
            >
              <ul className="p-3 space-y-3 text-sm text-gray-700">
                {questionData.length > 0 ? (
                  questionData.map((data, index) => (
                    <li
                      key={index}
                      className="flex justify-between items-center"
                    >
                      <div className="flex items-center truncate ...">
                        <input
                          id={`checkbox-item-${index}`}
                          type="checkbox"
                          value=""
                          checked={questionList[expandedChapter]?.includes(
                            data.QuestionId
                          )}
                          onChange={(event) =>
                            handleCheckboxChange(event, data)
                          }
                          className="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500"
                        />
                        <label
                          htmlFor={`checkbox-item-${index}`}
                          className="ms-2 text-sm font-medium text-gray-900"
                        >
                          <span>{data?.QuestionContent}</span>
                        </label>
                      </div>
                      <div>
                        {data.QuestionType === "Single Choice" && (
                          <svg
                            width="24px"
                            height="24px"
                            viewBox="0 0 16 16"
                            xmlns="http://www.w3.org/2000/svg"
                            fill="#16A34A" // Thay đổi màu fill thành mã hex màu xanh lá cây (#00FF00)
                            className="bi bi-check2-circle"
                          >
                            <path d="M2.5 8a5.5 5.5 0 0 1 8.25-4.764.5.5 0 0 0 .5-.866A6.5 6.5 0 1 0 14.5 8a.5.5 0 0 0-1 0 5.5 5.5 0 1 1-11 0z" />
                            <path d="M15.354 3.354a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l7-7z" />
                          </svg>
                        )}
                        {data.QuestionType === "Multiple Choice" && (
                          <svg
                            width="24px"
                            height="24px"
                            viewBox="0 0 16 16"
                            xmlns="http://www.w3.org/2000/svg"
                            fill="#16A34A"
                            class="bi bi-check2-square"
                          >
                            <path d="M3 14.5A1.5 1.5 0 0 1 1.5 13V3A1.5 1.5 0 0 1 3 1.5h8a.5.5 0 0 1 0 1H3a.5.5 0 0 0-.5.5v10a.5.5 0 0 0 .5.5h10a.5.5 0 0 0 .5-.5V8a.5.5 0 0 1 1 0v5a1.5 1.5 0 0 1-1.5 1.5H3z" />
                            <path d="m8.354 10.354 7-7a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0z" />
                          </svg>
                        )}
                        {data.QuestionType === "Text Input" && (
                          <svg
                            width="24px"
                            height="24px"
                            viewBox="0 0 24 24"
                            fill="#16A34A" // Thay đổi màu fill thành mã hex màu xanh lá cây (#00FF00)
                            xmlns="http://www.w3.org/2000/svg"
                          >
                            <path
                              d="M9.95197 6.25C9.52211 6.24993 9.12024 6.24986 8.79192 6.29891C8.42102 6.35432 8.04 6.4853 7.73542 6.82371C7.44103 7.15082 7.3371 7.54061 7.29204 7.91294C7.24993 8.26096 7.24996 8.69238 7.25 9.17954L7.25 9.75C7.25 10.1642 7.58579 10.5 8 10.5C8.41421 10.5 8.75 10.1642 8.75 9.75V9.22222C8.75 8.67931 8.75129 8.34011 8.78118 8.09313C8.7952 7.97725 8.81273 7.91048 8.8269 7.87221C8.83885 7.83993 8.84739 7.83046 8.85023 7.82731L8.85104 7.82637C8.8524 7.82473 8.8534 7.82353 8.86242 7.8194C8.87904 7.8118 8.92168 7.79617 9.01354 7.78245C9.21765 7.75196 9.50511 7.75 10 7.75H11.25V16.25H9.5C9.08579 16.25 8.75 16.5858 8.75 17C8.75 17.4142 9.08579 17.75 9.5 17.75H15C15.4142 17.75 15.75 17.4142 15.75 17C15.75 16.5858 15.4142 16.25 15 16.25H12.75V7.75H14C14.4949 7.75 14.7824 7.75196 14.9865 7.78245C15.0783 7.79617 15.121 7.8118 15.1376 7.8194C15.1466 7.82353 15.1476 7.82473 15.149 7.82637L15.1496 7.82716C15.1525 7.83031 15.1611 7.83993 15.1731 7.87221C15.1873 7.91048 15.2048 7.97725 15.2188 8.09313C15.2487 8.34011 15.25 8.67931 15.25 9.22222V9.75C15.25 10.1642 15.5858 10.5 16 10.5C16.4142 10.5 16.75 10.1642 16.75 9.75L16.75 9.17953C16.75 8.69238 16.7501 8.26096 16.708 7.91294C16.6629 7.54061 16.559 7.15082 16.2646 6.82371C15.96 6.4853 15.579 6.35432 15.2081 6.29891C14.8798 6.24986 14.4779 6.24993 14.048 6.25H9.95197Z"
                              fill="#16A34A"
                            />
                            <path
                              fill-rule="evenodd"
                              clip-rule="evenodd"
                              d="M11.9426 1.25C9.63423 1.24999 7.82519 1.24998 6.41371 1.43975C4.96897 1.63399 3.82895 2.03933 2.93414 2.93414C2.03933 3.82895 1.63399 4.96897 1.43975 6.41371C1.24998 7.82519 1.24999 9.63423 1.25 11.9426V12.0574C1.24999 14.3658 1.24998 16.1748 1.43975 17.5863C1.63399 19.031 2.03933 20.1711 2.93414 21.0659C3.82895 21.9607 4.96897 22.366 6.41371 22.5603C7.82519 22.75 9.63423 22.75 11.9426 22.75H12.0574C14.3658 22.75 16.1748 22.75 17.5863 22.5603C19.031 22.366 20.1711 21.9607 21.0659 21.0659C21.9607 20.1711 22.366 19.031 22.5603 17.5863C22.75 16.1748 22.75 14.3658 22.75 12.0574V11.9426C22.75 9.63423 22.75 7.82519 22.5603 6.41371C22.366 4.96897 21.9607 3.82895 21.0659 2.93414C20.1711 2.03933 19.031 1.63399 17.5863 1.43975C16.1748 1.24998 14.3658 1.24999 12.0574 1.25H11.9426ZM3.9948 3.9948C4.56445 3.42514 5.33517 3.09825 6.61358 2.92637C7.91356 2.75159 9.62178 2.75 12 2.75C14.3782 2.75 16.0864 2.75159 17.3864 2.92637C18.6648 3.09825 19.4355 3.42514 20.0052 3.9948C20.5749 4.56445 20.9018 5.33517 21.0736 6.61358C21.2484 7.91356 21.25 9.62178 21.25 12C21.25 14.3782 21.2484 16.0864 21.0736 17.3864C20.9018 18.6648 20.5749 19.4355 20.0052 20.0052C19.4355 20.5749 18.6648 20.9018 17.3864 21.0736C16.0864 21.2484 14.3782 21.25 12 21.25C9.62178 21.25 7.91356 21.2484 6.61358 21.0736C5.33517 20.9018 4.56445 20.5749 3.9948 20.0052C3.42514 19.4355 3.09825 18.6648 2.92637 17.3864C2.75159 16.0864 2.75 14.3782 2.75 12C2.75 9.62178 2.75159 7.91356 2.92637 6.61358C3.09825 5.33517 3.42514 4.56445 3.9948 3.9948Z"
                              fill="#16A34A"
                            />
                          </svg>
                        )}
                      </div>
                    </li>
                  ))
                ) : (
                  <>
                    <span className="text-gray-900 opacity-85 font-semibold italic">
                      No data
                    </span>
                  </>
                )}
              </ul>
              <div className="py-3">
                <label
                  htmlFor="questionCountInput"
                  className="block mb-1  text-sm font-medium text-gray-900"
                >
                  Choose questions at random:
                </label>

                <div className="flex justify-between items-center">
                  <input
                    id="questionCountInput"
                    type="number"
                    value={selectedQuestionCount}
                    min={0}
                    onChange={(event) =>
                      setSelectedQuestionCount(Number(event.target.value))
                    }
                    className="max-w-20 min-h-10 border border-blue-300 text-black text-sm rounded-md focus:outline-blue-500 focus:ring-blue-500 focus:border-blue-500 block p-2.5 text-center"
                  />
                  <button
                    onClick={() => {
                      handleSelectQuestions();
                    }}
                    className=" flex justify-center items-center gap-2 px-3 py-2 text-sm font-medium text-white bg-blue-500 rounded hover:bg-blue-600"
                  >
                    <AutoAwesomeIcon fontSize="small" />
                    Get Random
                  </button>
                </div>
              </div>
            </div>
          )}
        </div>
      ))}
    </div>
  );
}

export default QuestionsList;

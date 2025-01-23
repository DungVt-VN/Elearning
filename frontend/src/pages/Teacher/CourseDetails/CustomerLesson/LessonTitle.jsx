import React, { useState, useEffect } from "react";
import axios from "axios";

import EditIcon from "@mui/icons-material/Edit";
import Button from "@mui/material/Button";
import TextField from "@mui/material/TextField";
import { message } from "antd";

import "../EditWrite.scss";

export default function LessonTitle({ title, subTitle, chapterId, lessonId }) {
  const [lessonTitle, setLessonTitle] = useState("");
  const [isEditing, setIsEditing] = useState(false);
  const fetchLessonTitle = async () => {
    try {
      const res = await axios.get(
        `http://localhost:8800/api/courses/chapters/${chapterId}/lessons/title/${lessonId}`
      );
      setLessonTitle(res.data.lessonTitle);
    } catch (error) {
      console.error(error);
    }
  };

  useEffect(() => {
    fetchLessonTitle();
  }, [lessonId]);
  const handleIconClick = () => {
    setIsEditing(!isEditing);
  };

  const handleCancelClick = () => {
    setIsEditing(false);
  };

  const handleSaveClick = async () => {
    try {
      await axios.put(
        `http://localhost:8800/api/courses/chapters/${chapterId}/lessons/title/${lessonId}`,
        {
          lessonTitle: lessonTitle,
        }
      );
      message.success("Sửa thành công!");
    } catch (error) {
      message.error(error.message);
    }
    setIsEditing(false);
  };

  return (
    <div className="course-title">
      <div className="course-title-wrapper">
        <div className="course-title-header  mt-3 mb-3">
          <p>{title}</p>
          {!isEditing ? (
            <div onClick={handleIconClick} className="course-title-action">
              <EditIcon fontSize="small" />
              <span>{subTitle}</span>
            </div>
          ) : (
            <div onClick={handleCancelClick} className="course-title-action">
              <span>Hủy</span>
            </div>
          )}
        </div>
        <div className="course-title-body">
          {!isEditing ? (
            !lessonTitle ? (
              <div className="italic text-slate-400		">
                Không có tiêu đề bài học
              </div>
            ) : (
              <div>{lessonTitle}</div>
            )
          ) : (
            <div className="grid">
              <TextField
                value={lessonTitle}
                className="bg-main"
                onChange={(e) => setLessonTitle(e.target.value)}
              />
              <button
                className="text-white  border-none bg-gray-800 mt-3 py-1.5 rounded-md px-3 w-max hover:bg-gray-700"
                onClick={handleSaveClick}
              >
                Lưu
              </button>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

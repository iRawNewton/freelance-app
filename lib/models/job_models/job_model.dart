// To parse this JSON data, do
//
//     final jobDetails = jobDetailsFromJson(jsonString);

import 'dart:convert';

List<JobDetails> jobDetailsFromJson(String str) =>
    List<JobDetails>.from(json.decode(str).map((x) => JobDetails.fromJson(x)));

String jobDetailsToJson(List<JobDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobDetails {
  String jobId;
  String jobTitle;
  String jobType;
  String companyName;
  String location;
  String salaryMin;
  String salaryMax;
  String category;
  String shortDescription;
  String longDescription;
  String jobRequirements;
  String jobResponsibilities;
  String qualifications;
  String skills;
  String jobCategory;
  String jobSubCategory;
  String categoryName;
  String subcategoryName;

  JobDetails({
    required this.jobId,
    required this.jobTitle,
    required this.jobType,
    required this.companyName,
    required this.location,
    required this.salaryMin,
    required this.salaryMax,
    required this.category,
    required this.shortDescription,
    required this.longDescription,
    required this.jobRequirements,
    required this.jobResponsibilities,
    required this.qualifications,
    required this.skills,
    required this.jobCategory,
    required this.jobSubCategory,
    required this.categoryName,
    required this.subcategoryName,
  });

  factory JobDetails.fromJson(Map<String, dynamic> json) => JobDetails(
        jobId: json["job_id"],
        jobTitle: json["job_title"],
        jobType: json["job_type"],
        companyName: json["company_name"],
        location: json["location"],
        salaryMin: json["salary_min"],
        salaryMax: json["salary_max"],
        category: json["category"],
        shortDescription: json["short_description"],
        longDescription: json["long_description"],
        jobRequirements: json["job_requirements"],
        jobResponsibilities: json["job_responsibilities"],
        qualifications: json["qualifications"],
        skills: json["skills"],
        jobCategory: json["job_category"],
        jobSubCategory: json["job_sub_category"],
        categoryName: json["category_name"],
        subcategoryName: json["subcategory_name"],
      );

  Map<String, dynamic> toJson() => {
        "job_id": jobId,
        "job_title": jobTitle,
        "job_type": jobType,
        "company_name": companyName,
        "location": location,
        "salary_min": salaryMin,
        "salary_max": salaryMax,
        "category": category,
        "short_description": shortDescription,
        "long_description": longDescription,
        "job_requirements": jobRequirements,
        "job_responsibilities": jobResponsibilities,
        "qualifications": qualifications,
        "skills": skills,
        "job_category": jobCategory,
        "job_sub_category": jobSubCategory,
        "category_name": categoryName,
        "subcategory_name": subcategoryName,
      };
}

class ApplyController < ApplicationController
before_action :authenticate_user!

    def top
        
    end

    def test
        @testdata_ID = []
        @testdata_Name = []

        require "google/cloud/bigquery"
        bigquery = Google::Cloud::Bigquery.new
        sql     = "select * from test_data_set.PLR0600T_test2 limit 10"
        results = bigquery.query sql

        results.each do |row|
            puts "#{row[:url]}: #{row[:view_count]} views"
            @testdata_ID.push(row[:ANALYTICS_ID])
            @testdata_Name.push(row[:MEMBER_NAME])
        end
        
    end
    
    def testAfterGetValue
        @testdata_ID = []
        @testdata_Name = []
        @testdata_Feedback = []

        require "google/cloud/bigquery"
        bigquery = Google::Cloud::Bigquery.new
        sql     = "select * from test_data_set.PLR0600T_test2 limit 10"
        results = bigquery.query sql

        results.each do |row|
            puts "#{row[:url]}: #{row[:view_count]} views"
            @testdata_ID.push(row[:ANALYTICS_ID])
            @testdata_Name.push(row[:MEMBER_NAME])
            @testdata_Feedback.push(row[:FEEDBACK])
        end
        
        @testdata_Feedback_sentence = ""
        @testdata_Feedback.each do |data|
            @testdata_Feedback_sentence = @testdata_Feedback_sentence + "\n" + data
        end
        
    end

    def index
        @currentView = "applyIndex"
#        @firebaseInfo = FirebaseInfo.find_by(id:1)
        @applyID = ""
        
    
    end    
    
    def show        
        @currentView = "applyShow"
#        @firebaseInfo = FirebaseInfo.find_by(id:1)
        @applyID = params[:applyID]
    end

    def edit
        @currentView = "applyEdit"
#        @firebaseInfo = FirebaseInfo.find_by(id:1)
        @applyID = params[:applyID]

#        @anaPointTitle = ["ANGLE_NECK","ANGLE_R_HIP","ANGLE_L_HIP","ANGLE_R_KNEE","ANGLE_L_KNEE","ANGLE_R_ANKLE","ANGLE_L_ANKLE","ANGLE_AXIS","ANGLE_L_ELBOW","ANGLE_R_ELBOW","ANGLE_L_HAND","ANGLE_R_HAND"]
#        @angleValue = []
#        @detailScore = []
#        @fbFlag = []
#        @fbContent = []
#
#        @anaCriteriaTitle = ["ヘッドポジション","レッグ","軸","腕振り","接地"]
#        @criteriaScore = []
#
#        require "google/cloud/bigquery"
#        bigquery = Google::Cloud::Bigquery.new
#
#        sql1     = "select * from kstudio.KST0610T_userValue where ANALYTICS_ID = '2021_02_16_00_27_41_Kスタデモ' and FRAME = '1';"
#        results1 = bigquery.query sql1
#        
#        sql2     = "select * from kstudio.KST0610T_userScore where ANALYTICS_ID = '2021_02_16_00_27_41_Kスタデモ' and FRAME = '1';"
#        results2 = bigquery.query sql2
#
#        sql3     = "select * from kstudio.KST0610T_userScoreFB where ANALYTICS_ID = '2021_02_16_00_27_41_Kスタデモ' and FRAME = '1';"
#        results3 = bigquery.query sql3
#
#        results1.each do |row|
#            puts "#{row[:url]}: #{row[:view_count]} views"
#            @angleValue.push(row[:ANGLE_NECK].floor)
#            @angleValue.push(row[:ANGLE_R_HIP].floor)
#            @angleValue.push(row[:ANGLE_L_HIP].floor)
#            @angleValue.push(row[:ANGLE_R_KNEE].floor)
#            @angleValue.push(row[:ANGLE_L_KNEE].floor)
#            @angleValue.push(row[:ANGLE_R_ANKLE].floor)
#            @angleValue.push(row[:ANGLE_L_ANKLE].floor)
#            @angleValue.push(row[:ANGLE_AXIS].floor)
#            @angleValue.push(row[:ANGLE_L_ELBOW].floor)
#            @angleValue.push(row[:ANGLE_R_ELBOW].floor)
#            @angleValue.push(row[:ANGLE_L_HAND].floor)
#            @angleValue.push(row[:ANGLE_R_HAND].floor)
#            @angleValue.push(row[:ANGLE_GROUND].floor)
#        end
#
#        results2.each do |row|
#            puts "#{row[:url]}: #{row[:view_count]} views"
#            @detailScore.push(row[:ANGLE_NECK].floor)
#            @detailScore.push(row[:ANGLE_R_HIP].floor)
#            @detailScore.push(row[:ANGLE_L_HIP].floor)
#            @detailScore.push(row[:ANGLE_R_KNEE].floor)
#            @detailScore.push(row[:ANGLE_L_KNEE].floor)
#            @detailScore.push(row[:ANGLE_R_ANKLE].floor)
#            @detailScore.push(row[:ANGLE_L_ANKLE].floor)
#            @detailScore.push(row[:ANGLE_AXIS].floor)
#            @detailScore.push(row[:ANGLE_L_ELBOW].floor)
#            @detailScore.push(row[:ANGLE_R_ELBOW].floor)
#            @detailScore.push(row[:ANGLE_L_HAND].floor)
#            @detailScore.push(row[:ANGLE_R_HAND].floor)
#            @detailScore.push(row[:ANGLE_GROUND].floor)
#        end
#
#        results3.each do |row|
#            puts "#{row[:url]}: #{row[:view_count]} views"
#            @fbFlag.push(row[:ANGLE_NECK].floor)
#            @fbFlag.push(row[:ANGLE_R_HIP].floor)
#            @fbFlag.push(row[:ANGLE_L_HIP].floor)
#            @fbFlag.push(row[:ANGLE_R_KNEE].floor)
#            @fbFlag.push(row[:ANGLE_L_KNEE].floor)
#            @fbFlag.push(row[:ANGLE_R_ANKLE].floor)
#            @fbFlag.push(row[:ANGLE_L_ANKLE].floor)
#            @fbFlag.push(row[:ANGLE_AXIS].floor)
#            @fbFlag.push(row[:ANGLE_L_ELBOW].floor)
#            @fbFlag.push(row[:ANGLE_R_ELBOW].floor)
#            @fbFlag.push(row[:ANGLE_L_HAND].floor)
#            @fbFlag.push(row[:ANGLE_R_HAND].floor)
#            @fbFlag.push(row[:ANGLE_GROUND].floor)
#        end
#        
#        @criteriaScore[0] = @detailScore[0].floor
#        @criteriaScore[1] = ((@detailScore[1] + @detailScore[2] + @detailScore[3] + @detailScore[4] + @detailScore[5] + @detailScore[6])/6).floor
#        @criteriaScore[2] = @detailScore[7].floor
#        @criteriaScore[3] = ((@detailScore[8] + @detailScore[9] + @detailScore[10] + @detailScore[11])/4).floor
#        @criteriaScore[4] = @detailScore[12].floor
#        @totalScore = ((@criteriaScore[0] + @criteriaScore[1] + @criteriaScore[2] + @criteriaScore[3] + @criteriaScore[4])/5).floor
        
    end

    def create
        @firebaseInfo = FirebaseInfo.new(
    apiKey: "AIzaSyAjImPxYZZ3LmxAJ2L3AbGETd9F9BXXeKI",
    authDomain: "coachingapp1-stg.firebaseapp.com",
    databaseURL: "https://coachingapp1-stg-default-rtdb.firebaseio.com",
    projectId: "coachingapp1-stg",
    storageBucket: "coachingapp1-stg.appspot.com",
    messagingSenderId: "806777259833",
    appId: "1:806777259833:web:334e1d272d7ed77b7a4ae8",
    measurementId: "G-H2WNN8Q892"
            )   
        @firebaseInfo.save

        redirect_to("/apply/index")
        
    end
end

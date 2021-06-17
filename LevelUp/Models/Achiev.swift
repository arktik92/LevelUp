//
//  Achiev.swift
//  LevelUp
//
//  Created by Laura LONG on 10/06/2021.
//

import Foundation

enum Achiev {
    
    case padawanAstro, jediAstro, masterAstro, superStar, megaStar, gigastar, propre1, propre2, propre3, survie1, survie2, survie3, quotidien1, quotidien2, quotidien3, professionnel1, professionnel2, professionnel3, devPerso1, devPerso2, devPerso3, pratique1, pratique2, pratique3
    
    
    var name : String {
        switch self {
        case.padawanAstro : return "Je sais déjà tout ça, moi?" //5 badges(achiev) obtenus
        case.jediAstro : return "Matière grise en expansion"    //15 badges(achiev) obtenus
        case.masterAstro : return "Je suis le maître!"  //30 badges(achiev) obtenus
        case.superStar : return "Début d'une aventure"      //5 seriousgame terminés
        case.megaStar : return "Explorateur populaire"      //10 seriousgame terminés
        case.gigastar : return "Explorateur de la galaxie"  //20 seriousgame terminés
        case.propre1 : return "Plus jamais sale!"   //10pts en Hygiène
        case.propre2 : return "Comme un sous neuf"  //20pts en Hygiène
        case.propre3 : return "Moi, maniaque?"      //30pts en Hygiène
        case.survie1 : return "On ne sait jamais" //10pts en Survie
        case.survie2 : return "Autonome"          //20pts en Survie
        case.survie3 : return "Tarzan"            //30pts en Survie
        case.quotidien1 : return "Je ne vois plus choses comme avant"  //10pts en Quotidien
        case.quotidien2 : return "L'utile au quotidien"                //20pts en Quotidien
        case.quotidien3 : return "Astuce est mon maître-mot"           //30pts en Quotidien
        case.professionnel1 : return "Où est mon bureau?"                   //10pts en Professionnel
        case.professionnel2 : return "Tellement de professionnalisme"       //20pts en Professionnel
        case.professionnel3 : return "Pro jusqu'au bout"                    //30pts en Professionnel
        case.devPerso1 : return "Transformation commencée"   //10pts en DeveloppementPersonnel
        case.devPerso2 : return "Je me sens différent"      //20pts en DeveloppementPersonnel
        case.devPerso3 : return "Le nouveau Moi"            //30pts en DeveloppementPersonnel
        case.pratique1 : return "Besoin de conseil"             //10pts en Pratique
        case.pratique2 : return "Hmm...pratique n'est-ce pas?"  //20pts en Pratique
        case.pratique3 : return "Saviez-vous que...?"              //30pts en Pratique
        }
    }
    var imageName : String {
        switch self {
        case.padawanAstro : return "gem0"
        case.jediAstro : return "gem1"
        case.masterAstro : return "gem2"
        case.superStar : return "gem3"
        case.megaStar : return "gem4"
        case.gigastar : return "gem5"
        case.propre1 : return "gem6"  //10pts en Hygiène
        case.propre2 : return "gem7"  //20pts en Hygiène
        case.propre3 : return "gem8"  //30pts en Hygiène
        case.survie1 : return "gem9"  //10pts en Survie
        case.survie2 : return "gem10"  //20pts en Survie
        case.survie3 : return "gem11"  //30pts en Survie
        case.quotidien1 : return "gem12"  //10pts en Quotidien
        case.quotidien2 : return "gem13"  //20pts en Quotidien
        case.quotidien3 : return "gem14"  //30pts en Quotidien
        case.professionnel1 : return "gem15"  //10pts en Professionnel
        case.professionnel2 : return "gem16"  //20pts en Professionnel
        case.professionnel3 : return "gem17"  //30pts en Professionnel
        case.devPerso1 : return "gem19"  //10pts en DeveloppementPersonnel
        case.devPerso2 : return "gem20"  //20pts en DeveloppementPersonnel
        case.devPerso3 : return "gem21"  //30pts en DeveloppementPersonnel
        case.pratique1 : return "gem22"  //10pts en Pratique
        case.pratique2 : return "gem23"  //20pts en Pratique
        case.pratique3 : return "gem24"  //30pts en Pratique
        }
    }
    var shortDescription : String {
        switch self {
        case.padawanAstro : return "5 badges obtenus"
        case.jediAstro : return "15 badges obtenus"
        case.masterAstro : return "30 badges obtenus"
        case.superStar : return "5 Serious Game finis"
        case.megaStar : return "10 Serious Game finis"
        case.gigastar : return "20 Serious Game finis"
        case.propre1 : return "10pts en Hygiène"  //10pts en Hygiène
        case.propre2 : return "20pts en Hygiène"  //20pts en Hygiène
        case.propre3 : return "30pts en Hygiène"  //30pts en Hygiène
        case.survie1 : return "10pts en Survie"  //10pts en Survie
        case.survie2 : return "20pts en Survie"  //20pts en Survie
        case.survie3 : return "30pts en Survie"  //30pts en Survie
        case.quotidien1 : return "10pts en Quotidien"  //10pts en Quotidien
        case.quotidien2 : return "20pts en Quotidien"  //20pts en Quotidien
        case.quotidien3 : return "30pts en Quotidien"  //30pts en Quotidien
        case.professionnel1 : return "10pts en Professionnel"  //10pts en Professionnel
        case.professionnel2 : return "20pts en Professionnel"  //20pts en Professionnel
        case.professionnel3 : return "30pts en Professionnel"  //30pts en Professionnel
        case.devPerso1 : return "10pts en Dév. Personnel"  //10pts en DeveloppementPersonnel
        case.devPerso2 : return "20pts en Dév. Personnel"  //20pts en DeveloppementPersonnel
        case.devPerso3 : return "30pts en Dév. Personnel"  //30pts en DeveloppementPersonnel
        case.pratique1 : return "10pts en Pratique"  //10pts en Pratique
        case.pratique2 : return "20pts en Pratique"  //20pts en Pratique
        case.pratique3 : return "30pts en Pratique"  //30pts en Pratique
        }
    }
    
}

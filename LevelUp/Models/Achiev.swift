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
        case.padawanAstro : return "VVVV"
        case.jediAstro : return "VVVV"
        case.masterAstro : return "VVVV"
        case.superStar : return "VVVV"
        case.megaStar : return "VVVV"
        case.gigastar : return "VVVV"
        case.propre1 : return "VVVV"  //10pts en Hygiène
        case.propre2 : return "VVVV"  //20pts en Hygiène
        case.propre3 : return "VVVV"  //30pts en Hygiène
        case.survie1 : return "VVVV"  //10pts en Survie
        case.survie2 : return "VVVV"  //20pts en Survie
        case.survie3 : return "VVVV"  //30pts en Survie
        case.quotidien1 : return "VVVV"  //10pts en Quotidien
        case.quotidien2 : return "VVVV"  //20pts en Quotidien
        case.quotidien3 : return "VVVV"  //30pts en Quotidien
        case.professionnel1 : return "VVVV"  //10pts en Professionnel
        case.professionnel2 : return "VVVV"  //20pts en Professionnel
        case.professionnel3 : return "VVVV"  //30pts en Professionnel
        case.devPerso1 : return "VVVV"  //10pts en DeveloppementPersonnel
        case.devPerso2 : return "VVVV"  //20pts en DeveloppementPersonnel
        case.devPerso3 : return "VVVV"  //30pts en DeveloppementPersonnel
        case.pratique1 : return "VVVV"  //10pts en Pratique
        case.pratique2 : return "VVVV"  //20pts en Pratique
        case.pratique3 : return "VVVV"  //30pts en Pratique
        }
    }
    
}


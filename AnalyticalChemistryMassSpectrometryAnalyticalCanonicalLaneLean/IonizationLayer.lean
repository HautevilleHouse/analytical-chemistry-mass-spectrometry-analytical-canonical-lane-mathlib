import HautevilleHouse.AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean.MassSpectrometryBase

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean

structure IonizationCertificate where
  ionizationMethod : String
  ionizationEfficiency : Float
  fragmentationPattern : String
  sourceStability : Bool

deriving Repr, DecidableEq

def electronImpactIonization : IonizationCertificate := {
  ionizationMethod := "Electron Impact",
  ionizationEfficiency := 0.1,
  fragmentationPattern := "high fragmentation",
  sourceStability := true
}

def electrosprayIonization : IonizationCertificate := {
  ionizationMethod := "Electrospray",
  ionizationEfficiency := 0.8,
  fragmentationPattern := "low fragmentation",
  sourceStability := true
}

def matrixAssistedLaserDesorptionIonization : IonizationCertificate := {
  ionizationMethod := "MALDI",
  ionizationEfficiency := 0.5,
  fragmentationPattern := "moderate",
  sourceStability := true
}

def IonizationLayerClosed (C : IonizationCertificate) : Prop := 
  C.sourceStability = true ∧ C.ionizationEfficiency > 0

theorem ionization_layer_closed_ei : IonizationLayerClosed electronImpactIonization := by
  exact And.intro rfl (by decide)

theorem ionization_layer_closed_esi : IonizationLayerClosed electrosprayIonization := by
  exact And.intro rfl (by decide)

theorem ionization_layer_closed_maldi : IonizationLayerClosed matrixAssistedLaserDesorptionIonization := by
  exact And.intro rfl (by decide)

end AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean
end HautevilleHouse
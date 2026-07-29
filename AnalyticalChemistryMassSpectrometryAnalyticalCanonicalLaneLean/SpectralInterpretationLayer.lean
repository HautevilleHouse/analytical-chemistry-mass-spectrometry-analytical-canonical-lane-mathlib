import HautevilleHouse.AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean.MassSpectrometryBase

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean

structure SpectralInterpretationCertificate where
  massCalibration : Float → Float
  peakShape : String
  resolutionChecked : Bool
  isotopicPattern : String
  fragmentationModel : String

deriving Repr, DecidableEq

def defaultSpectralInterpretation : SpectralInterpretationCertificate := {
  massCalibration := λ x => x,
  peakShape := "Gaussian",
  resolutionChecked := true,
  isotopicPattern := "monoisotopic",
  fragmentationModel := "quadrupole"
}

def highResolutionInterpretation : SpectralInterpretationCertificate := {
  massCalibration := λ x => x * 1.00001,
  peakShape := "Lorentzian",
  resolutionChecked := true,
  isotopicPattern := "averaged",
  fragmentationModel := "orbitrap"
}

def SpectralInterpretationLayerClosed (C : SpectralInterpretationCertificate) : Prop := 
  C.resolutionChecked = true ∧ C.peakShape = "Gaussian" ∨ C.peakShape = "Lorentzian"

theorem default_spectral_interpretation_closed : SpectralInterpretationLayerClosed defaultSpectralInterpretation := by
  exact Or.inl (And.intro rfl rfl)

theorem high_resolution_interpretation_closed : SpectralInterpretationLayerClosed highResolutionInterpretation := by
  exact Or.inr (And.intro rfl rfl)

end AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean
end HautevilleHouse
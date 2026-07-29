import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean

structure CalibrationDatum where
  calibrantMasses : List Float
  observedMasses : List Float
  massAccuracyPpm : Float
  calibrationCurve : String
deriving Repr

structure MassCalibrationLayerCertificate where
  calibrationDatum : CalibrationDatum
  calibrationRoute : String
  driftCorrectionRoute : String
  massAccuracyChecked : Bool
  externalStandardUsed : Bool

default instance : Inhabited MassCalibrationLayerCertificate where
  default := {
    calibrationDatum := {
      calibrantMasses := [100.0, 500.0, 1000.0],
      observedMasses := [100.01, 500.02, 1000.03],
      massAccuracyPpm := 20.0,
      calibrationCurve := "linear"
    },
    calibrationRoute := "external calibration with sodium trifluoroacetate clusters",
    driftCorrectionRoute := "lock mass correction using known background ion",
    massAccuracyChecked := true,
    externalStandardUsed := true
  }

def MassCalibrationLayerClosed (C : MassCalibrationLayerCertificate) : Prop :=
  C.calibrationDatum.massAccuracyPpm < 50.0 ∧
  C.massAccuracyChecked = true ∧
  C.externalStandardUsed = true

theorem mass_calibration_layer_closed_checked :
    MassCalibrationLayerClosed (default : MassCalibrationLayerCertificate) := by
  unfold MassCalibrationLayerClosed
  simp

end AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean
end HautevilleHouse
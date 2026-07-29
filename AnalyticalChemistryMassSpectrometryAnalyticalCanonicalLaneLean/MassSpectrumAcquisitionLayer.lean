import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean

structure MassSpectrumDatum where
  acquisitionMethod : String
  massRange : String
  resolution : Float
  scanRate : Float
  acquisitionTime : Float
deriving Repr

structure MassSpectrumAcquisitionLayerCertificate where
  spectrumDatum : MassSpectrumDatum
  acquisitionRoute : String
  calibrationRoute : String
  dataIntegrityChecked : Bool
  instrumentReady : Bool

default instance : Inhabited MassSpectrumAcquisitionLayerCertificate where
  default := {
    spectrumDatum := {
      acquisitionMethod := "time-of-flight",
      massRange := "100-2000 Da",
      resolution := 10000.0,
      scanRate := 10.0,
      acquisitionTime := 1.0
    },
    acquisitionRoute := "mass spectrum acquired via time-of-flight analyzer",
    calibrationRoute := "external calibration with known standards",
    dataIntegrityChecked := true,
    instrumentReady := true
  }

def MassSpectrumAcquisitionLayerClosed (C : MassSpectrumAcquisitionLayerCertificate) : Prop :=
  C.spectrumDatum.resolution > 0 ∧
  C.dataIntegrityChecked = true ∧
  C.instrumentReady = true

theorem mass_spectrum_acquisition_layer_closed_checked :
    MassSpectrumAcquisitionLayerClosed (default : MassSpectrumAcquisitionLayerCertificate) := by
  unfold MassSpectrumAcquisitionLayerClosed
  refine ⟨?_, ?_, ?_⟩
  · decide
  · rfl
  · rfl

end AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean
end HautevilleHouse
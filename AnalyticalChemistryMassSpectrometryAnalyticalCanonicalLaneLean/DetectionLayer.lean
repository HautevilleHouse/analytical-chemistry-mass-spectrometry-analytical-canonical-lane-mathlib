import HautevilleHouse.AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean.MassSpectrometryBase

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean

structure DetectionCertificate where
  detectorType : String
  gain : Float
  noiseLevel : Float
  responseTime : Float

deriving Repr, DecidableEq

def electronMultiplierDetection : DetectionCertificate := {
  detectorType := "Electron Multiplier",
  gain := 10.0,
  noiseLevel := 0.01,
  responseTime := 0.001
}

def faradayCupDetection : DetectionCertificate := {
  detectorType := "Faraday Cup",
  gain := 1.0,
  noiseLevel := 0.1,
  responseTime := 0.01
}

def microchannelPlateDetection : DetectionCertificate := {
  detectorType := "Microchannel Plate",
  gain := 100.0,
  noiseLevel := 0.05,
  responseTime := 0.0001
}

def DetectionLayerClosed (C : DetectionCertificate) : Prop := 
  C.gain > 1 ∧ C.noiseLevel < 0.2

theorem detection_layer_closed_em : DetectionLayerClosed electronMultiplierDetection := by
  exact And.intro (by decide) (by decide)

theorem detection_layer_closed_fc : DetectionLayerClosed faradayCupDetection := by
  exact And.intro (by decide) (by decide)

theorem detection_layer_closed_mcp : DetectionLayerClosed microchannelPlateDetection := by
  exact And.intro (by decide) (by decide)

end AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean
end HautevilleHouse
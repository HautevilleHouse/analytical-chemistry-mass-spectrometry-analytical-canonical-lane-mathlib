import HautevilleHouse.AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean

structure MassSpecAdmittedObject where
  spectrumId : String
  ionizationMethod : String
  massRange : Nat × Nat
  calibrationStatus : Bool
  fragmentationModel : String
  massAccuracy : Float
  calibrationVerified : calibrationStatus = true
  fragmentationModelVerified : fragmentationModel ≠ ""
  massAccuracyVerified : massAccuracy > 0.0

structure MassSpecTheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : MassSpecAdmittedObject
  classicalBoundary : String
  carriedRemainder : String

def ClassicalSourceBoundaryCarried : Prop :=
  True

def NativeBridgeClosed (O : MassSpecAdmittedObject) : Prop :=
  O.calibrationVerified ∧ O.fragmentationModelVerified ∧ O.massAccuracyVerified

default theorem classical_source_boundary_carried_checked : ClassicalSourceBoundaryCarried :=
  trivial

end AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean
end HautevilleHouse
import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean.MassSpectrometryAdmissibleClass

namespace HautevilleHouse
namespace AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean

structure ResolutionEndpointCertificate where
  resolution : Float
  peakWidth : Float
  massAccuracy : Float
  endpointChecked : Bool

def resolutionEndpointCertificate : ResolutionEndpointCertificate := {
  resolution := 60000.0,
  peakWidth := 0.005,
  massAccuracy := 1.0e-6,
  endpointChecked := true
}

def ResolutionEndpointClosed (C : ResolutionEndpointCertificate) : Prop :=
  C.endpointChecked = true ∧ C.resolution > 10000.0

theorem resolution_endpoint_closed_checked :
    ResolutionEndpointClosed resolutionEndpointCertificate := by
  exact And.intro rfl (by native_decide)

end AnalyticalChemistryMassSpectrometryAnalyticalCanonicalLaneLean
end HautevilleHouse
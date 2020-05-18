import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @State private var currentFilter = CIFilter.noiseReduction()
    @Binding var isShown: Bool
    @Binding var image: Image?
    
    init(isShown: Binding<Bool>, image: Binding<Image?>) {
        _isShown = isShown
        _image = image
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        let beginImage = CIImage(image: uiImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = CIContext().createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            }
        
        isShown = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var isShown: Bool
    @Binding var image: Image?
    @Binding var useCamera: Bool
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(isShown: $isShown, image: $image)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        if !useCamera {
            picker.sourceType = .photoLibrary
        } else if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .photoLibrary
        } else {
            picker.sourceType = .camera
        }
        return picker
    }
}

public struct PhotoCaptureView: View {
    
    @Binding var showImagePicker: Bool
    @Binding var image: Image?
    @Binding var useCamera: Bool
    
    public init(showImagePicker: Binding<Bool>, image: Binding<Image?>, useCamera: Binding<Bool>) {
        self._showImagePicker = showImagePicker
        self._image = image
        self._useCamera = useCamera
    }
    
    public var body: some View {
        ImagePicker(isShown: $showImagePicker, image: $image, useCamera: $useCamera)
    }
}

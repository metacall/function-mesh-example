using IronPdf;

/* TODO: Implement NuGet for IronPdf dependency (https://www.nuget.org/packages/PDF.Core/) */

namespace PdfLib {
	public class Pdf {
		public static byte[] GeneratePdfFromHtml(html) {
			IronPdf.HtmlToPdf Renderer = new IronPdf.HtmlToPdf();

			return Renderer.RenderHtmlAsPdf(html).BinaryData;
		}
	}
}

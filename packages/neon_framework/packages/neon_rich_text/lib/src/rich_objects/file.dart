import 'package:flutter/material.dart';
import 'package:neon_framework/models.dart';
import 'package:neon_framework/utils.dart';
import 'package:neon_framework/widgets.dart';
import 'package:nextcloud/core.dart' as core;

/// Displays a file from a rich object.
class NeonRichObjectFile extends StatelessWidget {
  /// Creates a new Neon rich object file.
  const NeonRichObjectFile({
    required this.parameter,
    super.key,
  });

  /// The parameter to display.
  final core.RichObjectParameter parameter;

  @override
  Widget build(BuildContext context) {
    final child = LayoutBuilder(
      builder: (context, constraints) {
        final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

        final maxSize = Size(constraints.maxWidth, MediaQuery.sizeOf(context).height / 2);

        Size? logicalSize;
        var deviceSize = Size(-1, maxSize.height / devicePixelRatio);

        if (parameter.width != null && parameter.height != null) {
          deviceSize = Size(
            double.parse(parameter.width!),
            double.parse(parameter.height!),
          );

          // Convert to logical pixels
          logicalSize = deviceSize / devicePixelRatio;

          // Constrain size to max size but keep aspect ratio
          if (logicalSize.width > maxSize.width) {
            logicalSize = logicalSize * (maxSize.width / logicalSize.width);
          }
          if (logicalSize.height > maxSize.height) {
            logicalSize = logicalSize * (maxSize.height / logicalSize.height);
          }

          // Convert back to device pixels
          deviceSize = logicalSize * devicePixelRatio;
        }

        final account = NeonProvider.of<Account>(context);
        Widget image;
        if (parameter.mimetype == 'image/gif') {
          // Previews for animated GIFs are not animated, so we have to request the full file.
          image = NeonUriImage(
            account: account,
            blurHash: parameter.blurhash,
            uri: Uri.parse(
              '${account.credentials.serverURL}/remote.php/dav/files/${account.username}/${parameter.path!}',
            ),
          );
        } else {
          image = NeonApiImage(
            account: account,
            blurHash: parameter.blurhash,
            etag: parameter.etag,
            expires: null,
            getRequest: (client) => client.core.preview.$getPreviewByFileId_Request(
              fileId: int.parse(parameter.id),
              x: deviceSize.width.toInt(),
              y: deviceSize.height.toInt(),
              a: core.PreviewGetPreviewByFileIdA.$1,
              mimeFallback: core.PreviewGetPreviewByFileIdMimeFallback.$1,
            ),
          );
        }

        image = ConstrainedBox(
          constraints: logicalSize != null
              ? BoxConstraints.tight(logicalSize)
              : BoxConstraints(
                  minHeight: 100,
                  maxHeight: maxSize.height,
                  minWidth: 100,
                  maxWidth: maxSize.width,
                ),
          child: image,
        );

        if (parameter.previewAvailable == 'yes') {
          return Tooltip(
            message: parameter.name,
            child: image,
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image,
            Text(parameter.name),
          ],
        );
      },
    );

    return InkWell(
      onTap: () async {
        await launchUrl(NeonProvider.of<Account>(context), parameter.link!);
      },
      child: child,
    );
  }
}

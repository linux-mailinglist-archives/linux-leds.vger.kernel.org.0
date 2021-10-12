Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9891442AC1C
	for <lists+linux-leds@lfdr.de>; Tue, 12 Oct 2021 20:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234378AbhJLSjE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 12 Oct 2021 14:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234343AbhJLSjC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 12 Oct 2021 14:39:02 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A86C061765
        for <linux-leds@vger.kernel.org>; Tue, 12 Oct 2021 11:36:09 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9c93:91ff:d58:ecfb])
        by xavier.telenet-ops.be with bizsmtp
        id 56ZX2600C0KW32a016ZX0c; Tue, 12 Oct 2021 20:33:33 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maMah-004RUA-DL; Tue, 12 Oct 2021 20:33:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maMag-002j7L-8g; Tue, 12 Oct 2021 20:33:30 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v7 16/21] auxdisplay: ht16k33: Extract ht16k33_brightness_set()
Date:   Tue, 12 Oct 2021 20:33:22 +0200
Message-Id: <20211012183327.649865-17-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012183327.649865-1-geert@linux-m68k.org>
References: <20211012183327.649865-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Extract brightness handling into a helper function, so it can be called
from multiple places.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Robin van der Gracht <robin@protonic.nl>
---
v7:
  - Add Reviewed-by,

v6:
  - No changes,

v5:
  - No changes,

v4:
  - No changes,

v3:
  - Use "err" instead of "error" to be consistent with existing driver
    naming style,

v2:
  - No changes.
---
 drivers/auxdisplay/ht16k33.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index b50cbf7e57ba26d7..60e616c0e932cd84 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -113,6 +113,22 @@ static int ht16k33_display_off(struct ht16k33_priv *priv)
 	return i2c_smbus_write_byte(priv->client, REG_DISPLAY_SETUP);
 }
 
+static int ht16k33_brightness_set(struct ht16k33_priv *priv,
+				  unsigned int brightness)
+{
+	int err;
+
+	if (brightness == 0)
+		return ht16k33_display_off(priv);
+
+	err = ht16k33_display_on(priv);
+	if (err)
+		return err;
+
+	return i2c_smbus_write_byte(priv->client,
+				    REG_BRIGHTNESS | (brightness - 1));
+}
+
 static void ht16k33_fb_queue(struct ht16k33_priv *priv)
 {
 	struct ht16k33_fbdev *fbdev = &priv->fbdev;
@@ -197,13 +213,10 @@ static int ht16k33_bl_update_status(struct backlight_device *bl)
 
 	if (bl->props.power != FB_BLANK_UNBLANK ||
 	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
-	    bl->props.state & BL_CORE_FBBLANK || brightness == 0) {
-		return ht16k33_display_off(priv);
-	}
+	    bl->props.state & BL_CORE_FBBLANK)
+		brightness = 0;
 
-	ht16k33_display_on(priv);
-	return i2c_smbus_write_byte(priv->client,
-				    REG_BRIGHTNESS | (brightness - 1));
+	return ht16k33_brightness_set(priv, brightness);
 }
 
 static int ht16k33_bl_check_fb(struct backlight_device *bl, struct fb_info *fi)
-- 
2.25.1


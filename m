Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B13D53B43BB
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jun 2021 14:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbhFYNBm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Jun 2021 09:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231607AbhFYNBj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Jun 2021 09:01:39 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B7B4C061787
        for <linux-leds@vger.kernel.org>; Fri, 25 Jun 2021 05:59:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1476:ce84:e216:add8])
        by xavier.telenet-ops.be with bizsmtp
        id MQzC2500T2B1U9901QzCdp; Fri, 25 Jun 2021 14:59:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lwlQO-003TMC-CD; Fri, 25 Jun 2021 14:59:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lwlQN-004sQE-Gl; Fri, 25 Jun 2021 14:59:11 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 03/18] auxdisplay: img-ascii-lcd: Fix lock-up when displaying empty string
Date:   Fri, 25 Jun 2021 14:58:47 +0200
Message-Id: <20210625125902.1162428-4-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625125902.1162428-1-geert@linux-m68k.org>
References: <20210625125902.1162428-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

While writing an empty string to a device attribute is a no-op, and thus
does not need explicit safeguards, the user can still write a single
newline to an attribute file:

    echo > .../message

If that happens, img_ascii_lcd_display() trims the newline, yielding an
empty string, and causing an infinite loop in img_ascii_lcd_scroll().

Fix this by adding a check for empty strings.  Clear the display in case
one is encountered.

Fixes: 0cad855fbd083ee5 ("auxdisplay: img-ascii-lcd: driver for simple ASCII LCD displays")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Untested with img-ascii-lcd, but triggered with my initial version of
linedisp.

v2:
  - No changes.
---
 drivers/auxdisplay/img-ascii-lcd.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/auxdisplay/img-ascii-lcd.c b/drivers/auxdisplay/img-ascii-lcd.c
index 1cce409ce5cacbc8..e33ce0151cdfd150 100644
--- a/drivers/auxdisplay/img-ascii-lcd.c
+++ b/drivers/auxdisplay/img-ascii-lcd.c
@@ -280,6 +280,16 @@ static int img_ascii_lcd_display(struct img_ascii_lcd_ctx *ctx,
 	if (msg[count - 1] == '\n')
 		count--;
 
+	if (!count) {
+		/* clear the LCD */
+		devm_kfree(&ctx->pdev->dev, ctx->message);
+		ctx->message = NULL;
+		ctx->message_len = 0;
+		memset(ctx->curr, ' ', ctx->cfg->num_chars);
+		ctx->cfg->update(ctx);
+		return 0;
+	}
+
 	new_msg = devm_kmalloc(&ctx->pdev->dev, count + 1, GFP_KERNEL);
 	if (!new_msg)
 		return -ENOMEM;
-- 
2.25.1


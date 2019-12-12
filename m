Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF9C11C41D
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2019 04:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbfLLDko (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Dec 2019 22:40:44 -0500
Received: from mx2.suse.de ([195.135.220.15]:58556 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727784AbfLLDkJ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Dec 2019 22:40:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 66D56AF43;
        Thu, 12 Dec 2019 03:40:07 +0000 (UTC)
From:   =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [RFC 22/25] leds: tm1826: Add combined glyph support
Date:   Thu, 12 Dec 2019 04:39:49 +0100
Message-Id: <20191212033952.5967-23-afaerber@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191212033952.5967-1-afaerber@suse.de>
References: <20191212033952.5967-1-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Allow to squeeze the text "HEllO" into a 4-digit display,
as seen on MeLE V9 TV box.

Enable this combining mode only if the text would overflow.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 drivers/leds/leds-tm1628.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-tm1628.c b/drivers/leds/leds-tm1628.c
index e2c2a5d91596..0c0d099de8b0 100644
--- a/drivers/leds/leds-tm1628.c
+++ b/drivers/leds/leds-tm1628.c
@@ -347,6 +347,28 @@ static u8 tm1628_get_char_ssd_map(char ch)
 	return 0x0;
 }
 
+struct tm1628_ssd_glyph {
+	char *str;
+	u8 segs;
+};
+
+static const struct tm1628_ssd_glyph tm1628_glyph_ssd_map[] = {
+	{ "ll", SSD_TOP_LEFT | SSD_BOTTOM_LEFT |
+		SSD_TOP_RIGHT | SSD_BOTTOM_RIGHT },
+};
+
+static u8 tm1628_get_glyph_ssd_map(const char *str)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(tm1628_glyph_ssd_map); i++) {
+		if (!strncmp(tm1628_glyph_ssd_map[i].str, str, 2))
+			return tm1628_glyph_ssd_map[i].segs;
+	}
+
+	return 0x0;
+}
+
 static int tm1628_display_apply_map(struct tm1628 *s,
 	struct tm1628_display *display, u8 map)
 {
@@ -366,7 +388,7 @@ static ssize_t text_store(struct device *dev,
 {
 	struct tm1628 *s = dev_get_drvdata(dev);
 	size_t offset, len = count;
-	u8 map;
+	u8 map, glyph_map;
 	int i, ret;
 
 	if (len > 0 && buf[len - 1] == '\n')
@@ -375,6 +397,13 @@ static ssize_t text_store(struct device *dev,
 	for (i = 0, offset = 0; i < s->num_displays; i++) {
 		if (offset < len) {
 			map = tm1628_get_char_ssd_map(buf[offset]);
+			if (offset + 1 < len && len > s->num_displays) {
+				glyph_map = tm1628_get_glyph_ssd_map(buf + offset);
+				if (glyph_map) {
+					map = glyph_map;
+					offset++;
+				}
+			}
 			offset++;
 		} else
 			map = 0x0;
-- 
2.16.4


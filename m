Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8EF611C422
	for <lists+linux-leds@lfdr.de>; Thu, 12 Dec 2019 04:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbfLLDkt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Dec 2019 22:40:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:58618 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727764AbfLLDkH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Dec 2019 22:40:07 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id E4A2AADA8;
        Thu, 12 Dec 2019 03:40:05 +0000 (UTC)
From:   =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
To:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [RFC 19/25] leds: tm1628: Add 7-segment display support
Date:   Thu, 12 Dec 2019 04:39:46 +0100
Message-Id: <20191212033952.5967-20-afaerber@suse.de>
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

Detect DT child nodes covering more than one LED component and implement
a text to 7-segment display mapping.

Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 drivers/leds/leds-tm1628.c | 230 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 229 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-tm1628.c b/drivers/leds/leds-tm1628.c
index 8a8fd1562853..e2c2a5d91596 100644
--- a/drivers/leds/leds-tm1628.c
+++ b/drivers/leds/leds-tm1628.c
@@ -47,6 +47,15 @@ struct tm1628_info {
 	int				default_pwm;
 };
 
+struct tm1628_segment {
+	u32 grid;
+	u32 seg;
+};
+
+struct tm1628_display {
+	struct tm1628_segment segments[8];
+};
+
 struct tm1628_led {
 	struct led_classdev	leddev;
 	struct tm1628		*ctrl;
@@ -62,6 +71,8 @@ struct tm1628 {
 	int				mode_index;
 	int				pwm_index;
 	u8				data[14];
+	unsigned int			num_displays;
+	struct tm1628_display		*displays;
 	unsigned int			num_leds;
 	struct tm1628_led		leds[];
 };
@@ -253,6 +264,215 @@ static int tm1628_register_led(struct tm1628 *s,
 	return devm_led_classdev_register_ext(dev, &led->leddev, &init_data);
 }
 
+#define SSD_TOP			BIT(0)
+#define SSD_TOP_RIGHT		BIT(1)
+#define SSD_BOTTOM_RIGHT	BIT(2)
+#define SSD_BOTTOM		BIT(3)
+#define SSD_BOTTOM_LEFT		BIT(4)
+#define SSD_TOP_LEFT		BIT(5)
+#define SSD_MIDDLE		BIT(6)
+#define SSD_DOT			BIT(7)
+
+struct tm1628_ssd_char {
+	char ch;
+	u8 segs;
+};
+
+static const struct tm1628_ssd_char tm1628_char_ssd_map[] = {
+	{ '0', SSD_TOP | SSD_TOP_LEFT | SSD_TOP_RIGHT |
+	       SSD_BOTTOM_LEFT | SSD_BOTTOM_RIGHT | SSD_BOTTOM },
+	{ '1', SSD_TOP_RIGHT | SSD_BOTTOM_RIGHT },
+	{ '2', SSD_TOP | SSD_TOP_RIGHT | SSD_MIDDLE | SSD_BOTTOM_LEFT | SSD_BOTTOM },
+	{ '3', SSD_TOP | SSD_TOP_RIGHT | SSD_MIDDLE | SSD_BOTTOM_RIGHT | SSD_BOTTOM },
+	{ '4', SSD_TOP_LEFT | SSD_TOP_RIGHT | SSD_MIDDLE | SSD_BOTTOM_RIGHT },
+	{ '5', SSD_TOP | SSD_TOP_LEFT | SSD_MIDDLE | SSD_BOTTOM_RIGHT | SSD_BOTTOM },
+	{ '6', SSD_TOP | SSD_TOP_LEFT | SSD_MIDDLE | SSD_BOTTOM_LEFT | SSD_BOTTOM_RIGHT | SSD_BOTTOM },
+	{ '7', SSD_TOP | SSD_TOP_RIGHT | SSD_BOTTOM_RIGHT },
+	{ '8', SSD_TOP | SSD_TOP_LEFT | SSD_TOP_RIGHT | SSD_MIDDLE |
+	       SSD_BOTTOM_LEFT | SSD_BOTTOM_RIGHT | SSD_BOTTOM },
+	{ '9', SSD_TOP | SSD_TOP_LEFT | SSD_TOP_RIGHT | SSD_MIDDLE |
+	       SSD_BOTTOM_RIGHT | SSD_BOTTOM },
+	{ 'A', SSD_TOP | SSD_TOP_LEFT | SSD_TOP_RIGHT | SSD_MIDDLE |
+	       SSD_BOTTOM_LEFT | SSD_BOTTOM_RIGHT },
+	{ 'B', SSD_TOP | SSD_TOP_LEFT | SSD_TOP_RIGHT | SSD_MIDDLE |
+	       SSD_BOTTOM_LEFT | SSD_BOTTOM_RIGHT | SSD_BOTTOM },
+	{ 'C', SSD_TOP | SSD_TOP_LEFT | SSD_BOTTOM_LEFT | SSD_BOTTOM },
+	{ 'D', SSD_TOP | SSD_TOP_LEFT | SSD_TOP_RIGHT |
+	       SSD_BOTTOM_LEFT | SSD_BOTTOM_RIGHT | SSD_BOTTOM },
+	{ 'E', SSD_TOP | SSD_TOP_LEFT | SSD_MIDDLE | SSD_BOTTOM_LEFT | SSD_BOTTOM },
+	{ 'F', SSD_TOP | SSD_TOP_LEFT | SSD_MIDDLE | SSD_BOTTOM_LEFT },
+	{ 'G', SSD_TOP | SSD_TOP_LEFT | SSD_BOTTOM_LEFT | SSD_BOTTOM | SSD_BOTTOM_RIGHT },
+	{ 'H', SSD_TOP_LEFT | SSD_TOP_RIGHT | SSD_MIDDLE |
+	       SSD_BOTTOM_LEFT | SSD_BOTTOM_RIGHT },
+	{ 'I', SSD_TOP_LEFT | SSD_BOTTOM_LEFT },
+	{ 'J', SSD_TOP | SSD_TOP_RIGHT | SSD_BOTTOM_RIGHT | SSD_BOTTOM },
+	{ 'K', SSD_TOP_LEFT | SSD_TOP_RIGHT | SSD_MIDDLE |
+	       SSD_BOTTOM_LEFT | SSD_BOTTOM_RIGHT },
+	{ 'L', SSD_TOP_LEFT | SSD_BOTTOM_LEFT | SSD_BOTTOM },
+	{ 'O', SSD_TOP | SSD_TOP_LEFT | SSD_TOP_RIGHT |
+	       SSD_BOTTOM_LEFT | SSD_BOTTOM_RIGHT | SSD_BOTTOM },
+	{ 'P', SSD_TOP | SSD_TOP_LEFT | SSD_TOP_RIGHT | SSD_MIDDLE |
+	       SSD_BOTTOM_LEFT },
+	{ 'Q', SSD_TOP | SSD_TOP_LEFT | SSD_TOP_RIGHT |
+	       SSD_BOTTOM_LEFT | SSD_BOTTOM_RIGHT | SSD_BOTTOM },
+	{ 'R', SSD_TOP | SSD_TOP_LEFT | SSD_TOP_RIGHT | SSD_MIDDLE |
+	       SSD_BOTTOM_LEFT | SSD_BOTTOM_RIGHT },
+	{ 'S', SSD_TOP | SSD_TOP_LEFT | SSD_MIDDLE | SSD_BOTTOM_RIGHT | SSD_BOTTOM },
+	{ 'T', SSD_TOP | SSD_TOP_LEFT | SSD_BOTTOM_LEFT },
+	{ 'U', SSD_TOP_LEFT | SSD_BOTTOM_LEFT | SSD_BOTTOM | SSD_BOTTOM_RIGHT | SSD_TOP_RIGHT },
+	{ 'V', SSD_TOP_LEFT | SSD_BOTTOM_LEFT | SSD_BOTTOM | SSD_BOTTOM_RIGHT | SSD_TOP_RIGHT },
+	{ 'W', SSD_TOP_LEFT | SSD_BOTTOM_LEFT | SSD_BOTTOM | SSD_BOTTOM_RIGHT | SSD_TOP_RIGHT },
+	{ 'Z', SSD_TOP | SSD_TOP_RIGHT | SSD_MIDDLE | SSD_BOTTOM_LEFT | SSD_BOTTOM },
+	{ 'b', SSD_TOP_LEFT | SSD_MIDDLE | SSD_BOTTOM_LEFT | SSD_BOTTOM | SSD_BOTTOM_RIGHT },
+	{ 'l', SSD_TOP_LEFT | SSD_BOTTOM_LEFT },
+	{ 'o', SSD_MIDDLE | SSD_BOTTOM_LEFT | SSD_BOTTOM | SSD_BOTTOM_RIGHT },
+	{ 't', SSD_TOP_LEFT | SSD_MIDDLE | SSD_BOTTOM_LEFT | SSD_BOTTOM },
+	{ 'u', SSD_BOTTOM_LEFT | SSD_BOTTOM | SSD_BOTTOM_RIGHT },
+	{ 'v', SSD_BOTTOM_LEFT | SSD_BOTTOM | SSD_BOTTOM_RIGHT },
+	{ 'w', SSD_BOTTOM_LEFT | SSD_BOTTOM | SSD_BOTTOM_RIGHT },
+	{ '-', SSD_MIDDLE },
+	{ '_', SSD_BOTTOM },
+	{ '.', SSD_DOT },
+};
+
+static u8 tm1628_get_char_ssd_map(char ch)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(tm1628_char_ssd_map); i++) {
+		if (tm1628_char_ssd_map[i].ch == ch)
+			return tm1628_char_ssd_map[i].segs;
+	}
+
+	return 0x0;
+}
+
+static int tm1628_display_apply_map(struct tm1628 *s,
+	struct tm1628_display *display, u8 map)
+{
+	struct tm1628_segment *segment;
+	int i;
+
+	for (i = 0; i < 8; i++) {
+		segment = &display->segments[i];
+		tm1628_set_led(s, segment->grid, segment->seg, map & BIT(i));
+	}
+
+	return 0;
+}
+
+static ssize_t text_store(struct device *dev,
+	struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct tm1628 *s = dev_get_drvdata(dev);
+	size_t offset, len = count;
+	u8 map;
+	int i, ret;
+
+	if (len > 0 && buf[len - 1] == '\n')
+		len--;
+
+	for (i = 0, offset = 0; i < s->num_displays; i++) {
+		if (offset < len) {
+			map = tm1628_get_char_ssd_map(buf[offset]);
+			offset++;
+		} else
+			map = 0x0;
+
+		tm1628_display_apply_map(s, &s->displays[i], map);
+	}
+
+	ret = tm1628_set_address(s->spi, 0x0);
+	if (ret)
+		return ret;
+
+	ret = tm1628_write_data(s->spi, s->data, 14);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static struct device_attribute tm1628_attr =
+	__ATTR_WO(text);
+
+static int tm1628_register_display(struct tm1628 *s,
+	struct fwnode_handle *node)
+{
+	struct device *dev = &s->spi->dev;
+	struct tm1628_display *display;
+	u32 *reg;
+	u32 grid, seg;
+	int i, j, ret, reg_count;
+
+	reg_count = fwnode_property_count_u32(node, "reg");
+	if (reg_count < 0)
+		return reg_count;
+
+	if (reg_count % 2) {
+		dev_warn(dev, "Ignoring extra cell in %s reg property\n",
+			 fwnode_get_name(node));
+		reg_count--;
+	}
+
+	if (s->displays) {
+		dev_warn(dev, "Only one display supported\n");
+		return -EINVAL;
+	}
+
+	s->num_displays = reg_count >> 1;
+
+	reg = devm_kzalloc(dev, reg_count * sizeof(*reg), GFP_KERNEL);
+	if (!reg)
+		return -ENOMEM;
+
+	ret = fwnode_property_read_u32_array(node, "reg", reg, reg_count);
+	if (ret) {
+		dev_err(dev, "Reading %s reg property failed (%d)\n",
+			fwnode_get_name(node), ret);
+		return ret;
+	}
+
+	s->displays = devm_kzalloc(dev, s->num_displays * sizeof(*s->displays), GFP_KERNEL);
+	if (!s->displays)
+		return -ENOMEM;
+
+	for (i = 0; i < s->num_displays; i++) {
+		display = &s->displays[i];
+		grid = reg[i * 2];
+		seg  = reg[i * 2 + 1];
+		if (grid == 0 && seg != 0) {
+			if (!tm1628_is_valid_seg(s, seg)) {
+				dev_warn(dev, "%s reg out of range\n", fwnode_get_name(node));
+				return -EINVAL;
+			}
+			grid = s->info->modes[s->mode_index].grid_mask;
+			for (j = 0; grid && j < 7; j++) {
+				display->segments[j].seg = seg;
+				display->segments[j].grid = __ffs(grid);
+				grid &= ~BIT(display->segments[j].grid);
+			}
+		} else if (grid != 0 && seg == 0) {
+			if (!tm1628_is_valid_grid(s, grid)) {
+				dev_warn(dev, "%s reg out of range\n", fwnode_get_name(node));
+				return -EINVAL;
+			}
+			seg = s->info->modes[s->mode_index].seg_mask;
+			for (j = 0; seg && j < 8; j++) {
+				display->segments[j].grid = grid;
+				display->segments[j].seg = __ffs(seg);
+				seg &= ~BIT(display->segments[j].seg);
+			}
+		}
+	}
+
+	devm_kfree(dev, reg);
+
+	device_create_file(dev, &tm1628_attr);
+
+	return 0;
+}
+
 /* Work around __builtin_popcount() */
 static u32 tm1628_grid_popcount(u8 grid_mask)
 {
@@ -325,7 +545,7 @@ static int tm1628_spi_probe(struct spi_device *spi)
 			return ret;
 		}
 
-		if (fwnode_property_count_u32(child, "reg") == 2) {
+		if (reg[0] != 0 && reg[1] != 0 && fwnode_property_count_u32(child, "reg") == 2) {
 			ret = tm1628_register_led(s, child, reg[0], reg[1], &s->leds[i++]);
 			if (ret && ret != -EINVAL) {
 				dev_err(&spi->dev, "Failed to register LED %s (%d)\n",
@@ -334,6 +554,14 @@ static int tm1628_spi_probe(struct spi_device *spi)
 				return ret;
 			}
 			s->num_leds++;
+		} else {
+			ret = tm1628_register_display(s, child);
+			if (ret) {
+				dev_err(&spi->dev, "Failed to register display %s (%d)\n",
+					fwnode_get_name(child), ret);
+				fwnode_handle_put(child);
+				return ret;
+			}
 		}
 	}
 
-- 
2.16.4


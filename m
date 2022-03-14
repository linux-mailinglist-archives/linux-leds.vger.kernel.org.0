Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4474D83CB
	for <lists+linux-leds@lfdr.de>; Mon, 14 Mar 2022 13:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238982AbiCNMVq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Mar 2022 08:21:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241996AbiCNMSl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Mar 2022 08:18:41 -0400
Received: from fallback15.mail.ru (fallback15.mail.ru [94.100.179.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 484C243EEF
        for <linux-leds@vger.kernel.org>; Mon, 14 Mar 2022 05:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=corp.mail.ru; s=mail3;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=RECbcOT2frFzmOV8D/aGnSAlmUzK9dkzSNTK5F52RTQ=;
        t=1647260009;x=1647865409; 
        b=gEwP9c1+arvMxjqMikUrVpOkAVEo5Z2xQF3wyqvL+dmwp/KlBGd0GpSe/IGUG7QvAsHPH/fkQhAndvty1pmGiKtZ1SraqaLEbsNGs1WcRITqTZVnDGp/FP5jUZTBjqwdyeeh6sJLz/S70GmxA8VnEbQ132VZG0VLrtzrLPCNQ9A=;
Received: from [10.161.25.35] (port=58712 helo=smtp58.i.mail.ru)
        by fallback15.m.smailru.net with esmtp (envelope-from <i.vozvakhov@corp.mail.ru>)
        id 1nTjZj-00021Y-Kz
        for linux-leds@vger.kernel.org; Mon, 14 Mar 2022 15:13:24 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=corp.mail.ru; s=mail4;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=RECbcOT2frFzmOV8D/aGnSAlmUzK9dkzSNTK5F52RTQ=;
        t=1647260003;x=1647865403; 
        b=ZGuQBgJdUvciagX0MgJqkbc7qWEzjJM+KhOrshIaWA0ZHbOTGkSxg4Znbo7qeViwVlmVmQu0fqcgm9uV/yjCqv2BUv5awCXDGiW/cfpkVPNOQ+4i40iGO9zt/uUweS7sgWOHcJJ8poxU84jBW+Ka+2EMjKJ2YANmUZbAXBANJwmDy5fmJvwDfs/d37oDLhqhcZ0d608wyQF4kG/Z9mJjh/ExUyjIhfKB0gW7sR9gzeNCxraagukF7VZJ0E9dASgFAfiWGA9fOKVu2JQFGKoCeN2Nam9Lt26pbHcgq/ixlJlQA+J8Y8A+ypIh71Zew1YinEV6AVE/3lDZcJupL6h5QA==;
Received: by smtp58.i.mail.ru with esmtpa (envelope-from <i.vozvakhov@corp.mail.ru>)
        id 1nTjZY-0002CY-RX; Mon, 14 Mar 2022 15:13:13 +0300
From:   Ivan Vozvakhov <i.vozvakhov@corp.mail.ru>
To:     pavel@ucw.cz, linux-leds@vger.kernel.org
Cc:     Ivan Vozvakhov <i.vozvakhov@corp.mail.ru>
Subject: [PATCH] leds: add LED driver for Worldsemi WS2812B
Date:   Mon, 14 Mar 2022 15:12:21 +0300
Message-Id: <20220314121221.1175437-1-i.vozvakhov@corp.mail.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-618D5548: 25F0759C975EDF2E2BD7FA4A30232D1A8AE2871C64CB94082F0EE6177078E166
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD95C8DF32398C35CA640B06EEE757A11FFF4F198476F253530182A05F5380850404C228DA9ACA6FE2726B4347DC925004038A4E0EF033EB57FB6DA1B8E2F66CF8A6BB678B65BE86190
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE73F64378C139886A6EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AAEFEF2B38A4D0058638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D894006F520AF07F235A79C27A84DA8B226F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7328B01A8D746D8839FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B3A703B70628EAD7BA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC3B8E5DAC0480AB6A3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637A0E44A3179C952C7D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F72BE6798D60363526D8C47C27EEC5E9FB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C4C7A0BC55FA0FE5FCCFCE11C6E3B02A7CF16D3FCCBB11E9BACF471DB8CB6665DBB1881A6453793CE9C32612AADDFBE061C61BE10805914D3804EBA3D8E7E5B87ABF8C51168CD8EBDBC109CDBF71E2B98BDC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34FDC9529E4578B99C4635FCA2EE2D248FA68560A13197564165AEF02378EAA41F19C5858DE9B6D0351D7E09C32AA3244C1EE26A4F6B0613B0917B6EEE57FBDB7830452B15D76AEC14FACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojqbhzdNy/MvjZJgQxOPicmQ==
X-Mailru-Sender: 11C2EC085EDE56FAC07928AF2646A76926EE3DC8FAEBF89838A4E0EF033EB57F3985A38E0F8EAEA7F46F3136784BB3EA92D99EB8CC7091A7C20C2BB18DEE6B557F27392C0AF8423D5FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-618D5548: 0354E79ED1E721E4EB51B415622C700C39D64CAB2F5B596CB7D4151414492A19
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4953AEA1DBC835B53416FFB28D113BED44E654D511901DB5C049FFFDB7839CE9ED247C5032B7F6BC44CC655D7A3FB06022EDD45FB6EE5AA54D8CEA7AD2A5C1CBD
X-7FA49CB5: 0D63561A33F958A5BC6034ED2B9F31B199982996F16FF2AD08D2AC153D7CBB94CACD7DF95DA8FC8BD5E8D9A59859A8B64071617579528AACCC7F00164DA146DAFE8445B8C89999728AA50765F790063798EAA0EED4DE4A60389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC80A9EC8C3488E7643F6B57BC7E6449061A352F6E88A58FB86F5D81C698A659EA73AA81AA40904B5D9A18204E546F3947CB5C78E0E843E24DA040F9FF01DFDA4A84AD6D5ED66289B52698AB9A7B718F8C442539A7722CA490CD5E8D9A59859A8B684F990FCDE911FCF089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C4C7A0BC55FA0FE5FCCFCE11C6E3B02A7C8237CC7AA794928EEB6100949940FA48B1881A6453793CE9C32612AADDFBE06133F7A9E5587C79A693EDB24507CE13387DFF0A840B692CF8
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojqbhzdNy/MvgcjZzjl2xJjQ==
X-Mailru-MI: 8000000000000800
X-Mras: Ok
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch adds a LED class driver (powered by SPI)
for the WS2812B LEDs that's is widely used in
consumer electronic devices and DIY.

Signed-off-by: Ivan Vozvakhov <i.vozvakhov@corp.mail.ru>
---
 .../bindings/leds/leds-ws2812b.yaml           |  76 ++++
 drivers/leds/Kconfig                          |  12 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-ws2812b.c                   | 420 ++++++++++++++++++
 4 files changed, 509 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-ws2812b.yaml
 create mode 100644 drivers/leds/leds-ws2812b.c

diff --git a/Documentation/devicetree/bindings/leds/leds-ws2812b.yaml b/Documentation/devicetree/bindings/leds/leds-ws2812b.yaml
new file mode 100644
index 000000000000..a71f37f51e2a
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-ws2812b.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-ws2812b.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Worldsemi WS2812B LED's driver powered by SPI
+
+maintainers:
+  - Ivan Vozvakhov <i.vozvakhov@vk.team>
+
+description: |
+  Bindings for the Worldsemi WS2812B LED's powered by SPI.
+  Used SPI-MOSI only.
+
+  For more product information please see the link below:
+    http://www.world-semi.com/Certifications/WS2812B.html
+
+properties:
+  compatible:
+    const: worldsemi,ws2812b
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    const: 2500000 
+
+  device-name:
+    type: string
+
+patternProperties:
+  "(^led[0-9a-f]$|led)":
+    type: object
+    $ref: common.yaml#
+
+required:
+  - compatible
+  - reg
+  - spi-max-frequency
+
+additionalProperties: false
+
+examples:
+  - |
+   &spi0 {
+        status = "okay";
+        pinctrl-0 = <&spi0_mosi>;
+        
+        ws2812b@00 {
+                compatible = "worldsemi,ws2812b";
+                reg = <0x00>;
+                spi-max-frequency = <2500000>;
+                
+                led1 {
+                        label = "top-led1";
+                        color = <LED_COLOR_ID_GREEN>;
+                };
+                
+                led2 {
+                        label = "top-led2";
+                        color = <LED_COLOR_ID_RED>;
+                };
+                
+                led3 {
+                        label = "top-led3";
+                        color = <LED_COLOR_ID_BLUE>;
+                };
+	};
+   };
+   
+   &spi0_mosi_hs {
+        rockchip,pins = <2 RK_PA1 2 &pcfg_pull_down>;
+   };
+
+...
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 6090e647daee..4eda92a2c0b2 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -157,6 +157,18 @@ config LEDS_EL15203000
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-el15203000.
 
+config LEDS_WS2812B
+        tristate "LED Support for Worldsemi WS2812B"
+        depends on LEDS_CLASS
+        depends on SPI
+        depends on OF
+        help
+          This option enables support for WS2812B LED's
+          through SPI.
+
+          To compile this driver as a module, choose M here: the module
+          will be called leds-ws2812b.
+
 config LEDS_TURRIS_OMNIA
 	tristate "LED support for CZ.NIC's Turris Omnia"
 	depends on LEDS_CLASS_MULTICOLOR
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index e58ecb36360f..6eef9b731884 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -92,6 +92,7 @@ obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
 obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
 obj-$(CONFIG_LEDS_EL15203000)		+= leds-el15203000.o
 obj-$(CONFIG_LEDS_SPI_BYTE)		+= leds-spi-byte.o
+obj-$(CONFIG_LEDS_WS2812B)		+= leds-ws2812b.o
 
 # LED Userspace Drivers
 obj-$(CONFIG_LEDS_USER)			+= uleds.o
diff --git a/drivers/leds/leds-ws2812b.c b/drivers/leds/leds-ws2812b.c
new file mode 100644
index 000000000000..daef470e073e
--- /dev/null
+++ b/drivers/leds/leds-ws2812b.c
@@ -0,0 +1,420 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * LEDs driver for Worldsemi WS2812B through SPI
+ * SPI-MOSI for data transfer
+ * Required DMA transfers
+ *
+ * Copyright (C) 2022 Ivan Vozvakhov <i.vozvakhov@vk.team>
+ *
+ * Inspired by (C) Martin Sperl <kernel@martin.sperl.org>
+ *
+ */
+#include <linux/leds.h>
+#include <linux/of.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/workqueue.h>
+#include <linux/spi/spi.h>
+#include <linux/uaccess.h>
+#include <linux/miscdevice.h>
+
+/*
+ * WS2812B timings:
+ *  TH + TL = 1.25us +-600us
+ *  T0H: 0.4us +-150ns
+ *  T1H: 0.8us +-150ns
+ *  T0L: 0.85us +-150ns
+ *  T1L: 0.45us +-150ns
+ *  RESL: >50us
+ *
+ * Each bit led's state coding by 3 real bits (see tables above):
+ *  T0H and T0L as 1 bit, T1H and T1L as 2 bits.
+ *
+ * And let's assume SPI bus freq. to 2.5MHz.
+ * By that:
+ *  T0H: 0.4us
+ *  T1H: 0.8us
+ *  T0L: 0.8us
+ *  T1L: 0.4us
+ *  RESL: > (50 / 0.4 = 125) bit (16 bytes)
+ */
+#define SPI_BUS_SPEED_HZ 2500000
+#define RESET_BYTES 16
+/*
+ * Basically, SPI pull-up MOSI line, but for correct state it should be pull-down
+ * (RES is detected by low signal).
+ * SPI-MOSI for some controllers could have z-state with pull-down for MOSI
+ * before first SPI-CLK edges.
+ * To eliminate it, send RES sequence before first bit's.
+ */
+#define DELAY_BEFORE_FIRST_DATA RESET_BYTES
+#define DEFAULT_DEVICE_NAME "ws2812b"
+
+/*
+ * Ioctl interface for set's several led's at one time.
+ *
+ * [start_led, stop_led)
+ */
+struct ws2812b_multi_set {
+	int start_led;
+	int stop_led;
+	uint8_t *brightnesses;
+};
+
+#define LEDS_WS2812B_IOCTL_MAGIC    'z'
+#define LEDS_WS2812B_IOCTL_MULTI_SET    \
+	_IOW(LEDS_WS2812B_IOCTL_MAGIC, 0x01, struct ws2812b_multi_set)
+#define LEDS_WS2812B_IOCTL_GET_LEDS_NUMBER      \
+	_IOR(LEDS_WS2812B_IOCTL_MAGIC, 0x02, int)
+
+/*
+ * Each led's state bits coded by 3 bits,
+ * 8 led's one-color state (actual LED) would take 24 real-bits.
+ * That 24 bits divided into high, medium, low groups.
+ * All possible states defined there (see brightess_encode func. for masks).
+ */
+const char byte2encoding_h[] = {
+	0x92, 0x93, 0x9a, 0x9b,
+	0xd2, 0xd3, 0xda, 0xdb
+};
+
+const char byte2encoding_m[] = {
+	0x49, 0x4d, 0x69, 0x6d
+};
+
+const char byte2encoding_l[] = {
+	0x24, 0x26, 0x34, 0x36,
+	0xa4, 0xa6, 0xb4, 0xb6
+};
+
+struct ws2812b_encoding {
+	uint8_t h, m, l;
+};
+
+static void brightess_encode(
+		struct ws2812b_encoding *enc,
+		const uint8_t val)
+{
+	enc->h = byte2encoding_h[(val >> 5) & 0x07];
+	enc->m = byte2encoding_m[(val >> 3) & 0x03];
+	enc->l = byte2encoding_l[(val >> 0) & 0x07];
+}
+
+struct ws2812b_led {
+	struct led_classdev ldev;
+	spinlock_t led_data_lock;
+
+	uint8_t brightness;
+	int num;
+
+	struct device *dev;
+	struct device_node *child;
+
+	struct work_struct work;
+	struct ws2812b_priv *priv;
+};
+
+struct ws2812b_priv {
+	struct mutex ws2812b_mutex;
+
+	struct spi_device *spi;
+	struct spi_message spi_msg;
+	struct spi_transfer spi_xfer;
+	struct ws2812b_encoding *spi_data;
+
+	struct miscdevice mdev;
+	struct work_struct work_update_all;
+	int num_leds;
+
+	struct ws2812b_led *leds;
+};
+
+static void ws2812b_all_leds_update_work(struct work_struct *work)
+{
+	struct ws2812b_priv *priv = container_of(work, struct ws2812b_priv, work_update_all);
+	struct ws2812b_encoding *led_enc = priv->spi_data;
+	struct ws2812b_led *led = priv->leds;
+	int i;
+
+	led_enc = (struct ws2812b_encoding *)((uint8_t *)led_enc + DELAY_BEFORE_FIRST_DATA);
+
+	mutex_lock(&priv->ws2812b_mutex);
+	for (i = 0; i < priv->num_leds; i++, led_enc++, led++)
+		brightess_encode(led_enc, led->brightness);
+	spi_sync(priv->spi, &priv->spi_msg);
+	mutex_unlock(&priv->ws2812b_mutex);
+}
+
+static void ws2812b_led_work(struct work_struct *work)
+{
+	struct ws2812b_led *led = container_of(work, struct ws2812b_led, work);
+	struct ws2812b_priv *priv = led->priv;
+	struct ws2812b_encoding *led_enc = &priv->spi_data[led->num];
+
+	led_enc = (struct ws2812b_encoding *)((uint8_t *)led_enc + DELAY_BEFORE_FIRST_DATA);
+
+	mutex_lock(&priv->ws2812b_mutex);
+	brightess_encode(led_enc, led->brightness);
+	spi_sync(priv->spi, &priv->spi_msg);
+	mutex_unlock(&priv->ws2812b_mutex);
+}
+
+static void ws2812b_led_set_brightness(struct led_classdev *ldev,
+		enum led_brightness brightness)
+{
+	struct ws2812b_led *led = container_of(ldev, struct ws2812b_led, ldev);
+
+	spin_lock(&led->led_data_lock);
+	led->brightness = (uint8_t) brightness;
+	schedule_work(&led->work);
+	spin_unlock(&led->led_data_lock);
+}
+
+static int ws2812b_open(struct inode *inode, struct file *file)
+{
+	return 0;
+}
+
+static int ws2812b_release(struct inode *inode, struct file *file)
+{
+	return 0;
+}
+
+static long ws2812b_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	struct miscdevice *mdev = file->private_data;
+	struct ws2812b_priv *priv = container_of(mdev, struct ws2812b_priv, mdev);
+	struct ws2812b_led *led;
+	struct ws2812b_multi_set ms;
+	uint8_t *brightness;
+	int i = 0, ret = 0, leds_to_change;
+
+	switch (cmd) {
+	case LEDS_WS2812B_IOCTL_MULTI_SET:
+	{
+		if (copy_from_user(&ms, (void __user *)arg,
+					sizeof(struct ws2812b_multi_set))) {
+			ret = -EFAULT;
+			break;
+		}
+
+		leds_to_change = ms.stop_led - ms.start_led;
+		if (ms.start_led < 0
+				|| leds_to_change > priv->num_leds
+				|| leds_to_change < 1) {
+			ret = -EINVAL;
+			break;
+		}
+
+		brightness = kmalloc(sizeof(uint8_t) * leds_to_change, GFP_KERNEL);
+		if (!brightness)
+			return -ENOMEM;
+
+		if (copy_from_user(brightness, ms.brightnesses,
+					sizeof(uint8_t) * leds_to_change)) {
+			ret = -EFAULT;
+			break;
+		}
+
+		for (i = ms.start_led, led = priv->leds+ms.start_led;
+				i < ms.stop_led;
+				i++, led++, brightness++) {
+			spin_lock(&led->led_data_lock);
+			led->brightness = *brightness;
+		}
+		schedule_work(&priv->work_update_all);
+
+		for (i = ms.start_led, led = priv->leds+ms.start_led;
+				i < ms.stop_led;
+				i++, led++) {
+			spin_unlock(&led->led_data_lock);
+		}
+		kfree(brightness-leds_to_change);
+		break;
+	}
+	case LEDS_WS2812B_IOCTL_GET_LEDS_NUMBER:
+	{
+		int __user *p = (int __user *)arg;
+
+		ret = put_user(priv->num_leds, p);
+		break;
+	}
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static const struct file_operations ws2812b_ops = {
+	.owner = THIS_MODULE,
+	.open = ws2812b_open,
+	.release = ws2812b_release,
+	.unlocked_ioctl = ws2812b_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl   = ws2812b_ioctl,
+#endif
+};
+
+static int ws2812b_parse_child_dt(const struct device *dev,
+		struct device_node *child,
+		struct ws2812b_led *led)
+{
+	struct led_classdev *ldev = &led->ldev;
+	const char *state;
+
+	if (of_property_read_string(child, "label", &ldev->name))
+		ldev->name = child->name;
+
+	state = of_get_property(child, "default-state", NULL);
+	if (state) {
+		if (!strcmp(state, "on")) {
+			ldev->brightness = LED_FULL;
+		} else if (strcmp(state, "off")) {
+			dev_err(dev, "default-state can only be 'on' or 'off'");
+			return -EINVAL;
+		}
+		ldev->brightness = LED_OFF;
+	}
+
+	ldev->brightness_set = ws2812b_led_set_brightness;
+
+	INIT_WORK(&led->work, ws2812b_led_work);
+
+	return 0;
+}
+
+static int ws2812b_parse_dt(struct device *dev,
+		struct ws2812b_priv *priv)
+{
+	struct device_node *child;
+	int ret = 0, i = 0;
+
+	for_each_child_of_node(dev->of_node, child) {
+		struct ws2812b_led *led = &priv->leds[i];
+
+		led->priv = priv;
+		led->dev = dev;
+		led->child = child;
+		led->num = i;
+
+		spin_lock_init(&led->led_data_lock);
+
+		ret = ws2812b_parse_child_dt(dev, child, led);
+
+		if (ret)
+			goto err;
+
+		ret = devm_led_classdev_register(dev, &led->ldev);
+		if (ret) {
+			dev_err(dev, "failed to register led for %s: %d\n", led->ldev.name, ret);
+			goto err;
+		}
+
+		led->ldev.dev->of_node = child;
+		i++;
+	}
+
+	return 0;
+err:
+	of_node_put(child);
+	return ret;
+}
+
+static const struct of_device_id ws2812b_driver_ids[] = {
+	{ .compatible = "worldsemi,ws2812b" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ws2812b_driver_ids);
+
+static int ws2812b_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct ws2812b_priv *priv;
+	struct ws2812b_encoding *spi_data;
+	int ret, len, count_leds;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	count_leds = of_get_child_count(dev->of_node);
+	if (!count_leds) {
+		dev_err(dev, "should define at least one led\n");
+		return -EINVAL;
+	}
+
+	priv->num_leds = count_leds;
+	priv->leds = devm_kzalloc(dev, sizeof(struct ws2812b_led) * count_leds, GFP_KERNEL);
+
+	mutex_init(&priv->ws2812b_mutex);
+
+	len = DELAY_BEFORE_FIRST_DATA + count_leds * sizeof(struct ws2812b_encoding) + RESET_BYTES;
+	spi_data = devm_kzalloc(dev, len, GFP_KERNEL);
+	if (!spi_data)
+		return -ENOMEM;
+	priv->spi_data = spi_data;
+
+	priv->spi = spi;
+	spi_message_init(&priv->spi_msg);
+	priv->spi_xfer.len = len;
+	priv->spi_xfer.tx_buf = spi_data;
+	priv->spi_xfer.speed_hz = SPI_BUS_SPEED_HZ;
+	spi_message_add_tail(&priv->spi_xfer, &priv->spi_msg);
+
+	priv->mdev.minor = MISC_DYNAMIC_MINOR;
+	priv->mdev.fops = &ws2812b_ops;
+	priv->mdev.parent = NULL;
+
+	if (of_property_read_string(dev->of_node, "device-name", &priv->mdev.name))
+		priv->mdev.name = DEFAULT_DEVICE_NAME;
+
+	ret = misc_register(&priv->mdev);
+	if (ret) {
+		dev_err(dev, "can't register %s device\n", priv->mdev.name);
+		return ret;
+	}
+
+	INIT_WORK(&priv->work_update_all, ws2812b_all_leds_update_work);
+
+	spi_set_drvdata(spi, priv);
+
+	ret = ws2812b_parse_dt(dev, priv);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ws2812b_remove(struct spi_device *spi)
+{
+	struct ws2812b_priv *priv = spi_get_drvdata(spi);
+	int i;
+
+	for (i = 0; i < priv->num_leds; i++) {
+		led_classdev_unregister(&priv->leds[i].ldev);
+		cancel_work_sync(&priv->leds[i].work);
+	}
+	cancel_work_sync(&priv->work_update_all);
+
+	return 0;
+}
+
+static struct spi_driver ws2812b_driver = {
+	.probe = ws2812b_probe,
+	.remove = ws2812b_remove,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.owner = THIS_MODULE,
+		.of_match_table = ws2812b_driver_ids,
+	},
+};
+
+module_spi_driver(ws2812b_driver);
+
+MODULE_AUTHOR("Ivan Vozvakhov <i.vozvakhov@vk.team>");
+MODULE_DESCRIPTION("WS2812B LED driver powered by SPI");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("spi:ws2812b");
-- 
2.25.1


Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39643271198
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 02:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgITAZF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 20:25:05 -0400
Received: from lists.nic.cz ([217.31.204.67]:48816 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726806AbgITAZF (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 19 Sep 2020 20:25:05 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 983A5140A85;
        Sun, 20 Sep 2020 02:25:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600561502; bh=G+rg62qQo/kx0CzbOci94Gc6qvyYbx7amnNk/SadP7Q=;
        h=From:To:Date;
        b=C7sHa3FXiDEFtoPC3uZ/zvgsLhP8WmrnZuHX36zPMKpU+Ory04TO44eyem4KjXV2G
         B1tOhkZcXWAh+AmzxVQNjg6J/BwjtONshmrkxtgOFZDI0PqB2h7EHCbcBemtu7GwGb
         qbf2de9eHRNa7wmJA8ISsQ6qtLMforaRRN97Sl1U=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Peter Meerwald <p.meerwald@bct-electronic.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Zahari Petkov <zahari@balena.io>
Subject: [PATCH leds 5/7] leds: pca963x: use flexible array
Date:   Sun, 20 Sep 2020 02:24:58 +0200
Message-Id: <20200920002500.5851-6-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920002500.5851-1-marek.behun@nic.cz>
References: <20200920002500.5851-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Instead of doing two allocations, allocate only once, by utilizing
flexible array members.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Peter Meerwald <p.meerwald@bct-electronic.com>
Cc: Ricardo Ribalda <ribalda@kernel.org>
Cc: Zahari Petkov <zahari@balena.io>
---
 drivers/leds/leds-pca963x.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index a4096694925f5..73dc00787beed 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -96,15 +96,7 @@ static const struct i2c_device_id pca963x_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, pca963x_id);
 
-struct pca963x_led;
-
-struct pca963x {
-	struct pca963x_chipdef *chipdef;
-	struct mutex mutex;
-	struct i2c_client *client;
-	struct pca963x_led *leds;
-	unsigned long leds_on;
-};
+struct pca963x;
 
 struct pca963x_led {
 	struct pca963x *chip;
@@ -115,6 +107,14 @@ struct pca963x_led {
 	u8 gfrq;
 };
 
+struct pca963x {
+	struct pca963x_chipdef *chipdef;
+	struct mutex mutex;
+	struct i2c_client *client;
+	unsigned long leds_on;
+	struct pca963x_led leds[];
+};
+
 static int pca963x_brightness(struct pca963x_led *led,
 			      enum led_brightness brightness)
 {
@@ -367,7 +367,6 @@ static int pca963x_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct pca963x_chipdef *chipdef;
 	struct pca963x_platform_data *pdata;
-	struct pca963x_led *leds;
 	struct pca963x *chip;
 	int i, err;
 
@@ -389,26 +388,23 @@ static int pca963x_probe(struct i2c_client *client,
 		return -EINVAL;
 	}
 
-	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	chip = devm_kzalloc(dev, struct_size(chip, leds, chipdef->n_leds),
+			    GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
-	leds = devm_kcalloc(dev, chipdef->n_leds, sizeof(*leds), GFP_KERNEL);
-	if (!leds)
-		return -ENOMEM;
 
 	i2c_set_clientdata(client, chip);
 
 	mutex_init(&chip->mutex);
 	chip->chipdef = chipdef;
 	chip->client = client;
-	chip->leds = leds;
 
 	/* Turn off LEDs by default*/
 	for (i = 0; i < chipdef->n_leds / 4; i++)
 		i2c_smbus_write_byte_data(client, chipdef->ledout_base + i, 0x00);
 
 	for (i = 0; i < chipdef->n_leds; i++) {
-		struct pca963x_led *led = &leds[i];
+		struct pca963x_led *led = &chip->leds[i];
 
 		led->led_num = i;
 		led->chip = chip;
-- 
2.26.2


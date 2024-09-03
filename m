Return-Path: <linux-leds+bounces-2585-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8AA969A00
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 12:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A0841F23A43
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 10:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8481219F435;
	Tue,  3 Sep 2024 10:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bEGsYtxn"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6192F1AD253
	for <linux-leds@vger.kernel.org>; Tue,  3 Sep 2024 10:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725358808; cv=none; b=DmDmTro+pA1PPEm+3w/Jw6T0N1jPXIb44HccNdD2hYZVpsVfvgDCr7nFwgNtuQThA+PKsnZgMXVcxaGlxOVFgvgUF2zaGjd2h2TAvvOF6q8X4wWcvx3lQ6ALKY/riPak2UDFzNtyG+G4MJB37FAjlT+os6XyRJaZmw8Z13Wq+8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725358808; c=relaxed/simple;
	bh=vs8Tsdi6pPQ8xa5suwaesNowGqSnjweIujultdB+tXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JdbbMW9TcLh17mU73Krg6de4PGFDR4URTfkB8HKXb99HGREB7QyPxmQjN/phyjM5UaKv+EiLlvSj2pmofVKieV+/PZtt/7Cua4jAhFrg30QdWcHi+PKycAVvUlT2/dLtJGLwXi1KsMTKJWRLcLwutmaP3awwcfP9rt6uZCg0NOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bEGsYtxn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC17C4CEC8;
	Tue,  3 Sep 2024 10:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725358807;
	bh=vs8Tsdi6pPQ8xa5suwaesNowGqSnjweIujultdB+tXA=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=bEGsYtxnkzrKpretQSo4JKCpY7cbeCnkMDHXvC6m2VTA10+177K1o1qqOvKor+exw
	 Bjne6/gbMcb1YUp2us9WbcNK1zxy13WlXFpiUFbftQqELdMqz1J/R3eKOHKY9DAC/e
	 unlIFZZEJVqWXzGzW1w1w0o+HpBS3GX1Y1csmFjvPd1ZA9Vj8FcW+tz4ZZHxaFI2Mw
	 AUfBddPykKwD6wRYk0E+/sCizICOCeYO5wIzui8OmtXU1otQCngdM0rO+lOjYED+Ks
	 p0TNcqGNzFGlY/MaZH6IBiqD+4FDkqbEJ5PEEPaHLcdlHGnpn0De5Rvh8bmr9v6TBy
	 2VOeK70Plx9Sw==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v2 10/11] leds: turris-omnia: Use 100 columns in the rest of the code
Date: Tue,  3 Sep 2024 12:19:29 +0200
Message-ID: <20240903101930.16251-11-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240903101930.16251-1-kabel@kernel.org>
References: <20240903101930.16251-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are 7 more places in the code where the 100 column limit can be
used to make the code more uniform. Do it.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 58c3f3afbca5..4ab76b5b5e68 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -44,8 +44,7 @@ static int omnia_cmd_set_color(const struct i2c_client *client, u8 led, u8 r, u8
 	return omnia_cmd_write(client, buf, sizeof(buf));
 }
 
-static int omnia_led_send_color_cmd(const struct i2c_client *client,
-				    struct omnia_led *led)
+static int omnia_led_send_color_cmd(const struct i2c_client *client, struct omnia_led *led)
 {
 	int ret;
 
@@ -90,8 +89,7 @@ static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
 	 * implement the division instruction).
 	 */
 	if (brightness || led->hwtrig) {
-		led_mc_calc_color_components(mc_cdev, brightness ?:
-						      cdev->max_brightness);
+		led_mc_calc_color_components(mc_cdev, brightness ?: cdev->max_brightness);
 
 		/*
 		 * Send color command only if brightness is non-zero and the RGB
@@ -174,8 +172,7 @@ static void omnia_hwtrig_deactivate(struct led_classdev *cdev)
 	mutex_unlock(&leds->lock);
 
 	if (err)
-		dev_err(cdev->dev, "Cannot put LED to software mode: %i\n",
-			err);
+		dev_err(cdev->dev, "Cannot put LED to software mode: %i\n", err);
 }
 
 static struct led_trigger omnia_hw_trigger = {
@@ -251,8 +248,7 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Cannot set LED %pOF initial color\n", np);
 
-	ret = devm_led_classdev_multicolor_register_ext(dev, &led->mc_cdev,
-							&init_data);
+	ret = devm_led_classdev_multicolor_register_ext(dev, &led->mc_cdev, &init_data);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Cannot register LED %pOF\n", np);
 
@@ -270,8 +266,7 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
  * file lives in the device directory of the LED controller, not an individual
  * LED, so it should not confuse users.
  */
-static ssize_t brightness_show(struct device *dev, struct device_attribute *a,
-			       char *buf)
+static ssize_t brightness_show(struct device *dev, struct device_attribute *a, char *buf)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	u8 reply;
@@ -303,8 +298,7 @@ static ssize_t brightness_store(struct device *dev, struct device_attribute *a,
 }
 static DEVICE_ATTR_RW(brightness);
 
-static ssize_t gamma_correction_show(struct device *dev,
-				     struct device_attribute *a, char *buf)
+static ssize_t gamma_correction_show(struct device *dev, struct device_attribute *a, char *buf)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct omnia_leds *leds = i2c_get_clientdata(client);
@@ -320,8 +314,7 @@ static ssize_t gamma_correction_show(struct device *dev,
 	return sysfs_emit(buf, "%d\n", !!reply);
 }
 
-static ssize_t gamma_correction_store(struct device *dev,
-				      struct device_attribute *a,
+static ssize_t gamma_correction_store(struct device *dev, struct device_attribute *a,
 				      const char *buf, size_t count)
 {
 	struct i2c_client *client = to_i2c_client(dev);
-- 
2.44.2



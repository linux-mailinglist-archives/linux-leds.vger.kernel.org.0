Return-Path: <linux-leds+bounces-5196-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B654AB1A0BA
	for <lists+linux-leds@lfdr.de>; Mon,  4 Aug 2025 13:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FF133A73C4
	for <lists+linux-leds@lfdr.de>; Mon,  4 Aug 2025 11:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC57254873;
	Mon,  4 Aug 2025 11:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="UCDAcv47"
X-Original-To: linux-leds@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F9923817D;
	Mon,  4 Aug 2025 11:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754308214; cv=none; b=gcg7wbnf54G7XueiMi3P+UPZBJWZU21PzFulqb0ysfDj6kOOimmCXy98XaX0NeliqhB/Lt+EB4QR5nd6AOLguqWo3ra4QP4hh8WftjzQbB6jsOajFH6g6qSJCAoxBD1gueAhhJCg/fa8oFuCLyKBvJB4033Vnxi3wTb2l6xoEz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754308214; c=relaxed/simple;
	bh=mUcDTxTcvH9vf/PGlrGUaQ2EdvA/71aUCNo6FcsesZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ouCwHZ/LTd33gA/1f5Wd0I8Bvq3daP1qgR884jWr5nx3qfQ3fkoJ69wqBdjP8bhT8dvBuDkIW8K8zrrIDpjkWfethy748xdJx8m7+BaA/R7Ges6pTCP+61Fpq32Ao8N/YQw8WP4Njn/nIeni+wrK4WphvaEqHZKCsWPa94wqsnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=UCDAcv47; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=rUHH4Nk6xIhgeCZagXp4wb88amVQtbbOEVNBe86h1q4=; b=UCDAcv47ElhvhOYzJYfkAZWM+F
	YPPrJWmsEyFAbCfXQzdqLD41mo0cXvBjPakTz0yQcTRMXKboenSpLbgwvzO2DtiEkVj2UQuXwbVBw
	/40rHbhKNQEnd9v9k25tHsUDh/npr8zpadqY5C0PlS4Hv8rf1+eb8mcGwA7eRsYn8e1r4058/5jJv
	qivh8y7/GYdxwUFqyT7re5FyNZlbyU+3txuStwh0LNWRYL3X0YEJlzszYVkgpbILVRitB7L1wgk6q
	JqMcuSAnmPpFcOrYznPP18SwAV3oHZtLkMaRcs//tnSPkqMbOpYrKvQJcDle/anUldUf2Bd/aqian
	FwZfNB2g==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uithc-0003cE-F8; Mon, 04 Aug 2025 13:50:04 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: heiko@sntech.de,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] leds: qnap-mcu: add support for the red and green status LEDs
Date: Mon,  4 Aug 2025 13:49:49 +0200
Message-ID: <20250804114949.3127417-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250804114949.3127417-1-heiko@sntech.de>
References: <20250804114949.3127417-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is one more set of two LEDs on the qnap devices to indicate status.

One LED is green, the other is red and while they occupy the same space
on the front panel, they cannot be enabled at the same time.

But they can interact via blink functions, the MCU can flash them
alternately, going red -> green -> red -> ... either in 500ms or
1s intervals. They can of course also blink individually.

Add specific LED functions for them and register them on probe.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/leds/leds-qnap-mcu.c | 165 +++++++++++++++++++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/drivers/leds/leds-qnap-mcu.c b/drivers/leds/leds-qnap-mcu.c
index fe055c5511b8..fe1bec584f53 100644
--- a/drivers/leds/leds-qnap-mcu.c
+++ b/drivers/leds/leds-qnap-mcu.c
@@ -190,6 +190,166 @@ static int qnap_mcu_register_usb_led(struct device *dev, struct qnap_mcu *mcu)
 	return qnap_mcu_usb_led_set(&usb_led->cdev, 0);
 }
 
+enum qnap_mcu_status_led_mode {
+	QNAP_MCU_STATUS_LED_OFF = 0,
+	QNAP_MCU_STATUS_LED_ON = 1,
+	QNAP_MCU_STATUS_LED_BLINK_FAST = 2, /* 500ms / 500ms */
+	QNAP_MCU_STATUS_LED_BLINK_SLOW = 3, /* 1s / 1s */
+};
+
+struct qnap_mcu_status_led {
+	struct led_classdev cdev;
+	struct qnap_mcu_status_led *red;
+	u8 mode;
+};
+
+struct qnap_mcu_status {
+	struct qnap_mcu *mcu;
+	struct qnap_mcu_status_led red;
+	struct qnap_mcu_status_led green;
+};
+
+static inline struct qnap_mcu_status_led *cdev_to_qnap_mcu_status_led(struct led_classdev *led_cdev)
+{
+	return container_of(led_cdev, struct qnap_mcu_status_led, cdev);
+}
+
+static inline struct qnap_mcu_status *statusled_to_qnap_mcu_status(struct qnap_mcu_status_led *led)
+{
+	return container_of(led->red, struct qnap_mcu_status, red);
+}
+
+static u8 qnap_mcu_status_led_encode(struct qnap_mcu_status *status)
+{
+	if (status->red.mode == QNAP_MCU_STATUS_LED_OFF) {
+		switch (status->green.mode) {
+		case QNAP_MCU_STATUS_LED_OFF:
+			return '9';
+		case QNAP_MCU_STATUS_LED_ON:
+			return '6';
+		case QNAP_MCU_STATUS_LED_BLINK_FAST:
+			return '5';
+		case QNAP_MCU_STATUS_LED_BLINK_SLOW:
+			return 'A';
+		}
+	} else if (status->green.mode == QNAP_MCU_STATUS_LED_OFF) {
+		switch (status->red.mode) {
+		case QNAP_MCU_STATUS_LED_OFF:
+			return '9';
+		case QNAP_MCU_STATUS_LED_ON:
+			return '7';
+		case QNAP_MCU_STATUS_LED_BLINK_FAST:
+			return '4';
+		case QNAP_MCU_STATUS_LED_BLINK_SLOW:
+			return 'B';
+		}
+	} else if (status->green.mode == QNAP_MCU_STATUS_LED_ON &&
+		   status->red.mode == QNAP_MCU_STATUS_LED_ON) {
+		return 'D';
+	} else if (status->green.mode == QNAP_MCU_STATUS_LED_BLINK_SLOW &&
+		   status->red.mode == QNAP_MCU_STATUS_LED_BLINK_SLOW) {
+		return 'C';
+	}
+
+	/*
+	 * Here both LEDs are on in some fashion, either both blinking fast,
+	 * or in different speeds, so default to fast blinking for both.
+	 */
+	return '8';
+}
+
+static int qnap_mcu_status_led_update(struct qnap_mcu *mcu,
+				      struct qnap_mcu_status *status)
+{
+	u8 cmd[] = { '@', 'C', 0 };
+
+	cmd[2] = qnap_mcu_status_led_encode(status);
+
+	return qnap_mcu_exec_with_ack(mcu, cmd, sizeof(cmd));
+}
+
+static int qnap_mcu_status_led_set(struct led_classdev *led_cdev,
+				   enum led_brightness brightness)
+{
+	struct qnap_mcu_status_led *status_led = cdev_to_qnap_mcu_status_led(led_cdev);
+	struct qnap_mcu_status *base = statusled_to_qnap_mcu_status(status_led);
+
+	/* Don't disturb a possible set blink-mode if LED stays on */
+	if (brightness != 0 && status_led->mode >= QNAP_MCU_STATUS_LED_BLINK_FAST)
+		return 0;
+
+	status_led->mode = brightness ? QNAP_MCU_STATUS_LED_ON :
+					QNAP_MCU_STATUS_LED_OFF;
+
+	return qnap_mcu_status_led_update(base->mcu, base);
+}
+
+static int qnap_mcu_status_led_blink_set(struct led_classdev *led_cdev,
+					 unsigned long *delay_on,
+					 unsigned long *delay_off)
+{
+	struct qnap_mcu_status_led *status_led = cdev_to_qnap_mcu_status_led(led_cdev);
+	struct qnap_mcu_status *base = statusled_to_qnap_mcu_status(status_led);
+
+	if (status_led->mode == QNAP_MCU_STATUS_LED_OFF)
+		return 0;
+
+	if (*delay_on <= 500) {
+		*delay_on = 500;
+		*delay_off = 500;
+		status_led->mode = QNAP_MCU_STATUS_LED_BLINK_FAST;
+	} else {
+		*delay_on = 1000;
+		*delay_off = 1000;
+		status_led->mode = QNAP_MCU_STATUS_LED_BLINK_SLOW;
+	}
+
+	return qnap_mcu_status_led_update(base->mcu, base);
+}
+
+static int qnap_mcu_register_status_leds(struct device *dev, struct qnap_mcu *mcu)
+{
+	struct qnap_mcu_status *status;
+	int ret;
+
+	status = devm_kzalloc(dev, sizeof(*status), GFP_KERNEL);
+	if (!status)
+		return -ENOMEM;
+
+	status->mcu = mcu;
+
+	/*
+	 * point to the red led, so that statusled_to_qnap_mcu_status
+	 * can resolve the main status struct containing both leds
+	 */
+	status->red.red = &status->red;
+	status->green.red = &status->red;
+
+	status->red.mode = QNAP_MCU_STATUS_LED_OFF;
+	status->red.cdev.name = "red:status";
+	status->red.cdev.brightness_set_blocking = qnap_mcu_status_led_set;
+	status->red.cdev.blink_set = qnap_mcu_status_led_blink_set;
+	status->red.cdev.brightness = 0;
+	status->red.cdev.max_brightness = 1;
+
+	status->green.mode = QNAP_MCU_STATUS_LED_OFF;
+	status->green.cdev.name = "green:status";
+	status->green.cdev.brightness_set_blocking = qnap_mcu_status_led_set;
+	status->green.cdev.blink_set = qnap_mcu_status_led_blink_set;
+	status->green.cdev.brightness = 0;
+	status->green.cdev.max_brightness = 1;
+
+	ret = devm_led_classdev_register(dev, &status->red.cdev);
+	if (ret)
+		return ret;
+
+	ret = devm_led_classdev_register(dev, &status->green.cdev);
+	if (ret)
+		return ret;
+
+	return qnap_mcu_status_led_update(status->mcu, status);
+}
+
 static int qnap_mcu_leds_probe(struct platform_device *pdev)
 {
 	struct qnap_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
@@ -210,6 +370,11 @@ static int qnap_mcu_leds_probe(struct platform_device *pdev)
 					"failed to register USB LED\n");
 	}
 
+	ret = qnap_mcu_register_status_leds(&pdev->dev, mcu);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register status LEDs\n");
+
 	return 0;
 }
 
-- 
2.47.2



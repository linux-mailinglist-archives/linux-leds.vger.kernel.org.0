Return-Path: <linux-leds+bounces-5171-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BF4B16524
	for <lists+linux-leds@lfdr.de>; Wed, 30 Jul 2025 19:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1020F17D3A9
	for <lists+linux-leds@lfdr.de>; Wed, 30 Jul 2025 17:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCAD2DCF45;
	Wed, 30 Jul 2025 17:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="vQfg6XYe"
X-Original-To: linux-leds@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B3A1DFDAB;
	Wed, 30 Jul 2025 17:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753895126; cv=none; b=O09AKds4g+qUsqmpymitvQxNSZeCjgZ7RPsmxWfXNua31z7l51kEpf7hLr/XoDrHJ01XiTMQzsUWhZUFR61PbdMJOjnNAtMCTZijHm9VYvZHxaUN9AdqWgYp2guhPO/DPQcXBBoiWKdz/oEnQWRrsFgon4pPiHFWCIOssf4+Mik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753895126; c=relaxed/simple;
	bh=6f315aKBpZbc/FKzdZZbxH8She+aKjcwj6qDICLts3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mogsC4gl6Bgfw1We4Rr9YN1osq64Za+OpmbJQ5e9avTAJnAM2TXdfKRd1VHavRR5R8/GUz63YhKxSUZCKRFH9Fxw/yyKr0gE5rOCa25zygSPS+D2wNAlOnAdCJTO+Miv2Vr9WEFzEGKONc07sLUiiMEq5vUhKAEXt8PUdk5NGqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=vQfg6XYe; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=ACKnkrsm3996mQlnpuWF1ZjvpEvYQar65sXrCnRnrYo=; b=vQfg6XYe8S13wo+nJaxxj0ewRc
	m4R6njKJVSKczMshuVl0nhq7dBlscrU5Rg/GX51UdTi2WLI3Aw5XL44igJsW6d+DMRMNW+Uf9JyWc
	cXLEEEkLpRYUukuF8rL5EK5yiWClzXkxmB8He78R2g33m8IvS1AXcXxSID4bNn4X3n652NUCGkq2A
	4HNRo7P/wNdWvyhdpHk/JlgXMVrxdAyxV3xpvDPUYxKmAAawO9QHxOmYHoVEHOkRiYVsIKw/nEwe8
	z9EW+pUlRajP8W33jTK8EEMtgOS/aomN0KRsbb55yGxK3y/ZZCRNri9QlXJUNbV8AFxFreriyjlDV
	9QGOl4NA==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uhAEt-0001N9-Jc; Wed, 30 Jul 2025 19:05:15 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: heiko@sntech.de,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: qnap-mcu: add support for the red and green status leds
Date: Wed, 30 Jul 2025 19:05:07 +0200
Message-ID: <20250730170507.1869905-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
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

Add specific led functions for them and register them on probe.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/leds/leds-qnap-mcu.c | 156 +++++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/drivers/leds/leds-qnap-mcu.c b/drivers/leds/leds-qnap-mcu.c
index 4e4709456261..b7747b47c604 100644
--- a/drivers/leds/leds-qnap-mcu.c
+++ b/drivers/leds/leds-qnap-mcu.c
@@ -190,6 +190,157 @@ static int qnap_mcu_register_usb_led(struct device *dev, struct qnap_mcu *mcu)
 	return qnap_mcu_usb_led_set(&usb_led->cdev, 0);
 }
 
+enum qnap_mcu_status_led_mode {
+	QNAP_MCU_STATUS_LED_OFF = 0,
+	QNAP_MCU_STATUS_LED_ON = 1,
+	QNAP_MCU_STATUS_LED_BLINK_FAST = 2, /* 500ms / 500ms */
+	QNAP_MCU_STATUS_LED_BLINK_SLOW = 3, /* 1s / 1s */
+};
+
+struct qnap_mcu_status;
+struct qnap_mcu_status_led {
+	struct qnap_mcu_status *base;
+	struct led_classdev cdev;
+	u8 mode;
+};
+
+struct qnap_mcu_status {
+	struct qnap_mcu *mcu;
+	struct qnap_mcu_status_led red;
+	struct qnap_mcu_status_led green;
+};
+
+static inline struct qnap_mcu_status_led *
+		cdev_to_qnap_mcu_status_led(struct led_classdev *led_cdev)
+{
+	return container_of(led_cdev, struct qnap_mcu_status_led, cdev);
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
+	} else if (status->green.mode == QNAP_MCU_STATUS_LED_BLINK_SLOW &&
+		   status->red.mode == QNAP_MCU_STATUS_LED_BLINK_SLOW) {
+		return 'C';
+	}
+
+	/*
+	 * At this point, both LEDs are on in some fashion, but both
+	 * cannot be on at the same time, so just use the fast blink
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
+
+	/* Don't disturb a possible set blink-mode if LED stays on */
+	if (brightness != 0 &&
+	    status_led->mode >= QNAP_MCU_STATUS_LED_BLINK_FAST)
+		return 0;
+
+	status_led->mode = brightness ? QNAP_MCU_STATUS_LED_ON :
+					QNAP_MCU_STATUS_LED_OFF;
+
+	return qnap_mcu_status_led_update(status_led->base->mcu,
+					  status_led->base);
+}
+
+static int qnap_mcu_status_led_blink_set(struct led_classdev *led_cdev,
+					 unsigned long *delay_on,
+					 unsigned long *delay_off)
+{
+	struct qnap_mcu_status_led *status_led = cdev_to_qnap_mcu_status_led(led_cdev);
+
+	/* LED is off, nothing to do */
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
+	return qnap_mcu_status_led_update(status_led->base->mcu,
+					  status_led->base);
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
+	status->red.base = status;
+	status->green.base = status;
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
@@ -210,6 +361,11 @@ static int qnap_mcu_leds_probe(struct platform_device *pdev)
 					"failed to register USB LED\n");
 	}
 
+	ret = qnap_mcu_register_status_leds(&pdev->dev, mcu);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register status LED\n");
+
 	return 0;
 }
 
-- 
2.47.2



Return-Path: <linux-leds+bounces-5197-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D16ECB1A0BB
	for <lists+linux-leds@lfdr.de>; Mon,  4 Aug 2025 13:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC440170A26
	for <lists+linux-leds@lfdr.de>; Mon,  4 Aug 2025 11:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2232566DD;
	Mon,  4 Aug 2025 11:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ZOoXfSfO"
X-Original-To: linux-leds@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86403212D83;
	Mon,  4 Aug 2025 11:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754308214; cv=none; b=RKqoVXc1MhMvtiK4lPpjkBrfyyv9wJf8IdLWn5X+jh8EZgKrVNRXwDFLs4wcfvCWcTJriSRmzWe5V3yZPbwIjv6trJ/5uXUj3e3WrQeRyWkxfo0WS0A5OCIdFEMcPDvyYZS7LJWKfB5pYsKNvmcRRpPk+LITp/sj21AHZR+igmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754308214; c=relaxed/simple;
	bh=PXGjcA5GCbkRBqObq0KqFnQxUF7xeheMXf2IQzSt1Bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kGHzaqf28E01o784k+JgzNWh47mdZhHMEOutDNI/RR6VNHJzglEckevAZEfLkN+TUEJNDntbdymrznubPzpu4dSqKKpf67+R4t90VTfKclE9JxENCNMa0o0rOT9EapCg6tWRdJ/0t2bM1J1Vn3glp8Vq0YFnPkuB8XvEPosAG+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ZOoXfSfO; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=8iBcZ3OtVhbVYqsfwwCcpWfdIFjsudrQi0+7eI/zvFE=; b=ZOoXfSfOBIbUI8bADIvJ1GwBMI
	T7yuIE5bTOCJ0UPHgHx37HmieUjUPvND5O+6dq8QJte0gXzhavQGdLMrCPJsOUA8OxZqGpL11O2iO
	tUkhDIfq72H/GmlzSei41v3sFPmL6WZ99JgXqWTCHM8ulZVGuKurzgd18RP95x+lrH3A3oneklPpF
	hD2k3QGLhl1A/aUnhQmBPeG6qsNQiCBpXyHMwn6NXAwP8T1zbOkbHmzi3dRL1uEkLqtBA93h0Nr0S
	9ckKFho9/VsVuJi0HU4lm0BgLg2YhWf595yeVId4kh5YQfmH18Xrk4ZUJ1qPMpZ97uOTWV+benfOp
	etipw8yw==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uithc-0003cE-9R; Mon, 04 Aug 2025 13:50:04 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: heiko@sntech.de,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] leds: qnap-mcu: fix state numbering for usb LED
Date: Mon,  4 Aug 2025 13:49:48 +0200
Message-ID: <20250804114949.3127417-2-heiko@sntech.de>
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

The "@Cx" commands span a number of different functions, from the status
and usb LEDs to the buzzer and power button.

So change the usb-LED enum to start at 0 and adapt the offset accordingly
to not suggest @CD would relate to the usb-LED - while in fact "@CD" is a
state of the status LED.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/leds/leds-qnap-mcu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-qnap-mcu.c b/drivers/leds/leds-qnap-mcu.c
index 4e4709456261..fe055c5511b8 100644
--- a/drivers/leds/leds-qnap-mcu.c
+++ b/drivers/leds/leds-qnap-mcu.c
@@ -104,9 +104,9 @@ static int qnap_mcu_register_err_led(struct device *dev, struct qnap_mcu *mcu, i
 }
 
 enum qnap_mcu_usb_led_mode {
-	QNAP_MCU_USB_LED_ON = 1,
-	QNAP_MCU_USB_LED_OFF = 3,
-	QNAP_MCU_USB_LED_BLINK = 2,
+	QNAP_MCU_USB_LED_ON = 0,
+	QNAP_MCU_USB_LED_OFF = 2,
+	QNAP_MCU_USB_LED_BLINK = 1,
 };
 
 struct qnap_mcu_usb_led {
@@ -137,7 +137,7 @@ static int qnap_mcu_usb_led_set(struct led_classdev *led_cdev,
 	 * Byte 3 is shared between the usb led target on/off/blink
 	 * and also the buzzer control (in the input driver)
 	 */
-	cmd[2] = 'D' + usb_led->mode;
+	cmd[2] = 'E' + usb_led->mode;
 
 	return qnap_mcu_exec_with_ack(usb_led->mcu, cmd, sizeof(cmd));
 }
@@ -161,7 +161,7 @@ static int qnap_mcu_usb_led_blink_set(struct led_classdev *led_cdev,
 	 * Byte 3 is shared between the USB LED target on/off/blink
 	 * and also the buzzer control (in the input driver)
 	 */
-	cmd[2] = 'D' + usb_led->mode;
+	cmd[2] = 'E' + usb_led->mode;
 
 	return qnap_mcu_exec_with_ack(usb_led->mcu, cmd, sizeof(cmd));
 }
-- 
2.47.2



Return-Path: <linux-leds+bounces-4017-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0C5A3D8A7
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 12:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8A703BE535
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 11:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4791F193C;
	Thu, 20 Feb 2025 11:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="MwsbpjMq";
	dkim=pass (2048-bit key) header.d=triplefau.lt header.i=@triplefau.lt header.b="I3T48YCU"
X-Original-To: linux-leds@vger.kernel.org
Received: from e3i103.smtp2go.com (e3i103.smtp2go.com [158.120.84.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E945C1DE3AF
	for <linux-leds@vger.kernel.org>; Thu, 20 Feb 2025 11:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050905; cv=none; b=uZyOSaeXyjZrDV1vZVOP0jsiil9mfUyBDX78Sttp31KxT5ChugJ08Yx9hsEjacwpxnScM27wIN4zvBx7BmBZv0ik92Zkz1sIKOPi+NasWuM94X6mB55IqsudtLU8DZVBK6ugOZnU+RDih28k0MWV1kj1SLdgNm1CvWGIjoAsGxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050905; c=relaxed/simple;
	bh=YkiHPumBN8nAiPNaHtyQooOU01tx/EZ1O8QxZuFIQAw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YdBzRbWAlKNt2DGjUy7qERgDfKU9rRrd79biSfNxRuC8+UmowaKIsaoY0kDTFvATJjStnFFudpAN+4bYhRAeVKaPPzqgbKTcLZ+oB9qY9NkQQ/TEzkzF5ZmB8weZlQ4ueU7IjGqLPdvOQOgApRWcD/xT4P56VaaK1eToVe4dARY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=triplefau.lt; spf=pass smtp.mailfrom=em510616.triplefau.lt; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=MwsbpjMq; dkim=pass (2048-bit key) header.d=triplefau.lt header.i=@triplefau.lt header.b=I3T48YCU; arc=none smtp.client-ip=158.120.84.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=triplefau.lt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em510616.triplefau.lt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1740050893; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=M1W1nn58NLGVj+eWLt6EtKwldWjGNarRyKe0cNviRKI=;
 b=MwsbpjMq+1Yp1OJ38rUr7dbPIVRIb0d0WWELWVawDlQbHqGQCLMq60k0MYYtPvevxUbRE
 +LG8p+BGGrQYTIF3BUkY/y/T9EFEWvV4VIDtwfnd9w1LuSE9uRPOWgI4esvmXke4zTb5goN
 yxUwFUF1DKqWzKBu+8+P4q14p8To0beRWXbGZ+okEJray82CBAq6V37VcDm5WndEcxpwc9U
 hhzRAEyFEbP56sL4pnp9H14fVMGf23M7w1CsWNt0Ks3tdd9qDJAcnKzrYynyDjy2fKLFXNV
 W0d/J5UAC0cSPIRF5LIff7vZYoiR63TyTyQ2IS99zhwPViXvtn5c1mYFEU6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1740050893; h=from : subject
 : to : message-id : date;
 bh=M1W1nn58NLGVj+eWLt6EtKwldWjGNarRyKe0cNviRKI=;
 b=I3T48YCUusE+JtDuKqedjdpDRXt89/VXrSkg8esWY7uyQT2cWlitDv429MjM1MFhlgQ2j
 lJFQXGTsuwlSo9mrRls+faddzN5dZ7QhpmU/7fWOLKDwAEGfsUWEhsbN/X+OU6cSEiEYEEw
 Od0EQPt5xrPAwxEp/Fu52s9t62HOeexJYVVB411grtqyElaG9pLv0/N69Wdn40HUDe/9llf
 NLwiLR2mGk+e4uxd9W5WrYf4xo7pfSUcqMD7xbdhitTjZYfbd8kD/F2pYfva1oAgJETxs4N
 PQn4JyKY9jFASrqo6wh3xT2t2aYxXaULq91ztzw01ZlArZEE1VBhkrxDUyIA==
Received: from [10.12.239.196] (helo=localhost)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97.1-S2G)
	(envelope-from <repk@triplefau.lt>)
	id 1tl4iv-4o5NDgrvJ0D-lp0j;
	Thu, 20 Feb 2025 11:28:09 +0000
From: Remi Pommarel <repk@triplefau.lt>
To: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH v2] leds: Fix LED_OFF brightness race
Date: Thu, 20 Feb 2025 12:23:17 +0100
Message-Id: <19c81177059dab7b656c42063958011a8e4d1a66.1740050412.git.repk@triplefau.lt>
X-Mailer: git-send-email 2.40.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 510616m:510616apGKSTK:510616sDHMaHdAgA
X-smtpcorp-track: PRuRbwpuJm3K.G-SHUU3uWzXI.4aq3mw9a3-B

While commit fa15d8c69238 ("leds: Fix set_brightness_delayed() race")
successfully forces led_set_brightness() to be called with LED_OFF at
least once when switching from blinking to LED on state so that
hw-blinking can be disabled, another race remains. Indeed in
led_set_brightness(LED_OFF) followed by led_set_brightness(any)
scenario the following CPU scheduling can happen:

    CPU0                                     CPU1
    ----                                     ----
 set_brightness_delayed() {
   test_and_clear_bit(BRIGHTNESS_OFF)
                                         led_set_brightness(LED_OFF) {
                                           set_bit(BRIGHTNESS_OFF)
					   queue_work()
                                         }
                                         led_set_brightness(any) {
                                           set_bit(BRIGHTNESS)
					   queue_work() //already queued
                                         }
   test_and_clear_bit(BRIGHTNESS)
     /* LED set with brightness any */
 }

 /* From previous CPU1 queue_work() */
 set_brightness_delayed() {
   test_and_clear_bit(BRIGHTNESS_OFF)
     /* LED turned off */
   test_and_clear_bit(BRIGHTNESS)
     /* Clear from previous run, LED remains off */

In that case the led_set_brightness(LED_OFF)/led_set_brightness(any)
sequence will be effectively executed in reverse order and LED will
remain off.

With the introduction of commit 32360bf6a5d4 ("leds: Introduce ordered
workqueue for LEDs events instead of system_wq") the race is easier to
trigger as sysfs brightness configuration does not wait for
set_brightness_delayed() work to finish (flush_work() removal).

Use delayed_set_value to optionnally re-configure brightness after a
LED_OFF. That way a LED state could be configured more that once but
final state will always be as expected. Ensure that delayed_set_value
modification is seen before set_bit() using smp_mb__before_atomic().

Fixes: fa15d8c69238 ("leds: Fix set_brightness_delayed() race")
Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
Changes for v1 to v2:
  - Use smp_mb__before_atomic().
---
 drivers/leds/led-core.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index f6c46d2e5276..e3d8ddcff567 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -159,8 +159,19 @@ static void set_brightness_delayed(struct work_struct *ws)
 	 * before this work item runs once. To make sure this works properly
 	 * handle LED_SET_BRIGHTNESS_OFF first.
 	 */
-	if (test_and_clear_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags))
+	if (test_and_clear_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags)) {
 		set_brightness_delayed_set_brightness(led_cdev, LED_OFF);
+		/*
+		 * The consecutives led_set_brightness(LED_OFF),
+		 * led_set_brightness(LED_FULL) could have been executed out of
+		 * order (LED_FULL first), if the work_flags has been set
+		 * between LED_SET_BRIGHTNESS_OFF and LED_SET_BRIGHTNESS of this
+		 * work. To avoid ending with the LED turned off, turn the LED
+		 * on again.
+		 */
+		if (led_cdev->delayed_set_value != LED_OFF)
+			set_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
+	}
 
 	if (test_and_clear_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags))
 		set_brightness_delayed_set_brightness(led_cdev, led_cdev->delayed_set_value);
@@ -331,10 +342,13 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
 	 * change is done immediately afterwards (before the work runs),
 	 * it uses a separate work_flag.
 	 */
-	if (value) {
-		led_cdev->delayed_set_value = value;
+	led_cdev->delayed_set_value = value;
+	/* Ensure delayed_set_value is seen before work_flags modification */
+	smp_mb__before_atomic();
+
+	if (value)
 		set_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
-	} else {
+	else {
 		clear_bit(LED_SET_BRIGHTNESS, &led_cdev->work_flags);
 		clear_bit(LED_SET_BLINK, &led_cdev->work_flags);
 		set_bit(LED_SET_BRIGHTNESS_OFF, &led_cdev->work_flags);
-- 
2.40.0



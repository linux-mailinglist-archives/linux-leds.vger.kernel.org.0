Return-Path: <linux-leds+bounces-3997-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED9AA3BC51
	for <lists+linux-leds@lfdr.de>; Wed, 19 Feb 2025 12:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67FC117539E
	for <lists+linux-leds@lfdr.de>; Wed, 19 Feb 2025 11:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BDB1CAA6D;
	Wed, 19 Feb 2025 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="b6BAIhjw";
	dkim=pass (2048-bit key) header.d=triplefau.lt header.i=@triplefau.lt header.b="dFMlt8ey"
X-Original-To: linux-leds@vger.kernel.org
Received: from e3i103.smtp2go.com (e3i103.smtp2go.com [158.120.84.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6941BC073
	for <linux-leds@vger.kernel.org>; Wed, 19 Feb 2025 11:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739962912; cv=none; b=mdiSmRR1PGK7sPKk8AdhpvaaTyT2AiR62Fg2DMhC0/tNVkvKuJgbHK+Z9TW55CV2FxxWaqY3+4Km7LILgr2wOKA8jyYPYtyh1ytLZj+WXPQ8rhSunHqVfQUXoZGV3i5OFGFbyezl3NzlFBmx1bnWnirhZQbCQEolsOM6vaofHCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739962912; c=relaxed/simple;
	bh=KVCozw5OuqMr/WczaaczI9sNw6U6VyepsSXMw6cdk+0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cj8BNldxsDJOKcLD4hvBD+u7agdNyv9p4GY3VYwkHTCnOPc/xvEOeH084ynffzN5+JWkqlNITqW0dJ1ITecPK+Ie4+w4ABPvLpL7fdToskqZwC+Ip57cjXnIrAgTggFTkquZy0Bqdir4vC1jwsAsIwrwzVp/jkr+bp9ThjfrWSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=triplefau.lt; spf=pass smtp.mailfrom=em510616.triplefau.lt; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=b6BAIhjw; dkim=pass (2048-bit key) header.d=triplefau.lt header.i=@triplefau.lt header.b=dFMlt8ey; arc=none smtp.client-ip=158.120.84.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=triplefau.lt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em510616.triplefau.lt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1739962000; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=+8j7cPu5o3satpWXmx3WXP8Hl7/oNZHXIrtA6XxAmFU=;
 b=b6BAIhjw+SkjmITW9fmQ+l/juhEjBpFYRFclcWaBJfBVWMIbi/sMhRLQq8R4A3C2Ij8zE
 Ny7ObjY231bVdhYOUWy5eyXz15gyNE1/y8+d/6Z4QEM9EARSqdlPle/+pGfheHLVcF2Dy95
 lkXs/AS23c+kNb5WlOY9sbNhyusd8DL2OytcGyAgoqpgTNy3aAZ/hdDfdA7fqPdcnVBPwUD
 QO2m8KjvaR4nkyZG+De351g6U/s9TEe9gHFb4gukd5cRhkbC4u/SU5G7PPabjmnrSVjPt1f
 9rjSFWZeCmitLNolxgeeEk7lZ4ly/5VdSIKkz3QBQ2csm9mhk5ERBc9tDgow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1739962000; h=from : subject
 : to : message-id : date;
 bh=+8j7cPu5o3satpWXmx3WXP8Hl7/oNZHXIrtA6XxAmFU=;
 b=dFMlt8eylOIUsReojYGCneYPzASA9qNBCpKsd8OqJLe9LWxccIISjGJzibgsQPwR+c6Lw
 xLlyx9CWlNOcUkBNrQaF9lLfsqHUsLlo4HwgtKebGOQkdm5ejrZ5Wt3WiqtS2Tg4XvKGCvU
 P+1z8nY9v2DkLpMw3G6zZFPdHDo1/xgfpVp9lMyMdLyLsB3CghyfTdKaWaUnqABNmE2eFOk
 TG9oOaF+YRdsMhHcLG2dAn67JuAbzVOAK7DGGBP1qRm3LvUQ0XhfL9cUM7TUN19oCeATekT
 5hyzYFEB0ZvOlzEou9sB5yUbyoiQmERrNq7ZGrIuo3yTrc3Hqp4YrR8qZ6XA==
Received: from [10.12.239.196] (helo=localhost)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97.1-S2G)
	(envelope-from <repk@triplefau.lt>)
	id 1tkhb5-AIkwcC8t737-KJeX;
	Wed, 19 Feb 2025 10:46:31 +0000
From: Remi Pommarel <repk@triplefau.lt>
To: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH] leds: Fix LED_OFF brightness race
Date: Wed, 19 Feb 2025 11:41:36 +0100
Message-Id: <26a2690e77671cfe687c5614613fbb6f079f7365.1739959820.git.repk@triplefau.lt>
X-Mailer: git-send-email 2.40.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 510616m:510616apGKSTK:510616sYieL8a4ZV
X-smtpcorp-track: bOzxy6IRSk7K.HTMywujJ_gr_.womANASu_uR

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
final state will always be as expected.

Fixes: fa15d8c69238 ("leds: Fix set_brightness_delayed() race")
Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
While the race does seem to be very thin, it is very easy to trigger it
on my setup with the following command:

 $ echo "pattern" > /sys/class/leds/<device>/trigger
 $ echo "3 200 40 200 3 200 3 200" > /sys/class/leds/<device>/pattern
 $ sleep 1
 $ echo 0 > /sys/class/leds/<device>/brightness
 $ echo 30 > /sys/class/leds/<device>/brightness

The issue happens 8 out of 10 times, not sure why this is the case,
maybe two consecutive set_bit() on one CPU are likely to appear as
one just after a previous test_and_clear_bit() on another due to
the full memory barrier implied by this atomic operation ?

 drivers/leds/led-core.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index f6c46d2e5276..528f53bf13a9 100644
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
@@ -331,10 +342,11 @@ void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int value)
 	 * change is done immediately afterwards (before the work runs),
 	 * it uses a separate work_flag.
 	 */
-	if (value) {
-		led_cdev->delayed_set_value = value;
+	led_cdev->delayed_set_value = value;
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



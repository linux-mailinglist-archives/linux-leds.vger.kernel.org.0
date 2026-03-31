Return-Path: <linux-leds+bounces-7617-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKOZD44uzGkmQgYAu9opvQ
	(envelope-from <linux-leds+bounces-7617-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 22:29:02 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D1A37129D
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 22:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C3B9F303818D
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 20:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9D144E037;
	Tue, 31 Mar 2026 20:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4YLcYyb4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yUdiabnM"
X-Original-To: linux-leds@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DF33590A9;
	Tue, 31 Mar 2026 20:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774988937; cv=none; b=gHUYk8Jf0rmOibjh6lPW+E5mPcE8YRIYuLN5jgkAfIeAH3bqz/CxHHOWRZuAq0LI2OHQPJrv3H3q0IhEM13Z31eiMkH1xj7UP032yF0/s+NnunU0An88IrCYgDFOezQSu7G//hd/oTiEnC2OcyPmkxtgm9CessYLJ6LLAOmMOxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774988937; c=relaxed/simple;
	bh=KXglzgyvfkP55fBFnJOi0PuX9JK3UgzX7H5IIehy400=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qpHpLPxj0ihGUccIgR2n1y2wLPL/8+2jVLMjFvRQ97zSTri2XnWbz5I7PpHKPO6VSNlDqQzC3ApRVA4A+q7YDdmeEPCt5Pzq5T8KFXJHAPIQwI9yYF47jo9uq91XtWp7pMOACGak2zJWE4+EPQvufyrhW1BPRRbaIUZmDa3+w0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4YLcYyb4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yUdiabnM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Tobias Deiminger <tobias.deiminger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774988934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eefPElYpld93oFsZaXrFViWV+17mqlZG86ZJHW4oBZs=;
	b=4YLcYyb4euGSjl6T5PfKZYNB8Z2VppL/VlR55IDm5k9CMjHNcDDyvA68ykslLZ/YDEjG1i
	XgN4Z4eb4vW0DyvZ7rdN3iHTDmC/i32+MYX7KwuxSjOGq4/inMlkEB0QlfLH+6cx7XSxTL
	lhBe4rRXmj0I2IOZB5O2FlleazwrNwkmTQTGAn83Lrn+Sa4pGYizc8tU8pjJqfly2fINvz
	TFbor7M3DAVBkfcoCqu0hKBUdEdMNnvZ7E/Fs4mZYRd9U5rgoUjqtLW0RpJXjPwubvT3dl
	uMaNTVaoZ6Kqx0s0QvioN8HBsuAdIoTcqRNwBkg+PBlTAI1lblfigkv8AfI0pQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774988934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eefPElYpld93oFsZaXrFViWV+17mqlZG86ZJHW4oBZs=;
	b=yUdiabnMzA/51ublU9cIXSYxLlRR7TxyVzttaN/T7ftIYTGsXktCUv34fqHMsRi4rJ4QmY
	lasztwMGz2cUyjCw==
To: lee@kernel.org,
	pavel@kernel.org
Cc: eajames@linux.ibm.com,
	riku.voipio@iki.fi,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tobias Deiminger <tobias.deiminger@linutronix.de>
Subject: [PATCH v2] leds: pca9532: don't stop blinking for non-zero brightness
Date: Tue, 31 Mar 2026 22:28:48 +0200
Message-ID: <20260331202848.658676-1-tobias.deiminger@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7617-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tobias.deiminger@linutronix.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linutronix.de:dkim,linutronix.de:email,linutronix.de:mid]
X-Rspamd-Queue-Id: A8D1A37129D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

pca9532 unexpectedly stopped blinking when changing brightness to a
non-zero value. To reproduce:

 echo timer > /sys/class/leds/led-1/trigger   # blinks
 echo 255 > /sys/class/leds/led-1/brightness  # blinking stops, light on
 cat /sys/class/leds/led-1/trigger            # still claims [timer]

According to Documentation/leds/leds-class.rst, only brightness = 0
shall be a stop condition:

> You can change the brightness value of a LED independently of the
> timer trigger. However, if you set the brightness value to LED_OFF it
> will also disable the timer trigger.

Therefore add a guard to continue blinking when brightness != LED_OFF,
similar to how pca955x does it since 575f10dc64a2 ("leds: pca955x: Add
HW blink support").

Signed-off-by: Tobias Deiminger <tobias.deiminger@linutronix.de>
---
Changes in v2:
- Fix code style (capitalize start of comment, brace-placement).
- Link to v1: https://lore.kernel.org/r/20260321102121.1563365-1-tobias.deiminger@linutronix.de

Notes:
    A more advanced solution was to not simply return early on
    set_brightness, but actually support blinking at arbitrary brightness.
    This would however require conditional fallback to SW blinking, since
    PCA 9532 doesn't support routing PWM 0 (dim) and PWM 1 (blink) in
    series. The bugfix here keeps it simple. Optional SW blinking could be
    tried in a separate patch.

 drivers/leds/leds-pca9532.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 0344189bb991..dae7c6760508 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -182,11 +182,13 @@ static int pca9532_set_brightness(struct led_classdev *led_cdev,
 	int err = 0;
 	struct pca9532_led *led = ldev_to_led(led_cdev);
 
-	if (value == LED_OFF)
+	if (value == LED_OFF) {
 		led->state = PCA9532_OFF;
-	else if (value == LED_FULL)
+	} else if (led->state == PCA9532_PWM1) {
+		return 0; /* Non-zero brightness shall not stop HW blinking */
+	} else if (value == LED_FULL) {
 		led->state = PCA9532_ON;
-	else {
+	} else {
 		led->state = PCA9532_PWM0; /* Thecus: hardcode one pwm */
 		err = pca9532_calcpwm(led->client, PCA9532_PWM_ID_0, 0, value);
 		if (err)

base-commit: b2c87f5e98cd88095dbc6802197526703d5e4e48
-- 
2.47.3



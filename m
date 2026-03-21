Return-Path: <linux-leds+bounces-7409-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDJjDlZxvml1PQMAu9opvQ
	(envelope-from <linux-leds+bounces-7409-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2026 11:22:14 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE632E4B57
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2026 11:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34B5C3013790
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2026 10:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BE22D7814;
	Sat, 21 Mar 2026 10:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vvAKUc0Y";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zGcu2u5P"
X-Original-To: linux-leds@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7485D2D73BC;
	Sat, 21 Mar 2026 10:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774088531; cv=none; b=DdCyYoycH3fG9z31I+dlTH/q04XVwVkY5oPD7FUODcztxQswL6dpKwGAyVI24pjN3TY4jwN3H10SB2nGoMoPJt5bMV910HoMCNXB4FY+IJBZ4mGJJitByvNWYCRxiq1EHTJLWBZotLCxmI6EnCnOJNsiMiGzOZKy2IHfnhNgf0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774088531; c=relaxed/simple;
	bh=KGUwFR3tbeAl/rolCYburD6Ef5XFQ/7AX04PeIeiH9U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pbhcy3NWTdHGr1M+IJ0rmsCHL7WO74Fc+eT2T16C69KRzwcuUKLD4NAb/qquukGdmfS5btBeEY/KqjxtNhbqirlQ9Wy3N4RbkaiNFknhHGwwHEy8YYLl4IcZnbdBmCUjKzpu+Z8pEUC6bChJjX0wvWWF8+ajNkOY3ysVkOCZY7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vvAKUc0Y; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zGcu2u5P; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Tobias Deiminger <tobias.deiminger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774088528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IThn9WP7G6JtyKZvemXfdgx26GTVf5GdA7bWMYp+5hU=;
	b=vvAKUc0YK2aVBcsveyaitA/Cdy6DRAs/2rt6Gpr+UUa2NCCAVYFGXyeCCM5JKnnxzr4shu
	3caQ2BA/K6cRq2yFxpjs+9FMxGTLFdjiYKaXH1xv1UcNLFcYsJfUc9lUwohkqml/5Le/t8
	xwp+HGPpxz4wINLLBJ7BgBIbPhGBDTNPNauXhP9iy/yKXwowaekvlhXRx/jZXmZbeD768s
	Zdhi/mEPv1w2CJXNSi5lQ+8douZwWwx+xrahqkRtbI95qGH7neYfFb50mri0R14W+uzUJb
	lVO2Y75lBRMav4n8oyYk891jerFU9cP4GfR6SKjiL2nGs7AkTNVLmZ38ubVgPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774088528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IThn9WP7G6JtyKZvemXfdgx26GTVf5GdA7bWMYp+5hU=;
	b=zGcu2u5PAZSJbmygcz13z1EU0LQtQOzeTWB+e1622Zbej2Dqars5GEDxlLSVWlOtN6Vy6g
	oyJyYdCsMHOpXGDw==
To: lee@kernel.org,
	pavel@kernel.org
Cc: eajames@linux.ibm.com,
	j.weitzel@phytec.de,
	riku.voipio@iki.fi,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tobias Deiminger <tobias.deiminger@linutronix.de>
Subject: [PATCH] leds: pca9532: don't stop blinking for non-zero brightness
Date: Sat, 21 Mar 2026 11:21:21 +0100
Message-ID: <20260321102121.1563365-1-tobias.deiminger@linutronix.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7409-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tobias.deiminger@linutronix.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:dkim,linutronix.de:email,linutronix.de:mid]
X-Rspamd-Queue-Id: 8FE632E4B57
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

Notes:
    A more advanced solution was to not simply return early on
    set_brightness, but actually support blinking at arbitrary brightness.
    This would however require conditional fallback to SW blinking, since
    PCA 9532 doesn't support routing PWM 0 (dim) and PWM 1 (blink) in
    series. The bugfix here keeps it simple. Optional SW blinking could be
    tried in a separate patch.

 drivers/leds/leds-pca9532.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 0344189bb991..3de20e087334 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -184,6 +184,8 @@ static int pca9532_set_brightness(struct led_classdev *led_cdev,
 
 	if (value == LED_OFF)
 		led->state = PCA9532_OFF;
+	else if (led->state == PCA9532_PWM1)
+		return 0; /* non-zero brightness shall not stop HW blinking */
 	else if (value == LED_FULL)
 		led->state = PCA9532_ON;
 	else {

base-commit: b2c87f5e98cd88095dbc6802197526703d5e4e48
-- 
2.47.3



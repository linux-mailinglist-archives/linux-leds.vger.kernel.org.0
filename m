Return-Path: <linux-leds+bounces-6860-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNfpLvf4hWlEIwQAu9opvQ
	(envelope-from <linux-leds+bounces-6860-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 15:21:43 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF51BFEC09
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 15:21:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6223E3008D15
	for <lists+linux-leds@lfdr.de>; Fri,  6 Feb 2026 14:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7DE34B1B4;
	Fri,  6 Feb 2026 14:21:38 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65372212542
	for <linux-leds@vger.kernel.org>; Fri,  6 Feb 2026 14:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770387698; cv=none; b=QX6qcm1V0Cs7DB6j/XhpVw0M0sXqotxH/SOe22eJHf0YWCwelYNeuzjxOnAEUQMd6qra/2thCDvDrIYLkKHqTId/ba7YFhuwJqX6tIX5BYjg/PtPWgKKB408/peC0thr3I8kCyRUfAgktUzJozvWSN2qB35m6Rh9YSV1mvCd/qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770387698; c=relaxed/simple;
	bh=l+8YbjWdAz8DyFaNtUqm/RvyTSFfDx86vkiIrVoy07k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Z3a93+csDdN/7wrtyZT7jgEtFa5phhTrnyuM5enpVjKs/ALjbgGXXxTv3Ls9iaDga2+0kd6LKlKcFwDzda46/XdR7xHPqwAOMwy2Uv8SAPgYDm0ig20L+OJ1n12gIY59rrGqBEIYlDCGFD11qL/KDA3dp0T4Q2ZAfqFoDU3DIn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1voMiC-0007tN-EC; Fri, 06 Feb 2026 15:21:32 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Fri, 06 Feb 2026 15:21:23 +0100
Subject: [PATCH] leds: multicolor: change intensity_value to unsigned int
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-leds-multicolor-fix-signedness-error-v1-1-48a00ed33c07@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAOL4hWkC/x2NQQoCMRAEv7LM2YEkQlC/Ih4k6V0HYiIzugjL/
 t3BYzVF10YGFRhdpo0Uq5iM7hAPE5XHvS9gqc6UQsohhcwN1fj5aW8pow3lWb5ssnTUDjOGqo/
 5XNIJxxhjBfnVS+HeP3O97fsPeITZiXYAAAA=
X-Change-ID: 20260206-leds-multicolor-fix-signedness-error-69c28e3111de
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, kernel@pengutronix.de, 
 Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-leds];
	NEURAL_HAM(-0.00)[-0.905];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.tretter@pengutronix.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6860-lists,linux-leds=lfdr.de];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: EF51BFEC09
X-Rspamd-Action: no action

Using min to compare the intensity_value with led_dev->max_brightness
causes a signedness error:

	drivers/leds/led-class-multicolor.c: In function 'multi_intensity_store':
	././include/linux/compiler_types.h:630:45: error: call to '__compiletime_assert_195' declared with attribute error: min(intensity_value[i], led_cdev->max_brightness) signedness error

Change the type of intensity_value to unsigned int to fix the signedness
error.

intensity_value is used to set mcled_cdev->subled_info[i].intensity,
which is unsigned int, too.

Fixes: 129f82752bce ("leds: multicolor: Limit intensity to max_brightness of LED")
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/leds/led-class-multicolor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
index 5e0ac6465dc3..443b87c579ab 100644
--- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -34,14 +34,14 @@ static ssize_t multi_intensity_store(struct device *dev,
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
 	int nrchars, offset = 0;
-	int intensity_value[LED_COLOR_ID_MAX];
+	unsigned int intensity_value[LED_COLOR_ID_MAX];
 	int i;
 	ssize_t ret;
 
 	mutex_lock(&led_cdev->led_access);
 
 	for (i = 0; i < mcled_cdev->num_colors; i++) {
-		ret = sscanf(buf + offset, "%i%n",
+		ret = sscanf(buf + offset, "%u%n",
 			     &intensity_value[i], &nrchars);
 		if (ret != 1) {
 			ret = -EINVAL;

---
base-commit: 129f82752bcecd554936209aac4dbdd888e92224
change-id: 20260206-leds-multicolor-fix-signedness-error-69c28e3111de

Best regards,
-- 
Michael Tretter <m.tretter@pengutronix.de>



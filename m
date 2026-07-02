Return-Path: <linux-leds+bounces-8849-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GmpdGZeLRmotYQsAu9opvQ
	(envelope-from <linux-leds+bounces-8849-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 18:02:31 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B546F9DA1
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 18:02:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=j5VDd5QI;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8849-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8849-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE86A3052FFD
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 15:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE563368BA;
	Thu,  2 Jul 2026 15:55:04 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCE63368AB
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 15:55:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007704; cv=none; b=pRjhx+9DJ63/NYudlYM7AIOcO90sNPovvu6i5Sd9Y+NFQNXE+gTDuvcHcfYgEaimXsjapMcWzPGiPR2XjXoXhLfoaz44HWDCzxNxn0y9So7OI2Xm75CkwksKToADW6yv7ee6QQEvuhiSlnU4l2NU52DiePu0O3G2k1ZuG8uMsOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007704; c=relaxed/simple;
	bh=EBaGVlFtaU5cgkN4vkEjpdW+YdCqJZ1tqKuOPRWWN+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AHgNv/2hlqxy2Fs/Z/xEHDjLHu+Ptcv9cz+ongVdjncsat1fFfmYYbGpTQndgMEbRxOCCVGV8oNrB+Wr++Bl3UXCDvcCqFl+R9dEFYsqf69fb/DdkBMvCL0T8Dok5ACtMQmWkISnMA4ZAa+M20P8WCzIdEuf4TQbGT1+ZVWA1Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5VDd5QI; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b7612475so17062885e9.3
        for <linux-leds@vger.kernel.org>; Thu, 02 Jul 2026 08:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783007701; x=1783612501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yQp7blzNTKwxZMSxGZDcTyFP/mvOADqzAmk2csJY+sU=;
        b=j5VDd5QIxnejQIbC5UTyNAg3KServZL+NY/mHjq/BxpqeXCZVG+Wbo76MRKzNxg2Ik
         jzzu7jH2QqCdc0/OcZmTyEat8lhcxSgY+EOkIWska0UkJHm+SuYbjgyDo+chS1gpuXI0
         eGVQh2bWX1VrPnQYpFaxsf1XmqvIeu+VcYZoeeI/gqc7uM1xpQXp8Z2z0oH7uGAVSVAK
         XaEQypt6BqeE6NypyFZHTIzVWDuZDMhqQk6MBTC8dRLdDOOrOSabsE6NjXAs4iZmbMJ3
         AalZyeDyJVv48yf5lTTWRXbn2XHXeg44ap/OPH4i5OC+kkzTWLW6/8jlvL+nA5KI3jUs
         plZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783007701; x=1783612501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQp7blzNTKwxZMSxGZDcTyFP/mvOADqzAmk2csJY+sU=;
        b=RRgNy87YffTWOmvtpo27ARy9jsghojacGPortPFFVcn9yw4YjuCruaooJDSzWyFFN8
         Rp+nxIcYDReZtKtPCpKxYMdrkAuBY7/pdObrBc6iLIVqgv3HO8NyujDRXSq7Fx0cDfoC
         1oAziTUrFaoU1ebi21gRy6J6oFQCeqTwTrn3Onhfg1L1sa2z5xFc2O0BYxFUdQfETJYd
         YEDRpL5t9JBgXwl+DTG5QRym+uOwWSiLHPpcyGs6Jh3gv+BaIP1cZpNYPIP+ZjBqvb+P
         UVjeDNC4Y8Kyoy8E/pBXIhgRo8Ku/zsgdcks842DFEitfE6odNdgBNbdqOxJ5p+bRI4X
         OM4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+X8+FjK8ufD7rGc4wiu5KbK6EHaCMiStc02afBu4QdsgOvnpzk+3pLLUMp6yo+jiZRtekv4TF4N9+z@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2n5ke9VR5/nsOfX39+YMbaGEQOlWMX3qDmYTJd3I3fXRn3xT0
	NujfhfF4Awffe6EFVj0K3DRiotwVQzBjjP/Wia2RfNwQjL6kHHGopqNxhp8eKA==
X-Gm-Gg: AfdE7cntGZt10OZYI/M/9R1t8bevNp56C1j1OyFCZTdt4c59n2c6oYZDXzewCTzXDxu
	xwHihMKHnOKyavK+UReA1JC303OoIPJK8ps/epA8d5o8o84w2sM1r0JlrAvSKW6Xt0yDRWFoRqV
	ctm3+a5CGNewo6z907aK6LGEDxpRRg0RJ4OtmDY1wORYwZd+id01AM4r9WTe1kKmgtgDudwcc1D
	UA4MEhSqJYtSKZkSqqudpGR3m764XVAd19rhBkv6jQIgygMqd1MFojBz5S+kjo+hqxNhaab0iYW
	m7j+A1sX87FbyQ1qas/mvCGzbyxS7da2fjwg7UTWTzzK9iAz0SzX9qrGrX3VI4+2gyF+mFz1V+S
	Bak1UEB6lY7/bHay25NwzW09JE/rdavMTu7/vD9UJQO6Nk31VTr6IKW88QFY0d14zLsyH2djzAA
	s+GDs2Z2qelVZQpInupClALX1zMhh8gDhzqINS1zJiPPxsn6CWBu9MDWmjVZ7vYeKOsejV3+/eo
	MjCEoZVCOjHiATTOmNSSKC49T2Zig==
X-Received: by 2002:a05:600d:c:b0:493:adcb:d368 with SMTP id 5b1f17b1804b1-493c2b45ce5mr74061155e9.9.1783007700998;
        Thu, 02 Jul 2026 08:55:00 -0700 (PDT)
Received: from workstation.speedport.ip (p200300d5070afe1af6868251d71bd2b0.dip0.t-ipconnect.de. [2003:d5:70a:fe1a:f686:8251:d71b:d2b0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbb79sm9758055f8f.2.2026.07.02.08.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 08:55:00 -0700 (PDT)
From: Mert Seftali <mertsftl@gmail.com>
X-Google-Original-From: Mert Seftali <mertseftali@web.de>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mert Seftali <mertsftl@gmail.com>
Subject: [PATCH v2] leds: pwm: Annotate leds[] with __counted_by()
Date: Thu,  2 Jul 2026 17:54:52 +0200
Message-ID: <20260702155452.67594-1-mertseftali@web.de>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-8849-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-leds@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mertsftl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mertsftl@gmail.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mertsftl@gmail.com,linux-leds@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2B546F9DA1

From: Mert Seftali <mertsftl@gmail.com>

Add the __counted_by() attribute to the flexible array member leds[] in
struct led_pwm_priv so the compiler and runtime (e.g. FORTIFY_SOURCE,
UBSAN_BOUNDS) can bounds-check accesses against num_leds.

While here, pass the led_pwm_data element into led_pwm_add() instead of
the whole led_pwm_priv, so the helper no longer needs to index the array
itself. num_leds is incremented in the caller as each LED is added and
doubles as the index.

No functional change intended.

Suggested-by: Lee Jones <lee@kernel.org>
Signed-off-by: Mert Seftali <mertsftl@gmail.com>
---
Changes in v2 (per Lee Jones review):
- Pass the led_pwm_data element into led_pwm_add() so it drops the priv
  and index arguments; increment num_leds in the caller, where it also
  serves as the array index.

Build-tested only (also with FORTIFY_SOURCE and UBSAN_BOUNDS enabled).

 drivers/leds/leds-pwm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 6c1f2f50ff85..dabdf0423582 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -36,7 +36,7 @@ struct led_pwm_data {
 
 struct led_pwm_priv {
 	int num_leds;
-	struct led_pwm_data leds[];
+	struct led_pwm_data leds[] __counted_by(num_leds);
 };
 
 static int led_pwm_set(struct led_classdev *led_cdev,
@@ -81,10 +81,9 @@ static int led_pwm_default_brightness_get(struct fwnode_handle *fwnode,
 }
 
 __attribute__((nonnull))
-static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
+static int led_pwm_add(struct device *dev, struct led_pwm_data *led_data,
 		       struct led_pwm *led, struct fwnode_handle *fwnode)
 {
-	struct led_pwm_data *led_data = &priv->leds[priv->num_leds];
 	struct led_init_data init_data = { .fwnode = fwnode };
 	int ret;
 
@@ -167,7 +166,6 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 		}
 	}
 
-	priv->num_leds++;
 	return 0;
 }
 
@@ -193,9 +191,10 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 
 		led.default_state = led_init_default_state_get(fwnode);
 
-		ret = led_pwm_add(dev, priv, &led, fwnode);
+		ret = led_pwm_add(dev, &priv->leds[priv->num_leds], &led, fwnode);
 		if (ret)
 			return ret;
+		priv->num_leds++;
 	}
 
 	return 0;
-- 
2.55.0



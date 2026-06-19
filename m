Return-Path: <linux-leds+bounces-8689-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w7jgChBtNWo7wAYAu9opvQ
	(envelope-from <linux-leds+bounces-8689-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 19 Jun 2026 18:23:44 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E786A7088
	for <lists+linux-leds@lfdr.de>; Fri, 19 Jun 2026 18:23:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SXFEPkAg;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8689-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8689-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED00A3004607
	for <lists+linux-leds@lfdr.de>; Fri, 19 Jun 2026 16:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E393B993F;
	Fri, 19 Jun 2026 16:21:37 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04653BBFBB
	for <linux-leds@vger.kernel.org>; Fri, 19 Jun 2026 16:21:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781886096; cv=none; b=Gc7lkC+9kTRE20zRi3GYZUm0k3JfMlN9/cMBodVFkKY7cZ8bL3IaicfI1Ly/TGXFNz5vRQZgJ/7XB1rARMtw3QqgfXdzd9oFltQ3dbV8+r7cagvwfVRIE73dZF+Nz0QHt4Ffh/2KvrTpL0404AO1WHHmrIr7g0rYCT5w/fi2oqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781886096; c=relaxed/simple;
	bh=U2WAIKvThUojolYwSCVcMGa5Kcqxc1gTXqpQ6Egod3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iIFPtFSMbeZA3I59n1Q8cZp6Ki3fAbgZiZ+EwlHTO8nOFDBzfGRyrpXYOjwRONwQO6G4Alnydc0sMKqKyjqc5drv5gG/GpRO03OfNzbsx1TUVPuafesMTB5jo8ya1rHagDu6kRRAVBjUiYotENVgM0e54WLz+HbunMD8HUxsZhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SXFEPkAg; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso17353565e9.0
        for <linux-leds@vger.kernel.org>; Fri, 19 Jun 2026 09:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781886091; x=1782490891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3JLehku4Fkdexd+dqxNctEZTCkpHEg/7niz9TvmxWYQ=;
        b=SXFEPkAgL+w6QXLFYJRXSAfTLpiwJl/fXVYe72cyILXgVM+J9fZGCwHvQbaML5yyl9
         whqAc/znKi4dh5fAWVwHQOXFNjKjYrwYZptK5+gqQgPWdpYRwP/GQ/HIcb+ZMPiKjBsk
         FFkNMcNgVosSKMRYHbWEHUsU0QyITGM9wEZgTQZm484zjEyAC8dyJGw5agOFQcOz3mf6
         GrPEMlkvp/VRxHPaC50ZMnKC04Le/NpAgA1hPhT5+rvLyFBt325fmGyBPDN7Y4sl3+Jv
         rpbVKWdnwaqhpUwkWqLni8qXItmPps1IZC4pPGNpUAJWI3f//e+vYKgjyRD67HQ3aEWu
         OxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781886091; x=1782490891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JLehku4Fkdexd+dqxNctEZTCkpHEg/7niz9TvmxWYQ=;
        b=QHj+oZgTf2YxgGBfFk/FJi5jHSRDBQiPoITjwSXEk0R0LCelKwm7nXVKQ6Vo1/DZJv
         Lxx949H9WXAdMxwxVnMatQFMf2wjN+qji5B+DEJ5CBwsrXey481qCIh4zei82G1i8mtN
         vVwz7WGUeX+dXfculGGPFEweGDvnLpRIbyoZrj5vHhMCxTunKpWO/aW5Y35fRqaUibLc
         F/abnL/J+44UJQQqeYlSaMH1wZvpwf7lha5Oc3Tp+J7rjXc52vyyr2PX6lGnBIFadodK
         NqeHc4Bv3Zj9QRl/7FJixsoJ0vDN3OLZi7PV+rmnCmMWZfsZhFXQZI5ETP49S2nIhN02
         5f8A==
X-Forwarded-Encrypted: i=1; AFNElJ8dlUaCCaAn8Sn4Gzx+jmwVIxbujDGf4agmHNknRMD+PCaQx1O5IsdCBHO8cE1IdgR1F3ml4leS+JQp@vger.kernel.org
X-Gm-Message-State: AOJu0YxxLVVjhjI/AtHa0OBDFtO2MA5/mlzHjHu+/rBE9S06T4M8Ba8u
	WL4EKTEaKlMlAtFI3NsUKE+4wyT53a6HNPCkPI1maBxZQM1KGWze55PZ
X-Gm-Gg: AfdE7ckbhwIR3VfrPornHuoFXvkQxk019yT3GzAacMy/cqRhPy25qL1VxNKAzw3WQKb
	55MW+vzbBjZECTo//9CnyFZJBPkmX2mLcn9AIAa5Ul1RHmauWZ0zkX2LiZHNwfSvX4ksdyEggRK
	/LdPPPwh8hhhC9mvGCPTbMpVACFBBE1E9Uac6fH3y1Vp7eRDnWoSjfHPa+8QzPGOZp1+YSv7uIb
	SGlGuDXwnEFTyNgmeg9nCGgO1KiW+cG1Gq7oyrlRWHwveg9wBxTkKp9ybsLiSeAefTcp3eqtmp4
	UtPR7I2kSFG+KzacvuaC+kf55krFPh66gYlIH1RMccv5pCdrEuOUaoS1GGzG/k/IPKTJdy7PutG
	EYxiS0P5Znt1b1whwI7XdyQTTLx8mFlvNUP6rBPDKS1WzIPup0faSWrAnRBmgG3froaboSFVID3
	KaBpQGoDsIxTlvp2nG18lva2MJZ4KZrwd6JqjZfDZ0HaB1S8IS12IhtSF6AOfWJ0Avg8/ZotKxj
	JMIzvobnNE+Fzav1A==
X-Received: by 2002:a05:600c:5010:b0:490:e19b:9632 with SMTP id 5b1f17b1804b1-49240a59ademr57329915e9.17.1781886090506;
        Fri, 19 Jun 2026 09:21:30 -0700 (PDT)
Received: from workstation.speedport.ip (p200300d507395ed9440fa268944f0f11.dip0.t-ipconnect.de. [2003:d5:739:5ed9:440f:a268:944f:f11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd30078sm80399585e9.7.2026.06.19.09.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 09:21:30 -0700 (PDT)
From: Mert Seftali <mertsftl@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mert Seftali <mertsftl@gmail.com>
Subject: [PATCH] leds: pwm: Annotate leds[] with __counted_by()
Date: Fri, 19 Jun 2026 18:21:13 +0200
Message-ID: <20260619162113.416864-1-mertsftl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8689-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:linux-leds@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mertsftl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mertsftl@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mertsftl@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74E786A7088

Add the __counted_by() attribute to the flexible array member leds[] in
struct led_pwm_priv so the compiler and runtime (e.g. FORTIFY_SOURCE,
UBSAN_BOUNDS) can bounds-check accesses against num_leds.

For the annotation to be correct, num_leds must reflect the number of
allocated elements before leds[] is accessed. The driver already
allocates space for device_get_child_node_count() elements up front, so
set num_leds to that count right after allocation and fill the array by
explicit index, instead of incrementing num_leds as each LED is added.

No functional change intended.

Signed-off-by: Mert Seftali <mertsftl@gmail.com>
---
Build-tested only (also with FORTIFY_SOURCE and UBSAN_BOUNDS enabled).

 drivers/leds/leds-pwm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 6c1f2f50ff85..4c99a07da576 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -36,7 +36,7 @@ struct led_pwm_data {
 
 struct led_pwm_priv {
 	int num_leds;
-	struct led_pwm_data leds[];
+	struct led_pwm_data leds[] __counted_by(num_leds);
 };
 
 static int led_pwm_set(struct led_classdev *led_cdev,
@@ -82,9 +82,10 @@ static int led_pwm_default_brightness_get(struct fwnode_handle *fwnode,
 
 __attribute__((nonnull))
 static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
-		       struct led_pwm *led, struct fwnode_handle *fwnode)
+		       int idx, struct led_pwm *led,
+		       struct fwnode_handle *fwnode)
 {
-	struct led_pwm_data *led_data = &priv->leds[priv->num_leds];
+	struct led_pwm_data *led_data = &priv->leds[idx];
 	struct led_init_data init_data = { .fwnode = fwnode };
 	int ret;
 
@@ -167,14 +168,13 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 		}
 	}
 
-	priv->num_leds++;
 	return 0;
 }
 
 static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 {
 	struct led_pwm led;
-	int ret;
+	int ret, i = 0;
 
 	device_for_each_child_node_scoped(dev, fwnode) {
 		memset(&led, 0, sizeof(led));
@@ -193,7 +193,7 @@ static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv *priv)
 
 		led.default_state = led_init_default_state_get(fwnode);
 
-		ret = led_pwm_add(dev, priv, &led, fwnode);
+		ret = led_pwm_add(dev, priv, i++, &led, fwnode);
 		if (ret)
 			return ret;
 	}
@@ -217,6 +217,8 @@ static int led_pwm_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->num_leds = count;
+
 	ret = led_pwm_create_fwnode(&pdev->dev, priv);
 
 	if (ret)
-- 
2.54.0



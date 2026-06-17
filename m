Return-Path: <linux-leds+bounces-8630-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ney6FBJVMmoBywUAu9opvQ
	(envelope-from <linux-leds+bounces-8630-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 10:04:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B76E69767E
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 10:04:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Seuj2uvl;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8630-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8630-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C70A3078A27
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 08:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6D23C1966;
	Wed, 17 Jun 2026 08:01:10 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0843D410D
	for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 08:00:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683270; cv=none; b=oeBJPkYMlHF+TWTMk2PdNrUOTcR5OLOl0luhDtSq+//+yC0+QRDj+kjRkNzrwM18qaR93WUMyYG584somlWr7v5gTjWWZG6n1os154E5PcZtW37SXKSvKISUzEtD9AO4qhFlwNOOxss1PtarwBf9xYEXffpZqFtQG2kv+RbGyeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683270; c=relaxed/simple;
	bh=KKu9vuzjNh2iqUZwT5xjE/o1dLesFPk+03y2gSGMhFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IA47Jqj4mkP8li8riLzZM8EzS2QqiBh+d+HI6s1F0/o0GhSRRlpWC5AxOXclcrA4C0ZlKAKNs24s9pL5zyU6nB4GfKmsOYO5SiD1jGCkrhkjr6XVfSJvEPubvAJElSa/dSysXuzlHgYnCKGT62poiRLhFpdeIWrk9Py+7nXut20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Seuj2uvl; arc=none smtp.client-ip=209.85.208.48
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6919f40a0c8so10133311a12.0
        for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 01:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781683258; x=1782288058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2i1k8AoyDEf4+SEcMRPttiYCfUlkSwT7R4ZGBXCsSZk=;
        b=Seuj2uvl/9+wEOZEUExytld1ZS+46/FfLivxy3+PSQsYqdTMvu7F6JRigSUqqFDFAP
         Y7OVmlqKdgycRsE2yddzapgI+c5E/Pleyu5ALZJ/fQjqyLf3/T8cuLzI5FgmkK6wi1kG
         E/WIi+EDZfZHMhzOTYJCfhzlDYQELq3ly+gVdfr3xy0U5wlYY+lL38bpA72TAV13KwTV
         zcLq+AcHDslSWCp405e4eUG+FdrMkIXyoQORl7drXR6ao4R6Flp8EU4fEBGratJPYAbL
         cMzJCJIO9bGKDUISVufjCR17iW8CUViJadOQY0ePhKRqvoF4oMMK4uVLYpxzdoEe3/yR
         blag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683258; x=1782288058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2i1k8AoyDEf4+SEcMRPttiYCfUlkSwT7R4ZGBXCsSZk=;
        b=C65aclBsyNe221QIfOr2LBFeNa22WuIuwBPJ5N4aj1NgmZb5UA3sBOtGFlVattJBjP
         bLQFYTOlrOKV/HSMyMGdvS5/txAcV61MwR0hMky/bGKiSAtGnLwU/W7vfcZ5XVrBFYFq
         y4j6APBk6cLgAnVau0bD3FTU7QVdxNtsBbS6oy1EsTbD6oWH9X1wfWYR0OwZ13mBKDoi
         VpmiJspxMKtey+K6rDS1WeHVCIWaWayuOcKHTTAWvAMejEj1iswpqNJFbsVvcTlK0qTI
         MSQcMF4p/J3yPPrM/qiU8FRNJtLajXK9pBV6sQVz19oUSOhGqjOghyRtHPo4H2pbt/x5
         jraw==
X-Forwarded-Encrypted: i=1; AFNElJ9CrxV2HRpvnGKP9Im+oXFaZj5N2KWzqlfP1rnRciKGSd4AvRW2dA8bU69aB0n2QJIm+Vka8qe475ra@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa2k7EAPtcbZx2cd3WnYC2rkpWH58IOiYHNbF6mzMEapgf5bdc
	hFNInQ70CxFHzWqh8fETLTmUptv7UcnScVDdkumjOHMCAzAHYVkzAGa6
X-Gm-Gg: Acq92OGJm8h5e6R7Lkg0zK5emI77mw+gizyd2Io0vg231U1M2UbgyGk4B8v99Tk0C9/
	6DHS7cYWAGVg8XsPjBm0ROi+EefyaEREPICgAtZyY8nujJuDiUGe+SccfE1+eTYhOQLqywuRmly
	h2hJkU3fPYX7mW7exgPSxF2UAGLLSeFuX7EQC3i9FUt/0H7yLjtpTjUJ1Z+9Q+TaBx24yi1QZeV
	yllGKvn72Pkw2BIs4wOCrkG4vJ3qodXV5ab7T+RE0BF/w73yK+xt/Hgog6HH3ZL2b9smMShznTm
	8swVpaGVoR1qrFjTxGA+LFzH1xIcbo3E6nqIUzsHWrco4kB/KQY3hpHJpTHtVGa1J47r9eNvxPJ
	4yXo2z7qLOowdFfuDaG/ETBoK+w3Ebs5eZf2hc6pXiq7zaMOsxd3Lw61M9aAhOZFWi8Fo9lg+CQ
	hxBA==
X-Received: by 2002:a17:907:9305:b0:bfe:ed06:5a1f with SMTP id a640c23a62f3a-c05a83a199dmr195494666b.52.1781683257844;
        Wed, 17 Jun 2026 01:00:57 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb058fa59sm755339766b.0.2026.06.17.01.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:00:57 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v5 11/14] video: backlight: lm3533_bl: Improve logic of sysfs functions
Date: Wed, 17 Jun 2026 11:00:28 +0300
Message-ID: <20260617080031.99156-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617080031.99156-1-clamor95@gmail.com>
References: <20260617080031.99156-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8630-lists,linux-leds=lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:clamor95@gmail.com,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B76E69767E

Simplify the sysfs logic of properties by switching to macros and proper
regmap helpers.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
---
 drivers/video/backlight/lm3533_bl.c | 62 ++++++++++-------------------
 1 file changed, 22 insertions(+), 40 deletions(-)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 2c24647fc17a..9eb0db640948 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -23,6 +23,8 @@
 #define LM3533_BL_MAX_BRIGHTNESS	255
 
 #define LM3533_REG_CTRLBANK_AB_BCONF	0x1a
+#define   CTRLBANK_AB_BCONF_ALS(n)	BIT(2 * (n))
+#define   CTRLBANK_AB_BCONF_MODE(n)	BIT(2 * (n) + 1)
 
 
 struct lm3533_bl {
@@ -85,88 +87,68 @@ static ssize_t show_als_channel(struct device *dev,
 	return scnprintf(buf, PAGE_SIZE, "%u\n", channel);
 }
 
-static ssize_t show_als_en(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t show_als_en(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
 	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
-	u32 val;
-	u8 mask;
-	bool enable;
 	int ret;
 
-	ret = regmap_read(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF, &val);
-	if (ret)
+	ret = regmap_test_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
+			       CTRLBANK_AB_BCONF_ALS(ctrlbank));
+	if (ret < 0)
 		return ret;
 
-	mask = 1 << (2 * ctrlbank);
-	enable = val & mask;
-
-	return scnprintf(buf, PAGE_SIZE, "%d\n", enable);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", ret);
 }
 
-static ssize_t store_als_en(struct device *dev,
-					struct device_attribute *attr,
-					const char *buf, size_t len)
+static ssize_t store_als_en(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t len)
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
 	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
 	int enable;
-	u8 mask;
 	int ret;
 
 	if (kstrtoint(buf, 0, &enable))
 		return -EINVAL;
 
-	mask = 1 << (2 * ctrlbank);
-
 	ret = regmap_assign_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
-				 mask, enable);
+				 CTRLBANK_AB_BCONF_ALS(ctrlbank), enable);
 	if (ret)
 		return ret;
 
 	return len;
 }
 
-static ssize_t show_linear(struct device *dev,
-				struct device_attribute *attr, char *buf)
+static ssize_t show_linear(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
-	u32 val;
-	u8 mask;
-	int linear;
+	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
 	int ret;
 
-	ret = regmap_read(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF, &val);
-	if (ret)
+	ret = regmap_test_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
+			       CTRLBANK_AB_BCONF_MODE(ctrlbank));
+	if (ret < 0)
 		return ret;
 
-	mask = 1 << (2 * lm3533_bl_get_ctrlbank_id(bl) + 1);
-
-	if (val & mask)
-		linear = 1;
-	else
-		linear = 0;
-
-	return scnprintf(buf, PAGE_SIZE, "%x\n", linear);
+	return scnprintf(buf, PAGE_SIZE, "%x\n", ret);
 }
 
-static ssize_t store_linear(struct device *dev,
-					struct device_attribute *attr,
-					const char *buf, size_t len)
+static ssize_t store_linear(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t len)
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
+	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
 	unsigned long linear;
-	u8 mask;
 	int ret;
 
 	if (kstrtoul(buf, 0, &linear))
 		return -EINVAL;
 
-	mask = 1 << (2 * lm3533_bl_get_ctrlbank_id(bl) + 1);
-
 	ret = regmap_assign_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
-				 mask, linear);
+				 CTRLBANK_AB_BCONF_MODE(ctrlbank), linear);
 	if (ret)
 		return ret;
 
-- 
2.53.0



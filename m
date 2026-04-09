Return-Path: <linux-leds+bounces-7670-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BPkLfff12klTwgAu9opvQ
	(envelope-from <linux-leds+bounces-7670-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 19:20:55 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A493CE0EF
	for <lists+linux-leds@lfdr.de>; Thu, 09 Apr 2026 19:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E39783082403
	for <lists+linux-leds@lfdr.de>; Thu,  9 Apr 2026 17:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA0B3DEACA;
	Thu,  9 Apr 2026 17:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0P8rV7j"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7CA3E122C
	for <linux-leds@vger.kernel.org>; Thu,  9 Apr 2026 17:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775754975; cv=none; b=GddlfAY3XEb5cobNEGgLtF9rHdPGOGsqa8S9EQLf6AeVcIv9abrk8yO2ftbwNgLxWQVBVmEblgqiboYqlhZXIgA7326S3drluA5qpHI52yE+TCN050Vo1rDvdzg1aaykYBm+6taSqbd3IMfR6COFhIOjBG1PqJGoKUIff6/v02o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775754975; c=relaxed/simple;
	bh=tMd/ZF1dqBUHYrTgfnm1wy21WqtdOBZaIx9oJy3Ul70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DoRwmCI6qF1GxHD57M1bchLkcMF7l8wpV9HNq/RLXDQRSyOAKlFsfKTq6LP47kvGgg8B2UopQsW7XaMEGdJfrJYHV8JeBi3AXSP6nkJbjhpgEH8FjoAXrkvv00oCSiEKJOb0/n7+PnbmvzJtFFMNOo3PIwBTVIVmD4q1Eu9fVb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0P8rV7j; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35c206f0481so1186576a91.0
        for <linux-leds@vger.kernel.org>; Thu, 09 Apr 2026 10:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775754973; x=1776359773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XSBVMuGXL0WQqebbrx7WWDDOhjtkic5Xp9QAINsntBY=;
        b=R0P8rV7jweycqwILWZbNLVTNjkFD1jObK9S8qWUXJnRbCRon0yGZ3oaoDDCqsqCzo+
         SUNTFD+52L803eV1rri7YDq9sPnGgbIHkMsUHgKYjFgFk89r2Xja0pIjelBbxFp/FeGX
         KE5z9eslz4bogyyR5xU6BZlM2sPwfqOf6lJWgogj/aUNExxpL5sdIgrSVOz9B6ra8oX0
         fPbGYUKQtbQpocTolULmNGqz8JUGhDak9zEoRHmFpSv5KvH0VnyWLevVmpJjbLZaV8aH
         9cK1W1dUEbVIM7Ejy/DBPc0CspGoWTNBLIM3ZyoSmm2BI9h+Vb4fg2SmnPAA2T3lCm4N
         f5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775754973; x=1776359773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSBVMuGXL0WQqebbrx7WWDDOhjtkic5Xp9QAINsntBY=;
        b=afQAaXnGxI+1ACABBMp6/Ay8ADxjVCM7ctTySFTqC5WzFxLn1uJSoHVdtVvbNJqJhc
         VaA0uFJEPYIMhgCreK/kbW24oLUkOJI7kuyPVm9k4xNipd5Yzds5cI7mCdTmmed6wJ9C
         9uweCNyvd4fhGIO73/O5TU8usr4dcaFjdbpxFQehbvEsYqQP18DjlCNvuUvFrddZx6rX
         jbck1eSUk/waNRvGUvjhz+0UTqYRunXSAHaYth2C0CaWHjzYVd2TdijhGHExw5pfygmO
         2RErXYonv4A4l2FBRSJLshEuQXSiagDCPXGa1/j5uLlNr/ouFntHNo5aga23Can+6ORe
         zkUw==
X-Gm-Message-State: AOJu0Yyo8olqZg3ksWEZFiX0OommFSVuzkZp16+SAk7Iw+A15OeSyB89
	KiNZBrdhiTs3iILSOljog1f+p/pyU0xt3e9vCd7FX8L9j0JWnVWeOr/hBK5LBw==
X-Gm-Gg: AeBDieu290IkUffXC38uDFNE7Me3zuhfmLuw5EjjKKPL0Yzbi2esB3IgyPfEjzhXwlv
	jOKHCLJ5N9xJKqZenM27Fx34Ds9MCe87WIApGZ1UFp1Y1R41jZX21hqI1LHh/ffGHler5xHeWLC
	aGt/c9uXEwIc08sd5LqfsMPzfVnICRJJjdHx2VTHYsx89Hu5/+VTZEcbqpgjWASojC5jv+y5JyL
	s+urJDq0eAiOCOZfTDhngHeyzTShjXq8VoPeSpViKaKB5batRTvgL6fkvmuq4rYuWXK+3M4RNLr
	nu/ntV1eax4pkpFKVvw/Spy65Slykwjv3epF9rKzPsXGrL5kKposrSxGt9hyiTEBeGws3ApBYGK
	ZmbnOM/Vo2oztbiKLxwscXUPwPkJyXHX/YwNqQ22MCkyNaA1P5fl34aB730oQ0YuxgbrAn72hA3
	wnkJNOaP9jWH1XPHu8UIi5Tetfr6LnclSVudsk2nyQGfR8e4Ko64Bxdrc=
X-Received: by 2002:a17:90a:d605:b0:35b:93d8:6aaa with SMTP id 98e67ed59e1d1-35de68ce83emr26197435a91.19.1775754973076;
        Thu, 09 Apr 2026 10:16:13 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e34e959bcsm3591474a91.0.2026.04.09.10.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 10:16:12 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2] leds: qcom-lpg: allocate channels with main struct
Date: Thu,  9 Apr 2026 10:15:55 -0700
Message-ID: <20260409171555.14580-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7670-lists,linux-leds=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-leds];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 35A493CE0EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use a flexible array member to combine kzalloc and kcalloc. This
required moving the struct lpg_channel definition up as flexible array
members require a full definition.

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix kernel-doc and missing data assignment
 drivers/leds/rgb/leds-qcom-lpg.c | 120 +++++++++++++++----------------
 1 file changed, 58 insertions(+), 62 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index f6061c47f863..d7d6518de30f 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -80,58 +80,8 @@
 #define SDAM_PAUSE_HI_MULTIPLIER_OFFSET	0x8
 #define SDAM_PAUSE_LO_MULTIPLIER_OFFSET	0x9
 
-struct lpg_channel;
 struct lpg_data;
 
-/**
- * struct lpg - LPG device context
- * @dev:	pointer to LPG device
- * @map:	regmap for register access
- * @lock:	used to synchronize LED and pwm callback requests
- * @pwm:	PWM-chip object, if operating in PWM mode
- * @data:	reference to version specific data
- * @lut_base:	base address of the LUT block (optional)
- * @lut_size:	number of entries in the LUT block
- * @lut_bitmap:	allocation bitmap for LUT entries
- * @pbs_dev:	PBS device
- * @lpg_chan_sdam:	LPG SDAM peripheral device
- * @lut_sdam:	LUT SDAM peripheral device
- * @pbs_en_bitmap:	bitmap for tracking PBS triggers
- * @triled_base: base address of the TRILED block (optional)
- * @triled_src:	power-source for the TRILED
- * @triled_has_atc_ctl:	true if there is TRI_LED_ATC_CTL register
- * @triled_has_src_sel:	true if there is TRI_LED_SRC_SEL register
- * @channels:	list of PWM channels
- * @num_channels: number of @channels
- */
-struct lpg {
-	struct device *dev;
-	struct regmap *map;
-
-	struct mutex lock;
-
-	struct pwm_chip *pwm;
-
-	const struct lpg_data *data;
-
-	u32 lut_base;
-	u32 lut_size;
-	unsigned long *lut_bitmap;
-
-	struct pbs_dev *pbs_dev;
-	struct nvmem_device *lpg_chan_sdam;
-	struct nvmem_device *lut_sdam;
-	unsigned long pbs_en_bitmap;
-
-	u32 triled_base;
-	u32 triled_src;
-	bool triled_has_atc_ctl;
-	bool triled_has_src_sel;
-
-	struct lpg_channel *channels;
-	unsigned int num_channels;
-};
-
 /**
  * struct lpg_channel - per channel data
  * @lpg:	reference to parent lpg
@@ -203,8 +153,8 @@ struct lpg_channel {
  * @lpg:		lpg context reference
  * @cdev:		LED class device
  * @mcdev:		Multicolor LED class device
- * @num_channels:	number of @channels
  * @channels:		list of channels associated with the LED
+ * @num_channels:	number of @channels
  */
 struct lpg_led {
 	struct lpg *lpg;
@@ -216,6 +166,55 @@ struct lpg_led {
 	struct lpg_channel *channels[] __counted_by(num_channels);
 };
 
+/**
+ * struct lpg - LPG device context
+ * @dev:	pointer to LPG device
+ * @map:	regmap for register access
+ * @lock:	used to synchronize LED and pwm callback requests
+ * @pwm:	PWM-chip object, if operating in PWM mode
+ * @data:	reference to version specific data
+ * @lut_base:	base address of the LUT block (optional)
+ * @lut_size:	number of entries in the LUT block
+ * @lut_bitmap:	allocation bitmap for LUT entries
+ * @pbs_dev:	PBS device
+ * @lpg_chan_sdam:	LPG SDAM peripheral device
+ * @lut_sdam:	LUT SDAM peripheral device
+ * @pbs_en_bitmap:	bitmap for tracking PBS triggers
+ * @triled_base: base address of the TRILED block (optional)
+ * @triled_src:	power-source for the TRILED
+ * @triled_has_atc_ctl:	true if there is TRI_LED_ATC_CTL register
+ * @triled_has_src_sel:	true if there is TRI_LED_SRC_SEL register
+ * @num_channels: number of @channels
+ * @channels:	list of PWM channels
+ */
+struct lpg {
+	struct device *dev;
+	struct regmap *map;
+
+	struct mutex lock;
+
+	struct pwm_chip *pwm;
+
+	const struct lpg_data *data;
+
+	u32 lut_base;
+	u32 lut_size;
+	unsigned long *lut_bitmap;
+
+	struct pbs_dev *pbs_dev;
+	struct nvmem_device *lpg_chan_sdam;
+	struct nvmem_device *lut_sdam;
+	unsigned long pbs_en_bitmap;
+
+	u32 triled_base;
+	u32 triled_src;
+	bool triled_has_atc_ctl;
+	bool triled_has_src_sel;
+
+	unsigned int num_channels;
+	struct lpg_channel channels[] __counted_by(num_channels);
+};
+
 /**
  * struct lpg_channel_data - per channel initialization data
  * @sdam_offset:	Channel offset in LPG SDAM
@@ -1475,12 +1474,6 @@ static int lpg_init_channels(struct lpg *lpg)
 	struct lpg_channel *chan;
 	int i;
 
-	lpg->num_channels = data->num_channels;
-	lpg->channels = devm_kcalloc(lpg->dev, data->num_channels,
-				     sizeof(struct lpg_channel), GFP_KERNEL);
-	if (!lpg->channels)
-		return -ENOMEM;
-
 	for (i = 0; i < data->num_channels; i++) {
 		chan = &lpg->channels[i];
 
@@ -1603,18 +1596,21 @@ static int lpg_init_sdam(struct lpg *lpg)
 
 static int lpg_probe(struct platform_device *pdev)
 {
+	const struct lpg_data *data;
 	struct lpg *lpg;
 	int ret;
 	int i;
 
-	lpg = devm_kzalloc(&pdev->dev, sizeof(*lpg), GFP_KERNEL);
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data)
+		return -EINVAL;
+
+	lpg = devm_kzalloc(&pdev->dev, struct_size(lpg, channels, data->num_channels), GFP_KERNEL);
 	if (!lpg)
 		return -ENOMEM;
 
-	lpg->data = of_device_get_match_data(&pdev->dev);
-	if (!lpg->data)
-		return -EINVAL;
-
+	lpg->num_channels = data->num_channels;
+	lpg->data = data;
 	lpg->dev = &pdev->dev;
 	mutex_init(&lpg->lock);
 
-- 
2.53.0



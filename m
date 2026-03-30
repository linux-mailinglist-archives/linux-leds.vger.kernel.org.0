Return-Path: <linux-leds+bounces-7597-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCL7GgrpymkkBQYAu9opvQ
	(envelope-from <linux-leds+bounces-7597-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 23:20:10 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C34B73615C8
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 23:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD9F63018D55
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2026 21:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059183A1E8C;
	Mon, 30 Mar 2026 21:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuNn7ri2"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68E83A168A
	for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2026 21:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774905544; cv=none; b=TA3LCt4FlXGFJ8t1nN7jsRVhxEmGpA4QXgZ28G3qzzW+HZMR9/K6wNuk5OfEjkmyeavu2q8iy6qaez6FtAw37n+TfOPSt2vrDPe5wjxnP8s1ifwKtBt9B+vcK5izSoWjloXKiXFvFM7PD5f7xewLm9xGyro0NEl8ovgASm+1NyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774905544; c=relaxed/simple;
	bh=PhRTmmrveIbs1YS6D0M0TYAfJEj9eHYwILWhDTlfj4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c6l3zhmwIgs1WSx9Qo296kk09gzbjxTDlmXYZqLhxiSr/wBtYsNbueudCvRKx20oEVkPH9WZhhhjgxTu2EjZ+yFGRnE+H/TvG0jsXXdx7aPTblCmks7jQj02n7URV9FAOpp/eLmfJavEqNB2z3FrZPc/YcEnZezLfZm28y+wRCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuNn7ri2; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8296dabef74so4699496b3a.1
        for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2026 14:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774905542; x=1775510342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CTj819lvZos1BeuAanfcJHdbt5aBcVuD9J9vyYH7J9A=;
        b=LuNn7ri2cZ5kw23wWq2irMVUbHPKCqQSaykFpE+tc3zxDhkrIuluAlNHMxUFR82UhP
         9iot3Q6RZUmv++msGupsnQUgvvbgWxpeymWEkb8OWKFQT0S/IcmaHXZzGhLU88zpeOp/
         CvgI40zL+c5iKZEV3iShuBlqliluDhgZXItwyMvMSx3yKazt4dXtKG17gH9VXK2qNXBh
         HFRX7gweGBDSe6W/Abp6C0vYHv++qO8+IIhV2TUP/OghvlD5nKjDtNcC/LAOpGfSB111
         HW2xPr/2SFpKoppefg2sCtsTVyiVFzAUEqOJqtoenxc8KrJ46Vtg9Jokv4hKeqy2FyPp
         XB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774905542; x=1775510342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTj819lvZos1BeuAanfcJHdbt5aBcVuD9J9vyYH7J9A=;
        b=QEmG5BBZbCTZYmKxWSh6LQOVdEV92i0HJqzKLDrOyqyBwLw2ENTLX3bJM3RZGKYwD/
         clVYJHJ5cY0r9nw7C4oo1G8TqU9ioJpN3R51kZfVW2JDpjsPka+heY4xejDV31okFkph
         I7yXI+oLnANGI3CH676KOcNWsy5Pu11f5JwXzKoIv3Bojjtmf+QvvesTrrn27um8sXcO
         EZM2yUYG7mcA/wIJF3uq76JfFz4Z3qEU2BKonYspDEXBV9gmRPn8CTgbSQSx5afnDBuY
         dFqJER/EgoXAJf5idBwKtF0/XeX6i9+vZb3kw25XckZ5gNP222uKe81xOBCyAiKc4yd5
         eCww==
X-Gm-Message-State: AOJu0YxokzafPD7XTNva/pSllpqSPd2BW9xEFALNphLA8Y5HWsbmrGXi
	tbcz3l6aPkoZQRuTpeNesjElZ52K76rvQoRHvjR4SlSTW+y6W6DXyZXIkopOl8Bj
X-Gm-Gg: ATEYQzy38asl2t9DrO7fcMjwzOj7E65wtQnGSg6Z8hUIHBZ3G3vwBKtl7iMu0YdPhqH
	isiXRqO8yM+DlLhviF3v/GBfTFedwqlvJOpjKp3NrklbHSEWYqIbAGRPSwY7ulAMtcJjnTc8v8U
	ybRWZBMRxBjQVx8/sF3s2ENhg/RKhk9yA6OJFgKaimKPpA/D7V2FdcxmlDwyBLVulwiX42YdGq4
	AbJs18vuChHG2IXWL/jImTTtRio177N8mC2+wg2D7S5IRYUQGObabpsUAtxv9BJ4s0Drq2CK1ys
	0Fs22r3/OtUP7N6Q2ig6muhZdIhsvRkuxSJ9XQVySvrwiWad6uAz01GKpmiGJuQincGEVBMU6Qq
	+gASJrZToea4kVlvAZ89KVmUMxGX+lHzzU6n04WMmM6KNHQEKHfG+LY4LKDuIOdM6/CiSAAKYxe
	E6Pluk3+kds46RZ+KZyq1hr68TQfRfOQlNmtXT0rho+6Ir1Kob4BsId+rLr3sO2c2O6w==
X-Received: by 2002:a05:6a00:430c:b0:82a:1044:3563 with SMTP id d2e1a72fcca58-82c95d32c02mr12534654b3a.23.1774905542485;
        Mon, 30 Mar 2026 14:19:02 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85fc756sm7575756b3a.47.2026.03.30.14.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:19:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] leds: qcom-lpg: allocate channels with main struct
Date: Mon, 30 Mar 2026 14:18:44 -0700
Message-ID: <20260330211844.14796-1-rosenp@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-7597-lists,linux-leds=lfdr.de];
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
X-Rspamd-Queue-Id: C34B73615C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use a flexible array member to combine kzalloc and kcalloc. This
required moving the struct lpg_channel definition up as flexible array
members require a full definition.

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 117 +++++++++++++++----------------
 1 file changed, 56 insertions(+), 61 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index f6061c47f863..83cedf4a0cbf 100644
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
+ * @channels:	list of PWM channels
+ * @num_channels: number of @channels
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
 
@@ -1603,18 +1596,20 @@ static int lpg_init_sdam(struct lpg *lpg)
 
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
 	lpg->dev = &pdev->dev;
 	mutex_init(&lpg->lock);
 
-- 
2.53.0



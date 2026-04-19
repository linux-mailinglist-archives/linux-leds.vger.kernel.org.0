Return-Path: <linux-leds+bounces-7773-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPCwAW2i5GmUXgEAu9opvQ
	(envelope-from <linux-leds+bounces-7773-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 19 Apr 2026 11:37:49 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8CA4238A1
	for <lists+linux-leds@lfdr.de>; Sun, 19 Apr 2026 11:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14CF33039D80
	for <lists+linux-leds@lfdr.de>; Sun, 19 Apr 2026 09:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC8437D114;
	Sun, 19 Apr 2026 09:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNDW6PJy"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174B737BE93
	for <linux-leds@vger.kernel.org>; Sun, 19 Apr 2026 09:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776591282; cv=none; b=j6DVNXbF03aZIn5PxDxtF1bE4N7uYKRXv1H2xlEK/zkLNAJl/HrTv2hqFXA+iwUdTMKBqc3rnETrcinFsQuB280/EDyaEwjZz9+pIQvz5DOTofqwtXSjaMIiXuBa4ZVUuuE1e5W4zqgYmShVlSacmyIawE9UqbStycPqgRp3/Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776591282; c=relaxed/simple;
	bh=DPuU9UKzjNveL2Uy3y9tUPnjY6ZhEX35Z5uqTrDGofg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QrtSOyh1vREM2ShgCSrgsAJQB/f5RIpLHh/dKaRpF0kGpdaf6pJ4wx7XElaC0+NidVpK39Izg7kH32WUL66aUe/05y+4q0akgfXi/1QEn6Ev40RhcKAYz/F8XJkRBLjyZcgG4S4f1J2HQt8II4bRhWhDKzCpJWELLWguUDoyl5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNDW6PJy; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38e91416cc0so22345071fa.1
        for <linux-leds@vger.kernel.org>; Sun, 19 Apr 2026 02:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776591278; x=1777196078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwldWTVNb+Q/QpXo1IdPnwyyFuA7X8MQ9JBz50beleY=;
        b=gNDW6PJyeJ00F1zQsh4NhPP1dxsb4kvt0G2Bfbo0y8O0DXc86Vvapzj20VCp5R2y04
         4wxpxLLRN6ynpvk9FBeK1Q8Ej3wy3ndl+ZQ8dyP/fy+Ie0ObMYnNF7uflfEGJKUU0HGK
         eWVHXz3V8a/PizH5f7VQ78uct+V1Uz2fubwrCP4gaSpWRk7mI/aECcnY0hvxqifcX3JL
         COZq2Yg7ZqlfbOKGH+lpq/DlM8iITrTwjOfRQ9agI4DflhUEuSBMQ/7APJtv6tjnqQLd
         cQTybS5r5AE9S1QBJINjvUZImmx2uZQYeNki2ATbThKiy60vxJOsnPRKhiWQaPZTWil9
         sWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776591278; x=1777196078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WwldWTVNb+Q/QpXo1IdPnwyyFuA7X8MQ9JBz50beleY=;
        b=Emq5zC2E+nQaVxF60km2CzvPt87QaGr6uFY6KS9pHD14067QTvo2Nf1FSK44pJkuTw
         8pPE5PWIBwI1JJU1yWxXG9RqlmKkucY0f9bKg4vVmdTrhgd6I2AE1EcDkRXQJCcA4Vq9
         qnmUisbhzUin4sRpVcMYxEyG/wJC1RhiNEW4bSIJ+/g7H86UrP7igvRGUDix0PNFfnCI
         AkyMnV6Vhtbc8L16aeok2OR6JkeGHkNmE65CJ/mRxhYZWWC13OqYP1XRIQoadd5oYu2s
         6EA7U2GWULht6jE0EmUmVSYRiQNGYI3pe2fVIUcTfV417R+v5KQU0AICyakRUPLVTT/6
         x5CA==
X-Gm-Message-State: AOJu0YyvgErLiQfqDQrZoYl9W1gmwcF7fqXiIvmu9zhg6Mra3u5rlytH
	0+mXp6cbVdXvxPkFNLFjWcg45Hwz4LXTSl5Rwo9LmZvugPzkQhxUshwI
X-Gm-Gg: AeBDiesbkKdKbIASq3pf0laAvD6uJVbBPVMrBGm7rBs+t+iC+d9F4FhyDm5f5NP9gcz
	fSFPWs1ICnJ/QJ3yy9p+xs9fFx4cObyLJOP7tRqdUoIEMXCUXpeIV7CCoTBY9I7M5CrSaNPdqca
	tQDdCncsuv7GSxHNCQQGNVqr7lFUirdB5b+WYaKP3hk43Yjicu1k4Aak4sWkohCvxpyM4S2Joo1
	IQshbQ8wKviexJwYhkevhdC1xd+sFoq0NNd0anSydMOigezdj/TiOhcrGNoRLbQNn+4sWFyMrBC
	Kzw7xO9KOh8wbEe7RYviDu/5Cu52Mk92BJ2XV1cwDpbWXgVQqPnn5Duw5ALqN+2e73arnO6iWSA
	znzWxc0LmlnTbipv/dx/Zb+XjRNAubA3+QQZh1kVjkkgMlmWplT7Y1abJFbNg3iyJ5r5Lw+yGDN
	nzaKSjJvHBM3tl0semdN3InYy572G1NLhlKQ==
X-Received: by 2002:a05:651c:2344:20b0:389:e2e8:4f4c with SMTP id 38308e7fff4ca-38ec951d010mr18302131fa.21.1776591278096;
        Sun, 19 Apr 2026 02:34:38 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb7613a9sm18221671fa.41.2026.04.19.02.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 02:34:37 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 3/5] media: i2c: lm3560: Optimize mutex lock usage
Date: Sun, 19 Apr 2026 12:34:10 +0300
Message-ID: <20260419093412.40796-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260419093412.40796-1-clamor95@gmail.com>
References: <20260419093412.40796-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7773-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: AC8CA4238A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Pass the device's own mutex lock to the control handler so that the media
framework can handle control access instead of managing it manually. The
lock must be common to both sub-devices, so the individual sub-device
locks will not work here.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index 085a0ef70e39..5cd22c2fbb64 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -162,14 +162,12 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	struct lm3560_flash *flash = to_lm3560_flash(ctrl, led_no);
 	int rval = -EINVAL;
 
-	mutex_lock(&flash->lock);
-
 	if (ctrl->id == V4L2_CID_FLASH_FAULT) {
 		s32 fault = 0;
 		unsigned int reg_val;
 		rval = regmap_read(flash->regmap, REG_FLAG, &reg_val);
 		if (rval < 0)
-			goto out;
+			return rval;
 		if (reg_val & FAULT_SHORT_CIRCUIT)
 			fault |= V4L2_FLASH_FAULT_SHORT_CIRCUIT;
 		if (reg_val & FAULT_OVERTEMP)
@@ -179,8 +177,6 @@ static int lm3560_get_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		ctrl->cur.val = fault;
 	}
 
-out:
-	mutex_unlock(&flash->lock);
 	return rval;
 }
 
@@ -190,8 +186,6 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	u8 tout_bits;
 	int rval = -EINVAL;
 
-	mutex_lock(&flash->lock);
-
 	switch (ctrl->id) {
 	case V4L2_CID_FLASH_LED_MODE:
 		flash->led_mode = ctrl->val;
@@ -202,14 +196,12 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	case V4L2_CID_FLASH_STROBE_SOURCE:
 		rval = regmap_update_bits(flash->regmap,
 					  REG_CONFIG1, 0x04, (ctrl->val) << 2);
-		if (rval < 0)
-			goto err_out;
 		break;
 
 	case V4L2_CID_FLASH_STROBE:
 		if (flash->led_mode != V4L2_FLASH_LED_MODE_FLASH) {
 			rval = -EBUSY;
-			goto err_out;
+			break;
 		}
 		flash->led_mode = V4L2_FLASH_LED_MODE_FLASH;
 		rval = lm3560_mode_ctrl(flash);
@@ -218,7 +210,7 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 	case V4L2_CID_FLASH_STROBE_STOP:
 		if (flash->led_mode != V4L2_FLASH_LED_MODE_FLASH) {
 			rval = -EBUSY;
-			goto err_out;
+			break;
 		}
 		flash->led_mode = V4L2_FLASH_LED_MODE_NONE;
 		rval = lm3560_mode_ctrl(flash);
@@ -239,8 +231,6 @@ static int lm3560_set_ctrl(struct v4l2_ctrl *ctrl, enum lm3560_led_id led_no)
 		break;
 	}
 
-err_out:
-	mutex_unlock(&flash->lock);
 	return rval;
 }
 
@@ -332,6 +322,8 @@ static int lm3560_init_controls(struct lm3560_flash *flash,
 		return hdl->error;
 
 	flash->subdev_led[led_no].ctrl_handler = hdl;
+	flash->subdev_led[led_no].ctrl_handler->lock = &flash->lock;
+
 	return 0;
 }
 
-- 
2.51.0



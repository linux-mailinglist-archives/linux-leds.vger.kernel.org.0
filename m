Return-Path: <linux-leds+bounces-7832-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEZLN3Ia62lTIgAAu9opvQ
	(envelope-from <linux-leds+bounces-7832-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 09:23:30 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4673645AA89
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 09:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7429E30157F4
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2026 07:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4755A372EE4;
	Fri, 24 Apr 2026 07:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rDn4JFzR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B51C370D44
	for <linux-leds@vger.kernel.org>; Fri, 24 Apr 2026 07:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777015374; cv=none; b=bvvjkJ/tohdTMQMTMBGiebclSgRjoTT/sO/R24eNB+BbadKvcQXt8ZvW2HbVfDQQS34dxkjkF6lB34Ef6RfpXNxTZkm5Yc0Zz1CN1nIqpmyMMjNvPE2M7Oumx+Luou+2WeKLOl7kGGJOX77fUWKdRI8e/Ew/VRgtq0jQshvioQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777015374; c=relaxed/simple;
	bh=NnTZhLTZnNfRAZTpInLPnO6pd8hHUs/jOhkVX7vXeK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LLVAKnSu7ugeIpxq4HYCtIad8dSo9vM0mFLz/inVnwh7dHHuxVAso/ROJmRAMwwZWGltSSHloB8CBvygO3K19YdX4UyUU8jVYnk0XDFbCaoBjfPw0nZdHDtwSn5K6j1rzOhUc7eT1zHJm4MgiM9pJcqWsLyLcheFz2GjB81Q/ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rDn4JFzR; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a3fcb2c718so6406188e87.0
        for <linux-leds@vger.kernel.org>; Fri, 24 Apr 2026 00:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777015371; x=1777620171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0a97i72KVR1eeUiCzxnD93bJZC8Qqjf+srt6bZebIg=;
        b=rDn4JFzRu2B+Ntr7IzOp2eSJ0UR30SsYAbEH962Iq+huak/sOJKRNI3gyMQe8Q8DpS
         8WNSJH6VVa9d3AP3i60m+lks9JPVzrbptvpx2qKw1JA8jYXkG+FoDAy08+zBtPeJ4zYN
         G6GooWMQCbwg9JYb4LZUpBQ+dQv5kKePE0QmKOxDwLcpQEYldOMZwUxGKvCjOATf+kvq
         QB0QPCPKGS3XdUmIbCL3syLP40iLJdZeKBL1oqQeYeVi0x+e62/o+lkWGxecvsKUwqVh
         4eKrASH3s70BQjLJyxY5Z7N9aVZSxXYtyR+9qwCFpVKXTH1XPFRdTAfGkXBz7xRvz8WT
         wdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777015371; x=1777620171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d0a97i72KVR1eeUiCzxnD93bJZC8Qqjf+srt6bZebIg=;
        b=nOglr73kKc2yySPKx5nl2ILLb7ZmMIpk3bA70HFoxBBk1dn2EnzsCk1SEedzZd+v78
         ng2P+RTR7qggBSdvMEn4DmhkQVKE9Mi4jMrAkr3+HVzgK/0BSVUGJvy1tgcdk4UOes1c
         5OTBTGSevUd2k/7NHzXy70lZVXfFmfikrpt+Yx7Vq9ZdEo4vrZVSEpcgYKHgQq5QL+qs
         bq1+CVazshA13/+BY9JoV8BdgXTW4+EQ4SLDwr+nmrEHLp5NrdeeXce+Me36d0KJxZdB
         JM+hTgQ31ROcCT8xrAGD++uCBBL4QM7ROnAJO71Da7KQ7BPMxYWcy6j0wmxfBasaG02j
         L/+A==
X-Gm-Message-State: AOJu0YyNFtLEhALVKQlnqqhG9ttViGb77dXw1yZOSfGusTvOtBkKSY7T
	zxyCyuZMJ815XAAayzdHrtw5+bmluDA4ZAskysbaAVaBeKQl66JYcMtr
X-Gm-Gg: AeBDietiMAkm2/Hn0rrtlcsQNnpQpHLETLD+LfPEAP54cKEHBCWM8lyuU/vZpxdEtvG
	e8k4Hqv5ONbZhD1PHxK2KTA5YtuedyKZ8fNXOT3WrrY+wSpg9A72/Ba/Cg7T6WD7j87jYBamid7
	tZ4njPfE5af/j+CGWSI2BYdtsCKv57qMqmbVQ7k0ishfF7AXwcQLeDPy+5zMJvlHaVKS2ScvFaj
	I42gfAH2tQ/CqPTKGjHF4DvqpIE1sPVYLXARZyCTgk0r1z2xuy9drEbakly50yWY4G6ZQLhE+PZ
	ndLMDgU2k0Y7oXCI+O1X1o0BWeHPyk2ptJfCdv9B3cX8zHNIBhZTS/uUUFF1FUyC+ruTyO8H1/I
	vrw17nGQjnx7r77FjGTqReQlsUGEr6y37I7C2lv8gRGYPAQqDhQXT8rf3HxsHmj4S8iQRM3diNw
	d+hA1t0Vq5kB5uyQNJdPX6/Lo=
X-Received: by 2002:ac2:4c4b:0:b0:5a4:b0:a072 with SMTP id 2adb3069b0e04-5a4172ca655mr9466333e87.4.1777015370516;
        Fri, 24 Apr 2026 00:22:50 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41a238563sm5612550e87.55.2026.04.24.00.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 00:22:50 -0700 (PDT)
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
Subject: [PATCH v3 2/5] media: i2c: lm3560: Fix v4l2 subdev registration
Date: Fri, 24 Apr 2026 10:22:27 +0300
Message-ID: <20260424072230.90354-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260424072230.90354-1-clamor95@gmail.com>
References: <20260424072230.90354-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4673645AA89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7832-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

The existing driver does not call media subdev registration, making it
invisible to the media framework. Since the LM3560 supports two
independent LEDs, register each LED as a separate media entity.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index f4cc844f4e3c..085a0ef70e39 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -364,8 +364,15 @@ static int lm3560_subdev_init(struct lm3560_flash *flash,
 		goto err_out;
 	flash->subdev_led[led_no].entity.function = MEDIA_ENT_F_FLASH;
 
-	return rval;
+	rval = v4l2_async_register_subdev(&flash->subdev_led[led_no]);
+	if (rval < 0) {
+		dev_err(flash->dev, "failed to register V4L2 subdev");
+		goto error_out_media;
+	}
 
+	return rval;
+error_out_media:
+	media_entity_cleanup(&flash->subdev_led[led_no].entity);
 err_out:
 	v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
 	return rval;
-- 
2.51.0



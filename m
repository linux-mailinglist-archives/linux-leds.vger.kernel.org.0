Return-Path: <linux-leds+bounces-2185-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9599279DB
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2024 17:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 703681F24C51
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2024 15:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0821F1B11E1;
	Thu,  4 Jul 2024 15:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xQMDHXhm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646B01B0122
	for <linux-leds@vger.kernel.org>; Thu,  4 Jul 2024 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720106377; cv=none; b=XDytyaePHlXNdIpo9+ZVttB7x9vTYNjLSAhgTipAVKodrUfDMWIJbU8k/1Zkb9lA9sgx5DABmIKFAEd1D/hSq+WHYoq220xwvTGIu/Q0B7wU7b1oBXvQ8bOPOkVaC6LjlrkLF6KAaNS4sN5PKeWAogU2repWqPehKa+pCL4Af/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720106377; c=relaxed/simple;
	bh=NLb6Q+ANHQ06rpfkujhFNjqrqimEb0WH08jhVQZ/wu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IKONBU2rTUsyL4H7PVSLYCcbixWjV95XLMi+w0F+IAHIH7lLOKOHbpP40GegOl7gn5/aNOgVbIr0jOWO2A4dsbTYn8beh4ZbyKl2AYk6lNzfwFzZnSYs9PWHcds1r3goAPi6AtlSt04jG7RV/YxCQn94mGAr80o3nu+o+/34ARE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xQMDHXhm; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-70211abf4cbso487477a34.3
        for <linux-leds@vger.kernel.org>; Thu, 04 Jul 2024 08:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720106375; x=1720711175; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SBnMvG37dKuOC06S9766u4IZ2Y8qnimBTz3yQ0fqYFs=;
        b=xQMDHXhm0ZN/5JPM6OySB8Vz5K6qNztm+FpCV9WPEkfP5xlUqig4JNkIAuxFMMziIu
         igdjOGhw297xPnix49EX00tgvf9rpZyNC8Ioap+9kAuemFA0HPYqZXaCfiM13MI2iaaz
         uzUSIwsJltogYSPWxoa4z5VSgm2PyYFEmhZQE5yNNaZOT9dgZiGi20ow89dMl0YH8PLy
         zSdwRPAW1ZRPjAbz9LI1/5AYO6/dhei0nBFT4Bmfd1N/ZwADncLlQdEbcADt9SVjUOvA
         SmwOjjFCfQTgAlTLnkTMhwSOXLE6S/kJGiX7WVDVOzB72IHNs/g+30aG0j2NyYy5J3ik
         /lnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720106375; x=1720711175;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SBnMvG37dKuOC06S9766u4IZ2Y8qnimBTz3yQ0fqYFs=;
        b=EquAsy9p/i3j4eQnY7cOLcIZaYB1IxvjfojkmwMfbDRV9iIab9Axjxv+s6ZNuXibxN
         oB3juXKo6sxANcHiKC1I4uTJqdroMSXwmypDI8RMcIL8EBwZKTPUQXe0yWjwKBQuXGxH
         mjzB4R1IhZNxLa5Amexu5FZbMuDyUcVmFczlbpc0A6INmYbSINFdh039HcA2nipTH4XG
         zkcGsBLamLzpLfo0d1zLFFu6KOW7dBtaZsygoL/eHs9uYz00SD+IPPb2RBKhwUHLBcPW
         OAalDJtoug/WzOga7myWmx8oOCYIGXKSdS+xIOKCi6Nn/FJS81wI65LdJiAuzz0sdMDK
         4RNw==
X-Forwarded-Encrypted: i=1; AJvYcCVG+24Ib6txP8g77ikxWfhE3PSR4+wDkQIiSvSXgwvm8YuhqYE4mPrtR5ErgJgJaWReNqdIQNOy5f+S4SRyI9nVKNawC7cliNDpKQ==
X-Gm-Message-State: AOJu0YzfyPImr1X7C9fcZJZ9GFP955rgn7SYaVShXGcUCNdqQE8tzi8m
	OwWjVTLw8DjD8NNl1kNcOm2k4TMaOrGqJD6nU1vl5zh/zujJ59VqTwxBniNNNj8=
X-Google-Smtp-Source: AGHT+IGELc1XlTyU7hBE3KqfD3MGbDcxlgY/gdOmWK9vwGIPWbgvvPgc53z9nomGTso73+WzVnHE1Q==
X-Received: by 2002:a9d:684b:0:b0:700:cf81:3d75 with SMTP id 46e09a7af769-7034a737ef9mr2275095a34.4.1720106375459;
        Thu, 04 Jul 2024 08:19:35 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:96a0:e6e9:112e:f4c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7ad93c4sm2426120a34.46.2024.07.04.08.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 08:19:34 -0700 (PDT)
Date: Thu, 4 Jul 2024 10:19:32 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pavel Machek <pavel@ucw.cz>, Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: Lee Jones <lee@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] leds: flash: leds-qcom-flash: Test the correct variable in
 init
Message-ID: <ZoWJS_epjIMCYITg@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code was passing the incorrect pointer to PTR_ERR_OR_ZERO() so it
always returned success.  It should have been checking the array element
instead of the array itself.

Fixes: 96a2e242a5dc ("leds: flash: Add driver to support flash LED module in QCOM PMICs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/leds/flash/leds-qcom-flash.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
index 7c99a3039171..bf70bf6fb0d5 100644
--- a/drivers/leds/flash/leds-qcom-flash.c
+++ b/drivers/leds/flash/leds-qcom-flash.c
@@ -505,6 +505,7 @@ qcom_flash_v4l2_init(struct device *dev, struct qcom_flash_led *led, struct fwno
 	struct qcom_flash_data *flash_data = led->flash_data;
 	struct v4l2_flash_config v4l2_cfg = { 0 };
 	struct led_flash_setting *intensity = &v4l2_cfg.intensity;
+	struct v4l2_flash *v4l2_flash;
 
 	if (!(led->flash.led_cdev.flags & LED_DEV_CAP_FLASH))
 		return 0;
@@ -523,9 +524,12 @@ qcom_flash_v4l2_init(struct device *dev, struct qcom_flash_led *led, struct fwno
 				LED_FAULT_OVER_TEMPERATURE |
 				LED_FAULT_TIMEOUT;
 
-	flash_data->v4l2_flash[flash_data->leds_count] =
-		v4l2_flash_init(dev, fwnode, &led->flash, &qcom_v4l2_flash_ops, &v4l2_cfg);
-	return PTR_ERR_OR_ZERO(flash_data->v4l2_flash);
+	v4l2_flash = v4l2_flash_init(dev, fwnode, &led->flash, &qcom_v4l2_flash_ops, &v4l2_cfg);
+	if (IS_ERR(v4l2_flash))
+		return PTR_ERR(v4l2_flash);
+
+	flash_data->v4l2_flash[flash_data->leds_count] = v4l2_flash;
+	return 0;
 }
 # else
 static int
-- 
2.43.0



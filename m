Return-Path: <linux-leds+bounces-3226-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 869949B8029
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2024 17:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 050A3B21A23
	for <lists+linux-leds@lfdr.de>; Thu, 31 Oct 2024 16:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092A61BC094;
	Thu, 31 Oct 2024 16:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k89v/yD9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6161BC092;
	Thu, 31 Oct 2024 16:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730392239; cv=none; b=VGmx9lviaEYdJuk3zVk39RvAXIjwPTzo5nqtTzlpt4rCpz2eBF5UObhbgnZBZ9Zd+EYB9v/IoJdU2HRhJHTIfKgiioBifMZzpD2HIP4A/iKAgO55LPNLMvprM5Lo/V9DgH/TnIcDE3iTbQ6yNMnQ2a6ezvaoePY/nbV+ts6SSbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730392239; c=relaxed/simple;
	bh=TzgqBdulCcwCgsk4Dzl2mMhbkNEUYXQsDGt6SOyw+BM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H+xUcTsHnTUfMomVW4kaeNxy8/sQFGYWI2AlsbuzP1xVusQQC9CSmFOCRvTXhOja7yfg/XGTaRy3zZaDZxGN1elk9a8PZj3wnEzcyVG3VPa+f13IQvEiUExzBv/6grqtThpOmrHd1a5OLkHXVoMzC3AINP7/wzplinPwN1wRu0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k89v/yD9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4319399a411so9936685e9.2;
        Thu, 31 Oct 2024 09:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730392236; x=1730997036; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XNXajkYc5t4d7+5F+hR7xWhcLG/6vt6ncktwAAq0JXE=;
        b=k89v/yD9f+KeOKrypSjOoD1aFquN3RObcnxGsMmVIzsmbgSJC1cTX77Ut4qP1Q2CcZ
         Bj4tCtGKYV1lq2aAKYhjcZUfPy/Rr0VrDNg7PakZqI7KYu4vWX8Bp+k+KdIYAkmcrTTj
         /nLgOaHchlevIeo9OcpbtT82zO8xcubq6+uYpW91VLrr+nTlYgn68dgfiXUZ6N8YDSGS
         RzjbsbUeejJWbKug2+mJw3ThV3IYCf71JU8UvFS1snyRgLPiWscti/y8qOJ0JE7BX/Zm
         LW5vXVuGnbsmkKPmPyVbTpPNt80SYt1o5H9X6G12aHj7VbeKQr7h/hphF5L9y8vNCbjn
         xulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730392236; x=1730997036;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNXajkYc5t4d7+5F+hR7xWhcLG/6vt6ncktwAAq0JXE=;
        b=aeixCeBnqAQR1BTT7E6fP2es9EcpjR0+zIRmjAM+VgQY7whitXACAR+7UE8IRbCkXn
         YNVrLZryZOXNuSX2Msv+PaC59/MO4lN27wmb7vA13sD7IcgsLUzdafHYaKAuX6YSBHjx
         nilXFDP+ZayQoKV82PY6VI1n/9MMKuNgLO2nRdiSf86P3Tard6r58vpS+zrBH3wLVr+M
         TgZOA4Q7t9XYTb2TJ2LDn5XdP/5uGFxACJ/ZFNGsAQdwqZYHyCEcv1DSR9YNOAWIAmLQ
         DnK89apFZK1DVmNx7Vi5xBB0ehkJMlUyKUSb++Clgn1xk6e59LpuMU3FTnrGrguKObm2
         cPDg==
X-Forwarded-Encrypted: i=1; AJvYcCW3WPoSiLW/l2OcdAeP6rRHdA1O1FTTwLGqFA/g0WDuFUBeapZr5EHhGMorIisdgxoG4xa8c9CSK0kHzkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFrmKRUlaA2o2hUkYj+OSn+twKwtQwW4FzNI+/AR3om0knZpZ8
	t1uuATK8jwEhqS6jBnEsRrtPbNLP0XCT8QuenkZGOZZgFcrPSq/cMI1IQsA9
X-Google-Smtp-Source: AGHT+IGIfAXz/vQSNU2Skw4bianKAM1Jp/5ecW0BK4jLW5zxBREQKTFBFe4mztLjK8da8YYvKaMaTQ==
X-Received: by 2002:a05:600c:5490:b0:431:1a98:cb40 with SMTP id 5b1f17b1804b1-4319acb8d51mr160475515e9.18.1730392235822;
        Thu, 31 Oct 2024 09:30:35 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-7ee7-8301-f2ae-7106.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:7ee7:8301:f2ae:7106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e7d31sm62195235e9.9.2024.10.31.09.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 09:30:35 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 31 Oct 2024 17:30:30 +0100
Subject: [PATCH v2] leds: max5970: fix unreleased fwnode_handle in probe
 function
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-max5970-of_node_put-v2-1-0ffe1f1d3bc9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKWwI2cC/32NQQqDMBBFryKzbkqSxkq68h5FJMaJDlQjiQ0W8
 e5NPUCX78F/f4eIgTDCo9ghYKJIfs4gLwXY0cwDMuozg+RSCS40m8xW6ooz79rZ99gu75Xpm+4
 4V66segl5uQR0tJ3VZ5N5pLj68DlPkvjZ/70kGGd4t6iMU0Lorh4mQ6+r9RM0x3F8Aeta3FS2A
 AAA
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 Naresh Solanki <Naresh.Solanki@9elements.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730392234; l=1714;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=TzgqBdulCcwCgsk4Dzl2mMhbkNEUYXQsDGt6SOyw+BM=;
 b=8O7LAIITRM4GrxKyPXQnJLjNFXzUrJb1FXoRV17SJuCVU3wQx/fhZzfUuV/v41GaQt2SvjPC/
 DtDbh1oI9bxDSiIIWk6Zlb7qBq2Q+iEm0U/c+ypzL3/SszNP7mPhOSZ
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

An object initialized via device_get_named_child_node() requires calls
to fwnode_handle_put() when it is no longer required to avoid leaking
memory.

Add the automatic cleanup facility for 'led_node' to ensure that
fwnode_handle_put() is called in all execution paths.

Fixes: 736214b4b02a ("leds: max5970: Add support for max5970")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Changes in v2:
- Squash patches for mainline solution without intermediate steps.
- Link to v1: https://lore.kernel.org/r/20241019-max5970-of_node_put-v1-0-e6ce4af4119b@gmail.com
---
 drivers/leds/leds-max5970.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-max5970.c b/drivers/leds/leds-max5970.c
index 56a584311581..285074c53b23 100644
--- a/drivers/leds/leds-max5970.c
+++ b/drivers/leds/leds-max5970.c
@@ -45,7 +45,7 @@ static int max5970_led_set_brightness(struct led_classdev *cdev,
 
 static int max5970_led_probe(struct platform_device *pdev)
 {
-	struct fwnode_handle *led_node, *child;
+	struct fwnode_handle *child;
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
 	struct max5970_led *ddata;
@@ -55,7 +55,8 @@ static int max5970_led_probe(struct platform_device *pdev)
 	if (!regmap)
 		return -ENODEV;
 
-	led_node = device_get_named_child_node(dev->parent, "leds");
+	struct fwnode_handle *led_node __free(fwnode_handle) =
+		device_get_named_child_node(dev->parent, "leds");
 	if (!led_node)
 		return -ENODEV;
 

---
base-commit: f9f24ca362a4d84dd8aeb4b8f3ec28cb6c43dd06
change-id: 20241019-max5970-of_node_put-939b004f57d2

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>



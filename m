Return-Path: <linux-leds+bounces-2462-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D70F954DD1
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 17:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5DBE1F21CB8
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 15:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3621C57AF;
	Fri, 16 Aug 2024 15:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JczSFs7Z"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2881C578E
	for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 15:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723822342; cv=none; b=gRWvViEyzk964gt1DTeUrphhp/JOD5QoIkjfC8d8vzJMl1UgwoBVMtZW9Wkkbl5VrIf3N/ek/o8LeQ3O6zGtIFzlpdiKykfFScy8P0CQTwbAy68N117JB4rMtYVPfIRgiZd6Elsw/lQOduVQnQe1mK0YAf53ZJUnzsduuDibPk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723822342; c=relaxed/simple;
	bh=evm4/Qf1Gix0CG1zjk2y90RZHb2Oo+FXRI+CwqZngfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YyXES6GNfbyc1/+ODIaa/xQZw6dtLh0WDCvFpoqyWEAwW1ehKeU2C3yIDaURUxIIOJlJ6EPc7g3Bt7oOl/KXBZD6+KLa17+nP0rNBBXtSy9ZXZPW8TC5mi7lxP2BHCQNk2npt0jgDQVWNcbXVVJiawTnGAtBCjE8uw+q5V0oJq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JczSFs7Z; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428e1915e18so14755275e9.1
        for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 08:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822339; x=1724427139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i72cl2LG6rsfBE9NuFNe0vCjzQLf8lqqkLVcJWffpKE=;
        b=JczSFs7ZSvunsqpKG0tEFpCPMfCVKwpUkJ9EhwdByAotzt/2sR8MvwtwfomvDKVzqT
         2QIeR02aa0p82Ta9ucEnF9354TAw8CJxxqDF8BRsG7kCt1TuZjvFksBgbfP1X0gi8tL8
         CUCj1GE1vXfp6b4FnzWK5/JHVwqkafKqChWdnfQIXbA7P7nVYIx76IBbgTSM/UZB4XXN
         hlJhBzE5Z6jEpkcTZ7TUbv+0fOBYird/7oNiJQ7vKyhW9kk8fkK5w0rMbDL0Cjp3MmUN
         TV+b3sh0bhqCKSi5eX+CqpIF7xasaiQFN6jAz9QNcx644b6IP29pDd0W2EmT3o3MTccT
         z0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822339; x=1724427139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i72cl2LG6rsfBE9NuFNe0vCjzQLf8lqqkLVcJWffpKE=;
        b=T7w+Z8+J1Yl8SYEtlm+7KbD8A3yybtnGHUh836h3YWA+bUYmlst5y3+W954XqZqyhj
         tvwefaTE/5gaFXZxGUlOrmfjd74HfCJlQxF108oPosq2gh8h5i2DpnVm8dTWBypcjM4y
         8qRUM7Jz+1vZ3lP8Pwl9s9uQrkLU1fgPXbH7sV233oPzMtu0Uo8hWgSmLKQmxe8A1OAO
         TEaenonUKZlXxlNGBpnaxcauFvm/60/G3lI/dfImwL3GLNszJmQZsGB7xRmyQoO9eTY1
         0IGBYVEGOaxode4DGdzx6D+EQO3nA8nI+U2/+4xPGhKws8GpT0dLaQkyltr2xKsmZpuK
         Rlsg==
X-Gm-Message-State: AOJu0Yyc8O7qtHM88OLU4rc7dX0N06PqQc8EvsRQf1Vbn2QdtiTJW6eF
	dDlLvpn927OhkFGoFqeavuQRiYezGh7tMdYbaoFEuLd4u/br2XGYUB03Y+GSdMM=
X-Google-Smtp-Source: AGHT+IED0WYx0TreQX2OrKap07J96mSpWj6wWPju1D8qe2yhsCsW41zGu895F7DsFQ1Mn543/zW+Kg==
X-Received: by 2002:a5d:4b02:0:b0:371:82ec:206f with SMTP id ffacd0b85a97d-371943293cdmr1861574f8f.16.1723822338955;
        Fri, 16 Aug 2024 08:32:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:49 +0200
Subject: [PATCH 17/17] leds: qcom-lpg: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-17-1d0292802470@linaro.org>
References: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
In-Reply-To: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Riku Voipio <riku.voipio@iki.fi>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1848;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=evm4/Qf1Gix0CG1zjk2y90RZHb2Oo+FXRI+CwqZngfA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DojUfs6j9ghjY8rYQZeR83/DBn5C5vGVai7
 SH1nEKJD1aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w6AAKCRDBN2bmhouD
 12UID/4yUfw9u/p7xohuwxORPZDDT+wUHcCCjyoUV2diG+Nd0Oqzcv35eu6NeZNl7BNB3X0EQoQ
 VQn8BrW9aEHJFgdQC2UPhVqwKnqyy2th/AJfD9MDAa63IdWIdTPI4ZAUqhAMFTHyj4QCIM+Cewp
 6LSA+M0GHdFwqqZXKWRyINxmfNb+nD1yOcUJSn1p4mQVAlwWCr5tXZEmhFh/pvurGumxCqeHGt4
 EEPK8uuEV/ZrxuMoKFKYaZxEmbrQkvfISkoql4+54GXtQ4u7qmSdTqCSESVW8wrX19GteWzW34w
 /3rW7iV14tptFvALyHd80HwsDP/FpK1oa9PDUI4ukf8VXk4DMcTg0/DlK553j0gew5RgjMZszdh
 D6o0hFLVuvoe4M/wRvnYDb2c/HvPKNwKG2yLIkft3ezelGstcfsyprKU6Wvg9ui2s4MSiYcfIpb
 RkiasvWRnhtsxaMbCeE0GbtB8xTkCUJufOlMHca6MY6/0upIL7buM+iZ2gQD03zfpWZChYZ9xRT
 noGcSiHIFcHWGBT7QU3Aac96iJHkrY4pfr8vq2oE3o8DZhpegNlm58HqHDk0kl89GIR+JuccPSF
 ZN/CyNtXDJP5V8DPnd4ZHC6QzRAeZYyQ3PrXV/BluuDVR+gcWQ4G60i6McsRcpRxELK+EFjjgst
 yLwTWCItNdg6GjA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index e74b2ceed1c2..f3c9ef2bfa57 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1368,7 +1368,6 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 {
 	struct led_init_data init_data = {};
 	struct led_classdev *cdev;
-	struct device_node *child;
 	struct mc_subled *info;
 	struct lpg_led *led;
 	const char *state;
@@ -1399,12 +1398,10 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 		if (!info)
 			return -ENOMEM;
 		i = 0;
-		for_each_available_child_of_node(np, child) {
+		for_each_available_child_of_node_scoped(np, child) {
 			ret = lpg_parse_channel(lpg, child, &led->channels[i]);
-			if (ret < 0) {
-				of_node_put(child);
+			if (ret < 0)
 				return ret;
-			}
 
 			info[i].color_index = led->channels[i]->color;
 			info[i].intensity = 0;
@@ -1600,7 +1597,6 @@ static int lpg_init_sdam(struct lpg *lpg)
 
 static int lpg_probe(struct platform_device *pdev)
 {
-	struct device_node *np;
 	struct lpg *lpg;
 	int ret;
 	int i;
@@ -1640,12 +1636,10 @@ static int lpg_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	for_each_available_child_of_node(pdev->dev.of_node, np) {
+	for_each_available_child_of_node_scoped(pdev->dev.of_node, np) {
 		ret = lpg_add_led(lpg, np);
-		if (ret) {
-			of_node_put(np);
+		if (ret)
 			return ret;
-		}
 	}
 
 	for (i = 0; i < lpg->num_channels; i++)

-- 
2.43.0



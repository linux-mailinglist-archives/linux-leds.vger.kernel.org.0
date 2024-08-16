Return-Path: <linux-leds+bounces-2459-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F36D5954DC9
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 17:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63C44B23D8C
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 15:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA0E1C3F29;
	Fri, 16 Aug 2024 15:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BKNSOX7f"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DECE1C3F28
	for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 15:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723822338; cv=none; b=q/rP9V5UiYdSiYlwPIdXyfxNihthkwarf3ztWDlJ/C17QDwfj8PZ2KPCHFnYedXxZ0XPlS3S31u/z12zH6YaX/q8Kgi34HALDt72x8aVh2b2iusIGEg1d6k7GGjVK59xYSC1CXtEzFH7B9LwsXElXVrErrIv8uLrPcP81IFd/dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723822338; c=relaxed/simple;
	bh=3ARnnx7uT2kjUKO/lBdUAxqqDcV1RDRByaeh6p9QzVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mFhgEcnpNr5J5dPB4+d/pvl1J0dJa8NRaGTwMfFLzF2YI/+UHZzXZvKdTsghArLyEiZcG47xCUoaTiMRCIbAEqovmo939msEM2lDACx1ep+Eoy3qEyHqOsOZzx6PIEexglfK8iyqMy8VNXOLN8xBP01qQW2ktZkOVetPWMD5UIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BKNSOX7f; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4280c55e488so11224715e9.0
        for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 08:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822335; x=1724427135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOl1ZqBXdbAJXZzTI3BlQ8z/3fBsZwwoZ15vO5UkJdk=;
        b=BKNSOX7flAFtVilcKIw3BjpXNGzn4eU3cILCKRB0fSZ6SWhexbvHVt9K0F/SDsDc3z
         MMZrWiADE1Hh8iNbl4HX19sakphr8WyuxafJ/EdsjjrpDJMylUP0IS+UP+oVXeJDGFcE
         WBGEHe4faNl6i8zvEeukJQyY3ZovcrJP5xYxCWTygTsvfgF9ohivcxovaFN53AtYN6Vf
         X7rwiGFmZRZt/CSuErTn2pUXbwkMzgFNYbEGDDYa4GmPAYk3SL3SdW/R130IwVPIj2VE
         aCmC1E3umaXSDuGK4j93uu+Q9mfLpFTICeP2Evc93AMRLOFc3k/XV/hIY28qcyUf5ej4
         FS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822335; x=1724427135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOl1ZqBXdbAJXZzTI3BlQ8z/3fBsZwwoZ15vO5UkJdk=;
        b=Zi/3k2t4rtJQ5dHz7bRoq5YqiA9CdGdjDfNWVjFwbLArHS4S+139lKu6KxQZl3XiB1
         xl457I8RMC3MiITcCHpHU1RwIcupOoR6sLpZNcDvoL4cuJfaeMAjETMm4CUfKiiTaw1R
         OljZOFczJtVpKKocimGIFCfXNZzt5PkLBUGJmW+Ep10kYxQZa8BTERyWoW9DqgDrhben
         rHejY9PA24wTUvN+5dtmXu2SpL3iCqqD++dWB7KoSyiFJWtkuqwn5DqZKDEfQvoQ5Rs3
         Pz3Abx1n3lFVZVgRQzKNB+G1jHvWE5j5/MLO2etr4aypjiODea/+92D1U8P7XeCSwItb
         qEPw==
X-Gm-Message-State: AOJu0YxcsfvKhsHDD6fNlzTgLmCrHDusw8piym1j0TyHrHGe8B+fmJp4
	YDEFnV3Z6kVtyyRm6TySa4uS5XSXLW/ZiOmVK+hJY3KJVyWnB+lsI0wHmjE6MuU=
X-Google-Smtp-Source: AGHT+IEFjSH4WqobBhV+up3oZ7ztZRwBuC3HgNzLRXaYpTTRLatXBwsIRxgmIFfySIZM1KogU0AXTQ==
X-Received: by 2002:a05:600c:450c:b0:424:8743:86b4 with SMTP id 5b1f17b1804b1-429e232b8a0mr50953985e9.6.1723822334803;
        Fri, 16 Aug 2024 08:32:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:46 +0200
Subject: [PATCH 14/17] leds: pca9532: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-14-1d0292802470@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=3ARnnx7uT2kjUKO/lBdUAxqqDcV1RDRByaeh6p9QzVk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3Dl9NwZPB/MApEGkh1nDqgHmMiX/P3/AIqpm
 RoLHvTk8y6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w5QAKCRDBN2bmhouD
 19g0D/wMAqWjPIbSHETSNRfB9R/1HlUm5xI5ndiN59Zcgwr/clBCSt48gRDMuFGS05K/kNaSvRO
 8IbtYru6I5aMaoGCHU1KgbcevPw39TynUzLejaKERSJ2zXJ8UQ+qvh80ce/3XMYlfCBf9b19psi
 xRyJnm70aht0YnafXUBRfWvp6Im9/I7y1YV+tXBnLIKXrWLznSUDTHXSs7EKODOjnqt4mFNJfew
 qMZ4Lu9SFU+kG99RWVs4R96XWtdI5gtCmt9yjriDw5/cD9GE4Ad7Wjk+juXE5HvEjl/hZ0OnokN
 3HsBKw9y+68dZIwQVVDmPPZJb50/DGJstWUwxOti9yfDxKYMCkW/+dZf1/LxZYvuxb/0WOvODM5
 PNeM2bx/y0m/cOQY6GAYpu8UgoAbMWzQxufvxjUN52w+IQjQ7w3epmoZLycDyPEFvVQ9+Nz7kOQ
 I3QvW+PFDLC+htKn3wV0X1Adnhj3CWolfRDdVQ5m/UMB2EwDZy+VOthEx7pNzC5wcmFzTXoL6Sx
 4D/8ee8LHgG/8I5MiNA6wVgqUJCu/NJE1DY6XJ1JuVTbs8qyCiLVW8bJ/yo4ecJgPpBBhPTGdfE
 Ld2si21avus1XNVlYHHao2BVVh3XLSmqiMvmaWBGvQw3Y2J0/nbyOBAcRN0BUWe6W+N0RGJ2O2a
 fZZYbzRJlMQmwbQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/leds-pca9532.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 9f3fac66a11c..338ddada3de9 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -506,7 +506,6 @@ static struct pca9532_platform_data *
 pca9532_of_populate_pdata(struct device *dev, struct device_node *np)
 {
 	struct pca9532_platform_data *pdata;
-	struct device_node *child;
 	int devid, maxleds;
 	int i = 0;
 	const char *state;
@@ -525,7 +524,7 @@ pca9532_of_populate_pdata(struct device *dev, struct device_node *np)
 	of_property_read_u8_array(np, "nxp,psc", &pdata->psc[PCA9532_PWM_ID_0],
 				  ARRAY_SIZE(pdata->psc));
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		if (of_property_read_string(child, "label",
 					    &pdata->leds[i].name))
 			pdata->leds[i].name = child->name;
@@ -538,10 +537,8 @@ pca9532_of_populate_pdata(struct device *dev, struct device_node *np)
 			else if (!strcmp(state, "keep"))
 				pdata->leds[i].state = PCA9532_KEEP;
 		}
-		if (++i >= maxleds) {
-			of_node_put(child);
+		if (++i >= maxleds)
 			break;
-		}
 	}
 
 	return pdata;

-- 
2.43.0



Return-Path: <linux-leds+bounces-2455-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C860D954DC1
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 17:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0709F1C2144A
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 15:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925F81C379F;
	Fri, 16 Aug 2024 15:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F0U6SocS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA8E1BDAA0
	for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 15:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723822332; cv=none; b=L2GdPSncC660VEeFNyV8V7gIYIlxL1YJIDWlNGNdY8uHDoLazF7Mi2gFCC6sbf1r5eDsC7NoZKWduhol4pIXM/20qgs9wT4yH8zr3WJjU7EhMKmPnaDy340bDjoCSiOImvDSWrIEQX6xk5t94TwDPdnrqR/fDf1ZZO0+aynG+cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723822332; c=relaxed/simple;
	bh=pmrGUTEyc4+OdSgnYm2SLaaXl8kY77CCNdxnjrRu1fY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=grpqs44Hjk2qNAa9TCwt3MieDo8FXEa1o9iaE34salOC/GzMtPdJ+fcjif/3fwHx39FZcp6EONx6i71ew2QLudJpcLu5jRaqWnDsMh2JSvWHneGvyFmoKD7zgBxEZG3Xl21ymSHxtYh8EAZMqWRRRb0AgiX4mz0gcutLwlrpUcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F0U6SocS; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3717ff2358eso1125738f8f.1
        for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 08:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822329; x=1724427129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUGzP1t9Gta8AcQElPeRx7Ldl4ob+d0gDQH5kp4CXpA=;
        b=F0U6SocS/GRTd4IW0FVII1Ce/EFQ914e2FkgRncYAWnifKw/G+ZXRSsIKYBkGGE5xS
         gLVEi53ChflLlLNgZhUpH8mbywDpzWfWGPnqxdo8YOCQUECIokDGQnvGglwK6PdHFY5c
         UZHvKyH0zt9RhbVk+tgxgErKGhQX3PHWcDi5yd3+QbCRwKcU/GB+ww0EswtBEjFxq5+K
         1eIbaOzFiIXdbJ16p0LB0bXm7sA1+c4gVjjado2OrpvcG6yEakSHy9JHRH3tE6WUc2ip
         9IIbNQS3b8QeIev7IkjIx1D7d14sjs3uyO1JYO+5BxWV5DECGuuN4hp/KqyC5/F1oD4d
         I9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822329; x=1724427129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUGzP1t9Gta8AcQElPeRx7Ldl4ob+d0gDQH5kp4CXpA=;
        b=oc4xmeZbFdEcj+bn2lYYL9DHLMLxGNyisrLBKFPJpKFzBy7cuT1MW1U8RpSS8CvKpn
         lH5ddO5dNxnrJ8jR4yYikhpyPmQtPt1KXLZz878TfeSMeVIh0bkWdIy4r4GDZdD8Gkc+
         LukYN5wU83WbJV/py3xM24UJiE79+HxC1bM6cTEZ0p0Emq5UUBPG53EefRKxnvk8oyzd
         3QZlxQCOZVSKOyl9bqJqv2/0ft4S2OFrJCSylPAzsbDN3bjeigNIqljTtUQJigqPcUJ9
         5osdxMpxrjwNyzYhtR6xoECGq3O8M/6B1xjPmcREYs0my7asXavtkElenOMJ7WIGAR0F
         1YYg==
X-Gm-Message-State: AOJu0YzdFMTaHzpVi8zp/EPCRdM/pT7/2VZCzDVqyLsXwBJXpPp7GUSO
	oCJVs25u/ItT6GgqEMiRoNy5//B7t0WMAZPDlAz//gUdLge1VenChy4hVhvlR8U=
X-Google-Smtp-Source: AGHT+IGhEOtCAhmiEJzyM6rHhtwOV8c0tEKSFIqBbM2oY0Emu/CY0p4z+M30teYyAFMwJF8/lsh8kw==
X-Received: by 2002:adf:e907:0:b0:371:8f32:557e with SMTP id ffacd0b85a97d-371946a48bemr1879100f8f.39.1723822329270;
        Fri, 16 Aug 2024 08:32:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:42 +0200
Subject: [PATCH 10/17] leds: lp55xx: Simplify with scoped for each OF child
 loop
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-10-1d0292802470@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=pmrGUTEyc4+OdSgnYm2SLaaXl8kY77CCNdxnjrRu1fY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DhRHjXK+VVZ1wGfuTNvr54zgIfsr6GoeBrH
 1NeN/M93z2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w4QAKCRDBN2bmhouD
 1/ByD/9j6wZL4arhQNjD+UFfZLKCUSB+07X+VLcSzVuP8NTqtzt9JdzpwATyKwe+8mx4uaDZxsb
 GyCQxZBMeiJ5WyJ0GIhCw2HIc3aA9GoNieEjdRCZvaDvuh22wl5qUf5h9TBXcWlOP8nuX12gTbW
 VO79LyvYiS6Wcwfr38fhMxmCImw6vRxdBXOPdyJkqaeR7LptXb1w+5/c1xXHnd2D3xDHZhLahod
 QGtHiwJrNTQSZxwK8V3o4Sp+GG7KRxXMfXxsXxC/0LP6LMxe8NvryP+/ILF99EkLvjFEb7cAI1o
 2Yy/dUh36Wnt2bPgvIFZjQDGPLcRSNGjvfe1XaIHeoq3dNte0b+umeva9edjpAGZw3IgKOe6R3D
 CEzVN2rDv/DbS8biy9Ru226n+ymrguhAn12JQSErEnQ/Suw9+3NnXjhNUtl2KeSXWhMTeKaVcl5
 bJ0cDPBAehRG+k+e3ERjKnM5USAn9Jfgv7mRXpjdRCKcFBvNQ/0lnEA0e93da9h/mbXGfCAsJHe
 rxMoQ3aGihwQ7gGOAce92nHK4uyVHPuOj3UPq1ZoAnPjup8U8p3xLhNBj0Rdhw6TnwiyHdfqluv
 aivLqNn/0d44N/vgtlMX69I0VOhGgC28XeI05p99ukmU8CUtzwlQUZKApdcBL3wVj3h63Y5NejQ
 9gCn501ogVJCjxA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/leds-lp55xx-common.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 29e7142dca72..d493b31c215a 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -1173,16 +1173,13 @@ static int lp55xx_parse_multi_led(struct device_node *np,
 				  struct lp55xx_led_config *cfg,
 				  int child_number)
 {
-	struct device_node *child;
 	int num_colors = 0, ret;
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		ret = lp55xx_parse_multi_led_child(child, cfg, child_number,
 						   num_colors);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 		num_colors++;
 	}
 

-- 
2.43.0



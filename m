Return-Path: <linux-leds+bounces-2451-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7DC954DB9
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 17:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A03442875A2
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 15:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54C71C0DD9;
	Fri, 16 Aug 2024 15:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PmLYQ6KG"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063DB1BF32E
	for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 15:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723822326; cv=none; b=ry+pc+gNlEJ5vXjys/fIADmfvQ50RnXxUqhj5ex6MyMpvgcwpm8cnr/A/KddUrqOdY2Cx5Kt6SBTFlETJdqGDBMjIs4We5XNCqM5uIQBPYOXTqZYFkCQJSaxpYRmYF1tB9krMALmY6xp2/0U24R2099R1f1n0/wMtLRSZXAdAdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723822326; c=relaxed/simple;
	bh=jPAa7n3fQCOZoqW7oKViIUd50z7rPIx9W0P9wLhVk9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jofIGv/Jheey9Wsdf9IfVPnrfICnw4QlXTI23/qWL2d+kV76eIMojbiOpT+KKgn7ipwxnAqHiPKQ/Ll/3TgqAod5su0BuzUylQJCelTyWXqMB20bJ6e+QgYt0wMrxz2qIAkoQ4N3LtI3qf/Io2vDaxg6RSDYoKZDJcR+SJs8XAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PmLYQ6KG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-429c4a4c6a8so15715635e9.0
        for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 08:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822323; x=1724427123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SlPHB4gr+L6a3Oj22+1JrD6FFL140QqYHUkR8oZywNI=;
        b=PmLYQ6KGpyhT0koV6NCziEdI7PiEnSBgyYJ1PVSFVNEA4s+q65VuLBCPuSYU40+kwx
         mvJTFZPaZYK4CnNZRxh4sruMhqaoyOlTOJXu3a8wocZkdOAAwqUL6UvLyAsxweIQJwUO
         7p6jH1AjteMvbh9n4jLAyqYvY/w/+fJyQ2PnF7jo2V9VMGZHgL2JRX/ss+XIsxxl21+I
         Y255GhnkGLdaJE2ZICRmvvm7s9tEebb92EnlqVFid1l3dngz/1uITlzGotRL/AUhmKr2
         feNdyzjWpJ26n7ZJYERbFQurbHVweUzbngm6CFCh16LRMg843EyTEtZ1TbvosGh65m4A
         aKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822323; x=1724427123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlPHB4gr+L6a3Oj22+1JrD6FFL140QqYHUkR8oZywNI=;
        b=hwUmj8qI4YJjBl8WyK93ZyB2Ju+1UWlqjLDDuduJIKfmz9pYK0fO7Qd4xFz5pAtr97
         H/jBccH00RSiThqcb06o1xx7QVA4eyRKoiIj5+O0BY2e0g5ymnpjs9/h1tscxOEsxCEt
         FtT8n/T+pGOPBFoRb28QVpriGsUIO5o5hjSZsQn9u86PPuNT4x9FepKUj4y1CVBMnJVI
         oLT4YiTY3ezdcG6ROOA0Pc1tLUdA01mxydSflQm6/aam6fTasAwxXBQZordFlyhyYc9I
         AErBe/UjYNoDOJuM1ikJsWsugf8KYpBQ+MvF4z2jYQf6vVjT4VcxK6zeesiq9Egjm13y
         9s7A==
X-Gm-Message-State: AOJu0YyB1gpPgxtMRKQXVQXrCrbR8xXXOhW0ys48akYn0EkPve6bBlQI
	h+HoJPM6oOy7BI+mzAdXd2vJHjdjXlUyMjptA5+qfQViuJ17jhJOUqgCd6za4Ko=
X-Google-Smtp-Source: AGHT+IFBqViSqYS/Qn+XxO+w4C7+CaQs7V1F2BGvW2XzllPgvjc7cAPVBUQf03iTq4tSEpEg3x4Iag==
X-Received: by 2002:a05:600c:3589:b0:426:6388:d59f with SMTP id 5b1f17b1804b1-429ed7a6224mr21796435e9.1.1723822323342;
        Fri, 16 Aug 2024 08:32:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:38 +0200
Subject: [PATCH 06/17] leds: aw2013: Simplify with scoped for each OF child
 loop
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-6-1d0292802470@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1390;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jPAa7n3fQCOZoqW7oKViIUd50z7rPIx9W0P9wLhVk9w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DerHRigkFM7NozDs05CzB4VVyXWnkCs7tkx
 sIk5q1y1CuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w3gAKCRDBN2bmhouD
 18ZrD/97YWODT5Z5+DTebBI3wZE+0JSm6MgT/9fQqSV/jAaNDxPDxtcrU9f1tlmGpI9FQ3ztA1w
 5kIZXiEWrzUgc01OD/J1u+jXMzVC1rntgQmcCz3eR3mo7vdPoClcn8T4O64bLR388bwI+a/olF8
 ujcI81Zj77ajVSpsdceGMgG+REsRgUhZioX3In0qTtBtjFsadb/4L8RWNBVOt0AO5upLV8A/3gn
 JF6ZkJUcMAY0Qi0Da3wK33LBIxv2tlml2WyLQR7yfSeNJ+dBKo3cAPBXVC/GV/put6MdXTZbbOG
 ntf71ez6jrXpLB9FsKzXgKCZzAXfFyaj7c6KDKJZ0qdComtXvSZ9+mSp1BaMRlT4eBSVFgM3cZR
 aKo+cuCf9Ncg2VJFtXFtMzUFZexM9DjBvAC1DEpVp+NIeqZRM3mp7qsMfRUG9nTl2RVE3i62Yer
 peM1zsF7ZPtFOxd4B+nLZz4t6+pY9/fwPN8b5qz6rLrUQw6zir30lR/BIxNcgMmuFUK2hhjIedu
 zkFHEl6XDKHT1SYYpTDgvlWsGjQll18W4iojiDomjGXNaDHA6idfH18a2C2nDQ0S6Grm5I/A4RB
 9B5KZAgZi4zpiIw7aIsDRpYPQKDdovhX36Zqllgl60VZ5jN4ls0x1PBS4nHla9fOA5RQvPNMBvL
 PMAHdiIqEHJcgMA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/leds-aw2013.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 6475eadcb0df..216755d6010f 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -263,7 +263,7 @@ static int aw2013_blink_set(struct led_classdev *cdev,
 
 static int aw2013_probe_dt(struct aw2013 *chip)
 {
-	struct device_node *np = dev_of_node(&chip->client->dev), *child;
+	struct device_node *np = dev_of_node(&chip->client->dev);
 	int count, ret = 0, i = 0;
 	struct aw2013_led *led;
 
@@ -273,7 +273,7 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 
 	regmap_write(chip->regmap, AW2013_RSTR, AW2013_RSTR_RESET);
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		struct led_init_data init_data = {};
 		u32 source;
 		u32 imax;
@@ -304,10 +304,8 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 
 		ret = devm_led_classdev_register_ext(&chip->client->dev,
 						     &led->cdev, &init_data);
-		if (ret < 0) {
-			of_node_put(child);
+		if (ret < 0)
 			return ret;
-		}
 
 		i++;
 	}

-- 
2.43.0



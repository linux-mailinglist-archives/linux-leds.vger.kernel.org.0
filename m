Return-Path: <linux-leds+bounces-2450-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3366954DB7
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 17:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 916B52870C0
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 15:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDFE1BF33C;
	Fri, 16 Aug 2024 15:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lh1YLS8b"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3001BF310
	for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723822325; cv=none; b=uVsagX3YYxzMBYvIzWqO1DdT8hkufTYyOqpBnthegmK7mwPbBfVBqUXxzEy99IzBxKPYxbpFWSJXpz8xcsyoZZvF31x57vY80VAx4CYe+D/MMVK7PxH+dJ+o1xZ3Q/zjmHhUzrn1SSKhI5SG7weL/BlTycDmb1l4ya5U19U/eYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723822325; c=relaxed/simple;
	bh=OVXsaLaHpAF5uH0owWFBXjKO4nS2BM2WznX7TKsIhSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZcCcfu3YOyBjzEze3gS2k0GdyNNVabV3TZTEJmnYc48aU/RGcGYXqVxzogu243u0p3x7MiSaMQSRaLGzwZpioikDe8cQh111/uMSKxwMBISFJjyMqmhVvi/bXWpDrJhPNBzGvECW+KK+8jh9Q3di5Vjztyy9l9RuiFyDi5t+fFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lh1YLS8b; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52efc60a6e6so3120419e87.1
        for <linux-leds@vger.kernel.org>; Fri, 16 Aug 2024 08:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822322; x=1724427122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LbHR44bLM4FZ52+TjzVnIlbfMCn5qE1DnTHfiWLJ7c8=;
        b=lh1YLS8bjJKZJXIrtXwsmiZPpTP5u3UMZnex1ZCgckt+7MJ8jxolT8fsv6yP3sJBg/
         cXTaIoycNrGbT1cgzcIJcQvsCf+j3fPjGP2Ods5haTWDiSwu75A47LvsJWXoS6YdINHe
         RrUI5OfN2tnrk+aAtOy9PTszzKZSXEeHZtmiZcG87qFGX1X9pnUlPrZ4tEO3Qur3rGeh
         2GA1AGRgvQivnI+KvChqTIO/0/iZHs7IOjROFQVujbJTcl9HbE3d6UV2xHNFJf2wLOPz
         5CWSBTf1dseQ1PMCjRXlHbpkeaAF+HmoWZoNMgQMjS2Ypi9j7W0RZZgkVLhV2TmYs6yG
         /a6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822322; x=1724427122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbHR44bLM4FZ52+TjzVnIlbfMCn5qE1DnTHfiWLJ7c8=;
        b=qMCduoEIGRd4RQ6G0R+9DzAIVaelNPbIK6uiwZABb+FMpKJMIKHbkoa6CiKwr+iYeU
         gWPXZWcDON1ClhE5voLILR7IpOuVwH3CizzUflAh1lv0KT2UYGFKxtGBfly+qVoqFsw9
         7NVwnDYgITu0WLG4Q8DhUTZpCRFDAze6PRBa8R7FHzbVgSQajpQ671EK8Szp7NZP7OzI
         GtBbmbd2CjWDE191PK1zr9bBbj+7zT68wUb40lK3Yrd3IYmOZhedyIixtdmCsh04sccI
         PiX3+WVTxWSyDSomXQzjJLB6vd0QdGhpYQk5KbEvLKgrtdN4fjzkwryd7T1Y4UMPfKbu
         bXLg==
X-Gm-Message-State: AOJu0YxfifAQ7nBgkqeHvpUdzdsEbzREeVPE3Vun6N7LldhfQgxBnkRX
	Zoedd8b6L6a5YumPpoqsvCH4V/PD/8++Bj5zHstRQP4nkk886FBWEWcWTtjEHco=
X-Google-Smtp-Source: AGHT+IHxActLiG1YjVcFGYIn8S8tpL7GYn5YjKZvtEnowQwIDKLJw+P78NbSRNVlVr9yhYxdj5YjcA==
X-Received: by 2002:a05:6512:3a8d:b0:533:966:72cb with SMTP id 2adb3069b0e04-5331c6e324bmr2378225e87.48.1723822321846;
        Fri, 16 Aug 2024 08:32:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:37 +0200
Subject: [PATCH 05/17] leds: 88pm860x: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-5-1d0292802470@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1266;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=OVXsaLaHpAF5uH0owWFBXjKO4nS2BM2WznX7TKsIhSw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DdGtKK9vF/Igsn3otgQXRhwFYgtdI8zMghG
 N6WWewQV0WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w3QAKCRDBN2bmhouD
 19gEEACXTE/Bt5Piq+7QmHZKIKxE1e5XsrbSqm+4ImFiwaVig9kbXgGQLSXRH5UEENiLqiPpXwb
 cGBK827MslxTx5lvc0eqR0xGw5V0SUzmr24svS0ymsfjoLQvv0gpM5IIT8/j9xELhWXIvzDq9Eq
 NxoLtGrjXoWOkh2UU6ivt+4pSlksA3XINGNsi/nJBBe+x05EcF0F/Xhkrp8eaz0B3eYuQ7y/xIM
 ijNujYDLau798JvaH9MxCHeJykRB6NgKBBae8AzwIQamvrRPgKQM+KwzMVvEGCOohOrgibC49Mh
 231FWX5ZK/ciy22x3L13xDzYEAfAtuZLNAPGLovVhPGnAkeTBnJLHrPLa26Ab1+t1O8oYSL5SoB
 +Cu4/Hegu3x+oE4M/EugmWJlSuSXJCIYcPDXv37kaN6dNfUfCI2r6WR6yyOgpb3yGtIMdNrCZiv
 kNFB7MweAhEoln+tKaWZtathfLXF2PMhC6ikSGMWp17TLFwxy3nO5PARn/xkUj2OgHgjGy24ZVb
 OBobeUnbLjcKLj6LZcBbcKRadYhL5H1xYV9W3aGmCX/LIwvQGNrKQ2dNpaVgX+bPie592yDYuJP
 n2mb05+YBpkWuLztzlqcQAWqhRVggciLTuzTJZXz9fe1mGRy3B5l8npgdzp5ZHx7IvTCqjYKS7t
 QMf28Mjz4M4dbnA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/leds-88pm860x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-88pm860x.c b/drivers/leds/leds-88pm860x.c
index 033ab5fed38a..81238376484b 100644
--- a/drivers/leds/leds-88pm860x.c
+++ b/drivers/leds/leds-88pm860x.c
@@ -115,7 +115,7 @@ static int pm860x_led_set(struct led_classdev *cdev,
 static int pm860x_led_dt_init(struct platform_device *pdev,
 			      struct pm860x_led *data)
 {
-	struct device_node *nproot, *np;
+	struct device_node *nproot;
 	int iset = 0;
 
 	if (!dev_of_node(pdev->dev.parent))
@@ -125,12 +125,11 @@ static int pm860x_led_dt_init(struct platform_device *pdev,
 		dev_err(&pdev->dev, "failed to find leds node\n");
 		return -ENODEV;
 	}
-	for_each_available_child_of_node(nproot, np) {
+	for_each_available_child_of_node_scoped(nproot, np) {
 		if (of_node_name_eq(np, data->name)) {
 			of_property_read_u32(np, "marvell,88pm860x-iset",
 					     &iset);
 			data->iset = PM8606_LED_CURRENT(iset);
-			of_node_put(np);
 			break;
 		}
 	}

-- 
2.43.0



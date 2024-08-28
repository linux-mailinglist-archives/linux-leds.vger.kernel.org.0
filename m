Return-Path: <linux-leds+bounces-2537-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02801962689
	for <lists+linux-leds@lfdr.de>; Wed, 28 Aug 2024 14:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD36F1F22DE2
	for <lists+linux-leds@lfdr.de>; Wed, 28 Aug 2024 12:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D6D16BE34;
	Wed, 28 Aug 2024 12:05:59 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A4F16F0C3
	for <linux-leds@vger.kernel.org>; Wed, 28 Aug 2024 12:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724846759; cv=none; b=TUbjOrfafG8wxSRSnxu/oWILdC5+L2pJ2XOwo6TAgIxPlcT680Ebm/oUBIw9NwtRlHVyUYPdoTZLlec5fWYiBu/06eItieNx2gy7xjn3wRoDdqt6rWZVf1UYGZQzZCL7hxs9cFyRlav8TEdBqhqrHU13PN+HpObYdus9kI5C5v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724846759; c=relaxed/simple;
	bh=gkxRHpq20z/dtoP5iqjVQNs5ygSoysJ8cTBPbzY3teE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cx/z2MYunngyhBjrz5NWKC1wAdAeV5NY+xuoGtlI7mJOIn77Xp+MTYzYh7AsDxRVOwgBHJvMitYmkluHwC4Zr+NcybdptXNrtlTv4IODznHtlsLSJ0rzoZub3A7ARS33MT8d8oZVxk0pcXyR6y59IYoUQrvVvlVbmhov2zbRfgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wv34x2xfxzyQWq;
	Wed, 28 Aug 2024 20:05:05 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id EC9D914037D;
	Wed, 28 Aug 2024 20:05:53 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 28 Aug
 2024 20:05:53 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <pavel@ucw.cz>, <lee@kernel.org>
CC: <linux-leds@vger.kernel.org>, <lihongbo22@huawei.com>
Subject: [PATCH -next] leds: gpio: make use of dev_err_cast_probe()
Date: Wed, 28 Aug 2024 20:13:53 +0800
Message-ID: <20240828121353.3696414-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500022.china.huawei.com (7.185.36.66)

Using dev_err_cast_probe() to simplify the code.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 drivers/leds/leds-gpio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 83fcd7b6afff..d323c2954234 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -172,10 +172,9 @@ static struct gpio_leds_priv *gpio_leds_create(struct device *dev)
 		led.gpiod = devm_fwnode_gpiod_get(dev, child, NULL, GPIOD_ASIS,
 						  NULL);
 		if (IS_ERR(led.gpiod)) {
-			dev_err_probe(dev, PTR_ERR(led.gpiod), "Failed to get GPIO '%pfw'\n",
-				      child);
 			fwnode_handle_put(child);
-			return ERR_CAST(led.gpiod);
+			return dev_err_cast_probe(dev, led.gpiod,
+					"Failed to get GPIO '%pfw'\n", child);
 		}
 
 		led_dat->gpiod = led.gpiod;
-- 
2.34.1



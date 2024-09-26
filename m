Return-Path: <linux-leds+bounces-2840-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87886987BC5
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 01:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 436C4287345
	for <lists+linux-leds@lfdr.de>; Thu, 26 Sep 2024 23:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027E71B3B37;
	Thu, 26 Sep 2024 23:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKxt75Lo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC931B3B27;
	Thu, 26 Sep 2024 23:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392920; cv=none; b=E0DWqpLWaIw7s4rij48I38M/zGQXb36FS2AHOXAU9pAAvob13AR1KGe/XVTAJ/hs/m95dhrT30CCtFVPPgLBP4Jda91q4udai4zXPeCmCTQeOzEKtj4ZJh5WrQwLwjarGDM/X2dHz0DYP9evWqzMH/giZF2GnJR1wpWfh7204kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392920; c=relaxed/simple;
	bh=PSVqt2hzPQNutXFJ1ySerbu1QMLwioqVyiO4z6jxrQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r3CD6ZPVDhtPCwG9sefp6teC6+k2L7tVWqj+zwEI/qD6WRhcLzUs+2Q0wXscjqkVzti3bZS4FJ9AJ34t0mtUAfGXgITQUmMSpqFepjlSaRHJfBbwvorWxtMwRFwh+YdGiTGfphkngjiaQ46wKXkoUbni7d69fbQ2tOWmCZn44Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKxt75Lo; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a83562f9be9so137032466b.0;
        Thu, 26 Sep 2024 16:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392917; x=1727997717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsf1H9vGvMDgxqrrd3JfvSIa5200NszB5Zt97OWrjd0=;
        b=YKxt75Lod7JTxgh00DxWyHCw5JtauNMlKx92+JQ4zvjIRoXHy/CFfqJ1uI5uPNm8pI
         rWde9XAfWMGIGY0yvaT3vDBCDZ+49SFG4uQPD2bGUsjaT7Jkzdv4XOwpMdB/zDEIi3KM
         pP+L/SLDWzvyOKU7HlCzk/5s73skMV0Kh2EjXutiPfDmla3xZFGmul0QLQQyTrmKbXpz
         yvqfbZA/kAXUiMKOMwCx46TXok0JvnXWNeBpEthQVm9HJ4qkaoSVw9MGP9rvf5OlKK+g
         YjeuSnQwpjZxrDE/7MiRJJlj6JovB/1NHtPg4WEF2z1moYXviBiskT5Z+TgxAE5icBtI
         mnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392917; x=1727997717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsf1H9vGvMDgxqrrd3JfvSIa5200NszB5Zt97OWrjd0=;
        b=AK8aS3tXG8FqCGUJrz1hZKTlfDgAr1mfFHgYmkYPnsOjnS5cM8CDspxmd92iaKNz77
         K5aiLJlvjg6cqSOHJ1xMjE/0u3ZrnAdcqVlYu2iDTKbUh1nWhhNU2kybPDm2MpkGe8BA
         WSwbgbxe3trCkvw3maLnRQVyWhEXJ2mEyo0i8nesOFZXeMnx/A1N5gHBmS4930sNW2Kk
         1rQULngUtNmOW+dyOtj8gdtPC0/o/1auKJG71daVqOh/uLOkmbuhaXXt/Nnvsmuv8TiO
         87JAeich4cYP34yC/IxJvt3JyrVDl74W7wko6j6zleZPYAS55h+FoJWbndH1Zs9shPGp
         IqHg==
X-Forwarded-Encrypted: i=1; AJvYcCVZ5eOvozJIboXNS9rTE6Qqio62phWKTpYa7jkqLBAcGp6k2VuiXq0qOjQUJ9cWHYTbzB9i2DIlYDA33kY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkf914JWMQ3/IO5XXRwAsCnpaUJhxgGg3HjdPXssndHEXLgZGL
	6uSfy++vB4iCbKtaLMRWzAZahJ3a1bvuanAaNVsFoKE6idXpw5vb
X-Google-Smtp-Source: AGHT+IFFYGWgxNe3W6HVZ9vKaXN55rWL1eirSET5THcsDSbxqgt+Ehox2JsTuD01KAWPP5hH/gwWVw==
X-Received: by 2002:a17:907:320d:b0:a8d:128a:cc23 with SMTP id a640c23a62f3a-a93c4c2d809mr96338766b.59.1727392917484;
        Thu, 26 Sep 2024 16:21:57 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:57 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:09 +0200
Subject: [PATCH 18/18] leds: rgb: mt6370: switch to
 device_for_each_child_node_scoped()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-18-95c0614b38c8@gmail.com>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Gene Chen <gene_chen@richtek.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=3209;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=PSVqt2hzPQNutXFJ1ySerbu1QMLwioqVyiO4z6jxrQ8=;
 b=CwV0EpzUvZAO2Xr3Lvw35f2AWkJgxILgyeJ44eQr3MbK8h5/RqojjHPTG/zr0owvVEhgiQYxU
 1I/cZWn0KknD6O57SSfoyl0TPR+QYf61STH2RPg5oIKED+kOJG42L2i
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

After switching to the scoped variant, there is no longer need for a
jump to 'fwnode_release', as an immediate return is possible. Given that
the loop is called in the probe function, and it already uses
dev_err_probe(), the common "dev_err() + return" has been updated as
well.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/rgb/leds-mt6370-rgb.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/leds/rgb/leds-mt6370-rgb.c b/drivers/leds/rgb/leds-mt6370-rgb.c
index 359ef00498b4..fe76e8e27f9c 100644
--- a/drivers/leds/rgb/leds-mt6370-rgb.c
+++ b/drivers/leds/rgb/leds-mt6370-rgb.c
@@ -905,7 +905,6 @@ static int mt6370_leds_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mt6370_priv *priv;
-	struct fwnode_handle *child;
 	size_t count;
 	unsigned int i = 0;
 	int ret;
@@ -936,37 +935,27 @@ static int mt6370_leds_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to allocate regmap field\n");
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct mt6370_led *led = priv->leds + i++;
 		struct led_init_data init_data = { .fwnode = child };
 		u32 reg, color;
 
 		ret = fwnode_property_read_u32(child, "reg", &reg);
-		if (ret) {
-			dev_err(dev, "Failed to parse reg property\n");
-			goto fwnode_release;
-		}
+		if (ret)
+			dev_err_probe(dev, ret, "Failed to parse reg property\n");
 
-		if (reg >= MT6370_MAX_LEDS) {
-			ret = -EINVAL;
-			dev_err(dev, "Error reg property number\n");
-			goto fwnode_release;
-		}
+		if (reg >= MT6370_MAX_LEDS)
+			return dev_err_probe(dev, -EINVAL, "Error reg property number\n");
 
 		ret = fwnode_property_read_u32(child, "color", &color);
-		if (ret) {
-			dev_err(dev, "Failed to parse color property\n");
-			goto fwnode_release;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to parse color property\n");
 
 		if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI)
 			reg = MT6370_VIRTUAL_MULTICOLOR;
 
-		if (priv->leds_active & BIT(reg)) {
-			ret = -EINVAL;
-			dev_err(dev, "Duplicate reg property\n");
-			goto fwnode_release;
-		}
+		if (priv->leds_active & BIT(reg))
+			return dev_err_probe(dev, -EINVAL, "Duplicate reg property\n");
 
 		priv->leds_active |= BIT(reg);
 
@@ -975,18 +964,14 @@ static int mt6370_leds_probe(struct platform_device *pdev)
 
 		ret = mt6370_init_led_properties(dev, led, &init_data);
 		if (ret)
-			goto fwnode_release;
+			return ret;
 
 		ret = mt6370_led_register(dev, led, &init_data);
 		if (ret)
-			goto fwnode_release;
+			return ret;
 	}
 
 	return 0;
-
-fwnode_release:
-	fwnode_handle_put(child);
-	return ret;
 }
 
 static const struct of_device_id mt6370_rgbled_device_table[] = {

-- 
2.43.0



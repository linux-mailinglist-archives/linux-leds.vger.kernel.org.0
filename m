Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4654A102882
	for <lists+linux-leds@lfdr.de>; Tue, 19 Nov 2019 16:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728396AbfKSPqV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Nov 2019 10:46:21 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:39406 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727873AbfKSPqU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Nov 2019 10:46:20 -0500
Received: by mail-qk1-f195.google.com with SMTP id 15so18195912qkh.6;
        Tue, 19 Nov 2019 07:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2zddixLIG407nblq8qKNkbMRSz9Vj+er4J47xlaoa6s=;
        b=sWM8yhqarsXXdgRC3UamBKYPvXJ2ImKy01/+cId76FMPhdy3NJ0Jh8ZhBgJpSpxyAY
         j4R7LhsgHFKWGmMjq88vtT/XwZf7fDFquz/wYLpPQpwHFPsPKcRzGGoj3nypkL4S2Mi2
         u20dRmMsN89K1uP0OwaNRLgyYDEee2Z6G9fpmAVxSNxfZyIbgycuYhTisyXhIsuXJU1G
         eQ3yeP2tKHf8Szu043TxuZ5AT6kAdyvePJW8EbZNzxQniLNjj5LawVL4IuhIUmWDfacb
         qdscFThecVBfz4kxsu0mF8BCB30X8AlvQHeDrGR8AIRKWHw9WLencFL1U0pXOOGCUaeT
         ik1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2zddixLIG407nblq8qKNkbMRSz9Vj+er4J47xlaoa6s=;
        b=bh/FZ4aNNwznzoLImxel+UUR+5FvbWhnBZjbJynBdbcyiwQhYvmwOg9XpeDJRP1f4t
         5GqRFGiKT9+ZHbcjimSysM5DP9p95j1a+pnSgHeI9VpqkxpA2hZwlfjc+9kZYUHXgWaT
         Z3z6FYpikcDrtYhdySuOcw4pfgG3pwvTJw6Jp4fQvQ8E7CRFn4C/wF53lNllEazLDyLE
         ansRZ06fcvQr0nN8qrtzPK7T2/5GBfsLHn40/uLnO9+wrt5aVdPO7iYJGpCd5FCbyV95
         qTWKgdhbpKmam6tGlF/Ks8pkfhaQpwrqLe8IZtwe3QUZMlUEjL/whbL/oAJD9IZUulc+
         UIqw==
X-Gm-Message-State: APjAAAUaQQlsdVqyLOo+k0v0vpaSclnSdT3PcbT8E718Ivd5iE3cvYlU
        m5pK5wSbsBs29cDvr1Iatpc=
X-Google-Smtp-Source: APXvYqy8vwILNB4akBi0WDb3PQOnmeFNXiBzPCZWzHefMu+oYpB6aqtA5pK/D+KUGdNZE7OxpqP29Q==
X-Received: by 2002:a37:7f02:: with SMTP id a2mr29510616qkd.111.1574178379311;
        Tue, 19 Nov 2019 07:46:19 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id 50sm12949919qtv.88.2019.11.19.07.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 07:46:18 -0800 (PST)
From:   Sven Van Asbroeck <thesven73@gmail.com>
X-Google-Original-From: Sven Van Asbroeck <TheSven73@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v2 1/4] tps6105x: add optional devicetree support
Date:   Tue, 19 Nov 2019 10:46:08 -0500
Message-Id: <20191119154611.29625-2-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191119154611.29625-1-TheSven73@gmail.com>
References: <20191119154611.29625-1-TheSven73@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This driver currently requires platform data to specify the
operational mode and regulator init data (in case of regulator
mode).

Optionally specify the operational mode by looking at the name
of the devicetree child node.

Example: put chip in regulator mode:

i2c0 {
	tps61052@33 {
		compatible = "ti,tps61052";
		reg = <0x33>;

		regulator {
                            regulator-min-microvolt = <5000000>;
                            regulator-max-microvolt = <5000000>;
                            regulator-always-on;
		};
	};
};

Tree: linux-next
Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---
 drivers/mfd/tps6105x.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/tps6105x.c b/drivers/mfd/tps6105x.c
index 6ac3607a79c2..c906324d293e 100644
--- a/drivers/mfd/tps6105x.c
+++ b/drivers/mfd/tps6105x.c
@@ -91,6 +91,32 @@ static int tps6105x_add_device(struct tps6105x *tps6105x,
 			       PLATFORM_DEVID_AUTO, cell, 1, NULL, 0, NULL);
 }
 
+static struct tps6105x_platform_data *tps6105x_parse_dt(struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	struct tps6105x_platform_data *pdata;
+	struct device_node *child;
+
+	if (!np)
+		return ERR_PTR(-EINVAL);
+	if (of_get_available_child_count(np) > 1) {
+		dev_err(dev, "cannot support multiple operational modes");
+		return ERR_PTR(-EINVAL);
+	}
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return ERR_PTR(-ENOMEM);
+	pdata->mode = TPS6105X_MODE_SHUTDOWN;
+	for_each_available_child_of_node(np, child) {
+		if (child->name && !of_node_cmp(child->name, "regulator"))
+			pdata->mode = TPS6105X_MODE_VOLTAGE;
+		else if (child->name && !of_node_cmp(child->name, "led"))
+			pdata->mode = TPS6105X_MODE_TORCH;
+	}
+
+	return pdata;
+}
+
 static int tps6105x_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
@@ -99,9 +125,11 @@ static int tps6105x_probe(struct i2c_client *client,
 	int ret;
 
 	pdata = dev_get_platdata(&client->dev);
-	if (!pdata) {
-		dev_err(&client->dev, "missing platform data\n");
-		return -ENODEV;
+	if (!pdata)
+		pdata = tps6105x_parse_dt(&client->dev);
+	if (IS_ERR(pdata)) {
+		dev_err(&client->dev, "No platform data or DT found");
+		return PTR_ERR(pdata);
 	}
 
 	tps6105x = devm_kmalloc(&client->dev, sizeof(*tps6105x), GFP_KERNEL);
-- 
2.17.1


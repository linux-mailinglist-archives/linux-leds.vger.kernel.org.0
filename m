Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB1C01009C1
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2019 17:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbfKRQyM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Nov 2019 11:54:12 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:38342 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfKRQyL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Nov 2019 11:54:11 -0500
Received: by mail-qv1-f68.google.com with SMTP id q19so6820385qvs.5;
        Mon, 18 Nov 2019 08:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wf3DTsSlDTcQxeXP7BWArBCMudBOYs4WioyXcAQS7sE=;
        b=RLlAwlYDhzx/d6OKKkLRmeO3Jtlcc8B65q0/lWVHRRVoQLkQ0MXYsnTy5AsnUqQSHr
         PZ556LVCWZGOqtEA+qH7+sy1RzdEOyC/1mpCJps44iKHY3WoyG2AcfQjvlko/xtvQsIc
         nEJLQ2y7KmjGBurBOwtwA2mXsrwi9Swr9pGHWZvrlpK7QJzGXLzvwrVRNO9gjIWunv+o
         Fks0BLdvUNyQw0Z0cbk6L8zml+9qywDYYICL7swzjhQ7NUy9/f0RVxrrXtlxDIIm/fBT
         h5a3Hcn4XV4RkUOIhpgs6NSINBIQWMJLPegBWIJ3eCMovrUeZ/slOYwb0UGr7AED2ua2
         qy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wf3DTsSlDTcQxeXP7BWArBCMudBOYs4WioyXcAQS7sE=;
        b=HmK16qbCRaY0refwBFOCxzrDrqon7NEy/yjTqlnlTrsa7IMNT5KhMuxa/TQFNNRlr9
         nTxszYY8bv1VI6uz35n5RilEceQEAWgvnY5Q21H5E05sANnVn7krj472mqOTw2JK2JIa
         V1TWu9IpTW1BqjGx00tX7l7PnrCzKe5FmL5botSKYMx8LxQS01xVB/xfLSRi1rqrnIg7
         gFl+D4ZqwCK2VB8zOEyj7MLs36lEEUSy1JanW4c1Xxzal5CBfmm5ee+J7Cr+KmrDTU6N
         3EgGDX1qzCrf7CPqmFhUquclKl7K0tpmrAd1zf/3ILvKe6F5g2LsM5NUl2utgZ179t+M
         c8Dw==
X-Gm-Message-State: APjAAAUn87IZgpLnNuekgg//ZAcdtNciDytIDAd2ufzYGLhNNnnXaXhc
        8Dk5aJCuueihYBtS4ykye28=
X-Google-Smtp-Source: APXvYqyn1NSMDTjzTK87VIWey8nsvgExeWXpaBiJ8NvmMowPIq1B1v/EOeV0to4vGCpZligvcQ18qQ==
X-Received: by 2002:a0c:ae99:: with SMTP id j25mr7213547qvd.51.1574096050661;
        Mon, 18 Nov 2019 08:54:10 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id a3sm8634648qkf.76.2019.11.18.08.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 08:54:10 -0800 (PST)
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
Subject: [PATCH v1 1/4] tps6105x: add optional devicetree support
Date:   Mon, 18 Nov 2019 11:53:57 -0500
Message-Id: <20191118165400.21985-2-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118165400.21985-1-TheSven73@gmail.com>
References: <20191118165400.21985-1-TheSven73@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This driver currently requires platform data to specify the
operational mode and regulator init data (in case of regulator
mode).

Optionally specify the operational mode by looking at the
'compatible' property of the devicetree child node.

Example: put chip in regulator mode:

i2c0 {
	tps61052@33 {
		compatible = "ti,tps61052";
		reg = <0x33>;

		regulator {
			compatible = "ti,tps6105x-regulator";
		};
	};
};

Tree: next-20191118
Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---
 drivers/mfd/tps6105x.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/tps6105x.c b/drivers/mfd/tps6105x.c
index 6ac3607a79c2..401bd093b4ea 100644
--- a/drivers/mfd/tps6105x.c
+++ b/drivers/mfd/tps6105x.c
@@ -71,6 +71,7 @@ static struct mfd_cell tps6105x_gpio_cell = {
 
 static struct mfd_cell tps6105x_leds_cell = {
 	.name = "tps6105x-leds",
+	.of_compatible = "ti,tps6105x-leds",
 };
 
 static struct mfd_cell tps6105x_flash_cell = {
@@ -79,6 +80,7 @@ static struct mfd_cell tps6105x_flash_cell = {
 
 static struct mfd_cell tps6105x_regulator_cell = {
 	.name = "tps6105x-regulator",
+	.of_compatible = "ti,tps6105x-regulator",
 };
 
 static int tps6105x_add_device(struct tps6105x *tps6105x,
@@ -91,6 +93,32 @@ static int tps6105x_add_device(struct tps6105x *tps6105x,
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
+		if (of_device_is_compatible(child, "ti,tps6105x-regulator"))
+			pdata->mode = TPS6105X_MODE_VOLTAGE;
+		else if (of_device_is_compatible(child, "ti,tps6105x-leds"))
+			pdata->mode = TPS6105X_MODE_TORCH;
+	}
+
+	return pdata;
+}
+
 static int tps6105x_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
@@ -99,9 +127,11 @@ static int tps6105x_probe(struct i2c_client *client,
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


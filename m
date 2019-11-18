Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1F981009C5
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2019 17:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbfKRQyQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Nov 2019 11:54:16 -0500
Received: from mail-qv1-f67.google.com ([209.85.219.67]:36905 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbfKRQyN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Nov 2019 11:54:13 -0500
Received: by mail-qv1-f67.google.com with SMTP id s18so6840520qvr.4;
        Mon, 18 Nov 2019 08:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Bzl4ozQZbAWup0mtLmVDbc1Re1nPSSw6fmpMaMlXCPM=;
        b=EVemdcIpvjKz4v5TylJy/sya0B7xZUgakOgd4rWJvyY7zTaS8z4uRAcMZzpS09K5Wn
         KqFxHgs7IsvYu14WYkVKrGrz+JjsIWWEfikkUb9y9wnUfnaUifPS0WaJRSkKoyjwDe+D
         CRHWQ/cOvkIE+xAJzSkJP1CgpO2Js4ODGn13s4D3CCSrsKLWpoNmdHieMtdd/dszJAIk
         vIQnBVU0di0t5IGxAV3OKliQ9nqjnFV0beXeWUximdkh5NrEQFHTqTu2r8AN24+EoQ6b
         FO6M3gDVinguoTXzOhuCBlPrxvQfCtyO5SloxGYZefOC1pcBtFz4LD83BPdeDz6lGNPa
         eIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Bzl4ozQZbAWup0mtLmVDbc1Re1nPSSw6fmpMaMlXCPM=;
        b=KMboSy7+Gm4NM8gnYU4b/ICaCTM8O1ItP+cgm5FTurfZ6lSx5mtBwb0i/UhLHB+PEZ
         reiQCWzQ9d9JDB5tWvUrnpftHBm54av3phMGRBxE7OQ92OoLidrAvVmHYLvWyjMvm0Hr
         KwVJkRCzk5gKLSuhxJasXRLVbj6s8n7RZymosmhNzTlqpH5CEzJQCrQL7NqBJmlNRFY7
         /8hd7+Voo2fnCDh4zd5RsV8tVfNAX40H3tYOy8ZPF7cOsVTA3f90VY8NO6lIEpEIwFGT
         WJvHy1TOzTys7ILzx5A8UaC3Gt5t7X0PwLHA0fXTUNB6J8BslBbS4lEeU/Tb9C2Gy9ha
         O0wQ==
X-Gm-Message-State: APjAAAXLHmXpRLgLxdJCnKqBmk2UiqkFpp3VprjaYOGc8vdH2haWWNCI
        fTYrvo4fgDRDJv/RESVzqK8=
X-Google-Smtp-Source: APXvYqxfs9VcDHAluyh5fR3VU1omMORR75Mvu/hsXIqLXJke8sagJKEPkdpgdTjhcfbjtGhzUeijZQ==
X-Received: by 2002:ad4:55f3:: with SMTP id bu19mr25350053qvb.95.1574096052289;
        Mon, 18 Nov 2019 08:54:12 -0800 (PST)
Received: from localhost.localdomain ([72.53.229.209])
        by smtp.gmail.com with ESMTPSA id a3sm8634648qkf.76.2019.11.18.08.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 08:54:11 -0800 (PST)
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
Subject: [PATCH v1 2/4] regulator: tps6105x: add optional devicetree support
Date:   Mon, 18 Nov 2019 11:53:58 -0500
Message-Id: <20191118165400.21985-3-TheSven73@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118165400.21985-1-TheSven73@gmail.com>
References: <20191118165400.21985-1-TheSven73@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

If regulator init data is not specified in the parent mfd
device's platform data, attempt to retrieve it from the
devicetree node.

Example:

i2c0 {
	tps61052@33 {
		compatible = "ti,tps61052";
		reg = <0x33>;

		regulator {
			compatible = "ti,tps6105x-regulator";
			regulator-min-microvolt = <5000000>;
			regulator-max-microvolt = <5000000>;
			regulator-always-on;
		};
	};
};

Tree: next-20191118
Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
---
 drivers/regulator/tps6105x-regulator.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/tps6105x-regulator.c b/drivers/regulator/tps6105x-regulator.c
index 06059a94f7c6..9bc4e869fc4c 100644
--- a/drivers/regulator/tps6105x-regulator.c
+++ b/drivers/regulator/tps6105x-regulator.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/driver.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/tps6105x.h>
+#include <linux/regulator/of_regulator.h>
 
 static const unsigned int tps6105x_voltages[] = {
 	4500000,
@@ -58,6 +59,7 @@ static int tps6105x_regulator_probe(struct platform_device *pdev)
 {
 	struct tps6105x *tps6105x = dev_get_platdata(&pdev->dev);
 	struct tps6105x_platform_data *pdata = tps6105x->pdata;
+	struct regulator_init_data *init_data = pdata->regulator_data;
 	struct regulator_config config = { };
 	int ret;
 
@@ -68,8 +70,14 @@ static int tps6105x_regulator_probe(struct platform_device *pdev)
 		return 0;
 	}
 
+	if (!init_data)
+		init_data = of_get_regulator_init_data(
+					&pdev->dev, pdev->dev.of_node,
+					&tps6105x_regulator_desc);
+	if (!init_data)
+		return -EINVAL;
 	config.dev = &tps6105x->client->dev;
-	config.init_data = pdata->regulator_data;
+	config.init_data = init_data;
 	config.driver_data = tps6105x;
 	config.regmap = tps6105x->regmap;
 
-- 
2.17.1


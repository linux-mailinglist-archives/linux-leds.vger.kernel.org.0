Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDBCD62A9
	for <lists+linux-leds@lfdr.de>; Mon, 14 Oct 2019 14:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730762AbfJNMgQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Oct 2019 08:36:16 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36417 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730734AbfJNMgP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Oct 2019 08:36:15 -0400
Received: by mail-wm1-f68.google.com with SMTP id m18so16600759wmc.1
        for <linux-leds@vger.kernel.org>; Mon, 14 Oct 2019 05:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=balena-io.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=eDkeFppLvtXNEBjxaPNFQTWHXCS+7nQeKuiOCaxy1ec=;
        b=ssYxovwKsDIeP3c/RVqTFZhBkQghIWyPnvYGzk8rrwA4Bw65MJw/MAnSKB2TBaSNwU
         e04KZH9QLlk8UObqTowakJlXm8ITG2qQQnOTsPO18Ydi7tGBA7NkaPtP3OINClJXyd1R
         SuXKtTnLlpZqFyA7dvSi4U0MB9QdNSuUFIMa+Vn2w/81gHA+d33XT4t1x7ywS3GIHSKC
         RBekuSS+oJh6ZVAt593TBlWFE16STTYaaiZuKXQZPlXFmXQyPfTQ8PGGeUeoU7jAUs2X
         WT4PS66Gq/MPj/pfUBlLKMWMUcDR53/rVwF2rwzunhVGkdfCBBEou2UAdfh+TL0VWcMl
         ejrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=eDkeFppLvtXNEBjxaPNFQTWHXCS+7nQeKuiOCaxy1ec=;
        b=AE6HvKcsz3xVR4+IXiYJnDY+dE6Mkjwvl7h+hCsLYnvbV4FRywvR8x2fMaWMqa2++k
         KaboY4WmgVs/8nZhHRf35Rci/yx38z+5XdHgou0v6J7HnagTjyfnVLoNPM4zrC0gs8+F
         GrFjzwNxgb2674h+a+bbjhwOZvYwd11rucpye4S0KpmFgKRGq4gsg9xcLxv7D73+geUc
         IXRHGgx583X+5IVlG6GqSuwfy0ZyqDPzItbMt5psnM/D4jU7RzSj6DmgWS1Yv1c6mBzy
         gxaJQ+MPMDKlXVhLvSU8TcXmuTdhNQAy8unv495Z1qnX/dOAOC50BkWNrf1mD0UAKedC
         G8Jw==
X-Gm-Message-State: APjAAAVKQSePt0n/W1Ndkzjy4zpRUw5HR+zrBtp+J021RWsaIIt5AoqH
        m2gaXQJIfcK5swD32tgeK/iRnJEsCb3LBQ==
X-Google-Smtp-Source: APXvYqzhOsQrSP4FG7KJxxr+rJFiQ1Q8HlxkEau04jAoaFRBC6Wi8ub13Bh3YPcG7F8SOaH4M/OD0g==
X-Received: by 2002:a05:600c:3cb:: with SMTP id z11mr999551wmd.138.1571056572564;
        Mon, 14 Oct 2019 05:36:12 -0700 (PDT)
Received: from majorz.localdomain ([85.130.115.21])
        by smtp.gmail.com with ESMTPSA id q22sm15906265wmj.5.2019.10.14.05.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 05:36:12 -0700 (PDT)
Date:   Mon, 14 Oct 2019 15:36:04 +0300
From:   Zahari Petkov <zahari@balena.io>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zahari Petkov <zahari@balena.io>
Subject: [PATCH] leds: pca963x: Fix open-drain initialization
Message-ID: <20191014123604.GA743117@majorz.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

OUTDRV setting (bit 2) of Mode register 2 has a default value of 1.
During initialization when open-drain is used, instead of setting
OUTDRV to 0, the driver keeps it as 1. OUTDRV setting is now correctly
initialized to 0 when open-drain is used.

Additionally the BIT macro is used for improved readibility.

Fixes: bb29b9cccd95 ("leds: pca963x: Add bindings to invert polarity")
Signed-off-by: Zahari Petkov <zahari@balena.io>
---
 drivers/leds/leds-pca963x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 4afc317901a8..e3da2156b385 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -438,12 +438,12 @@ static int pca963x_probe(struct i2c_client *client,
 						    PCA963X_MODE2);
 		/* Configure output: open-drain or totem pole (push-pull) */
 		if (pdata->outdrv == PCA963X_OPEN_DRAIN)
-			mode2 |= 0x01;
+			mode2 &= ~BIT(2);
 		else
-			mode2 |= 0x05;
+			mode2 |= BIT(2);
 		/* Configure direction: normal or inverted */
 		if (pdata->dir == PCA963X_INVERTED)
-			mode2 |= 0x10;
+			mode2 |= BIT(4);
 		i2c_smbus_write_byte_data(pca963x->chip->client, PCA963X_MODE2,
 					  mode2);
 	}
-- 
2.23.0


Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D687C19A8E8
	for <lists+linux-leds@lfdr.de>; Wed,  1 Apr 2020 11:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbgDAJvy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 Apr 2020 05:51:54 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40981 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgDAJvy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 Apr 2020 05:51:54 -0400
Received: by mail-wr1-f65.google.com with SMTP id h9so29737142wrc.8;
        Wed, 01 Apr 2020 02:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZCD5e/zJXmKAX2xCPUbGFpEcZHshYsLsh9gx/j5UW0I=;
        b=bi80T+giF68sM8ftFWK9bZPS+hpjXMmcYzSpq1NJje2+6fFydWLm51hR3sCeLTwMBl
         iQuvSilcSJTLG+lxHWSyZPu8UDAma/VLD6BlQAM9PWvHQUpFOiqCkbikf3FAhdxfUkbi
         kU5NVIKN/ujxtNU/cN8sGuYh4fASqGaAOCDioUVIo4xth3V5AkGdpGdBnIKc9PPl+dq1
         58ZJK6HQM1Mkurm6xRGDdGaGpMtRkmImZ6LKTGs6AruxtuzivcvaUrjeC3Stq+OGjKTv
         hFSjBH33xEk2pEkAnNl6whAmroKh6ZGrVjhFAGwdpVbC5btZL++pHHqLMN8CAEy8iCnJ
         mndg==
X-Gm-Message-State: ANhLgQ0aZc+4Py+5HwoYOrbbFiez6clMPblPPpdjDZXVMz2/2xP8XYA6
        6kj0iw5P207lh7r5ovqRtuA=
X-Google-Smtp-Source: ADFU+vvyLTq9Vwo1E/Y7vOiZ5MDDMqJghjVelLsqU/ox9sZhwAGPZinVWHQpB0MOJ//7Bng3s1r0qw==
X-Received: by 2002:a5d:630e:: with SMTP id i14mr25120880wru.260.1585734711210;
        Wed, 01 Apr 2020 02:51:51 -0700 (PDT)
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id d7sm2154635wrr.77.2020.04.01.02.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 02:51:50 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH] leds: core: Fix warning message when init_data
Date:   Wed,  1 Apr 2020 11:51:47 +0200
Message-Id: <20200401095147.444353-1-ribalda@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The warning message when a led is renamed due to name collition can fail
to show proper original name if init_data is used. Eg:

[    9.073996] leds-gpio a0040000.leds_0: Led (null) renamed to red_led_1 due to name collision

Fixes: bb4e9af0348d ("leds: core: Add support for composing LED class device names")
Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 drivers/leds/led-class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 1fc40e8af75e..3363a6551a70 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -376,7 +376,7 @@ int led_classdev_register_ext(struct device *parent,
 
 	if (ret)
 		dev_warn(parent, "Led %s renamed to %s due to name collision",
-				led_cdev->name, dev_name(led_cdev->dev));
+				proposed_name, dev_name(led_cdev->dev));
 
 	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
 		ret = led_add_brightness_hw_changed(led_cdev);
-- 
2.25.1


Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2EE61281
	for <lists+linux-leds@lfdr.de>; Sat,  6 Jul 2019 19:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbfGFR7V (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 6 Jul 2019 13:59:21 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42474 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbfGFR7V (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 6 Jul 2019 13:59:21 -0400
Received: by mail-pl1-f193.google.com with SMTP id ay6so6074680plb.9;
        Sat, 06 Jul 2019 10:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JFIRLjxFpbq29Bt/7lF1zXV+hZag6ARLVLfe11BEZgA=;
        b=Cyq87AEqOrA37eqMi5Y+AQeL9QM8qLJ5EqA0lIWIVz3qH0ol5IXi6Vo5CvAedF1rK8
         AfzOjVby0zBQYSb3EvjfgxNp6w/JKXKCvXBxZnihnxE2FyRVxjXbd/2+m8uPow+T/84i
         AK80rHfguUI6bKACIw+RzLykgFjZjLQj3pRh2LOg3EgDalLVlpvo1rghc/bIvSMgfRu3
         BJK4jTwNyEB8AQXuZRkBG+MSCxrBQ98rR01nHUk/7yA7UkO/zM49HwNIIT1XEhC7t+6D
         wMF964qbpGaemOIO4ZWX3NvgQBx1pNA1lzXepwWzAlp1aQVpI7UbyKsh3rID/nU7Ip0/
         zgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JFIRLjxFpbq29Bt/7lF1zXV+hZag6ARLVLfe11BEZgA=;
        b=jDJJuynlI/s6bXs5F+/0jpNR3CrWNOqA/2xhqnUXGp2XrhU6pvaXogWu68eMDNzd2g
         hXBggu2h2xTgyRvJ/KRUQHDotT9wPwGNM9X8tSY0jpBJIeCvjv2RmdfXBpWypAS5TXkO
         DWQ3/bdLNJUnpS22RxJZlGp1fOV7/o/AyXgVBs9ixfaUAKGDjtLTnszWM2yb1KvSV1+o
         ax5Tcmkh6+VIkeXH/3TndxXCL99D2o0uWIG0tIWiucCJKY04dvJ5WsaMPIyO0ASmbdzb
         lFi++CaFRM7bpyoJ67RFR6z9S6mp6jfFZAIr7o5vS8gT2x+bOTl4mFhQw2Y1t9AOo2Ik
         R1fQ==
X-Gm-Message-State: APjAAAVPc3ugz9GFgl5/AqwBRqlhh0Wbf0dpS/alZv/KYFxopNLnS3HC
        +sy+H164nJxUqBQNX7Q2Sgg8UyJD
X-Google-Smtp-Source: APXvYqxFU353UaSEQZgQ3A0F+jfvvCebDV1WEg1co0jQrT+tmY9Fj9m79YsvZdwoOMf/93rxOH3uZQ==
X-Received: by 2002:a17:902:7c96:: with SMTP id y22mr12818522pll.39.1562435960895;
        Sat, 06 Jul 2019 10:59:20 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:368e:e048:68f1:84e7])
        by smtp.gmail.com with ESMTPSA id h6sm11967528pfn.79.2019.07.06.10.59.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 06 Jul 2019 10:59:20 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-nvme@lists.infradead.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 1/2] leds: move declaration of led_stop_software_blink() to linux/leds.h
Date:   Sun,  7 Jul 2019 02:58:58 +0900
Message-Id: <1562435939-15466-2-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562435939-15466-1-git-send-email-akinobu.mita@gmail.com>
References: <1562435939-15466-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

In preparation for adding LED block device activity trigger, expose
led_stop_software_blink() to outside the leds subsystem.

Cc: Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/leds/leds.h  | 1 -
 include/linux/leds.h | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 47b2294..64fe774 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -18,7 +18,6 @@ static inline int led_get_brightness(struct led_classdev *led_cdev)
 }
 
 void led_init_core(struct led_classdev *led_cdev);
-void led_stop_software_blink(struct led_classdev *led_cdev);
 void led_set_brightness_nopm(struct led_classdev *led_cdev,
 				enum led_brightness value);
 void led_set_brightness_nosleep(struct led_classdev *led_cdev,
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 9b2bf57..6aeda4f 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -189,6 +189,8 @@ extern void led_blink_set_oneshot(struct led_classdev *led_cdev,
 extern void led_set_brightness(struct led_classdev *led_cdev,
 			       enum led_brightness brightness);
 
+extern void led_stop_software_blink(struct led_classdev *led_cdev);
+
 /**
  * led_set_brightness_sync - set LED brightness synchronously
  * @led_cdev: the LED to set
-- 
2.7.4


Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96C7994F39
	for <lists+linux-leds@lfdr.de>; Mon, 19 Aug 2019 22:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728168AbfHSUlx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Aug 2019 16:41:53 -0400
Received: from mail-yb1-f195.google.com ([209.85.219.195]:34061 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727980AbfHSUlx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Aug 2019 16:41:53 -0400
Received: by mail-yb1-f195.google.com with SMTP id u68so989427ybg.1;
        Mon, 19 Aug 2019 13:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4BU95eBhs+HC0NJGFEbV9d3PrjnFpSecih7BAA/6rmo=;
        b=NAAQ9aw8lVE2/KTGJcQnCSvdY1ACz6cza6cz7eeO4L4hgqm/rr0oIJly7wQuCOe3al
         LXYkHEiLHJ60tbfTOQ4DcEPkckNtD+crDyLJu8crky/OigSKN/Oku7ynqdFnKkaihyOU
         5/jGjK2LwjFYNz1JD1huttG8qWFDL2qHNzyzoEX8k5z5eOs3+5U2d4aqzJunqu2uvIz0
         sUv6WLqIY+c9rObidu4oopiOn4bK0paK19VHDYK4nZL241g++ZiZbY1FqXdFloU3N8WX
         9HNxfwxQtp16IAEZJacjeeFGueUv6cRVcYh2+7UjaQE6sZV1N/13SL2uzz0EcJ5ZmH9k
         6K/Q==
X-Gm-Message-State: APjAAAUrhYZLHKwZ3Bdzc/hpu+1F692WM/inRPyFIYQ7UHYShvsMG7cr
        0DFue2GUQloTXaNSSlacs9A+QDozu48mQg==
X-Google-Smtp-Source: APXvYqwhriDR6UDs4l8UHBZUFS/QS2Uv2NpTWBgQc5wtLxv2tjKCYe8rfXh3T3gRXVG4Te6dNt/Pkw==
X-Received: by 2002:a25:4d1:: with SMTP id 200mr17116222ybe.400.1566247312853;
        Mon, 19 Aug 2019 13:41:52 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com. [24.158.240.219])
        by smtp.gmail.com with ESMTPSA id i201sm3282165ywg.49.2019.08.19.13.41.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 19 Aug 2019 13:41:52 -0700 (PDT)
From:   Wenwen Wang <wenwen@cs.uga.edu>
To:     Wenwen Wang <wenwen@cs.uga.edu>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org (open list:LED SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] led: triggers: Fix a memory leak bug
Date:   Mon, 19 Aug 2019 15:41:42 -0500
Message-Id: <1566247302-6217-1-git-send-email-wenwen@cs.uga.edu>
X-Mailer: git-send-email 2.7.4
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

In led_trigger_set(), 'event' is allocated in kasprintf(). However, it is
not deallocated in the following execution if the label 'err_activate' or
'err_add_groups' is entered, leading to memory leaks. To fix this issue,
free 'event' before returning the error.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
---
 drivers/leds/led-triggers.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 8d11a5e..eff1bda 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -173,6 +173,7 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 	list_del(&led_cdev->trig_list);
 	write_unlock_irqrestore(&led_cdev->trigger->leddev_list_lock, flags);
 	led_set_brightness(led_cdev, LED_OFF);
+	kfree(event);
 
 	return ret;
 }
-- 
2.7.4


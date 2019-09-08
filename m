Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74F91ACCC5
	for <lists+linux-leds@lfdr.de>; Sun,  8 Sep 2019 14:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729216AbfIHMlg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Sep 2019 08:41:36 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:32996 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728770AbfIHMlg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Sep 2019 08:41:36 -0400
Received: by mail-pl1-f194.google.com with SMTP id t11so5323969plo.0;
        Sun, 08 Sep 2019 05:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4yRstM0BKqcmQv1sIxq4+KPJ9q125Rzd81dDJA+zGDY=;
        b=Vmkb1nXFcHPZ7BVUoqIYoP6ohfnMlI6dvDpFB2oyl0sPZ112x9Ekg38RlHu1aEVDDo
         5aRCmR3r5sdCMbHuztaS0lydYuHr1oPUsZUPQlExYWTZzb+YCfnTz+aHjUQ3TgmZz4kU
         mNAhplt7xFH+X+3fq4CJVlABycEmCvrbJbbY5Vak9/gsMIXdVVNh+yrGFk5FsuBnbJTD
         +MUplGonpS+icecvPYH+nU0qLsaIOCphQ71k+SysVLrxwv6CLX1MSoihdoBn5UfSgRgm
         9iOH0N4QFZ1bI4ITgfeM01Xpvz8ZcMO8qm5gVmy5C/CflZhkO+D6/fFy7jlVFOBLuyz/
         0xLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4yRstM0BKqcmQv1sIxq4+KPJ9q125Rzd81dDJA+zGDY=;
        b=SItYbL8AYa0N50lJLjk9rugY/CKaRmapRfheKMRWKcsCPCQE0U0Z992f0nRs67UpOx
         oeF1ciG1c7NqY/wu4Vx3SIgs3+pzpAin7cbL57eMOF3mFkOcJcd+JrFvAw3Up6PZg1ve
         5XKSaUx+r00Ep3dbnf4CrSJPUIbJ/8EFAo3Xf/yELNMITMlhM2HdExDrbXLRD/c+eKW5
         yqsfUcmb6kHNktbsewNTSxsa09kdCBvLWt6FUNweh7oVKRH/frIPBvjgZXNfApoPhGqo
         pkDb1kiwHlAIcLWN00LNopL4T3le2jrklJ+jYdNiv54OYiA54WRYYpyxzGEsWZc63F+y
         QJXQ==
X-Gm-Message-State: APjAAAUPArcpIv0ybNPlacx4/OeEaa46E39G2ep81F2taDQ7u9BwJNT4
        5y8a3g+25q8hu/EcKzLRHLno+cnZ
X-Google-Smtp-Source: APXvYqwNxvhrJUhCzbbOUoemjdexeO5x9uEkYMXLjrkL40UB8V//xBVCeD/KwF7Z/7NjXP7YCh8xww==
X-Received: by 2002:a17:902:7246:: with SMTP id c6mr19204338pll.190.1567946495224;
        Sun, 08 Sep 2019 05:41:35 -0700 (PDT)
Received: from localhost.localdomain ([240f:34:212d:1:cae:1d92:a912:df67])
        by smtp.gmail.com with ESMTPSA id s7sm10879582pjn.8.2019.09.08.05.41.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 08 Sep 2019 05:41:34 -0700 (PDT)
From:   Akinobu Mita <akinobu.mita@gmail.com>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Akinobu Mita <akinobu.mita@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/5] leds: make sure leds_class is initialized before triggers are registered
Date:   Sun,  8 Sep 2019 21:41:09 +0900
Message-Id: <1567946472-10075-3-git-send-email-akinobu.mita@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567946472-10075-1-git-send-email-akinobu.mita@gmail.com>
References: <1567946472-10075-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

If the led-class and usb-common modules are built into the kernel, the
usb-common module could be initialized earlier than the led-class module.

So when the ledtrig_usb_gadget and ledtrig_usb_host LED triggers are
registered by usb-common module, the leds_class could not be initialized
yet.

We are going to populate sub-directories, each representing an LED
trigger in /sys/class/triggers/, so leds_class needs to be initialized
before any LED triggers is registered.

This makes led-class initialize earlier then usb-common by changing
initcall group.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
---
 drivers/leds/led-class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 8b5a1d1..7d85181 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -424,7 +424,7 @@ static void __exit leds_exit(void)
 	class_destroy(leds_class);
 }
 
-subsys_initcall(leds_init);
+postcore_initcall(leds_init);
 module_exit(leds_exit);
 
 MODULE_AUTHOR("John Lenz, Richard Purdie");
-- 
2.7.4


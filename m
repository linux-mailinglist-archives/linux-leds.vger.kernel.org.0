Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3E413CAE71
	for <lists+linux-leds@lfdr.de>; Thu, 15 Jul 2021 23:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhGOVWe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 15 Jul 2021 17:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbhGOVWb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Jul 2021 17:22:31 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2013CC061765
        for <linux-leds@vger.kernel.org>; Thu, 15 Jul 2021 14:19:37 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id g4-20020a17090ace84b029017554809f35so7318252pju.5
        for <linux-leds@vger.kernel.org>; Thu, 15 Jul 2021 14:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=student-cerritos-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D/oa7ytReZ7VT9msXCUi1s8afmQOHTlsDnMU7xTspFQ=;
        b=Tsc/3qGxyPXDJVwIcY/MFuc39MZRQ/yL+cifcIxUQrbCutxd+aTIDmDk2yaDApKoyL
         uG0OaT9FXAU67sWQquKMwkhlQRH2dpxys9XoiI18skcwR7o23bLHgmpEw56AYjfGs8uY
         UMIY0JqEqfO45Rug5xo7hZ+gR55/3ii1c2CFmstjwJ8kAyXbD7WYDD2MbpxsMDwkMdzc
         hHJ0rvcZQnpmBrAX9sRjp0Q8tUaOpkhf+1fuibu5uQEqV3nq3q5O2OJr7PBR0DK+fD1P
         KwHzT1Gcw9aiYqzb4JP29Iw9O69ONR/s61kAI8krSAeMyALq1844rPI+YmY0xgIgAJGv
         k3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D/oa7ytReZ7VT9msXCUi1s8afmQOHTlsDnMU7xTspFQ=;
        b=q040Tfl2JGhoHU0JK0aDJZlcPXwYTAM+bfAgTzCvobitYwaZ+aa4zMAQKbuzPk9zO/
         x2zLOJfyEZP0Jn1BGvdndHVCSElQOpVB4vGbcar9IDEJnotISjlQBGAmHqV/eqPSix91
         dxiVN3xQ9SVdOzfD6Da5C6HN9KaBONA1JZFciwddPqricXIs8mtDNywVEWga+V9qkmc6
         9gZ7RdEcnF9l2fds/6YdWvAUtM8rd4kIeU+U6UEwNqWzqAXUMmzor5WGFBHOefeC92sN
         C2iSzX8c96gG4dl9T2fsjefTGGQUJM262ZUvsl++UyB4ALxczF/8sdArPbJtOTLvERDe
         eLWg==
X-Gm-Message-State: AOAM531Z6z/dtmQ8UJCBCGTw0PHOv/GC1HcT5yFNcn92PWYFKS3qv5Fb
        gMv7RR/i5xOGJMWOfnyKJoQ4Nw==
X-Google-Smtp-Source: ABdhPJyXwrDuL9owj0pgU9mb9Di2Om1AdVvARUdtT5LpybVG35EeznfPk8MEu3RZO7cci27Kc5jayA==
X-Received: by 2002:a17:90a:590d:: with SMTP id k13mr6308052pji.56.1626383976720;
        Thu, 15 Jul 2021 14:19:36 -0700 (PDT)
Received: from fedora.. (066-215-081-126.biz.spectrum.com. [66.215.81.126])
        by smtp.gmail.com with ESMTPSA id gb10sm9811371pjb.43.2021.07.15.14.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 14:19:36 -0700 (PDT)
From:   Amy Parker <apark0006@student.cerritos.edu>
To:     pavel@ucw.cz
Cc:     Amy Parker <apark0006@student.cerritos.edu>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drivers/leds/TODO: update TODO to reflect changes
Date:   Thu, 15 Jul 2021 14:18:57 -0700
Message-Id: <fd4841b1fa09bfefb707563d85a2388d41c3b424.1626383424.git.apark0006@student.cerritos.edu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626383424.git.apark0006@student.cerritos.edu>
References: <cover.1626383424.git.apark0006@student.cerritos.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The previous commit in this chain (swap led_brightness from enum to
typedef) fixed the removed issue in this TODO. This patch updates
the TODO to indicate this.

Signed-off-by: Amy Parker <apark0006@student.cerritos.edu>
---
 drivers/leds/TODO | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/leds/TODO b/drivers/leds/TODO
index e1d771513b98..7b97bb733392 100644
--- a/drivers/leds/TODO
+++ b/drivers/leds/TODO
@@ -1,10 +1,6 @@
 -*- org -*-
 
 * On/off LEDs should have max_brightness of 1
-* Get rid of led_brightness
-
-It is really an integer, as maximum is configurable. Get rid of it, or
-make it into typedef or something.
 
 * Review atomicity requirements in LED subsystem
 
-- 
2.31.1


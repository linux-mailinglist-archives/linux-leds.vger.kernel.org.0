Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 077023CB1A9
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jul 2021 06:44:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232617AbhGPErB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Jul 2021 00:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbhGPErA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Jul 2021 00:47:00 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA77C061760
        for <linux-leds@vger.kernel.org>; Thu, 15 Jul 2021 21:44:05 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id y3so320089plp.4
        for <linux-leds@vger.kernel.org>; Thu, 15 Jul 2021 21:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=student-cerritos-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rvc+otqutfe9C4JM7KCaWpHHSFeG08UexFPe6shvLKo=;
        b=cRoQNjgBbMt0oAMvfK6kpgm4x5e+rMoipDAjfIVxdUVh1141X8iDJ4HDk5gM9Hzfr4
         7gVaBt/FjuzpUtY+qhLSdnGW1TYJMUl/MLtBMTB4DU6R547+vqVRzsXZ6LuSWR1rV8s9
         bOGU1jZiw2r0RIQnqZEVIZCi0l6K3Sjta/osLLLyf5y79IC93XNTUQA3S1Bva7gMzFv2
         0t8eRgNaOcWpnkl9a8bt7VfovsE9zYz61IMPDZzEYIjDDWyy8mi4erLW0r/pojcXDS/6
         4CwomX9WkKyd4H/Iy4jN49dzM24TWhA4llzd7gm/PYOIaH6XMMOd9eKJN8G0G/P/kMOO
         37gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rvc+otqutfe9C4JM7KCaWpHHSFeG08UexFPe6shvLKo=;
        b=OLEbMyopNhq88h0oqQJDaEluKnEcvDJN4v2TwjDG6HHezHKph3Diq3WVo630OQfdPN
         xsm75v/suQ+8LAnGi1Ag/R8aTjZrhHnNuByFKn5wTtDmVBFGZxoPq4B+d4BGxdSGfn8D
         FiMkVZ45TxyjsfNvc9lkukCumP9jsnF93VxnzwKyTA+46oFZQm/XlHIMEdcOxXZYGYmp
         82TPQe9eejv0JEV4exR0zpcFvQKfkKrAldhQNNoZm90nykrP49XGadz5XnZ8tXLIsox7
         MVirecdOHigd1dCaj4WNuHUvlu/R+7JiIoPxhzCj2ovDM5Ofh5YmbM1+fAb7u7Zjdz6n
         aW6w==
X-Gm-Message-State: AOAM5319GX/XkQZ7alMkW0JtyGr/Ao5vBr/LK4KQhK2NJoqgUHE+HW3i
        /637vRkLDAtFtpe6ygrJu+/yGA==
X-Google-Smtp-Source: ABdhPJwesiDkXjrxMN7Q28Tb2WSDFRyaqlUWcyAAuVhT9hTzWICQg7ye/YsmDRhd55aX7Iwm5eH1MA==
X-Received: by 2002:a17:902:bd82:b029:129:2e87:9946 with SMTP id q2-20020a170902bd82b02901292e879946mr6217787pls.53.1626410645219;
        Thu, 15 Jul 2021 21:44:05 -0700 (PDT)
Received: from localhost.localdomain ([47.145.96.82])
        by smtp.gmail.com with ESMTPSA id h9sm484583pjk.56.2021.07.15.21.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 21:44:04 -0700 (PDT)
From:   Amy Parker <apark0006@student.cerritos.edu>
To:     pavel@ucw.cz
Cc:     Amy Parker <apark0006@student.cerritos.edu>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] v4l2-flash-led-class.h: use typedef over enum
Date:   Thu, 15 Jul 2021 21:43:24 -0700
Message-Id: <20210716044324.523057-1-apark0006@student.cerritos.edu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Depends on: https://marc.info/?l=linux-kernel&m=162638395216296

When the above mentioned patch set was generated, it accidentally
changed another reference point of led_brightness in
include/media/v4l2-flash-led-class. This patch corrects this,
convering the enum to a u8.

Signed-off-by: Amy Parker <apark0006@student.cerritos.edu>
---
 include/media/v4l2-flash-led-class.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/v4l2-flash-led-class.h b/include/media/v4l2-flash-led-class.h
index 1705064b278a..d6e589851979 100644
--- a/include/media/v4l2-flash-led-class.h
+++ b/include/media/v4l2-flash-led-class.h
@@ -15,7 +15,7 @@
 struct led_classdev_flash;
 struct led_classdev;
 struct v4l2_flash;
-led_brightness;
+typedef u8 led_brightness;
 
 /**
  * struct v4l2_flash_ctrl_data - flash control initialization data, filled
-- 
2.31.1


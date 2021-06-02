Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57ADB3980F5
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jun 2021 08:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhFBGP3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Jun 2021 02:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbhFBGP1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Jun 2021 02:15:27 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131DDC06175F
        for <linux-leds@vger.kernel.org>; Tue,  1 Jun 2021 23:13:45 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id i5so1421435pgm.0
        for <linux-leds@vger.kernel.org>; Tue, 01 Jun 2021 23:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=om6hGnxFZYIN13oVDVK0VoiEWHmJSjCWHqU0Q/iLkTk=;
        b=nQxYNoQ4fzOE6uS6APqrtL1xI3WG5hrKy9H2fh9dlQZ/IucN8Uv7FvgIoL5FXgM6Fc
         n7IarmD4yfmZXpjDA2VCtHmdFtCcdlFUXLsBLSpBRPLtO1Y3bUwGYZzXrvusJQg0upLi
         ETLNaw6V3LTTugXSKDOadpO6vTTX7du6rEuCcsuUG/bHYUrUtcWZvvakhto4JllaodKk
         sbgiftlUBUi9IYNMTpsRkUTnUIaZ8uUTWrUu+LUMbvzqVee/8puuaBt4Y8lONoqdGjlZ
         3hB1ZvIgltS6afit20B7mnG3jxByKSqT9JIIP3OgcLxwUFLuKxZiG9vaN8n7scjEGGOE
         D4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=om6hGnxFZYIN13oVDVK0VoiEWHmJSjCWHqU0Q/iLkTk=;
        b=hco4whNSC+w4XZegp9L16YExMLvKGcHbX/JBOootpfOaVCf5hbZLEM/GyBGt7PIIAq
         8rZu/72TBFXuZQjrWNnTd9/ZKe3avN544G5GmPHrovy//di87bDXDmXF+ZLDVauH1sM2
         tvZSFxYH8Y11mfV26lRfvZ+KllmKRr6mwM9Lxbck/NSa99nTE1H1RRkjlJ64PibgOsU/
         +Ir0E6u5uuP0CiNw04ZiSa1Gmi1yIrSPyWQG8/AV425aIGSEfIIB0JI3701zP3fzZs7V
         Nn5/lCAxf/CPNqvElwHCit1qadXYCHA46Cl+FjT0cQRgSstiH7Vhfqv2TJvcpTReoSdR
         IW0Q==
X-Gm-Message-State: AOAM5310D1C/WqkqTdWcqn9Y+ItW3Eedgg4Pf1XubVNl87fyS4fJp8VX
        /aRkiuAM1H1iaHfqf0JSj19BWg==
X-Google-Smtp-Source: ABdhPJyvCIsHb074gGAngMXmaUvOs0t/La5+Z5Cfj/LSaZ5FvZ3UTJkrBZ4BmEhVoLpIxE/0VF1gBQ==
X-Received: by 2002:a62:198f:0:b029:2da:c68b:7a1b with SMTP id 137-20020a62198f0000b02902dac68b7a1bmr25850438pfz.62.1622614424655;
        Tue, 01 Jun 2021 23:13:44 -0700 (PDT)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id k20sm16535374pgl.72.2021.06.01.23.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 23:13:44 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs for game controllers.
Date:   Tue,  1 Jun 2021 23:12:52 -0700
Message-Id: <20210602061253.5747-3-roderick@gaikai.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602061253.5747-1-roderick@gaikai.com>
References: <20210602061253.5747-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Player LEDs are commonly found on game controllers from Nintendo and Sony
to indicate a player ID across a number of LEDs. For example, "Player 2"
might be indicated as "-x--" on a device with 4 LEDs where "x" means on.

This patch introduces a new LED_FUNCTION_PLAYER to properly indicate
player LEDs from the kernel. Until now there was no good standard, which
resulted in inconsistent behavior across xpad, hid-sony, hid-wiimote and
other drivers. Moving forward new drivers should use LED_FUNCTION_PLAYER.

Note: management of Player IDs is left to user space, though a kernel
driver may pick a default value.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 include/dt-bindings/leds/common.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 52b619d44ba2..94999c250e4d 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -60,6 +60,9 @@
 #define LED_FUNCTION_MICMUTE "micmute"
 #define LED_FUNCTION_MUTE "mute"
 
+/* Used for player LEDs as found on game controllers from e.g. Nintendo, Sony. */
+#define LED_FUNCTION_PLAYER "player"
+
 /* Miscelleaus functions. Use functions above if you can. */
 #define LED_FUNCTION_ACTIVITY "activity"
 #define LED_FUNCTION_ALARM "alarm"
-- 
2.31.1


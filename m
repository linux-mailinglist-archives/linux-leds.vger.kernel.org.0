Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB69E3FE580
	for <lists+linux-leds@lfdr.de>; Thu,  2 Sep 2021 00:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240725AbhIAWbp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 Sep 2021 18:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbhIAWbp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 Sep 2021 18:31:45 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3C70C061575
        for <linux-leds@vger.kernel.org>; Wed,  1 Sep 2021 15:30:47 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id r13so70903pff.7
        for <linux-leds@vger.kernel.org>; Wed, 01 Sep 2021 15:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QDMtbfOpT0+6YkOaTTHwkcuHgPn2OmfwGowoYSF3iN4=;
        b=MLHX34NKiTRkg9A7QRXI4GRcDtH4bZs/CzSNKS7RacDaWvVURjaGUnL7RDQ32IHXq/
         Dd2UL9A99ur5ymuxjCogBiMPny9QgFB6mN5+bRzxF5UBDSU3hHJdK+fiY0JHiXWHloX2
         eVog9NBPchOvdLmAxodV81qpZrnlzZouPNXUPuANYKo0xL30DdjLUGXPfgYXzJPR9vDX
         2cw0f+IoNVUfU/oW5fEY1XxMQnIiKGPQyBt63Togg7mhE1l1uSzXRRrympF53SXgkzPw
         JNmDnjLoBdunlxs9paSVeP3o+P9mxFT3hgl8R8w3HjiN3K4KhPHSxDoS+z7cn7VsWmnq
         5z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QDMtbfOpT0+6YkOaTTHwkcuHgPn2OmfwGowoYSF3iN4=;
        b=mCZVxHrrM3PLKEJ0xmrT2cNO62A08e1M3/RSyXLPDFHQoRS89vMi9MK6hEgXYsDIAC
         g58Jz2g0y6S20zVrBOCfpFW6jEZfP1nSy0W56rGrcDlPQTRoLQprZzRW2g8e4QeCHZpD
         jrAXabMDnSLDVBaNk4S5BaoH1WUt1Vt7XqWZGZbcm3qarz8/TJFSwJ51aVri74l44t+9
         ogsxNAUm8btPq2pSVu2H+fM6d/WCMsDjLm5PJSB8iq5cl2Tmc9VDEZREI5ipCeaHck1d
         QpHCTygKGVa0t5flkG/s69vsQ64lqLTV6y9mt/LB0sRvBFIEueE7tRS6XDlTIZFbHzj+
         pTvQ==
X-Gm-Message-State: AOAM531c+n5pl/YwwcihnyP/oYNhyXLVnn15aV1l+CjNPMDyv2TuwPVO
        Clpe7CXI8bm3b/DXdVvinCx5Rg==
X-Google-Smtp-Source: ABdhPJzF3d9sC9YAlUC/WU9o3JS+1maojVVGg3ZloR/4kR6GQTya3wyLIHkRljrSmHKTuxz4CjB1Ng==
X-Received: by 2002:a63:d40a:: with SMTP id a10mr1212606pgh.7.1630535447585;
        Wed, 01 Sep 2021 15:30:47 -0700 (PDT)
Received: from localhost.localdomain (rrcs-24-43-218-40.west.biz.rr.com. [24.43.218.40])
        by smtp.gmail.com with ESMTPSA id j2sm9623pfe.201.2021.09.01.15.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 15:30:47 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v2 0/3]  HID: playstation: add LED support
Date:   Wed,  1 Sep 2021 15:30:34 -0700
Message-Id: <20210901223037.2964665-1-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

This is a resubmit of the previous patch series. The only change
is the inclusion of a description of player LEDs into the LED
documentation (Documentation/leds/well-know-leds.txt). This file
was just merged by Linus among other LED changes into git master (5.15)
and the patch series is thus relative to there as well.

Regards,

Roderick Colenbrander
Sony Interactive Entertainment, LLC

Roderick Colenbrander (3):
  HID: playstation: expose DualSense lightbar through a multi-color LED.
  leds: add new LED_FUNCTION_PLAYER for player LEDs for game
    controllers.
  HID: playstation: expose DualSense player LEDs through LED class.

 Documentation/leds/well-known-leds.txt |  14 +++
 drivers/hid/hid-playstation.c          | 157 ++++++++++++++++++++++++-
 include/dt-bindings/leds/common.h      |   3 +
 3 files changed, 173 insertions(+), 1 deletion(-)

-- 
2.31.1


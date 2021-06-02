Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 316CA3980EF
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jun 2021 08:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbhFBGP1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Jun 2021 02:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbhFBGPZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Jun 2021 02:15:25 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3370C061760
        for <linux-leds@vger.kernel.org>; Tue,  1 Jun 2021 23:13:42 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id b15-20020a17090a550fb029015dad75163dso1145966pji.0
        for <linux-leds@vger.kernel.org>; Tue, 01 Jun 2021 23:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nPQLnAvO0NoLejjj/G5agnrfa1ACwjvpC6bBzczsjoQ=;
        b=QWvkVse8D3Vu6Qi0ZdMcQZMAflrIM9G2DvpK0M75esTzRE+Io1TMd2rIlNcpBoDhTR
         1Bk7LgJD2runhimlGs8pfmymjBAwr5D27pqj3NVLnk+PiFWVGstv50btcVfSZrNgSsdd
         y7E/93y04GVrtE3ysUq7KmSDYT2UrDrV+2t8oWOwNpYoOvAlPoF8iH2fwBzvF0q5d933
         CGi7E7VRkiHAWIXy1ucF3O/sLhQIlexbSRjP9+3Xt2sfpz6iMLT/QWHDdEceahTA+P47
         KtSX0UNPmpLwYCJ0qRnH/BVr5HzeY/H4XklbrbncsVz21bhFuXfw6Bi3KpYbyuMSM9Zk
         v2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nPQLnAvO0NoLejjj/G5agnrfa1ACwjvpC6bBzczsjoQ=;
        b=ujsWnC6/Xg0fZUHfly6jRF+1opPWVzQfVsHal6/r989GGTAiK0G6Sn0URc6pZ4zLgG
         DpGS35Xc/Q5aMDhWeF6nfRbvL5fkTFr/CQVh2JfbR8JKjg60odLSi7dJSlEqb0vFB8Rk
         ptUEGFnR4f6KDPooFux6SP2P7wjnNJO8wIbTZIJlwbBiTlTTBX4dPlTSddeDzK1NChI/
         zR5McDza4hUy0gsMEeRuolNpaIWHPgY1wSqGVgPrTBgJ0M9mk316Lh37R1CXy5AMyCKl
         GLmpqdW6NxObcAn0pfUcj0pKjytQixiMZmrI11/WAGRFK2rnNQW5IB97xaQR5tFp7vpz
         YwzA==
X-Gm-Message-State: AOAM530O6B1B6lfPJbEzmhGYQXukhtvUsrI02VhSa1oET4v0Hx+rFnwM
        C63+KbKJ7U4aQ6T8jF2F9FtcOw==
X-Google-Smtp-Source: ABdhPJyAMBgEJSTHOvy9/THVLT+kpKc/NwtJhTyDfUAtIvdvHALTgX0N/dNqWMKbnrjrM+zLPJldbQ==
X-Received: by 2002:a17:90b:247:: with SMTP id fz7mr3839418pjb.137.1622614422454;
        Tue, 01 Jun 2021 23:13:42 -0700 (PDT)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id k20sm16535374pgl.72.2021.06.01.23.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 23:13:41 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 0/3] HID: playstation: add LED support.
Date:   Tue,  1 Jun 2021 23:12:50 -0700
Message-Id: <20210602061253.5747-1-roderick@gaikai.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Hi,

Earlier this year Sony published a new driver 'hid-playstation' to support
our new DualSense controller. During the review process, the maintainers
of the LED subsystem expressed that they wanted to be more strict about LED
naming moving forward. There was little time to make the necessary changes
for Linux 5.12 at the time, so LED support was taken out for Linux 5.12.

This patch set adds support for the DualSense lightbar and player LEDs
based on previous patches, but using a new naming scheme.

The DualSense lightbar is exposed using a multi-color LED and is named
after the 'main' input device and uses a name like "inputX:rgb:indicator".

The player LEDs didn't have a suitable "function" type defined by the LED
subsystem. This patch series introduces a new "LED_FUNCTION_PLAYER" type
for these LEDs. This type is then used for 'hid-playstation' and long-term
will be used by 'hid-nintendo' as well. The overall naming takes the form:
"inputX:white:player-1" for the first player LED on a DualSense controller.

Regards,

Roderick Colenbrander
Sony Interactive Entertainment, LLC

Roderick Colenbrander (3):
  HID: playstation: expose DualSense lightbar through a multi-color LED.
  leds: add new LED_FUNCTION_PLAYER for player LEDs for game
    controllers.
  HID: playstation: expose DualSense player LEDs through LED class.

 drivers/hid/hid-playstation.c     | 157 +++++++++++++++++++++++++++++-
 include/dt-bindings/leds/common.h |   3 +
 2 files changed, 159 insertions(+), 1 deletion(-)

-- 
2.31.1


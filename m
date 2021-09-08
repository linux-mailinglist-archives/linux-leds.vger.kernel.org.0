Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59012403DFE
	for <lists+linux-leds@lfdr.de>; Wed,  8 Sep 2021 18:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349999AbhIHQ47 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 Sep 2021 12:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235666AbhIHQ46 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 Sep 2021 12:56:58 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1467C061757
        for <linux-leds@vger.kernel.org>; Wed,  8 Sep 2021 09:55:50 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id u11-20020a17090adb4b00b00181668a56d6so1952188pjx.5
        for <linux-leds@vger.kernel.org>; Wed, 08 Sep 2021 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7L4qaf81qlLbokA5nTTFRbaNkJ51z8ui225bWfpyX8c=;
        b=Msp/tPXD2287pH9IGdOQ3MeSrv4KhjHH5Vc59TqQp2750AfEyDyFNnAdHHh15iPwEs
         f6Tz3D1yWgeZ5VPzWVM9kJUpPip/nWR46lajXMV9C/zgBbZ3+j44rUckhtJkTZgkHZNR
         1hK+atQtY7dZl8H2R741CP8sYRy5A5fDQcSzb3oUYw/AKnxp9QZXYrOeuQuFuX8LzyD5
         e4225TvglZDCJfFbCkjClwt+Qg9BgAzGCB2fM6k5sU1IbAireWSt9AVnVenM5slFWikl
         VX1VX1MI2xzi+f4hIUkQ1BgcpYn7E1Y8z7javlQDSPNsiajqnpFrDEa1XlxiBAzanefL
         UybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7L4qaf81qlLbokA5nTTFRbaNkJ51z8ui225bWfpyX8c=;
        b=yDyY1sufQj0aPck3D4wFS9XRhLefR4Kq5shs5iM4Ie4I1iyapPQ1SLl5O0tDeAv75M
         IAV4RVj4DVuRN1FcFkEeZHX3efkKvv6cx4qrsbPjGok/vYPb/e0CTKlvbNRXE7U5kLLB
         jW5escePFFR3jeFiR5R0EF4ZpnbwPPJ7ek+6zDgmrkjw6ZyleSVlVMed0rHXYqF0k1Tw
         C1KwTs2wKyK9V+evB/2UcMq0ko3oJTX3Yjb87UBA7Rfn3k1c8zk7nwmLpXdk7W1RsbR2
         bEpGbUrYupdDA+ez38dYmw8e2dEfcVgCNmbmpUcAumg6Am+LN+h85eQJgEFZAEMG1u71
         3SHg==
X-Gm-Message-State: AOAM531b5pccN/objJG+glwQaK4ShDzWFW6UAEo7nvgxPKVvFfySNIKe
        IqfKfhb8FpwBCTIad9HuL5Iohw==
X-Google-Smtp-Source: ABdhPJy9wDYdVnDnLvj1MoMy03OXpN51YvFB3LgjKunk28JXE3Dd3hKEiTAbYye5iuU1aX7lRIfoLA==
X-Received: by 2002:a17:90a:3e84:: with SMTP id k4mr5249623pjc.68.1631120150112;
        Wed, 08 Sep 2021 09:55:50 -0700 (PDT)
Received: from localhost.localdomain (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id x19sm3133678pfa.104.2021.09.08.09.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 09:55:49 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v3 0/3] HID: playstation: add LED support
Date:   Wed,  8 Sep 2021 09:55:36 -0700
Message-Id: <20210908165539.3102929-1-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

This is a resubmit of the previous patch series with a few changes:
- Added LED_FUNCTION_PLAYER1 to LED_FUNCTION_PLAYER5 defines.
- Removed LED_FUNCTION_PLAYER define.
- Changed ps_led_register use led_classdev->brightness_set_blocking.

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
 include/dt-bindings/leds/common.h      |   7 ++
 3 files changed, 177 insertions(+), 1 deletion(-)

-- 
2.31.1


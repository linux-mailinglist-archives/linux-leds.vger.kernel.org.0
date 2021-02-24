Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C75A323A3C
	for <lists+linux-leds@lfdr.de>; Wed, 24 Feb 2021 11:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234854AbhBXKL7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Feb 2021 05:11:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234736AbhBXKLz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Feb 2021 05:11:55 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D20C061574;
        Wed, 24 Feb 2021 02:11:14 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id 7so1316684wrz.0;
        Wed, 24 Feb 2021 02:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bKXvIE3nuMsKxQTFAuTpbYrlf7UpO0Bje4NyqzN9k/0=;
        b=XTZxBVgzLT9Mtm64qin1JkVn1zS6A1boqNrntq5uO43ZQ/N/hBbrUZSfJAQ51w1UgN
         2NbL1gMMJpshXFQ7ZYGjtjLLYk0Z1po0Js+01te67f6nxiMUGI84t5mSnFG9NXmTi0eS
         Ga3/FTBBdiH+6x5c5Q6Y4+eQr09o8kmKvFXmKBsFIXXEjomwkgS9E3Wjsx0y5g49YLjC
         o23NzUa2SpOi2cmNj/nFdAYHCwYZfPLplTXi/+oAzA1gnv8EAH3eBhf2vfI6BZ958+lZ
         As6Lq6nYhh6WtAtfvKORLuSqsUrO3k8+e8yM7tAk3TWxDynYf5OZlnfY4OG22rayb2Fx
         zEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bKXvIE3nuMsKxQTFAuTpbYrlf7UpO0Bje4NyqzN9k/0=;
        b=apLgoeKx+8le3NFmZbjlg0FkOogY+J6DQH+WbJlwekcIin8Qs48c/+OK77wy+7xvAi
         DlMa8YugYaRShGRXcn+K9CkOz3GxWkJti83D30rOqDVskoMtCj2wTgHIS1j5Is8CH170
         aXmyoSOjuFPde3KegvZ51dtqQDxeG8vN6yi2jzfmIyHkZKn2JK1juNFhbaU+lES3Xr4H
         0Ysm1j074X23QQ/zjVUBGNK7laIB2Q37PBo2IaMN74x4voN5y3RIoVnStDAyaTcmEgvs
         pUzJy6A1xW1N8b2zy//4cN+VSdYPJm0v+ACv3tvKftX6ON1VbH9TZsLnbsol/J9rmzyh
         +Ivw==
X-Gm-Message-State: AOAM533Zx5T6w9g0r1Y1RCR/wv1eParS1BfBwfSXNLlWPz9+WvEi+5Gc
        OcxVF9oJObIj2e/r6cAoYPoCkC0imdcY1k4/
X-Google-Smtp-Source: ABdhPJwkDRsigOLFs518RT6WdqP135Vpf9TMIqcbTYxathgFMq+Jvmi2Q9JedJROr8ZWFjDYkWg9bA==
X-Received: by 2002:adf:f841:: with SMTP id d1mr1798348wrq.36.1614161473717;
        Wed, 24 Feb 2021 02:11:13 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id a14sm2842573wrg.84.2021.02.24.02.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 02:11:13 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, jonas.gorski@gmail.com,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 0/2] leds: bcm63x8: improve read and write functions
Date:   Wed, 24 Feb 2021 11:11:08 +0100
Message-Id: <20210224101110.20179-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This code is proven to work in BMIPS BE/LE and ARM BE/LE.
See bcm2835-rng and bcmgenet.c:
https://github.com/torvalds/linux/blob/3b9cdafb5358eb9f3790de2f728f765fef100731/drivers/char/hw_random/bcm2835-rng.c#L42-L60
https://github.com/torvalds/linux/blob/3b9cdafb5358eb9f3790de2f728f765fef100731/drivers/net/ethernet/broadcom/genet/bcmgenet.c#L71-L88

v2: fix comments style.

Álvaro Fernández Rojas (2):
  leds: bcm6328: improve write and read functions
  leds: bcm6358: improve write and read functions

 drivers/leds/leds-bcm6328.c | 26 ++++++++++++++------------
 drivers/leds/leds-bcm6358.c | 26 ++++++++++++++------------
 2 files changed, 28 insertions(+), 24 deletions(-)

-- 
2.20.1


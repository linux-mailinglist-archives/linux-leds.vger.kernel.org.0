Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EEE6393F44
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 11:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236528AbhE1JI2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 05:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236557AbhE1JIO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 05:08:14 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96FCFC0613ED
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 02:06:33 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id v12so2528001wrq.6
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 02:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tGA8vkDLt6dYLZnFFwRntWhzZURhB1wDtuAWGHGZ0NM=;
        b=Orl9heiY0WR6vfa1sp2uKVJBULCCWQBHzPu5Lh3vGfSzdqHqVgcmj2maT6xL0ewPvm
         fMESRMK80AVeCB7bPkKPxaLQwkjhx2hptthg/pDSwXvFzPPqIB98JwSRumkKsqNthFEA
         OUrExMGN+RHSqcEbU083dTPh8OHyR/LIHGYObkpB8UbUbKQNeKHrhAwqlyvalDrpiHgL
         q/GFZBmIQsp1u5yiVimytPxDEN2FCX36aXXl37ZSyc/oE/HPDaAZpiioccEiFaEyLqN3
         T9XmUny5HMmHpvUiGqaUCN16/UtORgj58t8nS4JEHziOhuxCC4NxjLiqHZo4PtCOfNul
         +TFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tGA8vkDLt6dYLZnFFwRntWhzZURhB1wDtuAWGHGZ0NM=;
        b=dAv3hiLQxDXweBsT54GzwA3coBbfjeM1yt0hfyuU04yBRE6gEdj3fMq+qkMNFT8k2W
         bGRPFaEU58orrqkh8XOf93kS7ftfdmQQGgfWQBKIHf60Z2XoEurNb/DJUhciI19UFdcX
         qqobU+s4tql8j/BPKte89l26/GDuvFf85F/ToPjzksGYJMaJvKsgD5+And3RzdpI0e3P
         UqShZo2N4XZcg6R1V8M+AhJSPqTDOr3qfXKCCmgVEdQSjZL2YNntlwlrAHRna5m2T6nr
         HqzkInhtOP+4Wh56lL0ttmWAH0+sYBVVrJ6cCtRXYlspqHgrUSwh3zKPHn1JwssmFtzE
         30Sg==
X-Gm-Message-State: AOAM530mbXwFNo6/IHAf1ah5sIZt03v5rioxwuyKNlq6pNY7RfNC7QJA
        srwkssSRvQa06zpwBjFPGTS4kA==
X-Google-Smtp-Source: ABdhPJyxh6txemxNNSAzlGyU3fdAEk1CnxtSlJUlkkd7Uv3vvL2kNSG56ZoGAZBGGuTHu//WXep3zg==
X-Received: by 2002:adf:8bc9:: with SMTP id w9mr6653902wra.378.1622192792246;
        Fri, 28 May 2021 02:06:32 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id m132sm6105911wmf.11.2021.05.28.02.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 02:06:31 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Antonio Ospite <ospite@studenti.unina.it>,
        Bryan Wu <bryan.wu@canonical.com>,
        Dan Murphy <D.Murphy@motorola.com>,
        Dan Murphy <dmurphy@ti.com>,
        David Rivshin <drivshin@allworx.com>,
        =?UTF-8?q?Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
        Jan-Simon Moeller <jansimon.moeller@gmx.de>,
        =?UTF-8?q?Jan-Simon=20M=C3=B6ller?= <dl9pf@gmx.de>,
        John Lenz <lenz@cs.wisc.edu>, Jonas Gorski <jogo@openwrt.org>,
        Kumar SAHU <shreshthakumar.sahu@stericsson.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Richard Purdie <rpurdie@openedhand.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH 00/15] Rid W=1 warnings from LED
Date:   Fri, 28 May 2021 10:06:14 +0100
Message-Id: <20210528090629.1800173-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (15):
  leds: trigger: ledtrig-cpu: Fix incorrectly documented param 'ledevt'
  leds: leds-gpio-register: Supply description for param 'id'
  leds: led-class: Fix incorrectly documented param 'dev'
  leds: leds-bcm6328: Demote kernel-doc abuse
  leds: leds-as3645a: Fix function name 'as3645a_set_current()'
  leds: leds-blinkm: Remove unused variable 'ret'
  leds: leds-is31fl32xx: Provide missing description for member
    'sw_shutdown_func'
  leds: leds-lp3944: Provide missing function names in documentation
    headers
  leds: leds-lm3530: Fix incorrect spelling of 'brightness'
  leds: leds-lm3692x: Fix some kernel-doc formatting issues
  leds: leds-lm3697: Provide some missing descriptions for struct
    members
  leds: leds-mlxreg: Fix incorrect documentation of struct member
    'led_cdev' and 'led_cdev_name'
  leds: leds-lp8860: Fix kernel-doc related formatting issues
  leds: leds-lm3692x: Demote non-complete kernel-doc
  leds: leds-mlxcpld: Fix a bunch of kernel-doc formatting issues

 drivers/leds/led-class.c           |  2 +-
 drivers/leds/leds-as3645a.c        |  2 +-
 drivers/leds/leds-bcm6328.c        |  2 +-
 drivers/leds/leds-blinkm.c         |  5 ++--
 drivers/leds/leds-gpio-register.c  |  1 +
 drivers/leds/leds-is31fl32xx.c     |  3 ++-
 drivers/leds/leds-lm3530.c         |  2 +-
 drivers/leds/leds-lm3692x.c        | 20 ++++++++--------
 drivers/leds/leds-lm3697.c         |  4 ++++
 drivers/leds/leds-lp3944.c         |  6 ++---
 drivers/leds/leds-lp8860.c         | 16 ++++++-------
 drivers/leds/leds-mlxcpld.c        | 38 +++++++++++++++---------------
 drivers/leds/leds-mlxreg.c         |  3 ++-
 drivers/leds/trigger/ledtrig-cpu.c |  2 +-
 14 files changed, 56 insertions(+), 50 deletions(-)

Cc: Antonio Ospite <ospite@studenti.unina.it>
Cc: Bryan Wu <bryan.wu@canonical.com>
Cc: Dan Murphy <D.Murphy@motorola.com>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: David Rivshin <drivshin@allworx.com>
Cc: "Fernández Rojas" <noltari@gmail.com>
Cc: Jan-Simon Moeller <jansimon.moeller@gmx.de>
Cc: "Jan-Simon Möller" <dl9pf@gmx.de>
Cc: John Lenz <lenz@cs.wisc.edu>
Cc: Jonas Gorski <jogo@openwrt.org>
Cc: Kumar SAHU <shreshthakumar.sahu@stericsson.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-leds@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Richard Purdie <rpurdie@openedhand.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>
Cc: Vadim Pasternak <vadimp@nvidia.com>
-- 
2.31.1


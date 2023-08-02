Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CCFF76D34F
	for <lists+linux-leds@lfdr.de>; Wed,  2 Aug 2023 18:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbjHBQIN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Aug 2023 12:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235052AbjHBQHz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Aug 2023 12:07:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6324F198A
        for <linux-leds@vger.kernel.org>; Wed,  2 Aug 2023 09:07:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E02AB61A18
        for <linux-leds@vger.kernel.org>; Wed,  2 Aug 2023 16:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C956C433C8;
        Wed,  2 Aug 2023 16:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690992472;
        bh=LS/hzCHnMZGkygLiyYSNo0gKng+PKlNYWfkl8NzGJGE=;
        h=From:To:Cc:Subject:Date:From;
        b=XxoQf78FM+y2xAE4eL7IHFfSYsigQLIjJwba/6iws2a1PLBHUyNigrxIPOFkphgdF
         /ZyYyeCLGF+SW3G4iluj8aJWSwK0Y639wtYPT6/+DSgxIsCEPh7OPc0hoHP2tH6yNQ
         ZK20JnhCYNRKoMaUPRkXOYi8rE1GjjGPNwxEKLoOWBHTsrkpbHBVBaIUj/URVto9Bd
         5mhmb5pZpFgBV7HY7AmqRnEBN62/Y880OETbIna3lRsACTyNqIv2fQWiPILUcPLmlC
         IxDsQuMDXuSw4f/zLVdeMk1eQMHfC4sbJuy41Ru864+Zn0Gw5QfV/2dTDGXxoIlnE2
         dI/o4edI+eWxA==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v3 0/6] leds: turris-omnia: updates
Date:   Wed,  2 Aug 2023 18:07:42 +0200
Message-ID: <20230802160748.11208-1-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel, Lee,

I am sending version 3 of Turris Omnia's LED controller updates.
Please read the summary (changes from version 2):
- added patch 1, which drops unnecessary mutex locking
- added patch 2, which changes SMBUS calls to regular I2C transfers
- added patch 3, changing sprintf() to dedicated sysfs_emit()
- patch 4 replaces patch 1 from v2, which changed max_brightness to 1.
  Instead, we make set_brightness() more effective by avoiding
  unnecessary I2C transactions (for example if brightness is being
  changed between 0 and 255, we do not send the color changing I2C
  command, only the enabling/disabling command)
- patch 5 is updated patch 3 from v2, which adds support for enabling
  HW blinking mode on the LEDs
- patch 6 adds support for enabling/disabling HW gamma correction of
  the RGB LEDs. Gamma correction is supported by newer MCU firmware
  versions

Marek

Marek Behún (6):
  leds: turris-omnia: drop unnecessary mutex locking
  leds: turris-omnia: do not use SMBUS calls
  leds: turris-omnia: use sysfs_emit() instead of sprintf()
  leds: turris-omnia: make set_brightness() more efficient
  leds: turris-omnia: support HW controlled mode via private trigger
  leds: turris-omnia: add support for enabling/disabling HW gamma
    correction

 .../sysfs-class-led-driver-turris-omnia       |  14 +
 drivers/leds/Kconfig                          |   1 +
 drivers/leds/leds-turris-omnia.c              | 363 +++++++++++++++---
 3 files changed, 329 insertions(+), 49 deletions(-)

-- 
2.41.0


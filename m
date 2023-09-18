Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D298A7A4F4E
	for <lists+linux-leds@lfdr.de>; Mon, 18 Sep 2023 18:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbjIRQjO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Sep 2023 12:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230212AbjIRQjC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Sep 2023 12:39:02 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23134EF1
        for <linux-leds@vger.kernel.org>; Mon, 18 Sep 2023 09:11:32 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF1DC433C9;
        Mon, 18 Sep 2023 16:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695053468;
        bh=KBssxqt+U4spXPfvMivq8Qm7KSfGN5YXpAlQZiaDM+0=;
        h=From:To:Cc:Subject:Date:From;
        b=YTPdLBXkRK4nF7Mw1gisTrxK/2KU6tyH31Pu/mxf9xNLi7tRLxI4idhcrZgya/jnZ
         nWcb5FY4XTP7FqIKv6fxXCpy8idyesl/5CXlxRo3k5ZPqtXMgmhCDDrCoUlEY7Z/UZ
         RFg2SsvADBGy9zkuEp1FyAlTZAEaqoZI9ZXii/2Zc12ovXl09tJSUoZF8R0ea5z/1O
         6uQn4sYwTgHEPjKMS2b9rAHVYTgdmrzPwAWnqCIoy9xL4niS8H9X7tpBo2DiXfR7On
         V6at2pSRQlulEwBnq83XdeacovELngMliehs38mfXrwk4w1ws6U4ZkA217C3myvE+c
         i7OixGmNO1W/w==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v4 0/4] leds: turris-omnia: updates
Date:   Mon, 18 Sep 2023 18:11:00 +0200
Message-ID: <20230918161104.20860-1-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Lee,

I am sending version 4 of Turris Omnia's LED controller updates.
I tried to address the issues you mentioned:
- I made the omnia_cmd_read_raw() function to return the number of read
  bytes on success
- I have renamed omnia_cmd_read() to omnia_cmd_read_u8() since it always
  reads one byte. The function returns the read byte on success and
  a negative errno on failure
- accordingly, I have renamed omnia_cmd_write() to omnia_cmd_write_u8(),
  and made it so that it returns the number of written bytes on success
- the newly added comments now start with a capital letter

Marek

Marek Behún (4):
  leds: turris-omnia: do not use SMBUS calls
  leds: turris-omnia: make set_brightness() more efficient
  leds: turris-omnia: support HW controlled mode via private trigger
  leds: turris-omnia: add support for enabling/disabling HW gamma
    correction

 .../sysfs-class-led-driver-turris-omnia       |  14 +
 drivers/leds/Kconfig                          |   1 +
 drivers/leds/leds-turris-omnia.c              | 352 ++++++++++++++++--
 3 files changed, 329 insertions(+), 38 deletions(-)

-- 
2.41.0


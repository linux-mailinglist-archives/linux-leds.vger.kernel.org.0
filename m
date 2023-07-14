Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1E007535B9
	for <lists+linux-leds@lfdr.de>; Fri, 14 Jul 2023 10:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235610AbjGNIxL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Jul 2023 04:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235745AbjGNIw7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Jul 2023 04:52:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C3F2120
        for <linux-leds@vger.kernel.org>; Fri, 14 Jul 2023 01:52:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 68D9361C63
        for <linux-leds@vger.kernel.org>; Fri, 14 Jul 2023 08:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF14AC433C8;
        Fri, 14 Jul 2023 08:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689324777;
        bh=wap7biS80aV2R9+o8AT3JSg0OdFZiOt5FuczEhYUKJY=;
        h=From:To:Cc:Subject:Date:From;
        b=nSJz9/1oCXDrEvwAinU8jUXo02dwFhSBKnaTa+1E4U91kHZad9/sRtdSN93n8lywJ
         a3N22eGKJmKwrDccdlKhVvwoeNOdy4HqKHRaJOurJUrChZrK12cVY5GReHkByLkNM9
         xGHK7t+XOfcWTwhH11QlwT55LJCawwXWwXLyYVyw8BH0ZvF3YVoZoGwdLIfx5ZqoEt
         IEDWaoQAKKetIFSsf00cV8K7gsxBCc66Phy3P19lmiDs9zzY9WZvvt7ZjCZurCug/m
         sb21qPhbSCVi2+ocqiXVAEbpIN3fTZleLt3dxgnBb3KzS7WbqeEGobLAaR1ynfAS7j
         OK+vOyFYCsQuA==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v2 0/3] leds: turris-omnia: updates
Date:   Fri, 14 Jul 2023 10:52:50 +0200
Message-ID: <20230714085253.13544-1-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel, Lee,

:-( I realized it was a year ago when I sent v1 of this series,
so I am resending this with a small change (I reversed the order of
the patches so that the most complicated patch comes last.).

The summary can be read in the original cover letter [1].

Marek

[1] https://lore.kernel.org/all/20221102002311.twso5wb4tzba5h2k@pali/t/

Marek Behún (3):
  leds: turris-omnia: change max brightness from 255 to 1
  leds: turris-omnia: initialize multi-intensity to full
  leds: turris-omnia: support HW controlled mode via private trigger

 drivers/leds/Kconfig             |  1 +
 drivers/leds/leds-turris-omnia.c | 46 +++++++++++++++++++++++++++++++-
 2 files changed, 46 insertions(+), 1 deletion(-)

-- 
2.41.0


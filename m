Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC31F5652E6
	for <lists+linux-leds@lfdr.de>; Mon,  4 Jul 2022 13:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233992AbiGDLAE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Jul 2022 07:00:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232942AbiGDLAD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Jul 2022 07:00:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA91525E2
        for <linux-leds@vger.kernel.org>; Mon,  4 Jul 2022 04:00:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 82C5E615C9
        for <linux-leds@vger.kernel.org>; Mon,  4 Jul 2022 11:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C83BEC3411E;
        Mon,  4 Jul 2022 10:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656932399;
        bh=tF7964G17Sez9MGnToIgZ1quBznLz3pVCTA61+bBAs4=;
        h=From:To:Cc:Subject:Date:From;
        b=ERV4Y/tLxxf5Q/Ym4e4kXUODd+gagZ/c3jCZHds3M/cFaCzqFMpbdL+qYRD7uJ7qY
         D71IJgPr3Oa117vmUgcB+dgpVVYD6PZhHKrvCoI407D/SK+4qkpXkPT4HeR/vyYqWo
         T293uURXls5pfl0rSWY8IIWpqwF9c4zFXy5AOM29DRk3uxn+eJgS6yD1hzarev/Pgw
         OXFJpRk+z7PycTKfZsmYo71vT7DOX7kh9/l5YlRVmVA8jo7LnxtwJaPgl/F1LiBGZL
         bRmIKoAGWqD9aj+6hUVswZvhFHx9t5/EDuSEknUmIYHU9QFo82ITx9DPQVPjwKRtqQ
         lP0FOAgj7Qk+Q==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Cc:     pali@kernel.org, Josef Schlehofer <josef.schlehofer@nic.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH 0/3] leds: turris-omnia: updates
Date:   Mon,  4 Jul 2022 12:59:52 +0200
Message-Id: <20220704105955.15474-1-kabel@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Pavel,

the upstream leds-turris-omnia driver is disabled in upstream Omnia
device-tree and isn't used by TurrisOS because it does not support
enabling HW control. This is because I wanted to implement it via
netdev trigger transparent offloading, but I still wasn't able to
implement this satisfactorily (and truthfully haven't had much time
to look into this for almost half a year now).

Let's implement this in the meantime via the private trigger
mechanism that we added two years ago.

In the future if netdev offloading gets implemented, we can still
keep this implementation if backwards compatibility is desired, or
we can just drop it.

Marek

Marek Behún (3):
  leds: turris-omnia: support HW controlled mode via private trigger
  leds: turris-omnia: initialize multi-intensity to full
  leds: turris-omnia: change max brightness from 255 to 1

 drivers/leds/Kconfig             |  1 +
 drivers/leds/leds-turris-omnia.c | 46 +++++++++++++++++++++++++++++++-
 2 files changed, 46 insertions(+), 1 deletion(-)

-- 
2.35.1


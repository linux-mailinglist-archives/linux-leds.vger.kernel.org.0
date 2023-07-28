Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B503766B9B
	for <lists+linux-leds@lfdr.de>; Fri, 28 Jul 2023 13:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235212AbjG1LXG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Jul 2023 07:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236236AbjG1LXC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Jul 2023 07:23:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52A662D61
        for <linux-leds@vger.kernel.org>; Fri, 28 Jul 2023 04:23:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E4F3F620F0
        for <linux-leds@vger.kernel.org>; Fri, 28 Jul 2023 11:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3FD0C433C8;
        Fri, 28 Jul 2023 11:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690543380;
        bh=ZNFEOCdnZpKcu2xs2Itiy1X5pMrt12HO8X+B0PAb388=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=VYE4T7n7I8FkU5SPMNi8kktIgmZa1WLzQRgR5XYCr5L1LERwd5+VIMAr6MIdbpCLs
         INVOB9jVcqFvU3ixsFKrXaiL1q4G5oKblnpZUyyVNPHTZyBu5bIryEAxE1VHI4k74J
         kznWgsUd+1e0nUObMAX6xYtgr+V6sTehCy4ciAapoGq1pm73flMpb6POwbRqoFUDdb
         oL4bKqCn3gHmBmXWXqTi7eL2TU7dNfmxsE2TcmHO+SX3suwLPNJPefD0VDKUW1RLrS
         1FwJ2GHfJcepWjyzMH/GhEGbdVC/zCtBIh1JMSGpJ45u0tBrARiXrgeRmlBK412q88
         QKfZueIvMaw1Q==
From:   Lee Jones <lee@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        linux-leds@vger.kernel.org, kernel@pengutronix.de,
        Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20230728065739.580281-1-u.kleine-koenig@pengutronix.de>
References: <20230728065739.580281-1-u.kleine-koenig@pengutronix.de>
Subject: Re: (subset) [PATCH] leds: qcom-lpg: Drop assignment to struct
 pwmchip::base
Message-Id: <169054337847.351209.7864098481511406737.b4-ty@kernel.org>
Date:   Fri, 28 Jul 2023 12:22:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 28 Jul 2023 08:57:39 +0200, Uwe Kleine-König wrote:
> Since commit f9a8ee8c8bcd ("pwm: Always allocate PWM chip base ID
> dynamically") there is no effect any more for assigning this variable. See
> pwmchip_add() which unconditionally overwrites this member.
> 
> 

Applied, thanks!

[1/1] leds: qcom-lpg: Drop assignment to struct pwmchip::base
      commit: 841165267827955bb3295b066cb6a906ba9265c0

--
Lee Jones [李琼斯]


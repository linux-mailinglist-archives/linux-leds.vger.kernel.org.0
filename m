Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC6077F447
	for <lists+linux-leds@lfdr.de>; Thu, 17 Aug 2023 12:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348253AbjHQKZe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Aug 2023 06:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349356AbjHQKZT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Aug 2023 06:25:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A70D213F
        for <linux-leds@vger.kernel.org>; Thu, 17 Aug 2023 03:25:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B09A763824
        for <linux-leds@vger.kernel.org>; Thu, 17 Aug 2023 10:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA5AC433C8;
        Thu, 17 Aug 2023 10:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692267917;
        bh=pCUN09EH3++c0bmgvTjU2PMIGEkhY2GrVQVoZ3sj3EE=;
        h=From:To:In-Reply-To:References:Subject:Date:From;
        b=M6AzHdEWoElId2kd0H6Nj7n5s8v8V5NiLItMF3QsGlifhNbM6AEb4A82/6rUmFnMA
         j+2SjnZbc2MrerpP6yhIUczqBl3nwu18pyyjjSpKD4zBqeVr+e6WFRkHWzB1IDGHA9
         y8TwaiuvyXCeGP1ayG6sOGkSkm+zD1V3Q6FRwdpbBUGv0/MuTESHqFEb6C27uPjq6F
         /3pjxba9ASK0kpSMHw77PuRCpEO7+XDXYwp4f3mmZPLxHtXpi167RGnaDgpgWg1W/Z
         M6p4KgcEVCuvQX5rjWkLgDExQMVsP1MsRjeCYBSurX7Wlt6OS/GrYtqCOzygjxdKQY
         qN3veaRSjBWng==
From:   Lee Jones <lee@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
In-Reply-To: <20230801124931.8661-1-kabel@kernel.org>
References: <20230801124931.8661-1-kabel@kernel.org>
Subject: Re: (subset) [PATCH] leds: multicolor: Use rounded division when
 calculating color components
Message-Id: <169226791578.964523.16524805525375125286.b4-ty@kernel.org>
Date:   Thu, 17 Aug 2023 11:25:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 01 Aug 2023 14:49:31 +0200, Marek Behún wrote:
> Given channel intensity, LED brightness and max LED brightness, the
> multicolor LED framework helper led_mc_calc_color_components() computes
> the color channel brightness as
> 
>     chan_brightness = brightness * chan_intensity / max_brightness
> 
> Consider the situation when (brightness, intensity, max_brightness) is
> for example (16, 15, 255), then chan_brightness is computed to 0
> although the fractional divison would give 0.94, which should be rounded
> to 1.
> 
> [...]

Applied, thanks!

[1/1] leds: multicolor: Use rounded division when calculating color components
      commit: 065d099f1be58187e6629273c50b948a02b7e1bf

--
Lee Jones [李琼斯]


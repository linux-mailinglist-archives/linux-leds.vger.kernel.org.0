Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A34A7AA99D
	for <lists+linux-leds@lfdr.de>; Fri, 22 Sep 2023 08:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjIVG7a (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 22 Sep 2023 02:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbjIVG73 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 22 Sep 2023 02:59:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FBBFCE
        for <linux-leds@vger.kernel.org>; Thu, 21 Sep 2023 23:59:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4127DC433C7;
        Fri, 22 Sep 2023 06:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695365963;
        bh=2n8SD+onKMJABH4WMhTAB1SsrMLN1yDHzsgPQ+4sc3k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aG1J4bn5YJ+sfPda1ZNWXajcMhMxx67Mm6WKAqlmz3wWSMmOFMg1vGtXT4vhmiRpm
         l72kkCU5rankG31iHp3O8RR6wdFkI7sJdbIrrOIqdsXpQ6OGfCz4XgTI2EiHpjB7vq
         LCaZy6Pk6Hxb2MNUJw2BAZcjzMfCQQVg6LmfWes7pVT3+vuXiEpS/zITA1oX2qrp20
         52hSPf26Oa4GxkBoGQUbjb5tcsw+H1q0MU8r3EYozlhL21GxGJiQXJxcc0vzMhl4Py
         dlsL+l+HDB5b8SwIub7+v5XdYISUX82v6HnDi+r80S7zN9kNe/kfGwrqTSM+OPRcbb
         RzGR0rdXMhtEA==
Date:   Fri, 22 Sep 2023 07:59:19 +0100
From:   Lee Jones <lee@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: turris-omnia: Fix unused variable
Message-ID: <20230922065919.GA3660432@google.com>
References: <20230921205025.20303-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230921205025.20303-1-kabel@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 21 Sep 2023, Marek Behún wrote:

> The variable ret is not used in this function.
> 
> Fixes: 28350bc0ac77 ("leds: turris-omnia: Do not use SMBUS calls")
> Closes: https://lore.kernel.org/linux-leds/202309212215.Yl5VQaSm-lkp@intel.com/T/#u
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  drivers/leds/leds-turris-omnia.c | 1 -
>  1 file changed, 1 deletion(-)

I already fixed and squashed this.

How was this missed when you tested the set?

-- 
Lee Jones [李琼斯]

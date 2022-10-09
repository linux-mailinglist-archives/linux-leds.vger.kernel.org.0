Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE54A5F8AEE
	for <lists+linux-leds@lfdr.de>; Sun,  9 Oct 2022 13:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbiJILku (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Oct 2022 07:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbiJILkt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Oct 2022 07:40:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E53F325EA7;
        Sun,  9 Oct 2022 04:40:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 90C5BB80C69;
        Sun,  9 Oct 2022 11:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CCCC433C1;
        Sun,  9 Oct 2022 11:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665315646;
        bh=D458pyFePFvs7htAJzZC7c6ouO/HzFuwkez6kvkqbTI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tCEdDtaQUc+ldqMTI6Vptm6LnqeUq/ODJGbAvw0Q+r383J8KO1ki9iO3cIB4pSyOd
         D1jTvIaf65aIdxdwZKQY2km2cLV01+rB7cR3FrcvmSyNESGyiyAWWA8iOourrQuXau
         ERbwl5f8946yyWhUIiaicizXZH06Wrq5TG4gNtJa1xFl3/cVg1YU3QYAGCGZ/HbBGD
         WGWsC+iATmYrOE/9EjeX7dKXaQGugPxscdtgbhK8Yl9qzrUhylNKn0HhnD0x8P19Va
         2rk4hCCZh7HO1QrBxcZd7ChHaPIkhxqXQ5TJxHaMdJ+ShYLeWbx0sSTQQvoGBMdLp4
         5PwVy1/kgGAWw==
Received: by pali.im (Postfix)
        id 7FD797C1; Sun,  9 Oct 2022 13:40:43 +0200 (CEST)
Date:   Sun, 9 Oct 2022 13:40:43 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: syscon: Implement support for active-low
 property
Message-ID: <20221009114043.6rdgpgzkngd527o7@pali>
References: <20220818172528.23062-1-pali@kernel.org>
 <20220818172528.23062-2-pali@kernel.org>
 <CACRpkdYWQVW_akJS7hvtU2=c063LCMfjN22X-neTfuTZRbt+yw@mail.gmail.com>
 <20220831114936.vukjsovdxw3cmj6h@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220831114936.vukjsovdxw3cmj6h@pali>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wednesday 31 August 2022 13:49:36 Pali Rohár wrote:
> On Friday 26 August 2022 10:05:26 Linus Walleij wrote:
> > On Thu, Aug 18, 2022 at 7:25 PM Pali Rohár <pali@kernel.org> wrote:
> > 
> > > This new active-low property specify that LED has inverted logic
> > > (0 - enable LED, 1 - disable LED).
> > >
> > > Signed-off-by: Pali Rohár <pali@kernel.org>
> > 
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > 
> > Yours,
> > Linus Walleij
> 
> Is something else needed for this patch series?

PING?

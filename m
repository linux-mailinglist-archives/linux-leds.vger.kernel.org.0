Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECBC5A7C72
	for <lists+linux-leds@lfdr.de>; Wed, 31 Aug 2022 13:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiHaLtn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 31 Aug 2022 07:49:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiHaLtm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 31 Aug 2022 07:49:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9ED2C2756;
        Wed, 31 Aug 2022 04:49:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 94B1EB82069;
        Wed, 31 Aug 2022 11:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B1AC433D6;
        Wed, 31 Aug 2022 11:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661946579;
        bh=4LbJ3Fi/IPwJ87/lgNAqNMNEtuoOIl5eDv6t1rOEhpM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Jzp8M+8xEYkvkKj2zAbOF2d1HUOf/3528ajVN9IbSawV8fsrCr6miPSeSFhwf43oX
         ZD/IL40s73BxdFtLwNyFgynfWicD+HJx1UEhq4L5GiTg5ym7GkiZ55fqVRm7Xu+/e4
         uiOfWbtU8l6527N9RRRf4f5idukpxdEDz7rjsAvVkQXKrNaZogfqCxVX40d+xi2P9Q
         NetUhJC5q74OscHroNlPEHIVuc7GBfqwAP8p6pAOdggF3QV/e3x3LJXt/AjVguUQnA
         h5dHm0U45MLIhfFyvCcnKReUv8psOm6xtKxRX8yfD34NeO6fm2vAcjy6m3WJiW9kR4
         nudjJ0AglDNPg==
Received: by pali.im (Postfix)
        id 4BBF5855; Wed, 31 Aug 2022 13:49:36 +0200 (CEST)
Date:   Wed, 31 Aug 2022 13:49:36 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: syscon: Implement support for active-low
 property
Message-ID: <20220831114936.vukjsovdxw3cmj6h@pali>
References: <20220818172528.23062-1-pali@kernel.org>
 <20220818172528.23062-2-pali@kernel.org>
 <CACRpkdYWQVW_akJS7hvtU2=c063LCMfjN22X-neTfuTZRbt+yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYWQVW_akJS7hvtU2=c063LCMfjN22X-neTfuTZRbt+yw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Friday 26 August 2022 10:05:26 Linus Walleij wrote:
> On Thu, Aug 18, 2022 at 7:25 PM Pali Rohár <pali@kernel.org> wrote:
> 
> > This new active-low property specify that LED has inverted logic
> > (0 - enable LED, 1 - disable LED).
> >
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Yours,
> Linus Walleij

Is something else needed for this patch series?

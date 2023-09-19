Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2727A6612
	for <lists+linux-leds@lfdr.de>; Tue, 19 Sep 2023 16:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbjISOBq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Sep 2023 10:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232437AbjISOBq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Sep 2023 10:01:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A98F3
        for <linux-leds@vger.kernel.org>; Tue, 19 Sep 2023 07:01:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C172AC433C8;
        Tue, 19 Sep 2023 14:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695132100;
        bh=Y1HrPjGHxQoe3prmJj3/1H0+ywLIRMDI4XlNFndO1HQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bw8D8eTNIK3eV0vz9ghfQM8wqq2EHipqRvrfAxcYjiluzeahaLVCLkGj8dXWj3rLx
         yhhWXcrrIvpEIWpB9Xm/pKRxug1bJy+unZi55md5SB2XoXfbz1IhXpNYqGR12Ite2m
         TyJoJvLCF0zgFyfW6kPsYk1MfXSjGICYs5l4+EQ9LOJdrJpv/8mtgIjo7jlQeP7Fqq
         MNIDwvenV9fnopLl4HceRO6jIV8jeZjSJ4PjBAlImfSVXVZwbFXO0x1Xpxs61kn2w0
         /fuMYTGkU5/n+hS+IVIW59gezGX4+1XdIKsuZSEIY1QQAaDBb95u5BFRx1OSeoZY9y
         qaAHe8viWn/Kw==
Date:   Tue, 19 Sep 2023 15:01:36 +0100
From:   Lee Jones <lee@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: Drop BUG_ON check for LED_COLOR_ID_MULTI
Message-ID: <20230919140136.GU13143@google.com>
References: <20230918140724.18634-1-kabel@kernel.org>
 <20230919104207.7bf1b237@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230919104207.7bf1b237@dellmb>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 19 Sep 2023, Marek Behún wrote:

> Hello,
> 
> Greg tells me to pester LED maintainers to get this into Linus' tree
> soon, so that we can avoid stable incosistencies (see
> https://lore.kernel.org/stable/2023091901-vessel-giggling-55ee@gregkh/).
> 
> Sorry about the inconvenience, this would not happen if this was not
> sent into stable in the first place, which is my fault, since I added
> the Fixes tag.

Starting back on upstream work now.

I'll get something out shortly.

-- 
Lee Jones [李琼斯]

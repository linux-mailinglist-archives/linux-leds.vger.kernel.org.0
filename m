Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C129A7AD263
	for <lists+linux-leds@lfdr.de>; Mon, 25 Sep 2023 09:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbjIYHxs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 25 Sep 2023 03:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232471AbjIYHxr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 25 Sep 2023 03:53:47 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C65B3
        for <linux-leds@vger.kernel.org>; Mon, 25 Sep 2023 00:53:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC52CC433C7;
        Mon, 25 Sep 2023 07:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695628420;
        bh=KFeghguGEVpavPHYq1Vnm8rQ6pfc0xqgJ9175aYIBf0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=shDmUNryI15Sd+SoXGDvlaMj5WWlzlNEyvL1gmUZEeNRQi+HSpAS80G8NGWyJfW1T
         2Ggt4m5o25cDTJw7wRNKFGLibAQCVPrAz3bxM/C0I+qXfHEi2XtNhkjU8Y8r44YZjX
         zgHTtWLNfUT1o2gAoITY+/OEOOp/xjsxiwT25u+UTChEaVAXOaNOvRgesurPh1ll9s
         JKpodS4I+pBCxZCsOo65aaUi0sZx0D7tYkCtWQbceRaaJe9FvqJ12ZelxNt4OOPGbK
         5wqO1r2YcBaFtv2nOHZpIy62CpAuqE6KcEeDxCgreFopMbBzrT59lDBLcmBw1UcjAH
         cOoimic43BKcg==
Date:   Mon, 25 Sep 2023 08:53:36 +0100
From:   Lee Jones <lee@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: turris-omnia: Fix unused variable
Message-ID: <20230925075336.GB9999@google.com>
References: <20230921205025.20303-1-kabel@kernel.org>
 <20230922065919.GA3660432@google.com>
 <20230922131654.2172a184@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230922131654.2172a184@dellmb>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 22 Sep 2023, Marek Behún wrote:

> On Fri, 22 Sep 2023 07:59:19 +0100
> Lee Jones <lee@kernel.org> wrote:
> 
> > On Thu, 21 Sep 2023, Marek Behún wrote:
> > 
> > > The variable ret is not used in this function.
> > > 
> > > Fixes: 28350bc0ac77 ("leds: turris-omnia: Do not use SMBUS calls")
> > > Closes: https://lore.kernel.org/linux-leds/202309212215.Yl5VQaSm-lkp@intel.com/T/#u
> > > Signed-off-by: Marek Behún <kabel@kernel.org>
> > > ---
> > >  drivers/leds/leds-turris-omnia.c | 1 -
> > >  1 file changed, 1 deletion(-)  
> > 
> > I already fixed and squashed this.
> > 
> > How was this missed when you tested the set?
> 
> I am not sure, but it is possible that I've refactored that function
> from my original (return 0 on success) to your proposed (return number
> of written bytes on success) and did not notice the warning. I am sure
> I tested that the result works. Maybe I switched to another terminal
> where I was testing it too fast and did not notice the warning.
> 
> Sorry about this.
> 
> Anyway, I have a question. Several days ago I also sent for review
> a new driver for other feautres the Turris Omnia MCU provides (GPIO,
> watchdog, wakeup+poweroff).
> There, I also refactored the _write and _read functions as you
> suggested (to return the number of bytes written/read).
> On review, Andy Shevchenko requested [1] to refactor it to my original
> (return 0 on success). I mentioned to him [2] your request, to which he
> replied [3]:
>   This is strange. For example, regmap APIs never returns amount of
>   data written or read. I think it's solely depends on the API. It might
>   be useful for i²c APIs, in case you can do something about it. but if
>   you have wrappers on top of that already (meaning not using directly
>   the i2c_*() calls, I dunno the positive return is anyhow useful.
> Since I agree with him, taking this into account, would you accept a
> patch that returns those function to how I originally wrote them
> (return 0 on success)?

As I said before, I'm not going to force you into anything.

Fire away.

-- 
Lee Jones [李琼斯]

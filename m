Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FFFE78294E
	for <lists+linux-leds@lfdr.de>; Mon, 21 Aug 2023 14:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235016AbjHUMkK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Aug 2023 08:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232895AbjHUMkK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Aug 2023 08:40:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A76D2CC
        for <linux-leds@vger.kernel.org>; Mon, 21 Aug 2023 05:39:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 38D7B63436
        for <linux-leds@vger.kernel.org>; Mon, 21 Aug 2023 12:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD843C433C8;
        Mon, 21 Aug 2023 12:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692621596;
        bh=foE5IJYCULnBmEfn8C28QzAc4Q85Jw1bxklUH8D+tQk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OryOoRDQ3aYhk2wut4hpM5koWMdNz5OsvuysvUNDvcEg4gsnBD86VQkyOMWjhhJqu
         /hQWjW7Cg27EbaHT6iOM4LD8h0OAQI6vnRRAj9Am2SUceLc9Pla5mzSLusB5kqmHHT
         0l0GCAYR7rZtkqqFEfZgiIF4lpp8SZgxn0Iv0JutzrRd720BBMPc2bdnlgnFo4oad7
         vpESLhcuXn6OyGImXCznNNv19zmAus2ljmrO+ETej2Ie0ubekb+71Q4dtTNopICl2Z
         Ar5jbwqElPa3MSntHIRVaukg2jCIrdX2HCkqT5hRlIUPP5/EyXFNktSCxl0MorMKIO
         pA+hmeQSq6fAg==
Date:   Mon, 21 Aug 2023 13:39:52 +0100
From:   Lee Jones <lee@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 4/6] leds: turris-omnia: make set_brightness() more
 efficient
Message-ID: <20230821123952.GL1380343@google.com>
References: <20230802160748.11208-1-kabel@kernel.org>
 <20230802160748.11208-5-kabel@kernel.org>
 <20230818094255.GR986605@google.com>
 <20230821121418.67155ca3@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230821121418.67155ca3@dellmb>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 21 Aug 2023, Marek Behún wrote:

> On Fri, 18 Aug 2023 10:42:55 +0100
> Lee Jones <lee@kernel.org> wrote:
> 
> > On Wed, 02 Aug 2023, Marek Behún wrote:
> > 
> > > Implement caching of the LED color and state values that are sent to MCU
> > > in order to make the set_brightness() operation more efficient by
> > > avoiding I2C transactions which are not needed.  
> > 
> > How many transactions does all of this extra code actually save?
> 
> Depends on how many transactions are requested by userspace wanting to
> change LED brightness, but see below.
> 
> > > On Turris Omnia's MCU, which acts as the RGB LED controller, each LED
> > > has a RGB color, and a ON/OFF state, which are configurable via I2C
> > > commands CMD_LED_COLOR and CMD_LED_STATE.
> > > 
> > > The CMD_LED_COLOR command sends 5 bytes and the CMD_LED_STATE command 2
> > > bytes over the I2C bus, which operates at 100 kHz. With I2C overhead
> > > this allows only ~1670 color changing commands and ~3200 state changing
> > > commands per second.  
> > 
> > Only?  Seems like quite a lot.
> 
> I may have chosen the wrong argument here. Yes, 1670 color changing
> commands are more than enough for a LED controller. This is not the
> problem.
> 
> The problem is that the we need to be able to send other commands over
> the same I2C bus, unrelated to the LED controller, and they need the
> bandwidth. The MCU exposes an interrupt interface, and it can trigger
> hundreds of interrupts per second. Each time we need to read the
> interrupt state register. Whenever we are sending a LED color/state
> changing command, the interrupt reading is waiting.
> 
> So this is the reason why I want to avoid unnecessary I2C transactions.
> 
> If I change the commit message to explain this, will you be satisfied?

Yes, I expect so.

> > > Currently, every time LED brightness or LED multi intensity is changed,
> > > we send a CMD_LED_STATE command, and if the computed color (brightness
> > > adjusted multi_intensity) is non-zero, we also send a CMD_LED_COLOR
> > > command.
> > > 
> > > Consider for example the situation when we have a netdev trigger enabled
> > > for a LED. The netdev trigger does not change the LED color, only the
> > > brightness (either to 0 or to currently configured brightness), and so
> > > there is no need to send the CMD_LED_COLOR command. But each change of
> > > brightness to 0 sends one CMD_LED_STATE command, and each change of
> > > brightness to max_brightness sends one CMD_LED_STATE command and one
> > > CMD_LED_COLOR command:
> > >     set_brightness(0)   ->  CMD_LED_STATE
> > >     set_brightness(255) ->  CMD_LED_STATE + CMD_LED_COLOR
> > >                                             (unnecessary)
> > > 
> > > We can avoid the unnecessary I2C transactions if we cache the values of
> > > state and color that are sent to the controller. If the color does not
> > > change from the one previously sent, there is no need to do the
> > > CMD_LED_COLOR I2C transaction, and if the state does not change, there
> > > is no need to do the CMD_LED_STATE transaction.
> > > 
> > > Because we need to make sure that out cached values are consistent with  
> > 
> > Nit: "our"
> > 
> 
> Thanks, I will fix this.
> 
> > > +
> > > +	/* send the color change command */  
> > 
> > Nit: Please start comments with an upper case char.
> 
> OK, I will change it.
> 
> > > +	ret = i2c_master_send(client, cmd, 5);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	/* cache the RGB channel brightnesses */
> > > +	for (int i = 0; i < OMNIA_LED_NUM_CHANNELS; ++i)  
> > 
> > Why the pre-increment?
> > 
> > It's non-standard and doesn't appear to have any affect.
> 
> According to git grep, current Linux sources contain around 7606
> occurances of pre-increment (++x) in for cycles:
>   git grep '; ++[a-z_]\+)' | wc -l
> 
> and 81360 occurances of post-increment (x++):
>   git grep '; [a-z_]\+++)' | wc -l
> 
> Yes, I admit that pre-increment is 10 times less frequent, but I do not
> consider that to be non-standard.
> 
> If you insist on this, I will change it. But I consider this
> non-consequential...
> 
> Please let me know whether you insist on it.

I don't.  It was a genuine question I was curious about.

Just looks odd and made me wonder if it actually served a purpose.

-- 
Lee Jones [李琼斯]

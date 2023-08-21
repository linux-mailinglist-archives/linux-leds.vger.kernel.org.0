Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCB9678272A
	for <lists+linux-leds@lfdr.de>; Mon, 21 Aug 2023 12:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233656AbjHUKeU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Aug 2023 06:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234766AbjHUKeS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Aug 2023 06:34:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAFDADC
        for <linux-leds@vger.kernel.org>; Mon, 21 Aug 2023 03:34:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 43A2863047
        for <linux-leds@vger.kernel.org>; Mon, 21 Aug 2023 10:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC2BFC433C7;
        Mon, 21 Aug 2023 10:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692614055;
        bh=cAkCHh7VD1dZlQ3NE1NF3wgandeGde5jCyqCouw1NGA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=P90VG4+uYF2xHULpfO5T9hcU94Lj1tnQ0swCxTa92RD6I48aQbinDfmNM/yGHSnVw
         JnCzK1GMjA9cTWB0NmC6nuXuqVrsKBCo7ePsJ/jvzsuWdnl9DOshYIjaPcA2mMtqR/
         N4udh4hEbWIBY31KVbrNrSDRJp0Zq/MC11Bw8tp9XTrwY5pdIZqDo06Km+Vcl3Ayfu
         gSNUtimhQPiRbINQVuaOEK3vut5trmkQuqRcvViRd2xM6x+Af1CKjL5+cyrm9qn7Uw
         y24cAHXwx1p1jWVCcpRgfz03lCTlSeCweapk6rX3/Q03fyGIj4Xnh8KmcY0dOJ6OGQ
         bbMeOOXLsp32A==
Date:   Mon, 21 Aug 2023 12:34:11 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Lee Jones <lee@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 5/6] leds: turris-omnia: support HW controlled mode
 via private trigger
Message-ID: <20230821123411.6ea98dac@dellmb>
In-Reply-To: <20230818090921.GQ986605@google.com>
References: <20230802160748.11208-1-kabel@kernel.org>
        <20230802160748.11208-6-kabel@kernel.org>
        <20230818090921.GQ986605@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 18 Aug 2023 10:09:21 +0100
Lee Jones <lee@kernel.org> wrote:

> > +	if (!err) {
> > +		/* put the LED into MCU controlled mode */  
> 
> Nit: You improved the comment above to be more grammatically correct by
> starting with an uppercase character.  Please continue with this
> improvement for all comments there in.

OK.

> > +static struct led_trigger omnia_hw_trigger = {
> > +	.name		= "omnia-mcu",
> > +	.activate	= omnia_hwtrig_activate,
> > +	.deactivate	= omnia_hwtrig_deactivate,
> > +	.trigger_type	= &omnia_hw_trigger_type,  
> 
> Not sure I understand this interface.
> 
> Why not just set a bool instead of carrying around an empty struct?

Let me explain:

So, if a LED class device has the same trigger type as a LED trigger,
the trigger will be available for that LED (it is listed in the sysfs
trigger file and can be chosen).

So we have a mechanism to "pair" a LED with a given trigger, to make it
possible for the LED core to distinguish whether a given trigger is
available for the LED.

A boolean information would not be enough: if we used a bool, we would
know that the trigger is private. But the LED core would not know for
which LEDs the trigger should be avaiable.

In pseudocode:

list_triggers_for_led(led) {
  for (trigger in trigger_list) {
    if (!trigger.trigger_type || trigger.trigger_type ==
                                 led.trigger_type)
      trigger is available for led
    else 
      trigger is not available for led
  }
}

Is this explaination good enough?

Marek

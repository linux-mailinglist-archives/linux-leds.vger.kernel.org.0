Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C40AC441B4D
	for <lists+linux-leds@lfdr.de>; Mon,  1 Nov 2021 13:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232307AbhKAMvG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Nov 2021 08:51:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:38234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232467AbhKAMvG (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 1 Nov 2021 08:51:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2149B60F45;
        Mon,  1 Nov 2021 12:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635770912;
        bh=aowZ4SMAwR/63kxGALyven05PtNMXa4LCay/eWGi9mA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MGtOmiJTAT5txcigeO/GLFb8CCP6TzUSTT8oHtWj4uY/krVykNoHr5X0NJwPojLV/
         sc3zpTlOiuPNLdFQ4iMwrMcP2W2vgJazgBPbtFSU3ZCBtr3twTnuGx7jto4OvKKNu/
         k66pAnkGmnUroRrfGF/Xqj+jo/dKaup4Xl3YrDgvXiN2+dflthTVxuGYJkOHJm7wWS
         UFwL8F19sSPQ4182fCXE3hyG3gpvSlmNW8KpQcGciPWm0ir8dMdrSqbVL4gun9Wiby
         SLLBca4/kkHwlXUjNojjir+pECpwNAyezobPSi7fNGW5vnbWrUhY8wprd+rsmuCfLC
         8FrtIDtgcenWA==
Date:   Mon, 1 Nov 2021 13:48:29 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: Don't emit brightness set error message if LED
 supports hw triggers only
Message-ID: <20211101134829.5adc5452@dellmb>
In-Reply-To: <20211101115910.GA2571@duo.ucw.cz>
References: <f80b57aa-a542-1d6b-50d9-6de0520f2871@gmail.com>
        <20211101115910.GA2571@duo.ucw.cz>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 1 Nov 2021 12:59:10 +0100
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> 
> > Working on a driver for specific network LEDs that support HW
> > triggers only I got error "Setting an LED's brightness failed" when
> > switching to a different trigger. This is caused by call
> > led_set_brightness(led_cdev, LED_OFF) in led_trigger_set() because
> > both brigthness_set callbacks are not implemented. Let's suppress
> > the error message in that case.  
> 
> Hmm... do we have such LEDs in tree? LED supporting only hardware
> triggers is kind of unusual/interesting/and I'm not really sure if we
> should have them in LED subsystem.

Why not? I mean there actually are such LEDs and the LED subsystem is
the best fit for them. The LED trigger ABI can be used to set HW
control mode on these LEDs.

I think it would be confusing to put such LEDs into a different
subsystem.

Marek

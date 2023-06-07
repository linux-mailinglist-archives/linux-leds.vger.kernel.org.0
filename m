Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0949A727092
	for <lists+linux-leds@lfdr.de>; Wed,  7 Jun 2023 23:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjFGVdD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 7 Jun 2023 17:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjFGVdC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 7 Jun 2023 17:33:02 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8EDFE4A;
        Wed,  7 Jun 2023 14:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=ubtDMWI6SjDotQFg9rb1A1hZlGcrJfnztwirpseERTc=; b=hiCbn2UfxiRUZFAkqMXaQ/ZmPR
        ySVzv/petK9AM4b4nZ+j/vmO9ayO6TcLyq2YRiimJE2viynF1jQvLmqZcDbeI+5jb4t7qNrnJ23az
        z0akFuZJYoUVsiTyERk5ScM9hZGiXZwfxEpruAvJhIPRnDETRle62HS9eyPGPdZpqlS0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1q70lx-00FC1n-0R; Wed, 07 Jun 2023 23:32:53 +0200
Date:   Wed, 7 Jun 2023 23:32:52 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: NPD in phy_led_set_brightness+0x3c
Message-ID: <c8fb4ca8-f6ef-461c-975b-09a15a43e408@lunn.ch>
References: <9e6da1b3-3749-90e9-6a6a-4775463f5942@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e6da1b3-3749-90e9-6a6a-4775463f5942@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

> There is no trigger being configured for either LED therefore it is not
> clear to me why the workqueue is being kicked in the first place?

Since setting LEDs is a sleepable action, it gets offloaded to a
workqueue.

My guess is, something in led_classdev_unregister() is triggering it,
maybe to put the LED into a known state before pulling the
plug. However, i don't see what.

I'm also wondering about ordering. The LED is registered with
devm_led_classdev_register_ext(). So maybe led_classdev_unregister()
is getting called too late? So maybe we need to replace devm_ with
manual cleanup.

However, i've done lots of reboots while developing this code, so its
interesting you can trigger this, and i've not seen it.

	    Andrew


Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A67387287EC
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jun 2023 21:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236399AbjFHTPP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 8 Jun 2023 15:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237023AbjFHTOz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Jun 2023 15:14:55 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F340A421C;
        Thu,  8 Jun 2023 12:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=haEJUEwEZ+Fee7bmi8zEEMUxkcl/kvAUtC3cSlFwSEQ=; b=A+6uc5QTmutoodqztGgGYA1GrD
        aPcqx+Hraj1JrfYATpQCk3lRZwPtWYJBywGjbLuN9Npe76bpMVM5UuckbATu2pdPzRaMB5gwCzTVi
        HqE2NiijQy0YMyKTZfQKmJ7t20rAxZ1ugORCNRU5Cwz6ujV4LnK0CcJDpo4NKzmI3KI4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1q7L4B-00FHEC-Gl; Thu, 08 Jun 2023 21:13:03 +0200
Date:   Thu, 8 Jun 2023 21:13:03 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: NPD in phy_led_set_brightness+0x3c
Message-ID: <b0dd0247-90f6-4769-a1f3-3b3499561b88@lunn.ch>
References: <9e6da1b3-3749-90e9-6a6a-4775463f5942@gmail.com>
 <c8fb4ca8-f6ef-461c-975b-09a15a43e408@lunn.ch>
 <11182cf6-eb35-273e-da17-6ca901ac06d3@gmail.com>
 <5558742d-232b-4417-9bea-6369434f8983@lunn.ch>
 <f415f93e-bf6c-88be-161d-f6d5c88ca10b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f415f93e-bf6c-88be-161d-f6d5c88ca10b@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Jun 08, 2023 at 10:33:30AM -0700, Florian Fainelli wrote:
> On 6/7/23 18:30, Andrew Lunn wrote:
> > > (gdb) print /x (int)&((struct phy_driver *)0)->led_brightness_set
> > > $1 = 0x1f0
> > > 
> > > so this would indeed look like an use-after-free here. If you tested with a
> > > PHYLINK enabled driver you might have no seen due to
> > > phylink_disconnect_phy() being called with RTNL held?
> > 
> > Yes, i've been testing with mvneta, which is phylink.
> 
> Humm, this is really puzzling because we have the below call trace as to
> where we call schedule_work() which is in led_set_brightness_nopm() however
> we have led_classdev_unregister() call flush_work() to ensure the workqueue
> completed. Is there something else in that call stack that prevents the
> system workqueue from running?

Has phy_remove() already been called? Last thing it does is:

phydev->drv = NULL;

This is one of the differences between my system and yours. With
mvneta, the mdio bus driver is an independent device. You have a
combined MAC and MDIO bus driver.

	Andrew

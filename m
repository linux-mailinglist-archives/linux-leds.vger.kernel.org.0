Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5017527247B
	for <lists+linux-leds@lfdr.de>; Mon, 21 Sep 2020 15:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgIUNCM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Mon, 21 Sep 2020 09:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgIUNCL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Sep 2020 09:02:11 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C053C061755;
        Mon, 21 Sep 2020 06:02:11 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id B5654140942;
        Mon, 21 Sep 2020 15:02:08 +0200 (CEST)
Date:   Mon, 21 Sep 2020 15:02:08 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Simon Guinot <simon.guinot@sequanux.org>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?B?T25kxZllag==?= Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Simon Guinot <sguinot@lacie.com>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH leds v1 10/10] leds: ns2: refactor and use struct
 led_init_data
Message-ID: <20200921150208.6a296bc7@nic.cz>
In-Reply-To: <20200921125343.GA4828@kw.sim.vm.gnt>
References: <20200916231650.11484-1-marek.behun@nic.cz>
        <20200916231650.11484-11-marek.behun@nic.cz>
        <20200918130206.GE29951@kw.sim.vm.gnt>
        <20200918191405.516b51ff@nic.cz>
        <20200921125343.GA4828@kw.sim.vm.gnt>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 21 Sep 2020 14:53:43 +0200
Simon Guinot <simon.guinot@sequanux.org> wrote:

> On Fri, Sep 18, 2020 at 07:14:05PM +0200, Marek Behun wrote:
> > On Fri, 18 Sep 2020 15:02:06 +0200
> > Simon Guinot <simon.guinot@sequanux.org> wrote:
> >   
> > > On Thu, Sep 17, 2020 at 01:16:50AM +0200, Marek Behún wrote:
> > > 
> > > Hi Marek,
> > >   
> > > > By using struct led_init_data when registering we do not need to parse
> > > > `label` DT property nor `linux,default-trigger` property.
> > > > 
> > > > Also, move forward from platform data to device tree only:
> > > > since commit c7896490dd1a ("leds: ns2: Absorb platform data") the
> > > > platform data structure is absorbed into the driver, because nothing
> > > > else in the source tree used it. Since nobody complained and all usage    
> > > 
> > > Well, I probably should have...
> > > 
> > > I am using this driver on the Seagate Superbee NAS devices. This devices
> > > are based on a x86 SoC. Since I have been unable to get from the ODM the
> > > LED information written in the ACPI tables, then platform data are used
> > > to pass the LED description to the driver.
> > > 
> > > The support of this boards is not available mainline yet but it is still
> > > on my todo list. So that's why I am complaining right now :) If it is
> > > not too much trouble I'd like to keep platform data support in this
> > > driver.
> > > 
> > > Thanks in advance.
> > > 
> > > Simon
> > >   
> > 
> > Simon, what if we refactored the driver to use fwnode API instead of OF
> > API? Then if it is impossible for you to write DTS for that device,
> > instead of platform data you could implement your device via swnode
> > fwnodes. :)  
> 
> Yes. That would be perfect.
> 
> Simon

BTW if you have access to device schematics I could try to write DTS,
with schematics and the current board source file it should not be that
hard. But I can't test it, since I don't have the board.

Marek

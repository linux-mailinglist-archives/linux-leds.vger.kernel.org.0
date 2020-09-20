Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 233E0271853
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 23:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgITVxP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Sun, 20 Sep 2020 17:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgITVxP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Sep 2020 17:53:15 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A3FDC061755;
        Sun, 20 Sep 2020 14:53:15 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 79A93140A87;
        Sun, 20 Sep 2020 23:53:12 +0200 (CEST)
Date:   Sun, 20 Sep 2020 23:53:12 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>, dmurphy@ti.com,
        linux-kernel@vger.kernel.org, Antonio Ospite <ao2@ao2.it>
Subject: Re: [PATCH leds] leds: regulator: remove driver
Message-ID: <20200920235312.7da1dd51@nic.cz>
In-Reply-To: <20200920214647.GC31397@duo.ucw.cz>
References: <20200920204203.17148-1-marek.behun@nic.cz>
        <20200920214647.GC31397@duo.ucw.cz>
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

On Sun, 20 Sep 2020 23:46:47 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> On Sun 2020-09-20 22:42:03, Marek Behún wrote:
> > The leds-regulator driver only supports the old platform data binding
> > and no in-tree code uses it. It also seems that no OpenWRT board uses
> > it.
> > 
> > Remove this driver.  
> 
> Lets keep this one.

Very well.

> Connecting LED directly to regulator simply makes sense.

It does makes sence to me as well, but at least it needs to be
rewritten to use OF instead of platdata. The way it is written now it
is not used by anyone, apparently.

Marek


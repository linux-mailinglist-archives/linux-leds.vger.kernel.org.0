Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8C72229642
	for <lists+linux-leds@lfdr.de>; Wed, 22 Jul 2020 12:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731610AbgGVKef (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Jul 2020 06:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726153AbgGVKef (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Jul 2020 06:34:35 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EED5C0619DC
        for <linux-leds@vger.kernel.org>; Wed, 22 Jul 2020 03:34:35 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id E2359140527;
        Wed, 22 Jul 2020 12:34:31 +0200 (CEST)
Date:   Wed, 22 Jul 2020 12:34:31 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v6 2/3] leds: initial support for Turris Omnia LEDs
Message-ID: <20200722123431.46b95739@nic.cz>
In-Reply-To: <20200722071542.GB8984@amd>
References: <20200721125922.10979-1-marek.behun@nic.cz>
        <20200721125922.10979-3-marek.behun@nic.cz>
        <20200722071542.GB8984@amd>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 22 Jul 2020 09:15:42 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> > +
> > +/*
> > + * On the front panel of the Turris Omnia router there is also a button which can be used to control
> > + * the intensity of all the LEDs at once, so that if they are too bright, user can dim them.
> > + * The microcontroller cycles between 8 levels of this global brightness (from 100% to 0%), but this
> > + * setting can have any integer value between 0 and 100. It is therefore convenient to be able to
> > + * change this setting from software.
> > + * We expose this setting via a sysfs attribute file called "brightness". This file lives in the
> > + * device directory of the LED controller, not an individual LED, so it should not confuse users.
> > + */  
> 
> Lets keep comments formatted to 80 columns. This overflew my screen
> and is unreadable.
> 							Pavel

OK. But you are aware that default limit was increased to 100 columns,
right?

Marek

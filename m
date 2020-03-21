Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D79B218E544
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2020 23:36:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727700AbgCUWgk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Mar 2020 18:36:40 -0400
Received: from lists.nic.cz ([217.31.204.67]:57722 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727039AbgCUWgj (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 21 Mar 2020 18:36:39 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 87DB714319C;
        Sat, 21 Mar 2020 23:36:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1584830198; bh=iGWQMJe953gCP9kw+F2D23vXUk6/uxc7XcwkmAHuwRQ=;
        h=Date:From:To;
        b=Hbks671dGdXcp+gt7hd6akmQuU6cdX/krxIgVk9ehUd9ZyaMG/opXXv3zsc3v6bOK
         QtBmAf25vinbYV7OLxrDMMIJTogMLbpV+2uwsJtNY0LpsY5b6d61NP8cH5bZOM1dG8
         dJbyiBJWcladspTXySWiOPWp9ADhERs7rFBURr5c=
Date:   Sat, 21 Mar 2020 23:36:38 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia
 LEDs
Message-ID: <20200321233638.587d94cc@nic.cz>
In-Reply-To: <20200321221653.GA13329@amd>
References: <20200319181604.2425-1-marek.behun@nic.cz>
        <20200321225342.7651547b@nic.cz>
        <20200321221653.GA13329@amd>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 21 Mar 2020 23:16:53 +0100
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> > The microcontroller on Turris Omnia supports more settings than just
> > LEDs (usb3 port power and input button for example).
> > 
> > I am wondering if this approach (registering LED driver to
> > communicate with the microcontroller) is correct, since the
> > microcontroller can do other things.
> > 
> > For Turris Mox firmware I created a driver in
> > drivers/firmware/turris-mox-rwtm.c.  
> 
> this should be drivers/platform/turris/, I believe. It is not
> _firmware_, is it?
> 

It is code that interacts with the firmware. It already is merged in
drivers/firmware/. The raspberrypi firmware interacting drivers is also
there...

Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B95FD18E489
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2020 21:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgCUUuc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Mar 2020 16:50:32 -0400
Received: from mail.nic.cz ([217.31.204.67]:49874 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726539AbgCUUuc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 21 Mar 2020 16:50:32 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 846361431A0;
        Sat, 21 Mar 2020 21:50:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1584823830; bh=FUyP7KReNeXlySBRbiLcwC4Gm+z4FtRNLfrQdusnzWs=;
        h=Date:From:To;
        b=qUz7/T7rrRnH+jBQdnQrzVd92blTIfIe0MQ99RhEOiXrpz+n73q5l+4nbn/h3nM8J
         0Kb8jRmgFs6fsdG6BbJUU0sxD0hBpF0KDuQQmRVFrWYlcN5QNj0YhfVtTkCXMO9twX
         04Xm2y6oKD6tEbtWNJR0KIfxB3cucz6Wt7IvWX9c=
Date:   Sat, 21 Mar 2020 21:50:30 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia
 LEDs
Message-ID: <20200321215030.08b75ccc@nic.cz>
In-Reply-To: <661959c3-cd24-1125-be35-f293212f4fe4@gmail.com>
References: <20200319181604.2425-1-marek.behun@nic.cz>
        <20200321153444.GE8386@duo.ucw.cz>
        <661959c3-cd24-1125-be35-f293212f4fe4@gmail.com>
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

On Sat, 21 Mar 2020 19:01:15 +0100
Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:

> > How will this look in the /sys/class/leds?
> > 
> > We don't want to see omnia:xxx:xx there. For the ethernet activity
> > leds, it would be nice to get something like eth0:red:activity...?  
> 
> devicename and devicename_mandatory should be removed.
> 

Without this I have:

omnialeds /sys/class/leds # ls
blue:power   red:power    white:lan-2  white:pci-1  white:user-1
green:power  white:lan-0  white:lan-3  white:pci-2  white:user-2
mmc0::       white:lan-1  white:lan-4  white:pci-3  white:wan

(the mmc0:: is not created by this driver).

Is this okay?

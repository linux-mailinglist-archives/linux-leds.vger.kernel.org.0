Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 927FC271179
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 02:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgITAGe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 20:06:34 -0400
Received: from lists.nic.cz ([217.31.204.67]:60694 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726680AbgITAGe (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 19 Sep 2020 20:06:34 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 84DC914095B;
        Sun, 20 Sep 2020 02:06:32 +0200 (CEST)
Date:   Sun, 20 Sep 2020 02:06:31 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     "Adrian Schmutzler" <mail@adrianschmutzler.de>
Cc:     <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: add LED_FUNCTION for
 wlan2g/wlan5g
Message-ID: <20200920020631.4d36b035@nic.cz>
In-Reply-To: <00da01d68ed9$f967dfb0$ec379f10$@adrianschmutzler.de>
References: <20200919192427.57033-1-freifunk@adrianschmutzler.de>
        <20200919223134.2371459c@nic.cz>
        <00b201d68ecd$8af46280$a0dd2780$@adrianschmutzler.de>
        <20200920002846.22a76e03@nic.cz>
        <00da01d68ed9$f967dfb0$ec379f10$@adrianschmutzler.de>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 20 Sep 2020 01:09:49 +0200
"Adrian Schmutzler" <mail@adrianschmutzler.de> wrote:

> > > As far as I understand it, the color/function system does not provide a  
> > comparable lever, as the final name is only constructed in led-core.c?  
> > >  
> > 
> > The files in /sys/class/leds/ are symlinks. The actual files are in /sys/devices/
> > somewhere. If you know the path of your LED in the device hierarchy, you
> > can find it that way. If your script can access the LED by reading device-tree,
> > you can implement your script so that you can find the LED in the hiearchy in
> > /sys/devices/ (or simply byt reading where do the symlinks in
> > /sys/class/leds/ point to).  
> 
> Thanks for that pointer; unfortunately though, I was only able to retrieve lists of leds in [device:]color:function syntax and lists of the DT nodes, but nothing where a single node from DT is linked or can be related to just one of the [device:]color:function identifiers.
> 
> Best
> 
> Adrian
>

Which driver is this? Normally there is of_node symlink in sysfs device
directory...

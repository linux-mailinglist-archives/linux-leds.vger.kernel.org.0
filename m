Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 454EB196618
	for <lists+linux-leds@lfdr.de>; Sat, 28 Mar 2020 13:27:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbgC1M1c (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 28 Mar 2020 08:27:32 -0400
Received: from mail.nic.cz ([217.31.204.67]:52322 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726268AbgC1M1c (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 28 Mar 2020 08:27:32 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 2BBF4140AC6;
        Sat, 28 Mar 2020 13:27:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1585398450; bh=POptYLkdjVEFEolqunF2WeIF9+5zdRr2xl2Vw6lArlk=;
        h=Date:From:To;
        b=L1NCnq5kFvCmxtn3fYSDi8YZ9CiiXKYM9uZv3RUh5K7CCZGOW21AeN2DP/TvPKEwN
         u459euUYP5nHGK/3YyURKCgaH70eaUuydNmi0CiaGn5/BOa2cEg994nSo2UQlf6+Vp
         iDjK+mb/u4xxjbfH/rd2d2mu8eBbg/kFOFUn8RT4=
Date:   Sat, 28 Mar 2020 13:27:29 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia
 LEDs
Message-ID: <20200328132729.5e628fe6@nic.cz>
In-Reply-To: <943a5770-ea9c-24ac-5ab3-a9a24fc6a856@gmail.com>
References: <20200319181604.2425-1-marek.behun@nic.cz>
        <20200321153325.GD8386@duo.ucw.cz>
        <943a5770-ea9c-24ac-5ab3-a9a24fc6a856@gmail.com>
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

On Sat, 28 Mar 2020 13:08:02 +0100
Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:

> Hi Pavel.
> 
> On 3/21/20 4:33 PM, Pavel Machek wrote:
> > Hi!
> >   
> >> This adds basic support for LEDs on the front side of CZ.NIC's Turris
> >> Omnia router.  
> > 
> > Looks good, I had to apply it by hand, by I took it. I realize that
> > dts interface may not be final, but I do not want to solve Makefile
> > rejects in future.  
> 
> I don't think it is a good idea to merge it without bindings,
> and with DT parser that will certainly undergo essential changes.
> 
> Besides, you appear as the commit author in your tree and moreover
> the patch has a broken title. Also the commit message contains
> DT bindings that will have different shape eventually.
> 
> NACK for merging this patch in this shape.
> 

This was only RFC, please do not merge.

Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE32319CC26
	for <lists+linux-leds@lfdr.de>; Thu,  2 Apr 2020 22:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388855AbgDBU5c (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 Apr 2020 16:57:32 -0400
Received: from lists.nic.cz ([217.31.204.67]:56840 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730837AbgDBU5c (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 2 Apr 2020 16:57:32 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id A4A30140EA0;
        Thu,  2 Apr 2020 22:57:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1585861050; bh=hrWRHnQmyiVeeppPtvFDL40n0E5Sijkw+fTbFw+7v/Y=;
        h=Date:From:To;
        b=FYq6wQyA0Q5wl3dGa94WwvoyNXGoY1RJmhSK6c0ctU5MT6/wGUXhjsnsTZeV/tbEU
         3dj+QcDrSHPECrnTrDSP0437388n4QaeY+IMHC82nY/kg+Wbq9PovP8gyGDPWQJb4Q
         7sk42LMRmZ1F+aRgX9HnXw2RfngOd/s3vJ0YuIC0=
Date:   Thu, 2 Apr 2020 22:57:30 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia
 LEDs
Message-ID: <20200402225730.2e6d9154@nic.cz>
In-Reply-To: <f7e641a1-c113-9c33-f6bb-256a8e59b92e@gmail.com>
References: <20200319181604.2425-1-marek.behun@nic.cz>
        <20200321153325.GD8386@duo.ucw.cz>
        <943a5770-ea9c-24ac-5ab3-a9a24fc6a856@gmail.com>
        <20200328132729.5e628fe6@nic.cz>
        <20200328133629.79603fe3@nic.cz>
        <00b6737b-47f8-7ea4-74b7-eee3d2aefdf3@gmail.com>
        <20200328182025.0b33200e@nic.cz>
        <7a12c510-605c-b31f-79e6-cccf3e29c682@gmail.com>
        <20200402162950.5c2847be@nic.cz>
        <f7e641a1-c113-9c33-f6bb-256a8e59b92e@gmail.com>
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

On Thu, 2 Apr 2020 22:19:50 +0200
Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:

> On 4/2/20 4:29 PM, Marek Behun wrote:
> > On Sun, 29 Mar 2020 14:53:57 +0200
> > Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> >   
> >>> in the case you mentioned there is a one "global" brightness setting per
> >>> each RGB LED. On Omnia, all 12 RGB LEDs have just one "global"
> >>> brightness property. Ie. I press the button, and all 12 LEDs glow get
> >>> dimmer. So there could be a 13th LED device with color LUMA, but what
> >>> function should it be given in DTS?    
> >>
> >> Then, in this particular case, adding devicename prefix for the whole
> >> family of LEDs would be justified. The question is whether it should be
> >> hardware related name or rather something different.  
> > 
> > Hi Jacek,
> > 
> > so now we have
> >   device:color:function
> > what if we made it so that there was a 4th part of LED name, ie
> >   group:device:color:function
> > ?
> > 
> > Would this be a problem?  
> 
> Indeed, the device alone would not be a sufficient differentiator
> since it is possible to have more than one LED controller of the
> same type on the board.
> 
> Nonetheless, I'd rather avoid the addition of a new generic section.
> Probably we would have to make it specific to this device.
> 

Ok, in that case I will do it so that devicename is "omnia".
devicename_mandatory should be set to true, yes?
Marek
